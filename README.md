# DensityScaler
Enhance your Android app by dynamically resizing it through density adjustments using this simple tool.

## Edit the Scale Amount
### Java
Modify the scaling factor by editing `DensityScaler.java`. Change the value `0.7f` to your desired float value:
```java
float scale = 0.7f; // Replace this value
```

### Smali
To change the scaling factor in Smali code, update the following line in `DensityScaler.smali`:
```smali
const v2, 0x3F333333    # 0.7f
```
Replace `0x3F333333` with the corresponding hexadecimal value from the table below.

## Using the Java or Smali Files
1. **Add Files to Source Code:** Place the provided files in the `/com/dpi/` directory within your app's source code.
2. **Update AndroidManifest:** Include the following provider in `AndroidManifest.xml`:
   ```xml
   <provider
       android:authorities="your.app.name.com.dpi.DensityScaler"
       android:exported="true"
       android:name="com.dpi.DensityScaler" />
   ```
   **Note:** Replace `your.app.name` with your app’s package name.

## Using the Precompiled `classes.dex`
1. **Decompile Without Source Code:**
   ```bash
   apktool d -s name.of.apk
   ```
2. **Add Precompiled Class File:** Rename the precompiled `classes.dex` file to the next available `classesX.dex`, such as `classes2.dex` or `classes8.dex`, and add it to the decompiled APK.
3. **Update AndroidManifest:**
   Include the following provider:
   ```xml
   <provider
       android:authorities="your.app.name.com.dpi.DensityScaler"
       android:exported="true"
       android:name="com.dpi.DensityScaler" />
   ```
   Again, replace `your.app.name` with your app’s package name.

## Smali Float Values
Use the table below for converting decimal scaling factors to hexadecimal values:

| Decimal | Hexadecimal |
|---------|-------------|
| 0.35    | 0x3EB33333  |
| 0.4     | 0x3ECCCCCD  |
| 0.45    | 0x3EE66666  |
| 0.5     | 0x3F000000  |
| 0.55    | 0x3F0CCCCD  |
| 0.6     | 0x3F19999A  |
| 0.65    | 0x3F266666  |
| 0.7     | 0x3F333333  |
| 0.75    | 0x3F400000  |
| 0.8     | 0x3F4CCCCD  |
| 0.85    | 0x3F59999A  |
| 0.9     | 0x3F666666  |

By following these steps, you can successfully scale your Android app and fine-tune it for different density preferences.

