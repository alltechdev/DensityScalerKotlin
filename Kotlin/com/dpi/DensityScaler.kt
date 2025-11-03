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
         * - Phones (< 600dp): More aggressive scaling (0.65-0.7) to maximize content
         * - Small tablets (600-720dp): Moderate scaling (0.75)
         * - Large tablets (> 720dp): Light scaling (0.8-0.85)
         * - Also considers screen density for fine-tuning
         */
        private fun getAdaptiveScaleFactor(context: android.content.Context): Float {
            val config = context.resources.configuration
            val displayMetrics = context.resources.displayMetrics

            // Get smallest screen width in dp
            val smallestScreenWidthDp = config.smallestScreenWidthDp

            // Get screen density DPI
            val densityDpi = displayMetrics.densityDpi

            return when {
                // Small phones (< 360dp width) - more aggressive scaling
                smallestScreenWidthDp < 360 -> 0.65f

                // Normal phones (360-600dp) - standard scaling
                smallestScreenWidthDp < 600 -> {
                    when {
                        densityDpi >= 480 -> 0.7f   // xxhdpi and above
                        densityDpi >= 320 -> 0.7f   // xhdpi and hdpi
                        else -> 0.75f               // mdpi and below
                    }
                }

                // Small tablets (600-720dp) - moderate scaling
                smallestScreenWidthDp < 720 -> 0.75f

                // Large tablets (720dp+) - light scaling
                else -> {
                    when {
                        densityDpi >= 320 -> 0.8f   // High density tablets
                        else -> 0.85f               // Standard tablets
                    }
                }
            }
        }
    }
}
