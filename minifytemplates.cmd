@echo off
if not exist README.md goto :wrongfolder 
md MinifiedTemplates 1>nul 2>nul
del MinifiedTemplates\*.* /q
copy src\web\wikitemplates\*.* MinifiedTemplates\.
htmlminifier MinifiedTemplates\.
goto :eof

:wrongfolder
echo Please run from the project root folder.
