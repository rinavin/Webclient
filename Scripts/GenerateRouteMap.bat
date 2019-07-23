echo off
set projectName=%1
set clilinkpath=%2


IF  [%clilinkpath%] NEQ [] (
   echo [V-CLI] npm link %clilinkpath%
   cmd.exe /c npm link %clilinkpath%
)

rem generate the routes map file
echo generating routes map
IF  [%projectName%]==[] (
ng g @magic-xpa/cli:routes
) ELSE (
ng g @magic-xpa/cli:routes --project=%projectName% 
)
