@echo off
echo **********************************************************
echo     	     关闭端口脚本 by joker-pper
echo **********************************************************

set /p CLOSE_PORT=请输入要关闭的端口:

::设置结果输出的文件
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
	        ::仅在LISTENING下增加索引值
		set /a index=index+1

		if !closed_pid! == !pid! (
			echo 已关闭pid - !pid!进程

		) else (
			echo ----------------------------------------------------------
			echo !key!
			echo ----------------------------------------------------------
			set /p close=是否关闭 【0:否, 1:是】:
			if !close! == 1 (
				taskkill -pid !pid! -f
				set closed_pid=!pid!
				echo 关闭pid - !pid!进程
			)
		)
	)

)
::删除输出文件
del %RESULT_OUT_FILE%

if %index% == 0 (
	echo 未找到该端口的相关信息
)

pause
