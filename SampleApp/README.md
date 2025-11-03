# DensityScaler Sample App

This is a lightweight sample Android app demonstrating the DensityScaler library in action.

## What It Does

The sample app demonstrates adaptive density scaling with two main features:

### 1. Current Device Information
Displays real-time information about your device:
- Device type (phone or tablet)
- Screen width in dp
- Original and scaled density (DPI)
- Applied scale percentage
- Screen resolution

### 2. Interactive Size Simulator 🎮✨

**LIVE UI RESIZING!** Tap different options to see the entire app resize in real-time:

- **Normal Size (100%)** - Standard device density
- **Small (75%)** - Slightly more compact UI
- **Smaller (65%)** - Much more content visible on screen

When you select an option, the app immediately:
1. Applies the new density scale
2. Restarts automatically
3. Shows you the UI at the new size

**This is a live, interactive demonstration of DensityScaler in action!** You can instantly see how your app would look at different densities without needing multiple devices.

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
3. **Adaptive Scaling**: Enabled by default, automatically adjusts for different devices

### Customizing the Scale

Edit `app/src/main/java/com/dpi/DensityScaler.kt`:

**To disable adaptive scaling and use a fixed value:**
```kotlin
private const val USE_ADAPTIVE_SCALING = false
private const val FIXED_SCALE_FACTOR = 0.7f  // Your desired scale
```

**To adjust the adaptive scaling thresholds:**
Modify the `getAdaptiveScaleFactor()` function to change which scale factors are used for different screen sizes.

## Requirements

- Android SDK 21+ (Android 5.0 Lollipop and above)
- Gradle 8.2
- Kotlin 1.9.20
