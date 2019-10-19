@echo off
echo ****************************************
echo     获取文件MD5脚本 by joker-pper
echo ****************************************

set /p FILE_FULL_NAME=请输入文件路径:


::获取md5值
certutil -hashfile %FILE_FULL_NAME% MD5 >FILE_MD5_TXT
setlocal enabledelayedexpansion
set index=0
for /f "tokens=* delims= " %%i in (FILE_MD5_TXT) do (
	::echo %%i
	if !index! == 1 (set FILE_MD5=%%i)
 	set /a index=index+1
)

del FILE_MD5_TXT

REM 移除md5中的空格,兼容md5出现空格的情况
set FILE_MD5=%FILE_MD5: =%

echo 当前文件(%FILE_FULL_NAME%)-MD5: %FILE_MD5%

pause