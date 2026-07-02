@ECHO OFF

REM Using Github Desktop on samba share is very slow

robocopy "Z:\Documents\Linux\arch" "C:\Users\john\Documents\GitHub\arch" /s /njh /njs

TIMEOUT 10
