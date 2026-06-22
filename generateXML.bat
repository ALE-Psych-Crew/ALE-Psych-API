@echo off

set "ALE_PSYCH_PATH=%~1"
if "%ALE_PSYCH_PATH%"=="" set "ALE_PSYCH_PATH=..\ALE-Psych"

pushd "%ALE_PSYCH_PATH%"
haxelib run lime display windows > docsGenerator.hxml
echo -xml docs.xml>> docsGenerator.hxml
haxe docsGenerator.hxml
set "GEN_EXIT=%ERRORLEVEL%"
popd
exit /b %GEN_EXIT%
