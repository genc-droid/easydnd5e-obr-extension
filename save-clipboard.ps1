param([Parameter(Mandatory=$true)][string]$Name)

Add-Type -AssemblyName System.Windows.Forms
$img = [System.Windows.Forms.Clipboard]::GetImage()

if ($null -eq $img) {
    Write-Host "Clipboard is empty or doesn't contain an image. Take a screenshot first (Win+Shift+S)." -ForegroundColor Red
    exit 1
}

$dir = Join-Path $PSScriptRoot 'screenshots'
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }

$path = Join-Path $dir "$Name.png"
$img.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
Write-Host "Saved: $path ($($img.Width)x$($img.Height))" -ForegroundColor Green
