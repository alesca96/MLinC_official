::===========================================================
::Builds the debug_out.exe to debug using Visual Studio Code
::===========================================================
@echo off
if exist .\bin\debug\debug_out.exe (
    del .\bin\debug\debug_out.exe )

:: Compile the source files
cl ^
/ZI ^
/Od ^
/EHsc ^
/nologo ^
gdi32.lib ^
msvcrt.lib ^
raylib.lib ^
winmm.lib ^
user32.lib ^
shell32.lib ^
.\source\*.cpp ^
/I:.\include ^
/Fo.\bin\debug\obj\ ^
/Fp.\bin\debug\vc140\vc140.idb ^
/Fd.\bin\debug\vc140\vc140.pdb ^
/RTC1 ^
/MDd ^
/GS ^
/FC ^
/D_DEBUG ^
/Fe.\bin\debug\debug_out.exe ^
/link ^
/pdb:.\bin\debug\vc140\debug_out.pdb /ilk:.\bin\debug\vc140\debug_out.ilk ^
/libpath:c:.\libs ^
/NODEFAULTLIB:libcmt /NODEFAULTLIB:msvcrtd

:: The following compilations flags can be added if needed
:: /analyze slows down complilation considerably 

:: Assembly: 
@REM /Fo.\bin\debug\obj\ ^
@REM/Fa.\bin\debug\asm\ ^

:: Code Analysis: 
@REM /GS
@REM/analyze ^
@REM/analyze:log .\bin\debug\analysis\ ^
