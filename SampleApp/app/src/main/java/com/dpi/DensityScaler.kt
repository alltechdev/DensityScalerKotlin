package com.dpi

/**
 * DensityScaler - Main entry point for screen density scaling.
 *
 * This ContentProvider automatically initializes when your app starts and applies
 * the specified density scale factor to your entire application.
 *
 * To use this in your app:
 * 1. Copy this file and its dependencies to your project's com.dpi package
 * 2. Add the ContentProvider declaration to your AndroidManifest.xml:
 *    <provider
 *        android:name="com.dpi.DensityScaler"
 *        android:authorities="${applicationId}.com.dpi.DensityScaler"
 *        android:exported="true" />
 * 3. Change SCALE_FACTOR below to your desired value (0.5 = 50%, 0.7 = 70%, etc.)
 * 4. Rebuild your app
 */
class DensityScaler : BaseLifecycleContentProvider() {

    override fun onCreate(): Boolean {
        val context = context ?: return false
        DensityConfiguration(SCALE_FACTOR).applyDensityScaling(context)
        return true
    }

    companion object {
        private val TAG = DensityScaler::class.java.simpleName

        /**
         * CHANGE THIS VALUE to adjust the screen density scale.
         *
         * Examples:
         * - 0.5f  = 50% scale (smaller UI, more content fits on screen)
         * - 0.7f  = 70% scale (default)
         * - 1.0f  = 100% scale (no change)
         * - 1.5f  = 150% scale (larger UI, less content fits on screen)
         *
         * Common values: 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9
         */
        private const val SCALE_FACTOR = 0.7f
    }
}
