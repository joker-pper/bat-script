@echo off
echo ****************************************
echo     ��ȡ�ļ�MD5�ű� by joker-pper
echo ****************************************

set /p FILE_FULL_NAME=�������ļ�·��:


::��ȡmd5ֵ
certutil -hashfile %FILE_FULL_NAME% MD5 >FILE_MD5_TXT
setlocal enabledelayedexpansion
set index=0
for /f "tokens=* delims= " %%i in (FILE_MD5_TXT) do (
	::echo %%i
	if !index! == 1 (set FILE_MD5=%%i)
 	set /a index=index+1
)

del FILE_MD5_TXT

REM �Ƴ�md5�еĿո�,����md5���ֿո�����
set FILE_MD5=%FILE_MD5: =%

echo ��ǰ�ļ�(%FILE_FULL_NAME%)-MD5: %FILE_MD5%

pause