package com.dpi;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.Log;

// Configuration class for adjusting screen density dynamically
class DensityConfiguration extends ActivityLifecycleManager {
    private static final String TAG = DensityConfiguration.class.getSimpleName();
    private final float densityScale;
    private int originalDensityDpi;

    DensityConfiguration(float densityScale) {
        this.densityScale = densityScale;
    }

    void applyDensityScaling(Context context) {
        if (densityScale == 1.0f) return;

        try {
            onCreate();
            Resources resources = context.getResources();
            Configuration config = new Configuration(resources.getConfiguration());
            originalDensityDpi = config.densityDpi;
            updateDensityDpi(config, resources);
        } catch (Exception e) {
            Log.w(TAG, "Failed to apply configuration", e);
        }
    }

    private void updateDensityDpi(Configuration config, Resources resources) {
        int newDensityDpi = Math.round(originalDensityDpi * densityScale);
        config.densityDpi = newDensityDpi;
        Log.i(TAG, "Updated densityDpi to: " + newDensityDpi);
        resources.updateConfiguration(config, resources.getDisplayMetrics());
    }

    @Override
    protected void onActivityCreated(Activity activity) {
        applyDensityToActivity(activity);
    }

    @Override
    protected void onActivityResumed(Activity activity) {
        applyDensityToActivity(activity);
    }

    @Override
    protected void onActivityStarted(Activity activity) {
        applyDensityToActivity(activity);
    }

    private void applyDensityToActivity(Activity activity) {
        try {
            updateDensityDpi(activity.getResources().getConfiguration(), activity.getResources());
        } catch (Exception e) {
            Log.w(TAG, "Failed to update density for activity", e);
        }
    }
}
