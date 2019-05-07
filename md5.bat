@echo off
echo ******获取文件MD5******

set /p APP_FILE=请输入文件路径:

::获取md5值
certutil -hashfile %APP_FILE% MD5 >APP_MD5_TXT
setlocal enabledelayedexpansion
set index=0
for /f "tokens=* delims= " %%i in (APP_MD5_TXT) do (
	::echo %%i
	if !index! == 1 (set md5=%%i)
 	set /a index=index+1
)

del APP_MD5_TXT

REM 移除md5中的空格,兼容md5出现空格的情况
set md5=%md5: =%

echo 当前文件MD5: %md5%
pause

