@echo off
set /p port=请输入要关闭端口:

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
			echo 已关闭pid - !pid!进程

		) else (

			set /p close=是否关闭【0:否, 1:是】:
			if !close! == 1 (
				taskkill -pid !pid! -f
				set closed_pid=!pid!
				echo 关闭pid - !pid!进程
			)
		)
	) else (
		echo 当前跳过关闭
	)
)

del %file_result%

if %index% == 0 (
	echo 未找到相关信息
)

pause
