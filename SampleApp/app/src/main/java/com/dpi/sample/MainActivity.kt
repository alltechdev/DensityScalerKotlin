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

        densityInfo.text = """
            Current Density: ${displayMetrics.densityDpi} dpi
            Density Scale: ${displayMetrics.density}
            Screen Size: ${displayMetrics.widthPixels} x ${displayMetrics.heightPixels}
        """.trimIndent()
    }
}
