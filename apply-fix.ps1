Write-Host "Applying Kotlin duplicate-class build workaround..."

if (-not (Test-Path ".\gradlew")) {
    Write-Host "ERROR: Run this script from the Android project root."
    exit 1
}

if (-not (Test-Path ".\gradle.properties")) {
    New-Item -ItemType File ".\gradle.properties" | Out-Null
}

$content = Get-Content ".\gradle.properties" -Raw

if ($content -notmatch "kotlin.stdlib.jdk.variants.version.alignment") {
    Add-Content ".\gradle.properties" "`r`n# Kotlin stdlib variant alignment`r`nkotlin.stdlib.jdk.variants.version.alignment=true"
}

Write-Host ""
Write-Host "Alignment property added."
Write-Host "IMPORTANT: Remove any explicit kotlin-stdlib-jdk7/jdk8 1.6.21 dependencies from your Gradle files."
Write-Host ""
Write-Host "Run:"
Write-Host "  .\gradlew clean"
Write-Host "  .\gradlew assembleRelease --no-daemon"