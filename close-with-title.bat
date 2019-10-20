@echo off

echo **********************************************************
echo     	              关闭带标题的脚本
echo **********************************************************

set cmd_title=first-title-cmd
taskkill /f /fi "windowtitle eq %cmd_title%

