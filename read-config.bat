@echo off
::author joker-pper

setlocal enabledelayedexpansion
::读取配置文件(格式: key=value)
for /f "tokens=1,2 delims== " %%i in (read-config.ini) do (
	set config_value=%%j
	if defined config_value (
	    ::存在值时
	    set config_name=%%i
	    echo 配置名称: !config_name!  值: !config_value!
	    
	)

)



pause