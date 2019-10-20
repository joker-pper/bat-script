@echo off

echo **********************************************************
echo     	              启动带标题的脚本
echo **********************************************************

set cmd_title=first-title-cmd

echo current cmd title is %cmd_title%
::设置标题

TITLE %cmd_title%
pause