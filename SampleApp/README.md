# DensityScaler Sample App

This is a lightweight sample Android app demonstrating the DensityScaler library in action.

## What It Does

The app shows a simple UI that displays:
- Current screen density (DPI)
- Density scale factor
- Screen dimensions

The DensityScaler is configured to scale the UI to **70%** of the normal density, making all UI elements appear smaller and allowing more content to fit on screen.

## Building the App

### Option 1: Using Android Studio
1. Open the `SampleApp` folder in Android Studio
2. Let Gradle sync complete
3. Click Run or Build > Build Bundle(s) / APK(s) > Build APK(s)

### Option 2: Using Command Line
```bash
cd SampleApp
./gradlew assembleDebug
```

The APK will be generated at: `app/build/outputs/apk/debug/app-debug.apk`

### Option 3: Using GitHub Actions
This repository includes a GitHub Actions workflow that can build the app automatically:
1. Go to the Actions tab in GitHub
2. Select "Build Sample App" workflow
3. Click "Run workflow"
4. Download the built APK from the workflow artifacts

## How DensityScaler Is Integrated

1. **Source Files**: DensityScaler Kotlin files are in `app/src/main/java/com/dpi/`
2. **Manifest Configuration**: ContentProvider is declared in `AndroidManifest.xml`
3. **Scale Factor**: Set to 0.7f (70%) in `DensityScaler.kt`

To change the scale:
- Edit `app/src/main/java/com/dpi/DensityScaler.kt`
- Modify the `SCALE_FACTOR` constant (line ~38)
- Rebuild the app

## Requirements

- Android SDK 21+ (Android 5.0 Lollipop and above)
- Gradle 8.2
- Kotlin 1.9.20
