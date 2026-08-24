# Webipedia Android - Kotlin Duplicate Class Fix

This patch addresses the build error:

Duplicate class kotlin.* found in:
- kotlin-stdlib:1.8.22
- kotlin-stdlib-jdk7:1.6.21
- kotlin-stdlib-jdk8:1.6.21

IMPORTANT:
This is a Gradle fix pack, not the original Android project. The original
webipedia-android source ZIP was not available in this conversation, so the
existing project files cannot be safely rewritten or re-zipped from the
screenshot alone.

## Recommended changes

1. Remove explicit dependencies on:
   org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.6.21
   org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.6.21

2. Keep Kotlin stdlib aligned with the Kotlin Gradle Plugin.

3. Add the Kotlin alignment property shown in gradle.properties.

4. Run:
   ./gradlew clean
   ./gradlew assembleRelease --no-daemon

The deprecated API message from MainActivity.java is only a warning and is
not the cause of the release build failure.

See:
- gradle.properties
- app-build.gradle.fix.txt
- fix-kotlin-duplicates.gradle
- apply-fix.ps1
- apply-fix.sh