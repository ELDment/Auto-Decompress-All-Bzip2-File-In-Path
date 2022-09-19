@echo off
setlocal EnableDelayedExpansion
if not exist %cd%\bzip2.exe ( 
	echo 不存在bzip2.exe文件，请先下载：https://github.com/philr/bzip2-windows && pause>nul && exit
)
if not exist %cd%\bzip2recover.exe ( 
	echo 不存在bzip2recover.exe文件，请先下载：https://github.com/philr/bzip2-windows && pause>nul && exit
)
if not exist %cd%\libbz2.dll ( 
	echo 不存在libbz2.dll文件，请先下载：https://github.com/philr/bzip2-windows && pause>nul && exit
)
:KeepCheck
cls
echo 您是否已经备份*.bz2文件？
echo 解压后*.bz2文件将会消失！
echo.
echo （Y=已完成，N=退出）
set /p KeepIn=[Y / N]: 
if /i "%KeepIn%"=="Y" (
	goto Next
) 
if /i "%KeepIn%"=="N" (
	exit
) 
goto KeepCheck
:Next
for /f "delims=" %%i in ('"dir /aa/s/b/on *.*.bz2"') do (
	set file=%%~fi
	set file=!file:/=/!
	bzip2 -d -v !file! 
)
pause>nul