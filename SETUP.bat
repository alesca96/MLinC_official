::======================================================
::Setup Environment and Creates Directories 
::======================================================
@echo off

setlocal
set VS_PATH=
for %%i in (
    "C:\%Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvarsall.bat"
    "C:\%Program Files\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat"
) do (
    if exist "%%i" (
        set VS_PATH=%%i
        goto :found
    )
)
echo Error: Unable to find vcvarsall.bat
exit /b 1

:found
echo Using vcvarsall.bat at %VS_PATH%

:: Set up the Visual Studio environment
call %VS_PATH% x64

:: Make directories: 
    :: Bin
    if not exist bin mkdir bin
    :: Debug
    if not exist bin\debug mkdir bin\debug
    if not exist bin\release\vc140 mkdir bin\release\vc140
    if not exist bin\debug\obj mkdir bin\debug\obj
    if not exist bin\debug\vc140 mkdir bin\debug\vc140
    if not exist bin\debug\analysis mkdir bin\debug\analysis
    if not exist bin\debug\asm mkdir bin\debug\asm
    if not exist bin\debug\VisualStudio mkdir bin\debug\VisualStudio
    :: Release
    if not exist bin\release mkdir bin\release
    if not exist bin\release\obj mkdir bin\release\obj

code .