# Install VS Code
try {
    choco install vscode    
}
# Install extensions
finally {
    code --install-extension ms-vscode.powershell
    code --install-extension ms-azuretools.vscode-bicep
    code --install-extension ms-dotnettools.csharp
    code --install-extension ms-dotnettools.csdevkit
    code --install-extension ms-vscode-remote.remote-containers
    code --install-extension ms-azuretools.vscode-docker
}