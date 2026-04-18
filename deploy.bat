@echo off
title Deploy — Kikao Lanches
cd /d "%~dp0"
echo.
echo  Kikao Lanches — iniciando deploy...
echo.
git add -A
git diff --cached --quiet || git commit -m "chore: deploy %date% %time%"
git push origin master
npx vercel --prod --yes --name kikao-lanches
echo.
echo  Deploy concluido! https://kikao-lanches.vercel.app
echo.
pause
