.class public abstract Lcom/dpi/ActivityLifecycleManager;
.super Lcom/dpi/BaseLifecycleContentProvider;
.source "ActivityLifecycleManager.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activeActivities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final activityTimerRunnable:Ljava/lang/Runnable;

.field private final handler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    const-class v0, Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dpi/ActivityLifecycleManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Lcom/dpi/BaseLifecycleContentProvider;-><init>()V

    .line 16
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/dpi/ActivityLifecycleManager;->activeActivities:Ljava/util/Set;

    .line 17
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/dpi/ActivityLifecycleManager;->handler:Landroid/os/Handler;

    .line 18
    new-instance v0, Lcom/dpi/ActivityLifecycleManager$1;

    invoke-direct {v0, p0}, Lcom/dpi/ActivityLifecycleManager$1;-><init>(Lcom/dpi/ActivityLifecycleManager;)V

    iput-object v0, p0, Lcom/dpi/ActivityLifecycleManager;->activityTimerRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/dpi/ActivityLifecycleManager;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/dpi/ActivityLifecycleManager;

    .line 14
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager;->activeActivities:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 14
    sget-object v0, Lcom/dpi/ActivityLifecycleManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/dpi/ActivityLifecycleManager;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/dpi/ActivityLifecycleManager;

    .line 14
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/dpi/ActivityLifecycleManager;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/dpi/ActivityLifecycleManager;

    .line 14
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager;->activityTimerRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method private static getApplication()Landroid/app/Application;
    .locals 6

    .line 92
    const/4 v0, 0x0

    .line 94
    .local v0, "applicationInstance":Landroid/app/Application;
    :try_start_0
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 95
    .local v1, "activityThreadClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "currentActivityThread"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 96
    .local v2, "activityThread":Ljava/lang/Object;
    const-string v4, "getApplication"

    new-array v5, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v4, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Application;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    .line 99
    .end local v1    # "activityThreadClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "activityThread":Ljava/lang/Object;
    goto :goto_0

    .line 97
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "AppUtils"

    const-string v3, "Failed to get Application instance"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 101
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-object v0
.end method


# virtual methods
.method protected getActivityTimerDelayMillis()I
    .locals 1

    .line 37
    const/16 v0, 0xbb8

    return v0
.end method

.method protected onActivityCreated(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 108
    return-void
.end method

.method protected onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 113
    return-void
.end method

.method protected onActivityPaused(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 111
    return-void
.end method

.method protected onActivityResumed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 110
    return-void
.end method

.method protected onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 109
    return-void
.end method

.method protected onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 112
    return-void
.end method

.method protected onActivityTimer(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 40
    return-void
.end method

.method public onCreate()Z
    .locals 3

    .line 44
    invoke-static {}, Lcom/dpi/ActivityLifecycleManager;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 45
    .local v0, "application":Landroid/app/Application;
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/dpi/ActivityLifecycleManager;->onInit(Landroid/app/Application;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    new-instance v2, Lcom/dpi/ActivityLifecycleManager$2;

    invoke-direct {v2, p0}, Lcom/dpi/ActivityLifecycleManager$2;-><init>(Lcom/dpi/ActivityLifecycleManager;)V

    invoke-virtual {v0, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 88
    return v1

    .line 46
    :cond_1
    :goto_0
    return v1
.end method

.method protected onInit(Landroid/app/Application;)Z
    .locals 1
    .param p1, "application"    # Landroid/app/Application;

    .line 105
    const/4 v0, 0x1

    return v0
.end method
