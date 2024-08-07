::======================================================
:: Runs code to Generate Data
::======================================================
@echo off

cd .\data 

:: Input Path (provided by user)
set /p "source_file=Enter the path to the .cpp source file: "

:: Extract the base name of the source file without the extension
for %%f in ("%source_file%") do set "basename=%%~nf"

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
%source_file% ^
/I:..\include ^
/Fo.\ ^
/Fe.\%basename%.exe ^
/link ^
/libpath:c:..\libs ^
/NODEFAULTLIB:libcmt

:: Delete intermediate files
del /q .\*.obj

:: Notify user of completion
echo Compilation complete. Output executable: %basename%.exe

:: Run the compiled executable
.\%basename%.exe

:: Notify user that the program has finished running
echo Program %basename%.exe has finished running.

:: Delete the executable
del /q .\%basename%.exe

:: Notify user that the executable has been deleted
echo Executable %basename%.exe has been deleted.