# packtool
Android fast packaging tools based on Walle

## 使用方法
1. 使用Walle正确配置渠道id，正常生成apk文件，进行对该文件进行加固等操作
2. 在channel文件设置渠道配置具体语法参考Walle,在config.ini文件配置应用签名（这里第一行留一行空白）
3. 将加固过的apk文件拖到packtool.bat上,或使用命令行：packtool [文件路径]
4. packtool将自动打包签名，生成的文件在/cache/apks中

## 项目说明
~~~
/lib  处理所使用的三方工具
/beta 未完成的Python版开发文件
channel 渠道配置文件
config.ini 签名配置文件
packtool.bat 执行文件
~~~
