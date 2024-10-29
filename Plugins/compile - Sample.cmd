@echo off

del /F /Q %~dps0Sample.log 2>NUL
if "%VCpath%"=="" call %~dps0..\getVCpath.cmd || exit /b 1

@echo.

@echo %~dps0Sample.log

	@echo compiling Sample
	%VCpath% Sample /Rebuild "Release|Any CPU" /Out %~dps0Sample.log || (
		@echo failed to compile
		pause
		exit /b 1
	)
	find /I "===" %~dps0Sample.log

if Not "%~1" == "batch" (
	@echo finished
	pause
)
exit /b 0
