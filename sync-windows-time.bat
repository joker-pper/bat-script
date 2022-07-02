:: 设置UTF-8
chcp 65001

@echo off

echo **********************************************************
echo     	   同步windows时间脚本(需要以管理员模式运行)
echo **********************************************************

@echo on

sc config w32time start=delayed-auto

::修改同步时间频率为5分钟(单位s)  0x12c = 300
:: 对应的为注册表中 regedit 计算机\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient SpecialPollInterval
reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient /v SpecialPollInterval /t REG_DWORD /d 0x12c /f

::设置多个时间同步服务器
w32tm /config /manualpeerlist:"ntp.aliyun.com ntp.cloud.aliyuncs.com time.windows.com" /syncfromflags:manual /update

net stop w32time
net start w32time

::执行同步命令
w32tm /resync

pause