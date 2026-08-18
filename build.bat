@echo off
setlocal

call mvn clean package
if %ERRORLEVEL% NEQ 0 (
    echo Build failed.
    exit /b %ERRORLEVEL%
)

echo.
echo Build successful: target\aurora-portal.war
