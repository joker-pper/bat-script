@echo off

set hour=%time:~0,2%

::�Ƴ�hour�еĿո񲢽��и�ʽ������(����Win Server 2008)
set hour=%hour: =%
::set hour=0

echo ����ǰ��hour:%hour%

set hour_prefix=%hour:~0,1%
echo hour_prefix:%hour_prefix%

if "%hour%"=="0" (
   set hour=0%hour%
) else (
    if %hour% lss 10 (
        ::��Ϊ0��С��10ʱֱ�ӽ��в�0
        set hour=0%hour%
     )
)

echo ������hour:%hour%

pause
