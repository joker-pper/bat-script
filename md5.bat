@echo off
echo ******��ȡ�ļ�MD5******

set /p APP_FILE=�������ļ�·��:

::��ȡmd5ֵ
certutil -hashfile %APP_FILE% MD5 >APP_MD5_TXT
setlocal enabledelayedexpansion
set index=0
for /f "tokens=* delims= " %%i in (APP_MD5_TXT) do (
	::echo %%i
	if !index! == 1 (set md5=%%i)
 	set /a index=index+1
)

del APP_MD5_TXT

REM �Ƴ�md5�еĿո�,����md5���ֿո�����
set md5=%md5: =%

echo ��ǰ�ļ�MD5: %md5%
pause

