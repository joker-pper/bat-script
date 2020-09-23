@echo off
echo ****************************************
echo     获取文件哈希值脚本 by joker-pper
echo ****************************************


set /p FILE_FULL_NAME=请输入文件路径:

set /p HashAlgorithm=请输入哈希算法(MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA515): 

::获取哈希值
 certutil -hashfile %FILE_FULL_NAME% %HashAlgorithm% >FILE_HASH_ALGORITHM_TXT
 setlocal enabledelayedexpansion
 set index=0
 for /f "tokens=* delims= " %%i in (FILE_HASH_ALGORITHM_TXT) do (
     ::echo %%i
     if !index! == 1 (set FILE_HASH_RESULT=%%i)
     set /a index=index+1
 )

 del FILE_HASH_ALGORITHM_TXT

 REM 兼容出现空格的情况
 set HASH_RESULT=%HASH_RESULT: =%

 echo 当前文件(%FILE_FULL_NAME%)-%HashAlgorithm%: %FILE_HASH_RESULT%




pause