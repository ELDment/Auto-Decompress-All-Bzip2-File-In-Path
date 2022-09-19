@echo off
setlocal EnableDelayedExpansion
if not exist %cd%\bzip2.exe ( 
	echo ������bzip2.exe�ļ����������أ�https://github.com/philr/bzip2-windows && pause>nul && exit
)
if not exist %cd%\bzip2recover.exe ( 
	echo ������bzip2recover.exe�ļ����������أ�https://github.com/philr/bzip2-windows && pause>nul && exit
)
if not exist %cd%\libbz2.dll ( 
	echo ������libbz2.dll�ļ����������أ�https://github.com/philr/bzip2-windows && pause>nul && exit
)
:KeepCheck
cls
echo ���Ƿ��Ѿ�����*.bz2�ļ���
echo ��ѹ��*.bz2�ļ�������ʧ��
echo.
echo ��Y=����ɣ�N=�˳���
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