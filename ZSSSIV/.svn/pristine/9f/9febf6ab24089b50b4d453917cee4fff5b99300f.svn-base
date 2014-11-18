@echo off

::当前目录
set Dir=./

:: ----------------- 启动配置参数 -----------------------
::jar包名
set JarName=synchdb.jar
::是否通过角色ID同步数据(0:是 1：否 2：两种方式同时同步)
set ByRoleID=1
::存放同步生成的sqlite文件的本地路径
set GeneratePath=F:\apache-tomcat-6.0.29\webapps\SSIV\sqlitefile
:: ------------------------------------------------------

:: 此处无需修改
java -jar -Xmn128m -Xms256m -Xmx512m %Dir%%JarName% %JarName% %ByRoleID% %GeneratePath%

pause

