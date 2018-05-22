@echo off
if not exist README.md goto :wrongfolder 
md deploy 1>nul 2>nul
del deploy\*.* /q
copy src\web\wikitemplates\*.* deploy\.
htmlminifier deploy\.
echo common.css
node utils\makelive.js < src\web\wikicss\common.css > deploy\common.css
goto :eof

:wrongfolder
echo Please run from the project root folder.
