@echo off
setlocal enabledelayedexpansion

echo Building...
CALL sass src/shoe-leather.scss:dist/shoe-leather-min.css --style compressed
CALL sass src/shoe-leather.scss:dist/shoe-leather.css 

FOR %%I IN ("%cd%\dist\shoe-leather-min.css" "%cd%\dist\shoe-leather.css") do (
    
    SET /a b = %%~zI 
    SET /a kb = %%~zI / 1024
    SET /a kb_dec = %%~zI %% 1024 * 100 / 1024 
    IF !kb_dec! LEQ 10 (
        echo built %%~nI.css - !kb!.0!kb_dec! KB (!b! bytes^^^)
    )
    IF !kb_dec! GEQ 9 (
        echo built %%~nI.css - !kb!.!kb_dec! KB (!b! bytes^^^)
    )
 )
echo Done.