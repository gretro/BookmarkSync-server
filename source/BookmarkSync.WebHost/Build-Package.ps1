#==============================================================
# Variables
#==============================================================
$ErrorActionPreference = "Stop"
$projectPath = Split-path -parent $MyInvocation.MyCommand.Definition
$packagePath = Join-Path $projectPath -ChildPath "_Published"

function Write-Title($title) {
    Write-Host "`r`n=============================================" -ForegroundColor DarkGreen
    Write-Host "> $title"
    Write-Host "=============================================`r`n" -ForegroundColor DarkGreen
}

function Write-Info($msg) {
    Write-Host $msg -ForegroundColor Gray
}

function Write-Message($msg) {
    Write-Host $msg -ForegroundColor DarkGray
}

function Remove-Package {
    Write-Title "Cleaning old package remainings"

    if(Test-Path $packagePath) {
        Remove-Item -Path $packagePath -Recurse -Force
        Write-Info "Done cleaning."
    }
    else {
        Write-Info "Package not found. Skipping this step."
    }
}

function New-Package {
    Write-Title "Generating the package"

    $args = @(
        "publish",
        "-c:Release",
        "-o:$packagePath"
    )

    Write-Message "Will execute command: `r`ndotnet $args"

    Push-Location $projectPath
    try {
        & dotnet $args
    }
    finally {
        Pop-Location
    }
}

function Main {
    Remove-Package

    New-Package

    Write-Info "`r`nDone publishing package!`r`n"
}

Main