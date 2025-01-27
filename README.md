# DensityScaler
Add this code to any app to resize the app by changing the density.

## Edit the scale amount
#### In Java:
In the DensityScaler.java change the `0.7f` to whatever value you want
#### In Smali:
In the DensityScaler.smali change the line `const v2, 0x3f333333    # 0.7f`
### To use the .Java or .Smali files

Add the .Java files directly to the app source code in /com/dpi/

Add the provider com.dpi.DensityScaler to the AndroidManifest.xml.

`<provider android:authorities="your.app.name.com.dpi.DensityScaler" android:exported="true" android:name="com.dpi.DensityScaler"/>`
Replace `your.app.name` with the name of your app.

### To use the precompiled classes.dex:

Decompile your app without decompiling source
`apktool d -s name.of.apk`

Add the classes.dex file, rename it to the next available option, eg. classes2.dex or classes8.dex

Add the provider com.dpi.DensityScaler to the AndroidManifest.xml.

`<provider android:authorities="your.app.name.com.dpi.DensityScaler" android:exported="true" android:name="com.dpi.DensityScaler"/>`
Replace `your.app.name` with the name of your app.
