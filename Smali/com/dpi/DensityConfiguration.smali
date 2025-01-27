.class Lcom/dpi/DensityConfiguration;
.super Lcom/dpi/ActivityLifecycleManager;
.source "DensityConfiguration.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final densityScale:F

.field private originalDensityDpi:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 11
    const-class v0, Lcom/dpi/DensityConfiguration;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dpi/DensityConfiguration;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(F)V
    .locals 0
    .param p1, "densityScale"    # F

    .line 15
    invoke-direct {p0}, Lcom/dpi/ActivityLifecycleManager;-><init>()V

    .line 16
    iput p1, p0, Lcom/dpi/DensityConfiguration;->densityScale:F

    .line 17
    return-void
.end method

.method private applyDensityToActivity(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .line 57
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/dpi/DensityConfiguration;->updateDensityDpi(Landroid/content/res/Configuration;Landroid/content/res/Resources;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/dpi/DensityConfiguration;->TAG:Ljava/lang/String;

    const-string v2, "Failed to update density for activity"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private updateDensityDpi(Landroid/content/res/Configuration;Landroid/content/res/Resources;)V
    .locals 4
    .param p1, "config"    # Landroid/content/res/Configuration;
    .param p2, "resources"    # Landroid/content/res/Resources;

    .line 34
    iget v0, p0, Lcom/dpi/DensityConfiguration;->originalDensityDpi:I

    int-to-float v0, v0

    iget v1, p0, Lcom/dpi/DensityConfiguration;->densityScale:F

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 35
    .local v0, "newDensityDpi":I
    iput v0, p1, Landroid/content/res/Configuration;->densityDpi:I

    .line 36
    sget-object v1, Lcom/dpi/DensityConfiguration;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Updated densityDpi to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {p2, p1, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 38
    return-void
.end method


# virtual methods
.method applyDensityScaling(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 20
    iget v0, p0, Lcom/dpi/DensityConfiguration;->densityScale:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    return-void

    .line 23
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/dpi/DensityConfiguration;->onCreate()Z

    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 25
    .local v0, "resources":Landroid/content/res/Resources;
    new-instance v1, Landroid/content/res/Configuration;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 26
    .local v1, "config":Landroid/content/res/Configuration;
    iget v2, v1, Landroid/content/res/Configuration;->densityDpi:I

    iput v2, p0, Lcom/dpi/DensityConfiguration;->originalDensityDpi:I

    .line 27
    invoke-direct {p0, v1, v0}, Lcom/dpi/DensityConfiguration;->updateDensityDpi(Landroid/content/res/Configuration;Landroid/content/res/Resources;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .end local v0    # "resources":Landroid/content/res/Resources;
    .end local v1    # "config":Landroid/content/res/Configuration;
    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/dpi/DensityConfiguration;->TAG:Ljava/lang/String;

    const-string v2, "Failed to apply configuration"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method protected onActivityCreated(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 42
    invoke-direct {p0, p1}, Lcom/dpi/DensityConfiguration;->applyDensityToActivity(Landroid/app/Activity;)V

    .line 43
    return-void
.end method

.method protected onActivityResumed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 47
    invoke-direct {p0, p1}, Lcom/dpi/DensityConfiguration;->applyDensityToActivity(Landroid/app/Activity;)V

    .line 48
    return-void
.end method

.method protected onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .line 52
    invoke-direct {p0, p1}, Lcom/dpi/DensityConfiguration;->applyDensityToActivity(Landroid/app/Activity;)V

    .line 53
    return-void
.end method
