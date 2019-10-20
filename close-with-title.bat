@echo off

echo **********************************************************
echo     	     close the first title cmd
echo **********************************************************

set cmd_title=first-title-cmd

taskkill /f /fi "windowtitle eq %cmd_title%"
::pause