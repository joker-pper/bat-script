@echo off
::author joker-pper

setlocal enabledelayedexpansion
::��ȡ�����ļ�(��ʽ: key=value)
for /f "tokens=1,2 delims== " %%i in (read-config.ini) do (
	set config_value=%%j
	if defined config_value (
	    ::����ֵʱ
	    set config_name=%%i
	    echo ��������: !config_name!  ֵ: !config_value!
	    
	)

)



pause