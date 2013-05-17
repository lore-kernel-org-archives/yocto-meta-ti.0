Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 558E9E01529
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 09:58:18 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4HGwG7j006252
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:17 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4HGwCUM026688
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:15 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 18 May 2013 00:58:12 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4HGwAuw014936;
	Fri, 17 May 2013 22:28:12 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 May 2013 22:27:59 +0530
Message-ID: <1368809879-27201-10-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <prabu@ti.com>
References: <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] omap3-sgx-modules-x11: Separate X11 SGX driver package into new recipe
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
X-List-Received-Date: Fri, 17 May 2013 16:58:18 -0000
Content-Type: text/plain

omap3-sgx-modules now contains only non-X11 drivers. The X11 driver is
available in the omap3-sgx-modules-x11 package.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 .../Compile-fixes-for-38-kernel.patch              |  346 ++++++++++++++++++++
 .../omap3-sgx-modules-x11/kernel-30.patch          |   38 +++
 .../omap3-sgx-modules-x11_4.09.00.01.bb            |   74 +++++
 3 files changed, 458 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
new file mode 100644
index 0000000..fc315bc
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
@@ -0,0 +1,346 @@
+--- GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_displayclass.c-orig	2011-03-08 04:27:35.000000000 -0800
++++ GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_displayclass.c	2011-03-17 13:11:31.000000000 -0700
+@@ -235,9 +235,20 @@ static OMAP_ERROR UnblankDisplay(OMAPLFB
+ {
+ 	int res;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
++	console_lock();
++#else
+ 	acquire_console_sem();
++#endif
++
+ 	res = fb_blank(psDevInfo->psLINFBInfo, 0);
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
++	console_unlock();
++#else
+ 	release_console_sem();
++#endif
++
+ #if !defined (CONFIG_OMAP2_DSS)
+ 	if (res != 0 && res != -EINVAL)
+ 	{
+@@ -1118,7 +1129,11 @@ static OMAP_ERROR InitDev(OMAPLFB_DEVINF
+ 	OMAP_ERROR eError = OMAP_ERROR_GENERIC;
+ 	unsigned long FBSize;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
++	console_lock();
++#else
+ 	acquire_console_sem();
++#endif
+ 
+ 	if (fb_idx < 0 || fb_idx >= num_registered_fb)
+ 	{
+@@ -1254,7 +1269,11 @@ static OMAP_ERROR InitDev(OMAPLFB_DEVINF
+ errModPut:
+ 	module_put(psLINFBOwner);
+ errRelSem:
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
++	console_unlock();
++#else
+ 	release_console_sem();
++#endif
+ 	return eError;
+ }
+ 
+@@ -1263,7 +1282,11 @@ static void DeInitDev(OMAPLFB_DEVINFO *p
+ 	struct fb_info *psLINFBInfo = psDevInfo->psLINFBInfo;
+ 	struct module *psLINFBOwner;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
++	console_lock();
++#else
+ 	acquire_console_sem();
++#endif
+ 
+ 	psLINFBOwner = psLINFBInfo->fbops->owner;
+ 
+@@ -1274,7 +1297,11 @@ static void DeInitDev(OMAPLFB_DEVINFO *p
+ 
+ 	module_put(psLINFBOwner);
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
++	console_unlock();
++#else
+ 	release_console_sem();
++#endif
+ }
+ 
+ OMAP_ERROR OMAPLFBInit(void)
+--- GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c-orig	2011-03-08 04:27:35.000000000 -0800
++++ GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c	2011-03-17 13:40:15.000000000 -0700
+@@ -24,11 +24,14 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+ #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <linux/module.h>
+ 
+ #include <linux/pci.h>
+--- GFX_Linux_KM/services4/srvkm/common/resman.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/common/resman.c	2011-03-17 14:20:07.000000000 -0700
+@@ -24,15 +24,17 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
+ #include "services_headers.h"
+ #include "resman.h"
+ 
+ #ifdef __linux__
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <linux/sched.h>
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,9)
+ #include <linux/hardirq.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/pvr_debug.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/pvr_debug.c	2011-03-17 14:33:09.000000000 -0700
+@@ -24,9 +24,13 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+ #include <asm/io.h>
+ #include <asm/uaccess.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/pvr_uaccess.h-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/pvr_uaccess.h	2011-03-17 14:39:14.000000000 -0700
+@@ -27,11 +27,14 @@
+ #ifndef __PVR_UACCESS_H__
+ #define __PVR_UACCESS_H__
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <asm/uaccess.h>
+ 
+ static inline unsigned long pvr_copy_to_user(void __user *pvTo, const void *pvFrom, unsigned long ulBytes)
+--- GFX_Linux_KM/services4/srvkm/env/linux/mm.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/mm.c	2011-03-17 14:46:23.000000000 -0700
+@@ -24,11 +24,14 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <linux/mm.h>
+ #include <linux/vmalloc.h>
+ #include <asm/io.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/mutils.h-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/mutils.h	2011-03-17 14:54:37.000000000 -0700
+@@ -27,11 +27,13 @@
+ #ifndef __IMG_LINUX_MUTILS_H__
+ #define __IMG_LINUX_MUTILS_H__
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+ #include <linux/config.h>
+ #endif
+-
+-#include <linux/version.h>
++#endif
+ 
+ #if !(defined(__i386__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26)))
+ #if defined(SUPPORT_LINUX_X86_PAT)
+--- GFX_Linux_KM/services4/srvkm/env/linux/mm.h-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/mm.h	2011-03-17 15:33:56.000000000 -0700
+@@ -27,11 +27,14 @@
+ #ifndef __IMG_LINUX_MM_H__
+ #define __IMG_LINUX_MM_H__
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <linux/slab.h>
+ #include <linux/mm.h>
+ #include <linux/list.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/mmap.c-orig	2011-03-17 20:39:31.000000000 -0700
++++ GFX_Linux_KM/services4/srvkm/env/linux/mmap.c	2011-03-17 20:40:00.000000000 -0700
+@@ -24,11 +24,14 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <linux/mm.h>
+ #include <linux/module.h>
+ #include <linux/vmalloc.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/proc.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/proc.c	2011-03-17 21:01:35.000000000 -0700
+@@ -24,13 +24,16 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+ #include <linux/init.h>
+ #include <linux/module.h>
+-#include <linux/version.h>
+ #include <linux/fs.h>
+ #include <linux/proc_fs.h>
+ #include <linux/seq_file.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/module.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/module.c	2011-03-17 21:32:19.000000000 -0700
+@@ -24,9 +24,13 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+ #if !defined(SUPPORT_DRI_DRM)
+ 	
+@@ -44,7 +48,6 @@
+ #include <linux/init.h>
+ #include <linux/kernel.h>
+ #include <linux/module.h>
+-#include <linux/version.h>
+ #include <linux/fs.h>
+ #include <linux/proc_fs.h>
+ 
+--- GFX_Linux_KM/services4/srvkm/env/linux/event.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/event.c	2011-03-18 08:51:42.000000000 -0700
+@@ -24,11 +24,14 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <asm/io.h>
+ #include <asm/page.h>
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22))
+--- GFX_Linux_KM/services4/srvkm/env/linux/osfunc.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/osfunc.c	2011-03-18 08:58:16.000000000 -0700
+@@ -24,11 +24,14 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+-#include <linux/version.h>
+ #include <asm/io.h>
+ #include <asm/page.h>
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22))
+--- GFX_Linux_KM/services4/srvkm/env/linux/pvr_drm.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/pvr_drm.c	2011-03-18 09:01:06.000000000 -0700
+@@ -26,14 +26,17 @@
+ 
+ #if defined(SUPPORT_DRI_DRM)
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+  #include <linux/config.h>
+ #endif
++#endif
+ 
+ #include <linux/init.h>
+ #include <linux/kernel.h>
+ #include <linux/module.h>
+-#include <linux/version.h>
+ #include <linux/fs.h>
+ #include <linux/proc_fs.h>
+ #include <asm/ioctl.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/mutils.c-orig	2011-03-08 04:27:36.000000000 -0800
++++ GFX_Linux_KM/services4/srvkm/env/linux/mutils.c	2011-03-18 09:08:12.000000000 -0700
+@@ -24,10 +24,13 @@
+  *
+  ******************************************************************************/
+ 
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
+ #ifndef AUTOCONF_INCLUDED
+ #include <linux/config.h>
+ #endif
+-#include <linux/version.h>
++#endif
+ 
+ #include <linux/spinlock.h>
+ #include <linux/mm.h>
+--- GFX_Linux_KM/services4/srvkm/env/linux/pvr_debug.c-orig	2011-03-31 13:46:48.000000000 -0700
++++ GFX_Linux_KM/services4/srvkm/env/linux/pvr_debug.c	2011-03-31 15:14:10.000000000 -0700
+@@ -76,7 +76,8 @@ static IMG_CHAR gszBufferIRQ[PVR_MAX_MSG
+ static PVRSRV_LINUX_MUTEX gsDebugMutexNonIRQ;
+ 
+  
+-static spinlock_t gsDebugLockIRQ = SPIN_LOCK_UNLOCKED;
++static DEFINE_SPINLOCK(gsDebugLockIRQ);
++
+ 
+ #if !defined (USE_SPIN_LOCK)  
+ #define	USE_SPIN_LOCK (in_interrupt() || !preemptible())
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
new file mode 100644
index 0000000..957a154
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
@@ -0,0 +1,38 @@
+From: Steve Sakoman
+Subject: omap3-sgx-modules: Fix build for Linux 3.0
+
+This patch implements the header change from plat/display.h to video/omapdss.h
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+--- GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c-orig	2011-08-01 07:21:45.000000000 -0700
++++ GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c	2011-08-01 07:29:32.000000000 -0700
+@@ -47,12 +47,12 @@
+ #if defined (SUPPORT_TI_DSS_FW)
+ #include <asm/io.h>
+ 
+-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,26))
+-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,31))
++#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,39)))
++#include <video/omapdss.h>
++#elif (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,31))
+ #include <plat/display.h>
+-#else 
++#elif (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,26))
+ #include <mach/display.h>
+-#endif 
+ #else 
+ #include <asm/arch-omap/display.h>
+ #endif 
+@@ -64,7 +64,11 @@ extern int omap_dispc_request_irq(unsign
+ extern void omap_dispc_free_irq(unsigned long, void (*)(void *), void *);
+ extern void omap_dispc_set_plane_base(int plane, IMG_UINT32 phys_addr);
+ #else
++#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,39))
++#include <video/omapdss.h>
++#else
+ #include <plat/display.h>
++#endif
+ #include <linux/console.h>
+ #include <linux/fb.h>
+ static omap_dispc_isr_t *pOMAPLFBVSyncISRHandle = NULL;
\ No newline at end of file
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
new file mode 100644
index 0000000..8493814
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
@@ -0,0 +1,74 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs (for X11)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_09_00_01"
+IMGPV = "1.9.2188537"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+
+SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+export KERNELDIR = "${STAGING_KERNEL_DIR}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti814x = "ti81xx"
+TI_PLATFORM_ti816x = "ti81xx"
+TI_PLATFORM_ti33x = "ti335x"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti814x = "dc_ti81xx_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+MODULESLOCATION_ti33x = "dc_ti335x_linux"
+
+export SUPPORT_XORG ?= "1"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
+
+do_compile() {
+	export TOOLCHAIN="${TOOLCHAIN_PATH}"
+	export PLAT_CC="${CC}"
+	export PLAT_CPP="${CXX}"
+	export PLAR_AR="${AR}"
+	for kernelver in ${WORKDIR}/../../linux-ti-staging/* ; do
+		cp -f $kernelver/git/drivers/gpu/drm/*.c ${S}/services4/3rdparty/linux_drm/
+	done
+	if [ $(echo -e "${KERNEL_VERSION}\n3.3" | sort --version-sort | head -1) = "3.3" ] ; then
+		cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.3 \
+			${S}/services4/3rdparty/linux_drm/Kbuild
+	else 
+		if [ $(echo -e "${KERNEL_VERSION}\n3.2" | sort --version-sort | head -1) = "3.2" ] ; then
+			cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.2 \
+				${S}/services4/3rdparty/linux_drm/Kbuild
+		fi
+	fi
+	oe_runmake BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}
+}
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    cp  ${S}/pvrsrvkm.ko \
+         ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+
+    cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+}
+
-- 
1.7.1


