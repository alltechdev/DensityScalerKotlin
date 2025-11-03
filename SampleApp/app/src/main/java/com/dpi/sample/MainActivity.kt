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

        // Set initial selection based on current device
        val config = resources.configuration
        when {
            config.smallestScreenWidthDp < 360 -> radioGroup.check(R.id.radioSmallPhone)
            config.smallestScreenWidthDp < 600 -> radioGroup.check(R.id.radioPhone)
            config.smallestScreenWidthDp < 720 -> radioGroup.check(R.id.radioSmallTablet)
            else -> radioGroup.check(R.id.radioTablet)
        }

        // Show initial result
        updateSimulatorResult(radioGroup.checkedRadioButtonId, simulatorResult)

        // Handle radio button changes
        radioGroup.setOnCheckedChangeListener { _, checkedId ->
            updateSimulatorResult(checkedId, simulatorResult)
        }
    }

    private fun updateSimulatorResult(checkedId: Int, resultTextView: TextView) {
        val (deviceType, screenWidth, scaleFactor) = when (checkedId) {
            R.id.radioSmallPhone -> Triple("Small Phone", "< 360dp", 0.65f)
            R.id.radioSmallTablet -> Triple("Small Tablet", "600-720dp", 0.75f)
            R.id.radioTablet -> Triple("Tablet", "> 720dp", 0.80f)
            else -> Triple("Normal Phone", "360-600dp", 0.70f) // radioPhone
        }

        val scalePercent = (scaleFactor * 100).toInt()
        val effect = when {
            scaleFactor < 0.7f -> "Maximum content on screen"
            scaleFactor < 0.75f -> "Balanced content and readability"
            scaleFactor < 0.8f -> "Comfortable reading"
            else -> "Large, easy-to-read UI"
        }

        resultTextView.text = """
            Device: $deviceType ($screenWidth)
            Scale Applied: $scalePercent% ($scaleFactor)

            Effect: $effect

            Example: On a device with 400 dpi original density,
            this would become ${(400 * scaleFactor).toInt()} dpi
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
