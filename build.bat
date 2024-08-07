::======================================================
:: Build the out.exe for the release version
::======================================================
@echo off
if exist .\bin\release\out.exe (
    del .\bin\release\out.exe
)


:: Compile the source files (RAYLIB)
cl ^
/O2 ^
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
/Fo.\bin\release\obj\ ^
/Fd.\bin\release\vc140.pdb ^
/Fe.\bin\release\out.exe ^
/link ^
/libpath:c:.\libs ^
/NODEFAULTLIB:libcmt



:: Compile the source files (OLIVEC LIBRARY)
@REM cl ^
@REM /O2 ^
@REM /EHsc ^
@REM /nologo ^
@REM /TC ^
@REM .\source\*.cpp ^
@REM /I:.\include ^
@REM /Fo.\bin\release\obj\ ^
@REM /Fd.\bin\release\vc140.pdb ^
@REM /Fe.\bin\release\out.exe 



:: Execute Program: 
echo Executing the program: .\bin\release\out.exe
.\bin\release\out.exe ./data/adder.arch ./data/adder.mat 

@REM echo Executing the program: .\bin\release\out.exe
@REM .\bin\release\out.exe ./data/xor.arch ./data/xor.mat 