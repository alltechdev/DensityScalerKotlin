.class Lcom/dpi/ActivityLifecycleManager$2;
.super Ljava/lang/Object;
.source "ActivityLifecycleManager.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dpi/ActivityLifecycleManager;->onCreate()Z
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

    .line 49
    iput-object p1, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .line 52
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0, p1}, Lcom/dpi/ActivityLifecycleManager;->onActivityCreated(Landroid/app/Activity;)V

    .line 53
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 84
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0, p1}, Lcom/dpi/ActivityLifecycleManager;->onActivityDestroyed(Landroid/app/Activity;)V

    .line 85
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 70
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v0}, Lcom/dpi/ActivityLifecycleManager;->access$000(Lcom/dpi/ActivityLifecycleManager;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 71
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0, p1}, Lcom/dpi/ActivityLifecycleManager;->onActivityPaused(Landroid/app/Activity;)V

    .line 72
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .line 62
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v0}, Lcom/dpi/ActivityLifecycleManager;->access$000(Lcom/dpi/ActivityLifecycleManager;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v0}, Lcom/dpi/ActivityLifecycleManager;->access$200(Lcom/dpi/ActivityLifecycleManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 64
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v0}, Lcom/dpi/ActivityLifecycleManager;->access$200(Lcom/dpi/ActivityLifecycleManager;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-static {v1}, Lcom/dpi/ActivityLifecycleManager;->access$300(Lcom/dpi/ActivityLifecycleManager;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 65
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0, p1}, Lcom/dpi/ActivityLifecycleManager;->onActivityResumed(Landroid/app/Activity;)V

    .line 66
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .line 80
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 57
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0, p1}, Lcom/dpi/ActivityLifecycleManager;->onActivityStarted(Landroid/app/Activity;)V

    .line 58
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 76
    iget-object v0, p0, Lcom/dpi/ActivityLifecycleManager$2;->this$0:Lcom/dpi/ActivityLifecycleManager;

    invoke-virtual {v0, p1}, Lcom/dpi/ActivityLifecycleManager;->onActivityStopped(Landroid/app/Activity;)V

    .line 77
    return-void
.end method
