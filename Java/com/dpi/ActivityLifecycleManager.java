package com.dpi;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;

import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

// Manages activity lifecycle events and associated logic
public abstract class ActivityLifecycleManager extends BaseLifecycleContentProvider {
    private static final String TAG = ActivityLifecycleManager.class.getSimpleName();
    private final Set<Activity> activeActivities = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private final Handler handler = new Handler();
    private final Runnable activityTimerRunnable = new Runnable() {
        @Override
        public void run() {
            try {
                for (Activity activity : activeActivities) {
                    try {
                        onActivityTimer(activity);
                    } catch (Exception e) {
                        Log.w(TAG, "Error in activity timer", e);
                    }
                }
                handler.postDelayed(this, getActivityTimerDelayMillis());
            } catch (Exception e) {
                Log.w(TAG, "Error in activity timer runnable", e);
            }
        }
    };

    protected int getActivityTimerDelayMillis() {
        return 3000;
    }

    protected void onActivityTimer(Activity activity) {}

    @Override
    public boolean onCreate() {
        Application application = getApplication();
        if (application == null || !onInit(application)) {
            return true;
        }

        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                ActivityLifecycleManager.this.onActivityCreated(activity);
            }

            @Override
            public void onActivityStarted(Activity activity) {
                ActivityLifecycleManager.this.onActivityStarted(activity);
            }

            @Override
            public void onActivityResumed(Activity activity) {
                activeActivities.add(activity);
                handler.removeCallbacksAndMessages(null);
                handler.post(activityTimerRunnable);
                ActivityLifecycleManager.this.onActivityResumed(activity);
            }

            @Override
            public void onActivityPaused(Activity activity) {
                activeActivities.remove(activity);
                ActivityLifecycleManager.this.onActivityPaused(activity);
            }

            @Override
            public void onActivityStopped(Activity activity) {
                ActivityLifecycleManager.this.onActivityStopped(activity);
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

            @Override
            public void onActivityDestroyed(Activity activity) {
                ActivityLifecycleManager.this.onActivityDestroyed(activity);
            }
        });

        return true;
    }

    private static Application getApplication() {
        Application applicationInstance = null;
        try {
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Object activityThread = activityThreadClass.getMethod("currentActivityThread").invoke(null);
            applicationInstance = (Application) activityThreadClass.getMethod("getApplication").invoke(activityThread);
        } catch (Exception e) {
            Log.w("AppUtils", "Failed to get Application instance", e);
        }

        return applicationInstance;
    }

    protected boolean onInit(Application application) {
        return true;
    }

    protected void onActivityCreated(Activity activity) {}
    protected void onActivityStarted(Activity activity) {}
    protected void onActivityResumed(Activity activity) {}
    protected void onActivityPaused(Activity activity) {}
    protected void onActivityStopped(Activity activity) {}
    protected void onActivityDestroyed(Activity activity) {}
}
