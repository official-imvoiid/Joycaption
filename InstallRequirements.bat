@echo off
setlocal
cd /D "%~dp0"

echo Starting TextCaption environment setup...

set Miniconda=%CD%\installer_files\Miniconda
set Scripts=%CD%\installer_files\Miniconda\Scripts
set Bin=%CD%\installer_files\Miniconda\Library\bin 
set Conda=%CD%\installer_files\Miniconda\_CONDA.exe

:: Set the path temporarily for this session
set PATH=%Miniconda%;%Miniconda%\condabin;%Scripts%;%Bin%;%PATH%

:: Check if conda is available
if not exist "%Conda%" (
    echo ERROR: Conda not found at %Conda%
    echo Please ensure Miniconda is properly installed.
    pause
    exit /b 1
)

:: Remove existing environment if it exists
echo Removing existing textcaption environment if it exists...
call conda env remove -n textcaption -y >nul 2>&1

:: Create Conda environment with Python 3.10.18
echo Creating new textcaption environment with Python 3.10.18...
call conda create -n textcaption python=3.10.18 -y
if %errorlevel% neq 0 (
    echo ERROR: Failed to create conda environment
    pause
    exit /b 1
)

:: Activate the new environment
echo Activating textcaption environment...
call %Scripts%\activate.bat textcaption
if %errorlevel% neq 0 (
    echo ERROR: Failed to activate conda environment
    pause
    exit /b 1
)


:: Install PyTorch packages first from CUDA index
echo Installing PyTorch with CUDA support...
pip install torch>=2.5.0 torchvision>=0.20.0 torchaudio>=2.5.0 --index-url https://download.pytorch.org/whl/cu121
if %errorlevel% neq 0 (
    echo ERROR: Failed to install PyTorch with CUDA
    pause
    exit /b 1
)

:: Install accelerate from regular PyPI
echo Installing accelerate...
pip install accelerate==1.9.0
if %errorlevel% neq 0 (
    echo ERROR: Failed to install accelerate
    pause
    exit /b 1
)

:: Install other packages from regular PyPI
echo Installing other requirements...
pip install bitsandbytes==0.46.1 gradio==5.38.1 pillow==11.3.0 tqdm==4.67.1 transformers==4.53.3
if %errorlevel% neq 0 (
    echo ERROR: Failed to install other requirements
    pause
    exit /b 1
)

:: Verify critical packages are installed
echo Verifying installation...
python -c "import gradio; print('Gradio version:', gradio.__version__)" 2>nul
if %errorlevel% neq 0 (
    echo WARNING: Gradio not properly installed
)

python -c "import PIL; print('Pillow version:', PIL.__version__)" 2>nul
if %errorlevel% neq 0 (
    echo WARNING: Pillow not properly installed
)

:: Deactivate environment
call conda deactivate

echo.
echo ============================================
echo TextCaption environment setup completed!
echo ============================================
echo.
pause