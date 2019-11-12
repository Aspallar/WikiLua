@echo off
if not exist README.md goto :wrongfolder 
setlocal

md deploy 1>nul 2>nul
md deploy\templates 1>nul 2>nul
md deploy\js 1>nul 2>nul

del deploy\*.* /q
del deploy\templates\*.*/q
del deploy\js\*.* /q

copy src\web\wikitemplates\*.* deploy\templates\.
htmlminifier deploy\templates\.

set ugly=node node_modules\uglify-js\bin\uglifyjs
for %%f in (src\web\adminscripts\*.js) do (
    echo Uglify %%f to %%~nf.min.js
    %ugly% %%f --compress --mangle --output deploy\js\%%~nf.min.js
)

rem echo common.css
rem node utils\makelive.js < src\web\wikicss\common.css > deploy\common.css
goto :eof

:wrongfolder
echo Please run from the project root folder.
