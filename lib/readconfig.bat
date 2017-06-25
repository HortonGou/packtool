@echo off
pushd "%cd%"
cd ..
set pard=%cd%
popd
@for /f "skip=1 tokens=1,2 delims==" %%a IN (%pard%/config.ini) Do if %1==%%a set %2=%%b & @echo readconfig get %%a, value is %%b
@goto :eof