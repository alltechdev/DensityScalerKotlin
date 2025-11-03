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
        val scaleFactor = if (USE_ADAPTIVE_SCALING) {
            getAdaptiveScaleFactor(context)
        } else {
            FIXED_SCALE_FACTOR
        }
        DensityConfiguration(scaleFactor).applyDensityScaling(context)
        return true
    }

    companion object {
        private val TAG = DensityScaler::class.java.simpleName

        /**
         * Enable adaptive scaling based on screen size.
         * Set to false to use FIXED_SCALE_FACTOR instead.
         */
        private const val USE_ADAPTIVE_SCALING = true

        /**
         * Fixed scale factor used when USE_ADAPTIVE_SCALING is false.
         *
         * Examples:
         * - 0.5f  = 50% scale (smaller UI, more content fits on screen)
         * - 0.7f  = 70% scale (default)
         * - 1.0f  = 100% scale (no change)
         * - 1.5f  = 150% scale (larger UI, less content fits on screen)
         */
        private const val FIXED_SCALE_FACTOR = 0.7f

        /**
         * Determines the optimal scale factor based on device screen characteristics.
         *
         * Logic:
         * - Small phones (< 360dp): Scaled down to 65% to maximize content
         * - Normal phones (360-600dp): 100% native density
         * - Tablets (600dp+): 100% native density
         */
        private fun getAdaptiveScaleFactor(context: android.content.Context): Float {
            val config = context.resources.configuration

            // Get smallest screen width in dp
            val smallestScreenWidthDp = config.smallestScreenWidthDp

            return when {
                // Small phones (< 360dp width) - scale down to maximize content
                smallestScreenWidthDp < 360 -> 0.65f

                // Normal phones and all tablets - native 100% density
                else -> 1.0f
            }
        }
    }
}
