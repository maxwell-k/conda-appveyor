7z x *.7z.exe > nul|| 7za x *.7z.exe > nul
if not exist "%SCRIPTS%" mkdir %SCRIPTS%
xcopy /s /y /q bin %SCRIPTS%
for %%i in ( etc usr mingw64 ) do (
  mkdir %PREFIX%\%%i
  xcopy /s /y /q %%i %PREFIX%\%%i
)
mkdir %PREFIX%\tmp

