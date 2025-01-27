.class Lcom/dpi/ActivityLifecycleManager$1;
.super Ljava/lang/Object;
.source "ActivityLifecycleManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dpi/ActivityLifecycleManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dpi/ActivityLifecycleManager;


# direct methods
.method constructor <init>(Lcom/dpi/ActivityLifecycleManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/dpi/ActivityLifecycleManager;

    .line 18
    iput-object p1, p0, Lcom/dpi/ActivityLifecycleManager$1;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 22
    :try_start_0
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$1;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v0}, Lcom/dpi/ActivityLifecycleManager;->access$000(Lcom/dpi/ActivityLifecycleManager;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 24
    .local v1, "activity":Landroid/app/Activity;
    :try_start_1
    iget-object v2, p0, Lcom/dpi/ActivityLifecycleManager$1;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v2, v1}, Lcom/dpi/ActivityLifecycleManager;->onActivityTimer(Landroid/app/Activity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 27
    goto :goto_1

    .line 25
    :catch_0
    move-exception v2

    .line 26
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Lcom/dpi/ActivityLifecycleManager;->access$100()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error in activity timer"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 28
    .end local v1    # "activity":Landroid/app/Activity;
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$1;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v0}, Lcom/dpi/ActivityLifecycleManager;->access$200(Lcom/dpi/ActivityLifecycleManager;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/dpi/ActivityLifecycleManager$1;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v1}, Lcom/dpi/ActivityLifecycleManager;->getActivityTimerDelayMillis()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 32
    goto :goto_2

    .line 30
    :catch_1
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/dpi/ActivityLifecycleManager;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error in activity timer runnable"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method
