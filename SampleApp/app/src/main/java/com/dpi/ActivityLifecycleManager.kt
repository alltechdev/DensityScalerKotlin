package com.dpi

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import java.util.Collections
import java.util.concurrent.ConcurrentHashMap

/**
 * Manages activity lifecycle events and associated logic.
 * Provides hooks for monitoring and responding to activity lifecycle changes.
 */
abstract class ActivityLifecycleManager : BaseLifecycleContentProvider() {

    private val activeActivities: MutableSet<Activity> =
        Collections.newSetFromMap(ConcurrentHashMap())

    private val handler = Handler(Looper.getMainLooper())

    private val activityTimerRunnable: Runnable = object : Runnable {
        override fun run() {
            try {
                activeActivities.forEach { activity ->
                    try {
                        onActivityTimer(activity)
                    } catch (e: Exception) {
                        Log.w(TAG, "Error in activity timer", e)
                    }
                }
                handler.postDelayed(this, activityTimerDelayMillis.toLong())
            } catch (e: Exception) {
                Log.w(TAG, "Error in activity timer runnable", e)
            }
        }
    }

    /**
     * Override this to change the timer delay. Default is 3000ms (3 seconds).
     */
    protected open val activityTimerDelayMillis: Int
        get() = 3000

    /**
     * Called periodically for each active activity based on the timer delay.
     */
    protected open fun onActivityTimer(activity: Activity) {}

    override fun onCreate(): Boolean {
        val application = getApplication() ?: return true

        if (!onInit(application)) {
            return true
        }

        application.registerActivityLifecycleCallbacks(object : Application.ActivityLifecycleCallbacks {
            override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
                this@ActivityLifecycleManager.onActivityCreated(activity)
            }

            override fun onActivityStarted(activity: Activity) {
                this@ActivityLifecycleManager.onActivityStarted(activity)
            }

            override fun onActivityResumed(activity: Activity) {
                activeActivities.add(activity)
                handler.removeCallbacksAndMessages(null)
                handler.post(activityTimerRunnable)
                this@ActivityLifecycleManager.onActivityResumed(activity)
            }

            override fun onActivityPaused(activity: Activity) {
                activeActivities.remove(activity)
                this@ActivityLifecycleManager.onActivityPaused(activity)
            }

            override fun onActivityStopped(activity: Activity) {
                this@ActivityLifecycleManager.onActivityStopped(activity)
            }

            override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}

            override fun onActivityDestroyed(activity: Activity) {
                this@ActivityLifecycleManager.onActivityDestroyed(activity)
            }
        })

        return true
    }

    /**
     * Called when the manager is initialized with the Application instance.
     * Return true to continue with lifecycle callbacks registration, false to skip.
     */
    protected open fun onInit(application: Application): Boolean = true

    /**
     * Lifecycle callback methods - override these to respond to activity lifecycle events.
     */
    protected open fun onActivityCreated(activity: Activity) {}
    protected open fun onActivityStarted(activity: Activity) {}
    protected open fun onActivityResumed(activity: Activity) {}
    protected open fun onActivityPaused(activity: Activity) {}
    protected open fun onActivityStopped(activity: Activity) {}
    protected open fun onActivityDestroyed(activity: Activity) {}

    companion object {
        private val TAG = ActivityLifecycleManager::class.java.simpleName

        /**
         * Gets the Application instance using reflection on ActivityThread.
         * This is an internal Android API but works reliably across versions.
         */
        private fun getApplication(): Application? {
            return try {
                val activityThreadClass = Class.forName("android.app.ActivityThread")
                val activityThread = activityThreadClass
                    .getMethod("currentActivityThread")
                    .invoke(null)
                activityThreadClass
                    .getMethod("getApplication")
                    .invoke(activityThread) as? Application
            } catch (e: Exception) {
                Log.w("AppUtils", "Failed to get Application instance", e)
                null
            }
        }
    }
}
