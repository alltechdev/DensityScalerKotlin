.class public Lcom/dpi/DensityScaler;
.super Lcom/dpi/BaseLifecycleContentProvider;
.source "DensityScaler.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-class v0, Lcom/dpi/DensityScaler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dpi/DensityScaler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/dpi/BaseLifecycleContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()Z
    .locals 3

    .line 11
    invoke-virtual {p0}, Lcom/dpi/DensityScaler;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 12
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_0

    .line 13
    const/4 v1, 0x0

    return v1

    .line 15
    :cond_0
    new-instance v1, Lcom/dpi/DensityConfiguration;

    const v2, 0x3f333333    # 0.7f

    invoke-direct {v1, v2}, Lcom/dpi/DensityConfiguration;-><init>(F)V

    invoke-virtual {v1, v0}, Lcom/dpi/DensityConfiguration;->applyDensityScaling(Landroid/content/Context;)V

    .line 16
    const/4 v1, 0x1

    return v1
.end method
