@echo on
cls

:: ��ǰ��������Ŀ¼
set LocalPath=%~dp0
:: TL���°���ȫ·����,������׺��ͬʱҲ�ǽ�ѹ������ļ�������
set  TLZipFile=%~dp0TLUpgradeData\TL_%1
:: TL���°���ѹ·��
set  TLDecompressPath=%~dp0TLUpgradeData\

echo ִ�и��£����Ժ�...

echo ----1.�رտͻ��˽���----
tasklist /nh|find /i "TL.exe"
if ERRORLEVEL 1 (echo TL�ͻ��˽����Ѿ�����) else (taskkill /f /im TL.exe)
tasklist /nh|find /i "TC.exe"
if ERRORLEVEL 1 (echo TC�ͻ��˽����Ѿ�����) else (taskkill /f /im TC.exe)

echo ----2.��ʼ��ѹ����װ��----
if exist %TLZipFile%.zip   %LocalPath%7z x %TLZipFile%.zip -o%TLDecompressPath% -aoa

echo ----3.��ʼ�����ļ�----
xcopy %TLZipFile%  %LocalPath% /e /f /k /y
:: xcopy switch˵����
:: /E           ����Ŀ¼����Ŀ¼��������Ŀ¼��
:: /F           ����ʱ��ʾ������Դ�ļ�����Ŀ���ļ�����
:: /K           �������ԡ�һ��� Xcopy ������ֻ�����ԡ�
:: /Y           ȡ����ʾ��ȷ��Ҫ����

echo ----4.ɾ����ʱ�ļ�----
del %TLZipFile%.zip
rmdir %TLZipFile% /s /q
:: ɾ�����ļ��к�����������ļ���/s ��ʾ�������ļ��У�/q ��ʾ����Ҫȷʵ��ʾ 
pause
