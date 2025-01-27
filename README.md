# DensityScaler
Add this code to any app to resize the app by changing the density.

## Edit the scale amount
In Jave
In Smali

### To use the .Java files

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
