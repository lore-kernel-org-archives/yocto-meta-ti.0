Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8886CE007DF; Tue,  5 Aug 2014 10:24:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43E18E007B5
	for <meta-ti@yoctoproject.org>; Tue,  5 Aug 2014 10:24:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7058352A5E; Tue,  5 Aug 2014 17:24:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140805172446.7058352A5E@arago-project.org>
Date: Tue,  5 Aug 2014 17:24:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap3-sgx-modules: update one of Darren' s patches to match change in 3.14 API
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 17:24:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f7b1140774e6c8c8aecde41388d40d9d407df6ff
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f7b1140774e6c8c8aecde41388d40d9d407df6ff

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug  5 12:12:15 2014 +0000

omap3-sgx-modules: update one of Darren's patches to match change in 3.14 API

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 ...x-use-platform-data-to-provide-reset-info.patch |    8 ++++----
 .../omap3-sgx-modules_5.01.01.01.bb                |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
index 22b73fd..5a8d1f1 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
@@ -1,7 +1,7 @@
-From 30a695502496302f804e14eeca90568f067b2db2 Mon Sep 17 00:00:00 2001
+From 7886ef77e4b48a7edd14acbcbe48f6a898251e78 Mon Sep 17 00:00:00 2001
 From: Darren Etheridge <detheridge@ti.com>
 Date: Fri, 25 Jul 2014 16:03:14 -0500
-Subject: [PATCH 2/4] SGX: linux: use platform data to provide reset info
+Subject: [PATCH 2/5] SGX: linux: use platform data to provide reset info
 
 In ti-linux-3.14.y we will not have a reset driver unlike ti-linux-3.12.y
 so this commit removes the dependency on the reset driver and instead
@@ -14,7 +14,7 @@ Signed-off-by: Darren Etheridge <detheridge@ti.com>
  1 file changed, 28 insertions(+), 6 deletions(-)
 
 diff --git a/GFX_Linux_KM/services4/srvkm/env/linux/module.c b/GFX_Linux_KM/services4/srvkm/env/linux/module.c
-index e03dc00..82d07f4 100644
+index e03dc00..90e16ce 100644
 --- a/GFX_Linux_KM/services4/srvkm/env/linux/module.c
 +++ b/GFX_Linux_KM/services4/srvkm/env/linux/module.c
 @@ -47,6 +47,10 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
@@ -22,7 +22,7 @@ index e03dc00..82d07f4 100644
  #endif
  
 +#ifndef CONFIG_RESET_CONTROLLER
-+#include <linux/platform_data/gfx-sgx.h>
++#include <linux/platform_data/sgx-omap.h>
 +#endif
 +
  #if defined(SUPPORT_DRI_DRM) && !defined(SUPPORT_DRI_DRM_PLUGIN)
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
index 0b1c06f..a1d95bf 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
@@ -10,7 +10,7 @@ IMGPV = "1.10.2359475"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"


