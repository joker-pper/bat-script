@echo off
echo ****************************************
echo     ��ȡ�ļ���ϣֵ�ű� by joker-pper
echo ****************************************


set /p FILE_FULL_NAME=�������ļ�·��:

set /p HashAlgorithm=�������ϣ�㷨(MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA515): 

::��ȡ��ϣֵ
 certutil -hashfile %FILE_FULL_NAME% %HashAlgorithm% >FILE_HASH_ALGORITHM_TXT
 setlocal enabledelayedexpansion
 set index=0
 for /f "tokens=* delims= " %%i in (FILE_HASH_ALGORITHM_TXT) do (
     ::echo %%i
     if !index! == 1 (set FILE_HASH_RESULT=%%i)
     set /a index=index+1
 )

 del FILE_HASH_ALGORITHM_TXT

 REM ���ݳ��ֿո�����
 set HASH_RESULT=%HASH_RESULT: =%

 echo ��ǰ�ļ�(%FILE_FULL_NAME%)-%HashAlgorithm%: %FILE_HASH_RESULT%




pause