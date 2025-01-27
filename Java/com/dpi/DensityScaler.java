package com.dpi;

import android.content.Context;

// Screen density scaling implementation
public class DensityScaler extends BaseLifecycleContentProvider {
    private static final String TAG = DensityScaler.class.getSimpleName();

    @Override
    public boolean onCreate() {
        Context context = getContext();
        if (context == null) {
            return false;
        }
        new DensityConfiguration(0.7f).applyDensityScaling(context);
        return true;
    }
}
