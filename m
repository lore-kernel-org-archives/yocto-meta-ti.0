Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A259E006F1; Tue, 29 Jul 2014 18:35:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D307E003FA
	for <meta-ti@yoctoproject.org>; Tue, 29 Jul 2014 18:35:46 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9I00G0D4FKLL00@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 29 Jul 2014 20:35:46 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 66F7C20187; Tue,
	29 Jul 2014 21:35:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 29 Jul 2014 21:35:13 -0400
Message-id: <1406684113-18232-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <1406684113-18232-1-git-send-email-denis@denix.org>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] omap3-sgx-modules 5.01.01.01: add Darren's patches to work with 3.14 kernel
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
X-List-Received-Date: Wed, 30 Jul 2014 01:35:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...SDK-Make-5_01_01_01-work-against-3.14-LTS.patch |  52 +++++++
 ...x-use-platform-data-to-provide-reset-info.patch | 121 ++++++++++++++++
 ...class-am335x-am437x-fix-mutex-deadlock-wa.patch | 153 +++++++++++++++++++++
 ...-make-it-building-against-ti-linux-3.14.y.patch |  44 ++++++
 .../omap3-sgx-modules_5.01.01.01.bb                |   7 +-
 5 files changed, 376 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch
new file mode 100644
index 0000000..e541079
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch
@@ -0,0 +1,52 @@
+From e2db38959a70d1be604a297276a0b0c2ac219bf5 Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <detheridge@ti.com>
+Date: Tue, 29 Jul 2014 16:06:17 -0500
+Subject: [PATCH 1/4] PoC: GFX: SDK: Make 5_01_01_01 work against 3.14 LTS
+
+An API rename is the main change.  Also hacked in some function prototypes
+for enabling use of the tilcdc DRM driver instead of the fbdev driver on
+AM335x.  However this all really needs a good cleanup as it is hacky at
+the moment.
+
+Signed-off-by: Darren Etheridge <detheridge@ti.com>
+---
+ GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c | 5 +++++
+ GFX_Linux_KM/services4/srvkm/env/linux/mutils.h                 | 6 +++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c b/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c
+index 5c3fc48..3857b95 100644
+--- a/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c
++++ b/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c
+@@ -93,6 +93,11 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ #include <linux/mutex.h>
+ 
+ #include <video/da8xx-fb.h>
++/* used by SGX OMAPLFB drvier */
++typedef void (*vsync_callback_t)(void *arg);
++int register_vsync_cb(vsync_callback_t handler, void *arg, int idx);
++int unregister_vsync_cb(vsync_callback_t handler, void *arg, int idx);
++
+ #if defined(PVR_OMAPLFB_DRM_FB)
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,0,0))
+ #include <plat/display.h>
+diff --git a/GFX_Linux_KM/services4/srvkm/env/linux/mutils.h b/GFX_Linux_KM/services4/srvkm/env/linux/mutils.h
+index 31e0dac..90ec41c 100644
+--- a/GFX_Linux_KM/services4/srvkm/env/linux/mutils.h
++++ b/GFX_Linux_KM/services4/srvkm/env/linux/mutils.h
+@@ -79,7 +79,11 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 	#define	IOREMAP(pa, bytes)	ioremap_cache(pa, bytes)
+ #else	
+ 	#if defined(__arm__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
+-		#define	IOREMAP(pa, bytes)	ioremap_cached(pa, bytes)
++		#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,13,0))
++			#define	IOREMAP(pa, bytes)	ioremap_cache(pa, bytes)
++		#else
++			#define	IOREMAP(pa, bytes)	ioremap_cached(pa, bytes)
++		#endif
+ 	#else
+ 		#define IOREMAP(pa, bytes)	ioremap(pa, bytes)
+ 	#endif
+-- 
+1.9.1
+
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
new file mode 100644
index 0000000..22b73fd
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
@@ -0,0 +1,121 @@
+From 30a695502496302f804e14eeca90568f067b2db2 Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <detheridge@ti.com>
+Date: Fri, 25 Jul 2014 16:03:14 -0500
+Subject: [PATCH 2/4] SGX: linux: use platform data to provide reset info
+
+In ti-linux-3.14.y we will not have a reset driver unlike ti-linux-3.12.y
+so this commit removes the dependency on the reset driver and instead
+uses the platform data that in a dt environment is configured in
+mach-omap2/pdata-quirks.c
+
+Signed-off-by: Darren Etheridge <detheridge@ti.com>
+---
+ GFX_Linux_KM/services4/srvkm/env/linux/module.c | 34 ++++++++++++++++++++-----
+ 1 file changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/GFX_Linux_KM/services4/srvkm/env/linux/module.c b/GFX_Linux_KM/services4/srvkm/env/linux/module.c
+index e03dc00..82d07f4 100644
+--- a/GFX_Linux_KM/services4/srvkm/env/linux/module.c
++++ b/GFX_Linux_KM/services4/srvkm/env/linux/module.c
+@@ -47,6 +47,10 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ #endif
+ #endif
+ 
++#ifndef CONFIG_RESET_CONTROLLER
++#include <linux/platform_data/gfx-sgx.h>
++#endif
++
+ #if defined(SUPPORT_DRI_DRM) && !defined(SUPPORT_DRI_DRM_PLUGIN)
+ #define	PVR_MOD_STATIC
+ #else
+@@ -344,9 +348,11 @@ static LDM_DRV powervr_driver = {
+ LDM_DEV *gpsPVRLDMDev;
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#ifdef CONFIG_RESET_CONTROLLER
+ struct reset_control *rstc;
+ bool already_deasserted = false;
+ #endif
++#endif
+ 
+ #if defined(MODULE) && defined(PVR_LDM_PLATFORM_MODULE) && \
+ 	!defined(PVR_USE_PRE_REGISTERED_PLATFORM_DEV)
+@@ -388,11 +394,14 @@ static int __devinit PVRSRVDriverProbe(LDM_DEV *pDevice, const struct pci_device
+ #endif
+ {
+ 	SYS_DATA *psSysData;
+-	int ret;	
++	int ret;
++	struct device *dev = &pDevice->dev;
++	struct gfx_sgx_platform_data *pdata = dev->platform_data;
++
+ 	PVR_TRACE(("PVRSRVDriverProbe(pDevice=%p)", pDevice));
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#ifdef CONFIG_RESET_CONTROLLER
+ 	rstc = reset_control_get(&pDevice->dev, NULL);
+-
+ 	if (IS_ERR(rstc)) 
+ 	{
+ 		dev_err(&pDevice->dev, "%s: error: reset_control_get\n", __func__);
+@@ -403,7 +412,7 @@ static int __devinit PVRSRVDriverProbe(LDM_DEV *pDevice, const struct pci_device
+ 
+ 	if (ret < 0)
+ 	{
+-		dev_err(&pDevice->dev, "%s: error: reset_control_clear_reset\n", __func__);
++		dev_err(dev, "%s: error: reset_control_clear_reset\n", __func__);
+ 		return ret;
+ 	}
+ 
+@@ -413,11 +422,22 @@ static int __devinit PVRSRVDriverProbe(LDM_DEV *pDevice, const struct pci_device
+ 	{
+ 		already_deasserted = true;
+ 	}
+-	else if (ret < 0) 
++	else if (ret < 0)
+ 	{
+-		dev_err(&pDevice->dev, "%s: error: reset_control_deassert\n", __func__);
++		dev_err(dev, "%s: error: reset_control_deassert\n", __func__);
+ 		return ret;
+ 	}
++#else
++	if (pdata && pdata->deassert_reset) {
++		ret = pdata->deassert_reset(pDevice, pdata->reset_name);
++		if (ret) {
++			dev_err(dev, "Unable to reset SGX!\n");
++		}
++	} else {
++		dev_err(dev, "SGX Platform data missing deassert_reset!\n");
++		return -ENODEV;
++	}
++#endif  /* CONFIG_RESET_CONTROLLER */
+ #endif
+ 
+ #if 0   /* INTEGRATION_POINT */
+@@ -432,7 +452,7 @@ static int __devinit PVRSRVDriverProbe(LDM_DEV *pDevice, const struct pci_device
+ 	{
+ 		return -EINVAL;
+ 	}
+-#endif	
++#endif
+ 	/* SysInitialise only designed to be called once.
+ 	 */
+ 	psSysData = SysAcquireDataNoCheck();
+@@ -445,6 +465,7 @@ static int __devinit PVRSRVDriverProbe(LDM_DEV *pDevice, const struct pci_device
+ 		}
+ 	}
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#ifdef CONFIG_RESET_CONTROLLER
+         if (!already_deasserted)
+         {
+                 ret = reset_control_is_reset(rstc);
+@@ -454,6 +475,7 @@ static int __devinit PVRSRVDriverProbe(LDM_DEV *pDevice, const struct pci_device
+                 }
+         }
+         reset_control_put(rstc);
++#endif /* CONFIG_RESET_CONTROLLER */
+ #endif
+ 
+ 	return PVRSRVIONClientCreate();
+-- 
+1.9.1
+
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch
new file mode 100644
index 0000000..0e2902d
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch
@@ -0,0 +1,153 @@
+From cf5156ff82e14fe01a194f9fa9a9adc528ac72f0 Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <detheridge@ti.com>
+Date: Tue, 29 Jul 2014 15:39:56 -0500
+Subject: [PATCH 3/4] SGX: displayclass: am335x, am437x - fix mutex deadlock
+ warning
+
+Rearrange the locking semantics in the Unblank screen function to
+remove the kernel warning about a possible deadlock scenario.
+
+The warning presents itself on the console like this:
+[ 2976.202979] ======================================================
+[ 2976.202983] [ INFO: possible circular locking dependency detected ]
+[ 2976.202994] 3.14.11-00997-gb20d0ac-dirty #53 Tainted: G           O
+[ 2976.202997] -------------------------------------------------------
+[ 2976.203005] OGLES2Chameleon/1203 is trying to acquire lock:
+[ 2976.203058]  (console_lock){+.+.+.}, at: [<bf07a310>]
+OMAPLFBUnblankDisplay+0x24/0xbc [omaplfb]
+[ 2976.203062]
+[ 2976.203062] but task is already holding lock:
+[ 2976.203087]  (&fb_info->lock){+.+.+.}, at: [<c0312358>]
+lock_fb_info+0x18/0x3c
+[ 2976.203090]
+[ 2976.203090] which lock already depends on the new lock.
+[ 2976.203090]
+[ 2976.203093]
+[ 2976.203093] the existing dependency chain (in reverse order) is:
+[ 2976.203101]
+[ 2976.203101] -> #1 (&fb_info->lock){+.+.+.}:
+[ 2976.203112]        [<c0312358>] lock_fb_info+0x18/0x3c
+[ 2976.203124]        [<c0313a7c>] register_framebuffer+0x174/0x26c
+[ 2976.203146]        [<c033c314>] omapfb_create_framebuffers+0x48c/0x7ac
+[ 2976.203157]        [<c033d3c4>] omapfb_probe+0x4d4/0x848
+[ 2976.203170]        [<c0381cc8>] platform_drv_probe+0x18/0x48
+[ 2976.203189]        [<c038096c>] driver_probe_device+0x10c/0x238
+[ 2976.203199]        [<c0380b2c>] __driver_attach+0x94/0x98
+[ 2976.203208]        [<c037f0f0>] bus_for_each_dev+0x54/0x88
+[ 2976.203216]        [<c03800f0>] bus_add_driver+0xd8/0x1d8
+[ 2976.203223]        [<c038115c>] driver_register+0x78/0xf4
+[ 2976.203234]        [<c0008968>] do_one_initcall+0xe4/0x144
+[ 2976.203250]        [<c07d3c18>] kernel_init_freeable+0xfc/0x1cc
+[ 2976.203261]        [<c0563260>] kernel_init+0x8/0xec
+[ 2976.203275]        [<c000e648>] ret_from_fork+0x14/0x2c
+[ 2976.203284]
+[ 2976.203284] -> #0 (console_lock){+.+.+.}:
+[ 2976.203301]        [<c008bc00>] console_lock+0x4c/0x60
+[ 2976.203328]        [<bf07a310>] OMAPLFBUnblankDisplay+0x24/0xbc [omaplfb]
+[ 2976.203340]        [<bf0797f4>] OpenDCDevice+0x60/0x78 [omaplfb]
+[ 2976.203459]        [<bf041ac0>] PVRSRVOpenDCDeviceKM+0xec/0x178 [pvrsrvkm]
+[ 2976.203654]        [<bf05645c>] PVRSRVOpenDCDeviceBW+0x6c/0xac [pvrsrvkm]
+[ 2976.203811]        [<bf056d10>] BridgedDispatchKM+0xf4/0x14c [pvrsrvkm]
+[ 2976.203966]        [<bf04f304>] PVRSRV_BridgeDispatchKM+0xf0/0x204
+[pvrsrvkm]
+[ 2976.203987]        [<c0129500>] do_vfs_ioctl+0x78/0x61c
+[ 2976.203997]        [<c0129b08>] SyS_ioctl+0x64/0x74
+[ 2976.204013]        [<c000e580>] ret_fast_syscall+0x0/0x48
+[ 2976.204016]
+[ 2976.204016] other info that might help us debug this:
+[ 2976.204016]
+[ 2976.204019]  Possible unsafe locking scenario:
+[ 2976.204019]
+[ 2976.204022]        CPU0                    CPU1
+[ 2976.204024]        ----                    ----
+[ 2976.204030]   lock(&fb_info->lock);
+[ 2976.204036]                                lock(console_lock);
+[ 2976.204041]                                lock(&fb_info->lock);
+[ 2976.204046]   lock(console_lock);
+[ 2976.204048]
+[ 2976.204048]  *** DEADLOCK ***
+[ 2976.204048]
+[ 2976.204055] 2 locks held by OGLES2Chameleon/1203:
+[ 2976.204217]  #0:  (psPVRSRVMutex#2/1){+.+.+.}, at: [<bf04f238>]
+PVRSRV_BridgeDispatchKM+0x24/0x204 [pvrsrvkm]
+[ 2976.204240]  #1:  (&fb_info->lock){+.+.+.}, at: [<c0312358>]
+lock_fb_info+0x18/0x3c
+
+Signed-off-by: Darren Etheridge <detheridge@ti.com>
+---
+ GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c | 8 +++++---
+ GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/omaplfb_linux.c | 7 +++++--
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c b/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c
+index 3857b95..a5cc7d0 100644
+--- a/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c
++++ b/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c
+@@ -812,10 +812,13 @@ static OMAPLFB_ERROR OMAPLFBBlankOrUnblankDisplay(OMAPLFB_DEVINFO *psDevInfo, IM
+ {
+ #ifdef FBDEV_PRESENT
+ 	int res;
++
++	OMAPLFB_CONSOLE_LOCK();
+ 	if (!lock_fb_info(psDevInfo->psLINFBInfo))
+ 	{
+ 		printk(KERN_ERR DRIVER_PREFIX
+ 			": %s: Device %u: Couldn't lock FB info\n", __FUNCTION__,  psDevInfo->uiFBDevID);
++		OMAPLFB_CONSOLE_UNLOCK();
+ 		return (OMAPLFB_ERROR_GENERIC);
+ 	}
+ 
+@@ -825,14 +828,13 @@ static OMAPLFB_ERROR OMAPLFBBlankOrUnblankDisplay(OMAPLFB_DEVINFO *psDevInfo, IM
+ 	* notification.
+ 	*/
+ 
+-
+-	OMAPLFB_CONSOLE_LOCK();
+ 	psDevInfo->psLINFBInfo->flags |= FBINFO_MISC_USEREVENT;
+ 	res = fb_blank(psDevInfo->psLINFBInfo, bBlank ? 1 : 0);
+ 	psDevInfo->psLINFBInfo->flags &= ~FBINFO_MISC_USEREVENT;
+ 
+-	OMAPLFB_CONSOLE_UNLOCK();
+ 	unlock_fb_info(psDevInfo->psLINFBInfo);
++	OMAPLFB_CONSOLE_UNLOCK();
++
+ 	if (res != 0 && res != -EINVAL)
+ 	{
+ 		printk(KERN_ERR DRIVER_PREFIX
+diff --git a/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/omaplfb_linux.c b/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/omaplfb_linux.c
+index c79dbd0..58b8640 100755
+--- a/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/omaplfb_linux.c
++++ b/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/omaplfb_linux.c
+@@ -948,10 +948,13 @@ static OMAPLFB_ERROR OMAPLFBBlankOrUnblankDisplay(OMAPLFB_DEVINFO *psDevInfo, IM
+ {
+ #ifdef FBDEV_PRESENT
+ 	int res;
++
++	OMAPLFB_CONSOLE_LOCK();
+ 	if (!lock_fb_info(psDevInfo->psLINFBInfo))
+ 	{
+ 		printk(KERN_ERR DRIVER_PREFIX
+ 		": %s: Device %u: Couldn't lock FB info\n", __FUNCTION__,  psDevInfo->uiFBDevID);
++		OMAPLFB_CONSOLE_UNLOCK();
+ 		return (OMAPLFB_ERROR_GENERIC);
+ 	}
+ 
+@@ -961,13 +964,13 @@ static OMAPLFB_ERROR OMAPLFBBlankOrUnblankDisplay(OMAPLFB_DEVINFO *psDevInfo, IM
+ 	* notification.
+ 	*/
+ 
+-	OMAPLFB_CONSOLE_LOCK();
+ 	psDevInfo->psLINFBInfo->flags |= FBINFO_MISC_USEREVENT;
+ 	res = fb_blank(psDevInfo->psLINFBInfo, bBlank ? 1 : 0);
+ 	psDevInfo->psLINFBInfo->flags &= ~FBINFO_MISC_USEREVENT;
+ 
+-	OMAPLFB_CONSOLE_UNLOCK();
+ 	unlock_fb_info(psDevInfo->psLINFBInfo);
++	OMAPLFB_CONSOLE_UNLOCK();
++
+ 	if (res != 0 && res != -EINVAL)
+ 	{
+ 		printk(KERN_ERR DRIVER_PREFIX
+-- 
+1.9.1
+
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch
new file mode 100644
index 0000000..b9c004f
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch
@@ -0,0 +1,44 @@
+From 21e14daefe16351320e01392f188cf473f67702f Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <detheridge@ti.com>
+Date: Tue, 29 Jul 2014 15:54:14 -0500
+Subject: [PATCH 4/4] SGX: linux: make it building against ti-linux-3.14.y
+
+The fbdev drivers moved into their own directory under drivers/video.
+All of the omap2 dss stuff moved there as well so update the Makefile
+to point to the right place.
+
+Signed-off-by: Darren Etheridge <detheridge@ti.com>
+---
+ GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/Kbuild | 2 +-
+ GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/Kbuild | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/Kbuild b/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/Kbuild
+index 1ae2359..7c2a39d 100755
+--- a/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/Kbuild
++++ b/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/Kbuild
+@@ -14,7 +14,7 @@ EXTRA_CFLAGS =	-DLINUX \
+ 		-I$(PVR_BUILD_DIR)/include4 \
+ 		-I$(PVR_BUILD_DIR)/services4/include \
+ 		-I$(PVR_BUILD_DIR)/services4/system/$(PVR_SYSTEM) \
+-		-I$(KERNELDIR)/drivers/video/omap2 \
++		-I$(KERNELDIR)/drivers/video/fbdev/omap2 \
+ 		-I$(PVR_BUILD_DIR)/services4/system/include \
+ 		$(SYS_CFLAGS.1) \
+ 
+diff --git a/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/Kbuild b/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/Kbuild
+index 1ae2359..7c2a39d 100755
+--- a/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/Kbuild
++++ b/GFX_Linux_KM/services4/3rdparty/dc_ti43xx_linux/Kbuild
+@@ -14,7 +14,7 @@ EXTRA_CFLAGS =	-DLINUX \
+ 		-I$(PVR_BUILD_DIR)/include4 \
+ 		-I$(PVR_BUILD_DIR)/services4/include \
+ 		-I$(PVR_BUILD_DIR)/services4/system/$(PVR_SYSTEM) \
+-		-I$(KERNELDIR)/drivers/video/omap2 \
++		-I$(KERNELDIR)/drivers/video/fbdev/omap2 \
+ 		-I$(PVR_BUILD_DIR)/services4/system/include \
+ 		$(SYS_CFLAGS.1) \
+ 
+-- 
+1.9.1
+
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
index 40bf8c0..0b1c06f 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
@@ -10,7 +10,7 @@ IMGPV = "1.10.2359475"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
@@ -33,6 +33,11 @@ BINFILE := "${BINFILE_HARDFP}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
+SRC_URI += "file://0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch;striplevel=2 \
+            file://0002-SGX-linux-use-platform-data-to-provide-reset-info.patch;striplevel=2 \
+            file://0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch;striplevel=2 \
+            file://0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch;striplevel=2"
+
 SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
 SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
 
-- 
2.0.2


