@echo off
set /p port=������Ҫ�رն˿�:

set file_result=port-result-file

netstat -nao | findstr %port%>%file_result%

setlocal enabledelayedexpansion
set index=0
set closed_pid=-1
for /f "tokens=1,2,3,4,5 delims= " %%a in (!file_result!) do (
	set treaty=%%a
	set local_address=%%b
	set out_address=%%c
	set status=%%d
	set pid=%%e

	set /a index=index+1
	set key=!treaty! - !local_address! - !out_address! - !status! - !pid!

	echo !key!
	if !status! == LISTENING (
		if !closed_pid! == !pid! (
			echo �ѹر�pid - !pid!����

		) else (

			set /p close=�Ƿ�رա�0:��, 1:�ǡ�:
			if !close! == 1 (
				taskkill -pid !pid! -f
				set closed_pid=!pid!
				echo �ر�pid - !pid!����
			)
		)
	) else (
		echo ��ǰ�����ر�
	)
)

del %file_result%

if %index% == 0 (
	echo δ�ҵ������Ϣ
)

pause
