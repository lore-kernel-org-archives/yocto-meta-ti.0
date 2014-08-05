Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1485EE0079B; Mon,  4 Aug 2014 23:12:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7FB1E004DD
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 23:12:43 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9T00GG8L8HGX90@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Aug 2014 01:12:32 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C84A2016D; Tue,
	05 Aug 2014 02:12:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Aug 2014 02:12:15 -0400
Message-id: <1407219135-17200-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1407219135-17200-1-git-send-email-denis@denix.org>
References: <1407219135-17200-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] omap3-sgx-modules: update one of Darren's patches to match change in 3.14 API
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
X-List-Received-Date: Tue, 05 Aug 2014 06:12:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0002-SGX-linux-use-platform-data-to-provide-reset-info.patch  | 8 ++++----
 recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb       | 2 +-
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
-- 
2.0.4


