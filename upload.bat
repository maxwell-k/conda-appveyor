rem A second, identical appveyor build results in a conflict that shows as a
rem build failure. To add a new build increment the build number in meta.yaml.
C:\Python34-x64\Scripts\anaconda.exe -t %1 upload --no-progress %2
IF NOT ERRORLEVEL 2 exit /B 0
IF ERRORLEVEL 2 exit /B 2
