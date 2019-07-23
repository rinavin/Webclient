echo off
set inputDirectory=%1

rem copy the json files
echo copying files
robocopy %inputDirectory% "magic-metadata" /s /NFL /NDL /NJH /NJS /nc /ns /np