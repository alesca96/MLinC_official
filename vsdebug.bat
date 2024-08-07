::======================================================
::Builds the debug_out.exe and debug using Visual Studio
::======================================================

@echo on
call debug.bat

@echo off
:: Specify the source and destination directories
set source=".\bin\debug"
set destination=".\bin\debug\VisualStudio"

:: Specify the name of the .exe file
set filename="debug_out.exe"

:: Move the file
move %source%\%filename% %destination%

:: Move to directory 
cd .\bin\debug\VisualStudio

if not exist .\debug_out.sln (
:: Start VS to debug with it
start devenv .\debug_out.exe
) else (
:: Existing solution case: 
start devenv debug_out.sln
@REM del debug_out.sln
@REM del .\.vs
@REM start devenv .\debug_out.exe
)