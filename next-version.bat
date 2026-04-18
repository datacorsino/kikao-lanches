@echo off
title Proxima Versao — Kikao Lanches
cd /d "%~dp0"
echo.
echo  Kikao Lanches — avancando para proxima versao...
echo.

if not exist "%~dp0.next_version.txt" (
    echo  INFO: Nao existe uma proxima versao ainda.
    echo  Voce ja esta na versao mais recente.
    echo.
    pause
    exit /b 0
)

set /p NEXT= < "%~dp0.next_version.txt"

echo  Avancando para: %NEXT%
echo.

git reset --hard %NEXT%
git push origin master --force
npx vercel --prod --yes --name kikao-lanches

del "%~dp0.next_version.txt"

echo.
echo  Versao restaurada! https://kikao-lanches.vercel.app
echo.
pause
