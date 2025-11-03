package com.dpi.sample

import android.os.Bundle
import android.widget.RadioGroup
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Display current density information
        val densityInfo = findViewById<TextView>(R.id.densityInfo)
        val displayMetrics = resources.displayMetrics
        val config = resources.configuration

        val deviceType = when {
            config.smallestScreenWidthDp < 360 -> "Small Phone"
            config.smallestScreenWidthDp < 600 -> "Phone"
            config.smallestScreenWidthDp < 720 -> "Small Tablet"
            else -> "Tablet"
        }

        val appliedScale = getScaleForScreenWidth(config.smallestScreenWidthDp, displayMetrics.densityDpi)

        densityInfo.text = """
            Device Type: $deviceType
            Screen Width: ${config.smallestScreenWidthDp}dp

            Original Density: ${(displayMetrics.densityDpi / appliedScale).toInt()} dpi
            Applied Scale: ${(appliedScale * 100).toInt()}%
            Current Density: ${displayMetrics.densityDpi} dpi
            Resolution: ${displayMetrics.widthPixels} x ${displayMetrics.heightPixels}
        """.trimIndent()

        // Setup simulator
        setupSimulator()
    }

    private fun setupSimulator() {
        val radioGroup = findViewById<RadioGroup>(R.id.deviceTypeRadioGroup)
        val simulatorResult = findViewById<TextView>(R.id.simulatorResult)

        // Set to normal by default
        radioGroup.check(R.id.radioOriginal)

        // Show initial result
        updateSimulatorResult(radioGroup.checkedRadioButtonId, simulatorResult)

        // Handle radio button changes
        radioGroup.setOnCheckedChangeListener { _, checkedId ->
            val scaleFactor = when (checkedId) {
                R.id.radioOriginal -> 1.0f
                R.id.radioSmallPhone -> 0.75f
                R.id.radioPhone -> 0.65f
                else -> 1.0f
            }

            // Apply the scale dynamically
            com.dpi.DensityConfiguration.applyDynamicScale(applicationContext, scaleFactor)

            // Recreate activity to show changes
            recreate()
        }
    }

    private fun updateSimulatorResult(checkedId: Int, resultTextView: TextView) {
        val (deviceType, scaleFactor) = when (checkedId) {
            R.id.radioOriginal -> Pair("Normal Size", 1.0f)
            R.id.radioSmallPhone -> Pair("Small (Compact)", 0.75f)
            R.id.radioPhone -> Pair("Smaller (More Content)", 0.65f)
            else -> Pair("Normal Size", 1.0f)
        }

        val scalePercent = (scaleFactor * 100).toInt()
        val effect = when {
            scaleFactor == 1.0f -> "Standard device size"
            scaleFactor == 0.75f -> "Slightly more compact"
            else -> "Much more content visible"
        }

        resultTextView.text = """
            $deviceType - $scalePercent%
            Effect: $effect

            👆 Select options above to resize the UI!
            The app will restart to apply changes.
        """.trimIndent()
    }

    private fun getScaleForScreenWidth(screenWidthDp: Int, densityDpi: Int): Float {
        return when {
            screenWidthDp < 360 -> 0.65f
            screenWidthDp < 600 -> {
                when {
                    densityDpi >= 480 -> 0.7f
                    densityDpi >= 320 -> 0.7f
                    else -> 0.75f
                }
            }
            screenWidthDp < 720 -> 0.75f
            else -> {
                when {
                    densityDpi >= 320 -> 0.8f
                    else -> 0.85f
                }
            }
        }
    }
}
