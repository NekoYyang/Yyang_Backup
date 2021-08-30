@echo off

REM #-----------脚本介绍-----------
REM #脚本名字:Yyang_Backup 阳阳备份工具
REM #当前版本:1.1
REM #本bat脚本由阳阳_Yyang编写
REM #脚本源码已公开，非付费工具 工具更新/下载地址：github.com/Hua-Fan-Yang/Yyang_Backup
REM #本工具已集成7zip压缩工具
REM #-----------脚本工作流程介绍-----------
REM #1 设置时间时间变量
REM #2 复制需要备份的文件到脚本自动生成的data文件夹内
REM #3 压缩data内文件
REM #4 压缩日志文件
REM #5 设置自动删除日期并删除7天前的备份文件
REM #6 删除临时文件夹
REM #7 备份次数变量+1
REM #8 等待倒计时结束后再次备份
REM #-----------日志会保存什么呢-----------
REM #1 你备份的文件文件夹与文件名字  具体请自己打开log文件查看，普通技术部就能打开
REM #2 压缩过程信息
REM #3 变量运行情况

set a=1
REM #备份次数变量 "无需修改"
:Menu
chcp 233
echo %date%%time%>>./data/data.log
set MM1=%date:~5,2%
if "%date:~5,2%"=="01" set MM1=1
if "%date:~5,2%"=="02" set MM1=2
if "%date:~5,2%"=="03" set MM1=3
if "%date:~5,2%"=="04" set MM1=4
if "%date:~5,2%"=="05" set MM1=5
if "%date:~5,2%"=="06" set MM1=6
if "%date:~5,2%"=="07" set MM1=7
if "%date:~5,2%"=="08" set MM1=8
if "%date:~5,2%"=="09" set MM1=9
REM #日期格式更变 "无需修改"
md data
REM #创建临时文件夹 "无需修改"
set A1=%date:~0,4%-%MM1%-%date:~8,2%
REM #时间变量设置 "无需修改"
title Yyang_Backup 阳阳备份工具 [备份次数 %a% ]
echo 自动备份已开始请勿关闭此窗口！！！！！
echo 备份已开始请勿关闭此窗口！！！！！
echo 备份期间窗口可能不会出现任何内容[内容会被保存到log文件夹里]
REM #"无需修改"

REM #---------------------------需要修改---------------------------
set sourcePath=D:\MSF Survival Focos\
REM #需要备份的地址"修改等于号后面的即可记得以\结尾,否则将会出问题" 需要修改！！！！！！！
REM #---------------------------需要修改---------------------------

set targetPath=.\data\
REM #备份文件临时存储位置 "无需修改"
set folderName=backup
REM #临时文件名字 "无需修改"
XCOPY /e /c /y  "%sourcePath%*" "%targetPath%%folderName%\">>./data/data.log
REM #备份的设置 "无需修改"
set zip7=.\7z\7z.exe
REM #设置7z的命令行程序路径 "无需修改"
set Save=%A1%
REM #设置备份压缩包保存路径  "请勿修改"[否则自动删除失效]
set curdate=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%
REM #压缩文件名字 "无需修改"
set www=.\data\backup\
REM #设置要打包压缩的文件夹 "无需修改"
"%zip7%" a -tzip "%Save%\%curdate%.zip" "%www%" -mx0 -xr!.svn >>./data/data.log
REM #备份命令 -xr!.svn过滤.svn文件夹 "无需修改"
echo Done time %date% %time%>>./data/data.log
REM #完成时间记录 "无需修改"
set zip7=.\7z\7z.exe
set Save=.\log\
set www=.\data\data.log
"%zip7%" a -tzip "%Save%\%curdate%.zip" "%www%" -mx0 -xr!.svn
REM #日志压缩程序 "无需修改"
set RDY=%date:~0,4%
set RDM=%MM1%
set /a RDD=%date:~8,2%-7

if "%date:~5,2%"=="01"  if "%date:~8,2%"=="1" set /a RDY=%date:~0,4%-1
if "%date:~5,2%"=="01"  if "%date:~8,2%"=="2" set /a RDY=%date:~0,4%-1
if "%date:~5,2%"=="01"  if "%date:~8,2%"=="3" set /a RDY=%date:~0,4%-1
if "%date:~5,2%"=="01"  if "%date:~8,2%"=="4" set /a RDY=%date:~0,4%-1
if "%date:~5,2%"=="01"  if "%date:~8,2%"=="5" set /a RDY=%date:~0,4%-1
if "%date:~5,2%"=="01"  if "%date:~8,2%"=="6" set /a RDY=%date:~0,4%-1
if "%date:~5,2%"=="01"  if "%date:~8,2%"=="7" set /a RDY=%date:~0,4%-1

if "%date:~8,2%"=="1" set /a RDM=%MM1%-1
if "%date:~8,2%"=="2" set /a RDM=%MM1%-1
if "%date:~8,2%"=="3" set /a RDM=%MM1%-1
if "%date:~8,2%"=="4" set /a RDM=%MM1%-1
if "%date:~8,2%"=="5" set /a RDM=%MM1%-1
if "%date:~8,2%"=="6" set /a RDM=%MM1%-1
if "%date:~8,2%"=="7" set /a RDM=%MM1%-1

if "%date:~8,2%"=="1" set RDD=25
if "%date:~8,2%"=="2" set RDD=26
if "%date:~8,2%"=="3" set RDD=27
if "%date:~8,2%"=="4" set RDD=28
if "%date:~8,2%"=="5" set RDD=29
if "%date:~8,2%"=="6" set RDD=30
if "%date:~8,2%"=="7" set RDD=31

if "%MM1%"=="3" if "%date:~8,2%"=="1" set RDD=23
if "%MM1%"=="3" if "%date:~8,2%"=="2" set RDD=24
if "%MM1%"=="3" if "%date:~8,2%"=="3" set RDD=25
if "%MM1%"=="3" if "%date:~8,2%"=="4" set RDD=26
if "%MM1%"=="3" if "%date:~8,2%"=="5" set RDD=27
if "%MM1%"=="3" if "%date:~8,2%"=="6" set RDD=28
if "%MM1%"=="3" if "%date:~8,2%"=="7" set RDD=29

echo %RD%>>./data/data.log
set RD=%RDY%-%RDM%-%RDD%
rd /s /q .\%RD%\ 
REM #自动删除脚本 "无需修改"

rd /s /q .\data\ 
REM #临时文件夹 "无需修改"
echo 备份完毕，等待下一轮备份。
echo %RDY%-%RDM%-%RDD%>>./data/data.log
set /a a=%a%+1
REM #备份次数变量 "无需修改"
echo %date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%>>./data/data.log

REM #---------------------------选择修改---------------------------
timeout /nobreak /t 30
REM #备份完后等待多久进行下一次备份，以秒为单位，选择修改！！！！！！！
REM #---------------------------选择修改---------------------------

goto Menu
REM #  by：阳阳_Yyang