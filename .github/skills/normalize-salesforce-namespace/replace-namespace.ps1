param(
    [string]$TargetRoot = "force-app/main/default",
    [string]$OldPrefix = "copado_know1__",
    [string]$NewPrefix = "copadoai__"
)

$root = Join-Path -Path (Get-Location) -ChildPath $TargetRoot

if (-not (Test-Path -Path $root)) {
    throw "Target root not found: $root"
}

$files = Get-ChildItem -Path $root -Recurse -File | Where-Object {
    Select-String -Path $_.FullName -Pattern [regex]::Escape($OldPrefix) -SimpleMatch -Quiet
}

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    $updated = $content.Replace($OldPrefix, $NewPrefix)
    if ($updated -ne $content) {
        Set-Content -Path $file.FullName -Value $updated -Encoding utf8
        Write-Output "Updated $($file.FullName)"
    }
}