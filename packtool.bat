@echo off
@set mypath=%~dp0
@set filepath=%~dp1
@echo %filepath%
@echo %mypath%cache

@set filename=%~n1

@CALL %mypath%lib\readconfig keyAlias keyAliasValue
@CALL %mypath%lib\readconfig storeFile storeFileValue
@CALL %mypath%lib\readconfig storePassword storePasswordValue
@CALL %mypath%lib\readconfig keyPassword keyPasswordValue


@rd /s/q %mypath%cache

@md %mypath%cache
@md %mypath%cache\apks

@call %mypath%lib\zipalign -v 4 %~1 %mypath%cache\%filename%_nosign.apk

@call java -jar %mypath%lib\apksigner.jar sign --ks %storeFileValue% --ks-key-alias %keyAliasValue% --ks-pass pass:%storePasswordValue%  --key-pass pass:%keyPasswordValue% --out %mypath%cache\%filename%_sign.apk %mypath%cache\%filename%_nosign.apk

@call java -jar %mypath%lib\CheckAndroidV2Signature.jar %mypath%cache\%filename%_sign.apk

@call java -jar %mypath%lib\walle-cli-all.jar batch -f %mypath%channel %mypath%cache\%filename%_sign.apk %mypath%cache\apks