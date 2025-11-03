# DensityScaler
Enhance your Android app by dynamically resizing it through density adjustments using this simple tool.

**Now available in Kotlin!** Choose your preferred implementation: Kotlin (recommended for modern apps), Java, or Smali/DEX for modifying existing APKs.

---

## 🚀 Quick Start with Kotlin (Recommended)

### Step 1: Add Files to Your Project
Copy all Kotlin files from the `Kotlin/com/dpi/` directory to your project:
```
YourProject/app/src/main/java/com/dpi/
├── DensityScaler.kt
├── BaseLifecycleContentProvider.kt
├── ActivityLifecycleManager.kt
└── DensityConfiguration.kt
```

### Step 2: Update AndroidManifest.xml
Add this inside the `<application>` tag:
```xml
<provider
    android:name="com.dpi.DensityScaler"
    android:authorities="${applicationId}.com.dpi.DensityScaler"
    android:exported="true" />
```

**Note:** Using `${applicationId}` automatically uses your app's package name. Alternatively, replace it manually like: `com.yourapp.package.com.dpi.DensityScaler`

### Step 3: Configure Scaling (Adaptive or Fixed)

**Option A: Adaptive Scaling (Default - Recommended)**

The scaler automatically adjusts based on device screen size:
- **Small phones** (< 360dp): 65% scale
- **Normal phones** (360-600dp): 70% scale
- **Small tablets** (600-720dp): 75% scale
- **Large tablets** (720dp+): 80-85% scale

No configuration needed - it works automatically!

**Option B: Fixed Scale Factor**

To use a fixed scale for all devices, open `DensityScaler.kt`:
```kotlin
companion object {
    // Disable adaptive scaling
    private const val USE_ADAPTIVE_SCALING = false

    // Set your fixed scale factor
    private const val FIXED_SCALE_FACTOR = 0.7f  // 70% scale
}
```

**Scale Factor Guide:**
- `0.5f` = 50% scale (much smaller UI, more content)
- `0.7f` = 70% scale (balanced)
- `1.0f` = 100% scale (no change)
- `1.5f` = 150% scale (larger UI for accessibility)

### Step 4: Build and Run
Rebuild your app - the density scaling will automatically apply on app launch!

### Troubleshooting
- **App crashes on launch?** Check that the ContentProvider authority matches your package name
- **No effect visible?** Make sure you changed `SCALE_FACTOR` and rebuilt the app
- **Gradle sync issues?** Ensure Kotlin is enabled in your project (it should be by default in modern Android Studio)

---

## Alternative Methods (Java, Smali, Precompiled DEX)

### Method 1: Java Source

#### Edit the Scale Amount
Modify the scaling factor by editing `DensityScaler.java`. Change the value `0.7f` to your desired float value:
```java
float scale = 0.7f; // Replace this value
```

#### Using Java Files
1. **Add Files to Source Code:** Place the provided files from `Java/com/dpi/` directory in your app's source code at `/com/dpi/`
2. **Update AndroidManifest:** Include the following provider in `AndroidManifest.xml`:
   ```xml
   <provider
       android:authorities="your.app.name.com.dpi.DensityScaler"
       android:exported="true"
       android:name="com.dpi.DensityScaler" />
   ```
   **Note:** Replace `your.app.name` with your app's package name.

### Method 2: Smali (For APK Modification)
To change the scaling factor in Smali code, update the following line in `DensityScaler.smali`:
```smali
const v2, 0x3F333333    # 0.7f
```
Replace `0x3F333333` with the corresponding hexadecimal value from the table below.

#### Using Smali Files
1. **Decompile Your APK:**
   ```bash
   apktool d name.of.apk
   ```
2. **Add Smali Files:** Copy files from `Smali/com/dpi/` to the decompiled APK's smali directory
3. **Update AndroidManifest:** Add the ContentProvider (see above)
4. **Rebuild APK:**
   ```bash
   apktool b name.of.apk
   ```

### Method 3: Precompiled DEX (Easiest for APK Modification)
1. **Decompile Without Source Code:**
   ```bash
   apktool d -s name.of.apk
   ```
2. **Choose a Precompiled DEX:** Select one of the precompiled `classes(.X).dex` files based on your desired scale (0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8)
3. **Add to APK:** Rename it to the next available `classesX.dex` (e.g., `classes2.dex` if your APK has classes.dex, or `classes8.dex` if it has up to classes7.dex)
4. **Update AndroidManifest:**
   ```xml
   <provider
       android:authorities="your.app.name.com.dpi.DensityScaler"
       android:exported="true"
       android:name="com.dpi.DensityScaler" />
   ```
   Replace `your.app.name` with the target app's package name.
5. **Rebuild and Sign:**
   ```bash
   apktool b name.of.apk
   # Then sign the APK with your keystore
   ```

---

## Reference: Smali Float Values (IEEE 754 Hex)

For Smali modifications, use these hexadecimal values:

| Scale | Decimal | Hexadecimal | Effect |
|-------|---------|-------------|--------|
| 35%   | 0.35    | 0x3EB33333  | Much smaller UI |
| 40%   | 0.4     | 0x3ECCCCCD  | Very small UI |
| 45%   | 0.45    | 0x3EE66666  | Small UI |
| 50%   | 0.5     | 0x3F000000  | Half scale |
| 55%   | 0.55    | 0x3F0CCCCD  | Moderate small |
| 60%   | 0.6     | 0x3F19999A  | Slightly small |
| 65%   | 0.65    | 0x3F266666  | Slightly small |
| **70%** | **0.7** | **0x3F333333** | **Default (recommended)** |
| 75%   | 0.75    | 0x3F400000  | Slightly larger |
| 80%   | 0.8     | 0x3F4CCCCD  | Larger UI |
| 85%   | 0.85    | 0x3F59999A  | Much larger |
| 90%   | 0.9     | 0x3F666666  | Very large UI |

---

## 📱 What This Does

DensityScaler dynamically adjusts your Android app's screen density (DPI) without modifying any of your UI code.

**🌟 NEW: Smart Adaptive Scaling**
By default, DensityScaler now automatically detects your device type and applies the optimal scale:
- Small phones get more aggressive scaling (65%) to maximize content
- Normal phones get balanced scaling (70%)
- Tablets get lighter scaling (75-85%) for comfortable viewing

**Use Cases:**
- **Multi-Device Support:** One configuration works optimally across phones and tablets
- **Testing:** See how your app looks at different densities
- **Accessibility:** Make UI elements larger or smaller
- **APK Modification:** Resize third-party apps
- **Development:** Quick density testing without device changes

The tool works by using a ContentProvider that initializes early in the app lifecycle and applies density scaling before any UI is rendered.

---

## 💡 Pro Tips

1. **Try the sample app**: The included sample app has an interactive simulator that lets you resize the UI in real-time!
2. **Use adaptive scaling**: Let the library automatically optimize for different devices (enabled by default)
3. **Start with 100%**: Normal phones and tablets work great at standard density (no scaling needed)
4. **Use Kotlin version**: More maintainable and modern with better inline documentation
5. **Backup your APK**: When modifying existing APKs, always keep the original
6. **Check logs**: Look for "DensityConfiguration" logs to verify scaling is applied

---

## 🤝 Contributing

Found a bug or want to improve the code? Feel free to submit issues or pull requests!

## 📄 License

This project is open source. Use it freely in your projects.

