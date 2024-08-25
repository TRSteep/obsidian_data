@echo off

set "d=%appdata%\wargaming.net\WorldOfTanks"
set "f1=preferences.xml"

if not exist "%d%" ( 
echo OK!
@pause && exit )
 
pushd "%d%"
 for /f "delims=" %%a in ('2^>nul dir /b^|findstr /xv /c:"%f1%"') do >nul 2>&1 rd /s /q "%%a"& >nul 2>&1 del /q "%%a"
popd
echo OK!
pause