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

:: Run GUI
python ImageCaption.py || (
    echo Python script failed to run.
    exit /b 1
)
