##  JoyCaption - Windows Optimized

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python](https://img.shields.io/badge/Python-3.8%2B-blue)](https://www.python.org/)
[![Windows](https://img.shields.io/badge/Platform-Windows-blue)](https://www.microsoft.com/windows/)

A Windows-optimized version of [JoyCaption](https://github.com/fpgaminer/joycaption/tree/main/gradio-app) that eliminates Linux-specific dependencies and provides a streamlined setup experience for Windows users.

## 🎯 About JoyCaption

JoyCaption is an image captioning Visual Language Model (VLM) being built from the ground up as a free, open, and uncensored model for the community to use in training Diffusion models. The model combines Meta-Llama-3.1-8B with Google's SigLIP vision encoder to provide high-quality image descriptions perfect for AI art generation and dataset preparation.

## 🚀 Key Features

- **Windows Native**: Removes `liger_kernel` dependency that requires `triton` (Linux-only)
- **One-Click Setup**: Automated installation with batch files
- **Portable Installation**: Self-contained Conda environment in `installedfiles/miniconda`
- **Memory Optimization**: Multiple VRAM options (NF4, 8-bit, BF16)
- **Easy Relocation**: Simple environment reconfiguration when moved
- **High-Quality Captions**: Leverages Meta-Llama-3.1-8B for natural, detailed descriptions
- **Gradio Interface**: User-friendly web interface for image captioning
- **Batch Processing Ready**: Can be extended for batch image captioning workflows

## 🔧 What's Different?

The original JoyCaption gradio app (`app.py`) requires `liger_kernel`, which depends on `triton` - a library that only works on Linux systems. This creates a significant barrier for Windows users who want to run JoyCaption locally.

**Original Implementation Issues:**
- Requires `liger_kernel` for memory optimization
- `liger_kernel` depends on `triton` (Linux/CUDA specific)
- Complex setup process for Windows users
- Potential compatibility issues with Windows CUDA installations

**Our Windows-Optimized Solution (`ImageCaption.py`):**
- **Eliminates Linux dependencies**: No more `liger_kernel` or `triton` requirements
- **Maintains full functionality**: All JoyCaption model capabilities preserved
- **Improves Windows compatibility**: Native Windows operation without WSL or Linux subsystems
- **Streamlined installation**: Automated setup with batch files
- **Memory efficiency**: Alternative quantization methods for different VRAM levels

## 📋 Requirements

- **Operating System**: Windows 10/11 (64-bit)
- **GPU**: NVIDIA GPU with CUDA support (recommended for optimal performance)
- **VRAM**: Minimum 8GB (NF4 quantization), 12GB+ (8-bit), 16GB+ (BF16)
- **Storage**: 20GB+ free disk space for model files and dependencies
- **Internet**: Required for initial model download and setup

## 🚀 Quick Start

### 1. Download Conda
```batch
GetConda.bat
```
This downloads and installs Miniconda to `installer_files\Miniconda`.

### 2. Set Environment
```batch
SetEnv.bat
```
Configures the Conda environment paths. **Run this again if you move the folder to a new location.**

### 3. Install Requirements
```batch
InstallRequirements.bat
```
Creates the Python environment and installs all required packages.

### 4. Start the Application
```batch
StartTextCaptioner.bat
```
Launches the JoyCaption interface.

## 🛠️ Manual Operations

For advanced users who need to perform manual operations:

```batch
Cmd.bat
```
Opens a preconfigured command prompt with all necessary Conda paths set.

## 💾 Memory Usage Options

The application automatically selects the best quantization based on your available VRAM:

| VRAM | Quantization | Description |
|------|--------------|-------------|
| 8GB+ | **NF4** | 4-bit quantization for low VRAM |
| 12GB+ | **8-bit** | 8-bit quantization for medium VRAM |
| 16GB+ | **BF16** | Brain Float 16 for high VRAM |

## 📁 Project Structure

```
Joycaption/
├── ImageCaption.py         # Main application (Windows optimized)
├── GetConda.bat            # Download Conda installer
├── SetEnv.bat              # Set environment variables
├── InstallRequirements.bat # Install requirements
├── StartTextCaptioner.bat  # Start the application
├── Cmd.bat                 # Manual command prompt
├── requirements.txt        # Python dependencies
└── installer_files/        # Conda installation directory
    └── Miniconda/          # Miniconda installation
      └── pkgs              # All Miniconda Base Packages
    └── Environments        # All Miniconda Envs
```

## 🔄 Moving the Installation

If you need to move the entire folder to a different location:

1. Move the complete folder to the new location
2. Run `SetEnv.bat` to reconfigure the environment paths
3. Continue using the application normally

## 🛠️ Troubleshooting

### Common Issues

**Environment not found after moving folder:**
- Solution: Run `SetEnv.bat` to reconfigure paths

**CUDA out of memory:**
- Lower the quantization (use NF4 for lower VRAM)
- Close other GPU-intensive applications

**Import errors:**
- Ensure all requirements are installed: run `InstallRequirements.bat`
- Check that CUDA is properly installed

### Manual Environment Reset

If you encounter issues, you can manually reset the environment:

1. Delete the `installer_files` folder
2. Run `GetConda.bat`
3. Run `SetEnv.bat`
4. Run `InstallRequirements.bat`

## 📝 License

This project is licensed under the Apache License 2.0 - the same license as the original JoyCaption project. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Original JoyCaption**: Created by [fpgaminer](https://github.com/fpgaminer/joycaption) - A groundbreaking open-source VLM for image captioning
- **Built upon**: The gradio-app implementation from the original repository
- **Model Components**: 
  - Meta-Llama-3.1-8B language model
  - Google SigLIP vision encoder (siglip-so400m-patch14-384)
- **Community**: Thanks to the AI/ML community for supporting open-source VLM development
- **Windows Optimization**: Independently developed for improved Windows compatibility

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Areas where contributions would be particularly helpful:

- Performance optimizations
- Additional quantization options
- UI improvements
- Documentation enhancements



---

**Note**: This is an independent optimization of the original JoyCaption project, focused specifically on improving Windows compatibility and ease of installation.
