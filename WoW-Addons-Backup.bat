@echo off
title Backup WoW Addons
color 0a

REM The below will create a text file with the list of backup folders needed to compress using 7z
	(
		echo "C:\Program Files (x86)\World of Warcraft\Interface"
		echo "C:\Program Files (x86)\World of Warcraft\WTF"
	) > "BackupFolders.txt"

:choice
echo.
echo Author: Joel
echo Version: 1.3
echo WoW add-ons Backup
echo Note: Addons will be backed up to Google Drive and Pandora Box
echo Interface and WTF Folder will be backed up and compressed
echo --------------------------------------------------------------------------
echo.
set /P c= Are you sure you want to continue [Y/N]?
if /I "%c%" EQU "Y" goto :Start-Backup
if /I "%c%" EQU "N" goto :Exit-Backup
goto :choice

:Start-Backup
echo.
echo Starting Backup...
timeout /t 5 /nobreak
if exist "F:\Backups\WoW-Addons-Backup.7z" del "F:\Backups\WoW-Addons-Backup.7z"
if exist "D:\Google Drive\WoW Backup\WoW-Addons-Backup.7z" del "D:\Google Drive\WoW Backup\WoW-Addons-Backup.7z"

7z a -mx9 "F:\Backups\WoW-Addons-Backup" -r @BackupFolders.txt
7z a -mx9 "D:\Google Drive\WoW Backup\WoW-Addons-Backup" -r @BackupFolders.txt
echo Backup Complete!
timeout /t 15
exit

:Exit-Backup
echo Canceling Backup...
timeout /t 5
exit
