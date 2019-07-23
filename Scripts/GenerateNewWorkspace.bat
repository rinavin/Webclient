echo off
set outputdir=%1
set workspace=%2
set cliVersion=%3
set angularVersion=%4


mkdir  %outputdir%
chdir /d %outputdir%

echo Install angular/cli@8 - Installing angular/cli version 8
cmd.exe /c npm i @angular/cli@8

echo generate new workspace
cmd.exe /c ng new %workspace% --skip-git

chdir %workspace% 

cmd.exe /c npm i 

