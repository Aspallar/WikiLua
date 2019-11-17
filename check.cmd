@echo off
echo LUA
luacheck src\Lua\wikia
echo ECMAScript
jshint src\web\wikiscripts src\web\adminscripts
