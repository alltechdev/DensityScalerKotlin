# DensityScaler Sample App

A lightweight Android app that demonstrates DensityScaler with an **interactive live UI resizer**.

## What Makes This Special

This isn't just a demo - it's a **fully interactive playground** where you can:
- Switch between 3 different density scales with a single tap
- Watch the entire app resize instantly (with automatic restart)
- See exactly how your UI would look at different densities
- Test what scale factor works best for your use case

Perfect for developers, designers, and product managers who want to visualize density scaling!

## Features

### 1. Current Device Information
Displays real-time metrics about your device:
- Device type classification
- Screen width in dp
- Original DPI (before scaling)
- Currently applied scale percentage
- Current DPI (after scaling)
- Screen resolution in pixels

### 2. Interactive Density Changer 🎮✨

**THE MAIN FEATURE** - Three radio buttons that actually change the app's density:

- **Normal Size (100%)** - Your device's native density (no scaling)
- **Small (75%)** - Fits ~33% more content on screen
- **Smaller (65%)** - Fits ~50% more content on screen

**How it works:**
1. Tap any option
2. App applies the new density scale to the system configuration
3. Activity automatically restarts
4. You see the entire UI (text, buttons, spacing) resize!

This demonstrates DensityScaler's core capability: **runtime density modification without code changes**.

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

1. **Source Files**: DensityScaler Kotlin files copied to `app/src/main/java/com/dpi/`
2. **Manifest Configuration**: ContentProvider declared in `AndroidManifest.xml`
3. **Dynamic Scaling**: Uses `DensityConfiguration.applyDynamicScale()` for runtime changes
4. **Interactive UI**: MainActivity calls `recreate()` after applying new scale

### Key Implementation Details

**DensityConfiguration.kt** has a companion method for dynamic scaling:
```kotlin
fun applyDynamicScale(context: Context, scaleFactor: Float)
```

**MainActivity.kt** handles radio button clicks:
```kotlin
radioGroup.setOnCheckedChangeListener { _, checkedId ->
    val scaleFactor = when (checkedId) {
        R.id.radioOriginal -> 1.0f
        R.id.radioSmallPhone -> 0.75f
        R.id.radioPhone -> 0.65f
        else -> 1.0f
    }
    DensityConfiguration.applyDynamicScale(applicationContext, scaleFactor)
    recreate()  // Restart activity to apply changes
}
```

**Note:** The initial DensityScaler ContentProvider has adaptive scaling disabled in this sample app so users can freely test different densities interactively.

## Requirements

- Android SDK 21+ (Android 5.0 Lollipop and above)
- Gradle 8.2
- Kotlin 1.9.20
