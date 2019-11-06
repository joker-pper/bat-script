@echo off

set hour=%time:~0,2%

::移除hour中的空格并进行格式化处理(兼容Win Server 2008)
set hour=%hour: =%
::set hour=0

echo 处理前的hour:%hour%

set hour_prefix=%hour:~0,1%
echo hour_prefix:%hour_prefix%

if "%hour%"=="0" (
   set hour=0%hour%
) else (
    if %hour% lss 10 (
        ::不为0且小于10时直接进行补0
        set hour=0%hour%
     )
)

echo 处理后的hour:%hour%

pause
