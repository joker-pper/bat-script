@echo off
echo **********************************************************
echo     	     �رն˿ڽű� by joker-pper
echo **********************************************************

set /p CLOSE_PORT=������Ҫ�رյĶ˿�:

::���ý��������ļ�
set RESULT_OUT_FILE=CLOSE_PORT_RESULT_FILE

netstat -nao | findstr %CLOSE_PORT%>%RESULT_OUT_FILE%

setlocal enabledelayedexpansion
set index=0
set closed_pid=-1
for /f "tokens=1,2,3,4,5 delims= " %%a in (!RESULT_OUT_FILE!) do (
	set treaty=%%a
	set local_address=%%b
	set out_address=%%c
	set status=%%d
	set pid=%%e

	set key=!treaty! - !local_address! - !out_address! - !status! - !pid!

	::echo !key!
	if !status! == LISTENING (
	        ::����LISTENING����������ֵ
		set /a index=index+1

		if !closed_pid! == !pid! (
			echo �ѹر�pid - !pid!����

		) else (
			echo ----------------------------------------------------------
			echo !key!
			echo ----------------------------------------------------------
			set /p close=�Ƿ�ر� ��0:��, 1:�ǡ�:
			if !close! == 1 (
				taskkill -pid !pid! -f
				set closed_pid=!pid!
				echo �ر�pid - !pid!����
			)
		)
	)

)
::ɾ������ļ�
del %RESULT_OUT_FILE%

if %index% == 0 (
	echo δ�ҵ��ö˿ڵ������Ϣ
)

pause
