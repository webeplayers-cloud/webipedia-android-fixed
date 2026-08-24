#!/usr/bin/env bash
set -e

echo "Applying Kotlin duplicate-class build workaround..."

if [ ! -f "gradlew" ]; then
  echo "ERROR: Run this script from the Android project root."
  exit 1
fi

if [ ! -f "gradle.properties" ]; then
  touch gradle.properties
fi

if ! grep -q "kotlin.stdlib.jdk.variants.version.alignment" gradle.properties; then
  printf "\n# Kotlin stdlib variant alignment\nkotlin.stdlib.jdk.variants.version.alignment=true\n" >> gradle.properties
fi

echo ""
echo "Alignment property added."
echo "IMPORTANT: Remove any explicit kotlin-stdlib-jdk7/jdk8 1.6.21 dependencies"
echo "from your Gradle files if they are present."
echo ""
echo "Run:"
echo "  ./gradlew clean"
echo "  ./gradlew assembleRelease --no-daemon"