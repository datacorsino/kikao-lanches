@echo off
title Rollback — Kikao Lanches
cd /d "%~dp0"
echo.
echo  Kikao Lanches — voltando para versao anterior...
echo.

for /f "tokens=1" %%A in ('git rev-parse HEAD') do set CURRENT=%%A
for /f "tokens=1" %%A in ('git log --oneline -2 ^| findstr /v "%CURRENT:~0,7%"') do (
    if not defined PREV set PREV=%%A
)

if not defined PREV (
    echo  ERRO: Nao existe versao anterior. Este e o primeiro commit.
    echo.
    pause
    exit /b 1
)

echo  Commit atual:   %CURRENT:~0,7%
echo  Voltando para:  %PREV%
echo.

echo %CURRENT% > "%~dp0.next_version.txt"

git reset --hard %PREV%
git push origin master --force
npx vercel --prod --yes --name kikao-lanches

echo.
echo  Rollback concluido! https://kikao-lanches.vercel.app
echo  (Use next-version.bat para voltar a versao mais recente)
echo.
pause
