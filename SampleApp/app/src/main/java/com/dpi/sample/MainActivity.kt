package com.dpi.sample

import android.os.Bundle
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

        densityInfo.text = """
            Device Type: $deviceType
            Screen Width: ${config.smallestScreenWidthDp}dp

            Current Density: ${displayMetrics.densityDpi} dpi
            Density Scale: ${displayMetrics.density}
            Resolution: ${displayMetrics.widthPixels} x ${displayMetrics.heightPixels}

            Adaptive Scaling: Enabled
        """.trimIndent()
    }
}
