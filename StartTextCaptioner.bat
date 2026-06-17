@echo off
setlocal

cd /D "%~dp0"

:: Define paths
set "Miniconda=%CD%\installer_files\Miniconda"
set "Scripts=%Miniconda%\Scripts"
set "Bin=%Miniconda%\Library\bin"
set "CondaBat=%Miniconda%\condabin\conda.bat"

:: Update PATH
set "PATH=%Miniconda%;%Miniconda%\condabin;%Scripts%;%Bin%;%PATH%"

:: Activate Conda env
call "%CondaBat%" activate textcaption || (
    echo Failed to activate 'textcaption' environment.
    exit /b 1
)

:: Select mode
echo.
echo  [1]  ImageCaption        (2-4k images or less)
echo  [2]  Continuous Caption  (large datasets)
echo.
set /p "choice=  Select mode [1 or 2]: "

if "%choice%"=="1" (
    python ImageCaption.py || ( echo Python script failed to run. & exit /b 1 )
) else if "%choice%"=="2" (
    python Continous_ImageCaption.py || ( echo Python script failed to run. & exit /b 1 )
) else (
    echo Invalid choice.
    exit /b 1
)
