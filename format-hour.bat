@echo off

set hour=%time:~0,2%

::�Ƴ�hour�еĿո񲢽��и�ʽ������(����Win Server 2008)
set hour=%hour: =%
::set hour=0
::set hour=00
::set hour=01
::set hour=1
::set hour=11


echo ����ǰ��hour:%hour%

set hour_prefix=%hour:~0,1%
echo hour_prefix:%hour_prefix%

if "%hour%"=="0" (
   set hour=0%hour%
) else (
    if %hour% lss 10 (
        ::��hour prefix��Ϊ0ʱ����Ҫ���в�0 (e.g: 01 1)
        if "%hour_prefix%" neq "0" (
            set hour=0%hour%
        )
     )
)

echo ������hour:%hour%

pause
