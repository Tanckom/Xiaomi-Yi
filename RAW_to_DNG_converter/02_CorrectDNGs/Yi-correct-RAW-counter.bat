@echo off
setlocal enableextensions enabledelayedexpansion
SET /A COUNT=1
if [%1]==[] goto :eof
:loop
exiftool -WhiteLevel=1024 -BlackLevel=50 %1 -overwrite_original
ECHO !COUNT! file(s) processed.
SET /A COUNT+=1
shift
if not [%1]==[] goto loop