echo off
set projectName=%1

IF  [%projectName%]==[] (
cmd.exe /c ng g @magic-xpa/cli:single-control 
) ELSE (
cmd.exe /c ng g @magic-xpa/cli:single-control --project=%projectName%
)
