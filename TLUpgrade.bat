@echo on
cls

:: 当前程序所在目录
set LocalPath=%~dp0
:: TL更新包完全路径名,不带后缀，同时也是解压缩后的文件夹名称
set  TLZipFile=%~dp0TLUpgradeData\TL_%1
:: TL更新包解压路径
set  TLDecompressPath=%~dp0TLUpgradeData\

echo 执行更新，请稍后...

echo ----1.关闭客户端进程----
tasklist /nh|find /i "TL.exe"
if ERRORLEVEL 1 (echo TL客户端进程已经结束) else (taskkill /f /im TL.exe)
tasklist /nh|find /i "TC.exe"
if ERRORLEVEL 1 (echo TC客户端进程已经结束) else (taskkill /f /im TC.exe)

echo ----2.开始解压缩安装包----
if exist %TLZipFile%.zip   %LocalPath%7z x %TLZipFile%.zip -o%TLDecompressPath% -aoa

echo ----3.开始复制文件----
xcopy %TLZipFile%  %LocalPath% /e /f /k /y
:: xcopy switch说明：
:: /E           复制目录和子目录，包括空目录。
:: /F           复制时显示完整的源文件名和目标文件名。
:: /K           复制属性。一般的 Xcopy 会重置只读属性。
:: /Y           取消提示以确认要覆盖

echo ----4.删除临时文件----
del %TLZipFile%.zip
rmdir %TLZipFile% /s /q
:: 删除当文件夹和里面的所有文件，/s 表示包含子文件夹，/q 表示不需要确实提示 
pause
