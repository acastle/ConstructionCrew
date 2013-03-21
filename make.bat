@echo off
RMDIR /S /Q bin\

XCOPY /E src\*.lua bin\

pushd %~dp0\bin\
rename *.lua *.
popd

for /d %%x in (bin\*) do @(
 pushd %%x
 rename *.lua *.
 popd
)