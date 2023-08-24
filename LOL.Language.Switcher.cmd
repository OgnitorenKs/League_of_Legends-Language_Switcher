echo off
setlocal enabledelayedexpansion
chcp 65001
cls
title League of Legends Change Language │ OgnitorenKs

reg query "HKU\S-1-5-19" > NUL 2>&1
	if %errorlevel% NEQ 0 (Call :Powershell "Start-Process '%L%\LOL.Language.Switcher.cmd' -Verb Runas"&exit)

MD %AppData%\OgnitorenKs\LOL.Change.Language > NUL 2>&1
DEL /F /Q /A "%Temp%\LOL_Disk" > NUL 2>&1
DEL /F /Q /A "%Temp%\LOL_Switcher" > NUL 2>&1
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E#&echo on&for %%b in (1) do rem"') do (set R=%%b)
set Error=0
chcp 437 > NUL
for /f "skip=3 tokens=1 delims= " %%a in ('Powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID"') do (
	chcp 65001 > NUL
	echo Disk = %%a >> %Temp%\LOL_Disk
)
:LOL_Auto_Location
cls
echo.&echo  %R%[90m...%R%[96mSearching League of Legends%R%[90m...%R%[0m
set Number=0
echo.
FOR /F "tokens=3" %%a in ('Findstr /i "Disk" %Temp%\LOL_Disk 2^>NUL') do (
	FOR /F "tokens=*" %%b in ('dir /b /s %%a\*LeagueClient.exe 2^>NUL') do (
		set /a Number+=1
		echo   %R%[32m!Number!-%R%[33m "%%b"%R%[0m
		echo [LOL_!Number!]=%%b >> %Temp%\LOL_Switcher
	)
)
Findstr /i "[LOL_1]" %Temp%\LOL_Switcher > NUL 2>&1
	if %errorlevel% NEQ 0 (echo %R%[31m League of Legends is not installed%R%[0m
						   set Error=1)
echo.
set /p Value=►%R%[32m Select Location: %R%[0m
	if %Error% EQU 1 (goto LOL_Location)
FOR /F "delims='=' tokens=2" %%g in ('Findstr /i "LOL_%Value%" %Temp%\LOL_Switcher') do (set LOL_Location=%%g)
:Select_Langugage
cls
echo.&echo %R%[96m Language Menu %R%[0m
echo.
echo  %R%[32m  1-%R%[33m ja_JP%R%[90m ►%R%[37m Japanese%R%[0m
echo  %R%[32m  2-%R%[33m ko_KR%R%[90m ►%R%[37m Korean%R%[0m
echo  %R%[32m  3-%R%[33m zh_CN%R%[90m ►%R%[37m Chinese%R%[0m
echo  %R%[32m  4-%R%[33m zh_TW%R%[90m ►%R%[37m Taiwanese%R%[0m
echo  %R%[32m  5-%R%[33m es_ES%R%[90m ►%R%[37m Spanish (Spain)%R%[0m
echo  %R%[32m  6-%R%[33m es_MX%R%[90m ►%R%[37m Spanish (Latin America)%R%[0m
echo  %R%[32m  7-%R%[33m en_US%R%[90m ►%R%[37m English (United States)%R%[0m
echo  %R%[32m  8-%R%[33m en_GB%R%[90m ►%R%[37m English (British)%R%[0m
echo  %R%[32m  9-%R%[33m en_AU%R%[90m ►%R%[37m English (Australia)%R%[0m
echo  %R%[32m 10-%R%[33m fr_FR%R%[90m ►%R%[37m French%R%[0m
echo  %R%[32m 11-%R%[33m de_DE%R%[90m ►%R%[37m German%R%[0m
echo  %R%[32m 12-%R%[33m it_IT%R%[90m ►%R%[37m Italian%R%[0m
echo  %R%[32m 13-%R%[33m pl_PL%R%[90m ►%R%[37m Polish%R%[0m
echo  %R%[32m 14-%R%[33m ro_RO%R%[90m ►%R%[37m Romanian%R%[0m
echo  %R%[32m 15-%R%[33m el_GR%R%[90m ►%R%[37m Greek%R%[0m
echo  %R%[32m 16-%R%[33m pt_BR%R%[90m ►%R%[37m Portuguese%R%[0m
echo  %R%[32m 17-%R%[33m hu_HU%R%[90m ►%R%[37m Hungarian%R%[0m
echo  %R%[32m 18-%R%[33m ru_RU%R%[90m ►%R%[37m Russian%R%[0m
echo  %R%[32m 19-%R%[33m tr_TR%R%[90m ►%R%[37m Turkish%R%[0m
echo.
set /p Value=►%R%[32m Select Language= %R%[0m
	if %Value% EQU 1 (Call :LOL_Start ja_JP)
	if %Value% EQU 2 (Call :LOL_Start ko_KR)
	if %Value% EQU 3 (Call :LOL_Start zh_CN)
	if %Value% EQU 4 (Call :LOL_Start zh_TW)
	if %Value% EQU 5 (Call :LOL_Start es_ES)
	if %Value% EQU 6 (Call :LOL_Start es_MX)
	if %Value% EQU 7 (Call :LOL_Start en_US)
	if %Value% EQU 8 (Call :LOL_Start en_GB)
	if %Value% EQU 9 (Call :LOL_Start en_AU)
	if %Value% EQU 10 (Call :LOL_Start fr_FR)
	if %Value% EQU 11 (Call :LOL_Start de_DE)
	if %Value% EQU 12 (Call :LOL_Start it_IT)
	if %Value% EQU 13 (Call :LOL_Start pl_PL)
	if %Value% EQU 14 (Call :LOL_Start ro_RO)
	if %Value% EQU 15 (Call :LOL_Start el_GR)
	if %Value% EQU 16 (Call :LOL_Start pt_BR)
	if %Value% EQU 17 (Call :LOL_Start hu_HU)
	if %Value% EQU 18 (Call :LOL_Start ru_RU)
	if %Value% EQU 19 (Call :LOL_Start tr_TR)
	if %Error% EQU 2 (goto Finish)
goto Select_Langugage
:LOL_Start
FOR %%g in (
"RiotClientServices.exe"
"RiotClientUx.exe"
"LeagueClient.exe"
"LeagueClientUx.exe"
"LeagueClientUxRender.exe"
"LeagueCrashHandler64.exe"
"League of Legends.exe"
) do (
	taskkill /f /im %%g > NUL 2>&1
)
timeout /t 3 /nobreak > NUL
"%LOL_Location:~0,-1%" --locale=%~1
set Error=2
goto :eof
:Finish
cls
echo.
echo %R%[96m The patching process has been completed successfully%R%[0m
timeout /t 7 /nobreak > NUL
exit
:Powershell
chcp 437 > NUL 2>&1
Powershell -command %*
chcp 65001 > NUL 2>&1
goto :eof