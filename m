Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84684E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 23 Dec 2011 05:16:05 -0800 (PST)
Received: by wgbdr1 with SMTP id dr1so15478449wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 23 Dec 2011 05:16:05 -0800 (PST)
Received: by 10.227.206.6 with SMTP id fs6mr14478953wbb.20.1324646164970;
	Fri, 23 Dec 2011 05:16:04 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id p2sm13599432wbh.22.2011.12.23.05.16.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 05:16:04 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 23 Dec 2011 14:15:58 +0100
Message-Id: <1324646158-3778-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] ti-dmai: clean up recipe
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2011 13:16:07 -0000

* remove DP = -1, there's only one recipe
* remove unused files
* add git patch header to remaining patches

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/dmai/ti-dmai.inc                        |    4 +-
 ...01-Correct-DMAI-s-Resize-module-for-DM365.patch |   34 -----
 .../dmai/ti-dmai/dmai-built-with-angstrom.patch    |   48 --------
 .../dmai-do-not-panic-on-mixer-failure.patch       |   31 -----
 .../ti-dmai/dmai-r423-add-omapl137-support.patch   |   12 --
 .../dmai/ti-dmai/dmai-support-32bit-align.patch    |   17 ---
 recipes-ti/dmai/ti-dmai/dmai-update-cpu-name.patch |   16 ---
 .../dmai/ti-dmai/dmai-update-fb-display.patch      |   77 ------------
 .../dmai/ti-dmai/dmai-update-v4l2-display.patch    |  127 --------------------
 .../omap3530-r642-remove-include-videodev.diff     |   74 +++++++-----
 recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff   |   32 ++++--
 recipes-ti/dmai/ti-dmai_svn.bb                     |   12 +-
 12 files changed, 74 insertions(+), 410 deletions(-)
 delete mode 100644 recipes-ti/dmai/ti-dmai/0001-Correct-DMAI-s-Resize-module-for-DM365.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-built-with-angstrom.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-do-not-panic-on-mixer-failure.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-r423-add-omapl137-support.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-support-32bit-align.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-update-cpu-name.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-update-fb-display.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/dmai-update-v4l2-display.patch

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 8b536fc..8c20384 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -47,12 +47,12 @@ DMAIPLATFORM_dm355     = "dm355_al"
 DMAIPLATFORM_dm365     = "dm365_al"
 DMAIPLATFORM_omapl137  = "ol137_al"
 DMAIPLATFORM_omapl138  = "ol138_al"
-DMAIPLATFORM          ?= "<UNDEFINED_DMAIPLATFORM>"
+DMAIPLATFORM          ?= "UNDEFINED_DMAIPLATFORM"
 
 # Need to set this for other platforms as well
 #GPPOS_dm355      = "LINUX_GCC"
 #GPPOS_dm365      = "LINUX_GCC"
-#GPPOS           ?= "<UNDEFINEDGPPOS>"
+#GPPOS           ?= "UNDEFINEDGPPOS"
 
 # Need to re-define this for OMAP-L137/L138
 DSPSUFFIX_omapl137 = "x64P"
diff --git a/recipes-ti/dmai/ti-dmai/0001-Correct-DMAI-s-Resize-module-for-DM365.patch b/recipes-ti/dmai/ti-dmai/0001-Correct-DMAI-s-Resize-module-for-DM365.patch
deleted file mode 100644
index 21e71de..0000000
--- a/recipes-ti/dmai/ti-dmai/0001-Correct-DMAI-s-Resize-module-for-DM365.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9d9326c26ea990fa49842e0c57d520a5acb4d887 Mon Sep 17 00:00:00 2001
-From: Don Darling <ddarling@ti.com>
-Date: Fri, 16 Apr 2010 17:40:40 -0500
-Subject: [PATCH] Correct DMAI's Resize module for DM365.
-
-The PSP requires virtual addresses to be given for the resize buffers.  This
-differs from previous releases, which required physical addresses.  This
-change updates the Resize module to use virtual addresses.
----
- .../packages/ti/sdo/dmai/linux/dm365/Resize.c      |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/dmai/packages/ti/sdo/dmai/linux/dm365/Resize.c b/dmai/packages/ti/sdo/dmai/linux/dm365/Resize.c
-index c1716c4..3e71e46 100644
---- a/dmai/packages/ti/sdo/dmai/linux/dm365/Resize.c
-+++ b/dmai/packages/ti/sdo/dmai/linux/dm365/Resize.c
-@@ -313,12 +313,12 @@ Int Resize_execute(Resize_Handle hResize,
- 
-     rsz.in_buff.index     = -1;
-     rsz.in_buff.buf_type  = IMP_BUF_IN;
--    rsz.in_buff.offset    = Buffer_getPhysicalPtr(hSrcBuf) + srcOffset;
-+    rsz.in_buff.offset    = ((Int32)Buffer_getUserPtr(hSrcBuf)) + srcOffset;
-     rsz.in_buff.size      = Buffer_getSize(hSrcBuf);
- 
-     rsz.out_buff1.index    = -1;
-     rsz.out_buff1.buf_type = IMP_BUF_OUT1;
--    rsz.out_buff1.offset   = Buffer_getPhysicalPtr(hDstBuf) + dstOffset;
-+    rsz.out_buff1.offset   = ((Int32)Buffer_getUserPtr(hDstBuf)) + dstOffset;
-     rsz.out_buff1.size     = Buffer_getSize(hDstBuf);
-     
-     /* 
--- 
-1.6.3.3
-
diff --git a/recipes-ti/dmai/ti-dmai/dmai-built-with-angstrom.patch b/recipes-ti/dmai/ti-dmai/dmai-built-with-angstrom.patch
deleted file mode 100644
index fc49789..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-built-with-angstrom.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Index: dmai_1_20_00_06/packages/config.bld
-===================================================================
---- dmai_1_20_00_06.orig/packages/config.bld	2009-02-11 19:38:51.000000000 -0600
-+++ dmai_1_20_00_06/packages/config.bld	2009-02-11 19:39:23.000000000 -0600
-@@ -42,7 +42,7 @@
- 
- /* location of the Codec Sourcery Arm9 tools */
- var GCArmv5T = xdc.useModule('gnu.targets.arm.GCArmv5T');
--GCArmv5T.LONGNAME = 'bin/arm-none-linux-gnueabi-gcc';
-+GCArmv5T.LONGNAME = 'bin/arm-angstrom-linux-gnueabi-gcc';
- GCArmv5T.platform = "ti.platforms.evm3530";
- GCArmv5T.rootDir = java.lang.System.getenv("CSTOOL_DIR");
- 
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/Makefile
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/Makefile	2009-02-11 19:39:57.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/Makefile	2009-02-11 19:58:05.000000000 -0600
-@@ -33,7 +33,7 @@
- DMAI_INSTALL_DIR = ../../../..
- TARGET = dmai
- 
--include $(DMAI_INSTALL_DIR)/Rules.make
-+#include $(DMAI_INSTALL_DIR)/Rules.make
- 
- # Should the full command be echoed to the console during build?
- VERBOSE=false
-@@ -64,7 +64,7 @@
- MVL_CPP_FLAGS		= $(GNU_CPP_FLAGS) -Dxdc_target_name__=MVArm9
- CS_CPP_FLAGS		= $(GNU_CPP_FLAGS) -Dxdc_target_name__=codesourcery/GCArmv5T
- 
--GNU_C_FLAGS		= $(C_FLAGS) -Wall -Werror
-+GNU_C_FLAGS		= $(C_FLAGS) -Wall
- C64P_C_FLAGS		= $(C_FLAGS)
- 
- GNU_AR_FLAGS		= $(AR_FLAGS)
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/apps/Makefile.app
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/apps/Makefile.app	2009-02-11 19:58:44.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/apps/Makefile.app	2009-02-11 19:59:01.000000000 -0600
-@@ -34,7 +34,7 @@
- ifndef DMAI_INSTALL_DIR
-     DMAI_INSTALL_DIR = ../../../../../..
- endif
--include $(DMAI_INSTALL_DIR)/Rules.make
-+#include $(DMAI_INSTALL_DIR)/Rules.make
- 
- # Should the full command be echoed to the console during build?
- VERBOSE=false
diff --git a/recipes-ti/dmai/ti-dmai/dmai-do-not-panic-on-mixer-failure.patch b/recipes-ti/dmai/ti-dmai/dmai-do-not-panic-on-mixer-failure.patch
deleted file mode 100644
index 20e1aec..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-do-not-panic-on-mixer-failure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Sound_alsa.c
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/linux/Sound_alsa.c	2009-02-11 19:19:23.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Sound_alsa.c	2009-02-11 19:19:25.000000000 -0600
-@@ -139,7 +139,7 @@
- 
-     snd_mixer_selem_id_free (sid);
-     snd_mixer_close (rcMixer);
--
-+      
-     return Dmai_EOK;
- }
- 
-@@ -431,14 +431,13 @@
-             Sound_alsa_delete(hSound);
-             return NULL;
-         }
--
-+        
-         if (setMixerVolume (attrs) <0) {
--            Sound_alsa_delete (hSound);
--            return NULL;
-+            Dmai_dbg2("Failed to set the mixer volume on %s (%s)\n",
-+                AUDIO_DEVICE, snd_strerror(status));
-         }
-     }
- 
--
-     return hSound;
- }
- 
diff --git a/recipes-ti/dmai/ti-dmai/dmai-r423-add-omapl137-support.patch b/recipes-ti/dmai/ti-dmai/dmai-r423-add-omapl137-support.patch
deleted file mode 100644
index 8f9e8b9..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-r423-add-omapl137-support.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c davinci_multimedia_application_interfaceb/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c
---- davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c	2010-03-14 22:43:20.000000000 +0000
-+++ davinci_multimedia_application_interfaceb/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c	2010-03-14 23:19:41.000000000 +0000
-@@ -43,7 +43,7 @@
- 
- #ifdef Dmai_Device_omap3530
- #include <linux/omapfb.h>
--#elif defined Dmai_Device_omapl138
-+#elif defined (Dmai_Device_omapl137) || defined (Dmai_Device_omapl138)
- #include <video/davincifb.h>
- #else
- #include <video/davincifb_ioctl.h>
diff --git a/recipes-ti/dmai/ti-dmai/dmai-support-32bit-align.patch b/recipes-ti/dmai/ti-dmai/dmai-support-32bit-align.patch
deleted file mode 100644
index 0ee817d..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-support-32bit-align.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/linux/omap3530/Resize.c
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/linux/omap3530/Resize.c	2009-02-11 19:20:45.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/linux/omap3530/Resize.c	2009-02-11 19:21:09.000000000 -0600
-@@ -557,9 +557,9 @@
-     srcOffset = srcDim.y * srcDim.lineLength + srcDim.x * 2;
-     dstOffset = dstDim.y * dstDim.lineLength + dstDim.x * 2;
- 
--    /* Input and output buffers must be 4096 bytes aligned */
--    assert(((Buffer_getPhysicalPtr(hDstBuf) + srcOffset) & 0xFFF) == 0);
--    assert(((Buffer_getPhysicalPtr(hSrcBuf) + dstOffset) & 0xFFF) == 0);
-+    /* Pointers must be a multiple of 32 bytes */
-+    assert((Buffer_getPhysicalPtr(hDstBuf) & 0x1F) == 0);
-+    assert((Buffer_getPhysicalPtr(hSrcBuf) & 0x1F) == 0);
- 
-     /* Queue the resizer buffers */
-     for (i=0; i < 2; i++) { 
diff --git a/recipes-ti/dmai/ti-dmai/dmai-update-cpu-name.patch b/recipes-ti/dmai/ti-dmai/dmai-update-cpu-name.patch
deleted file mode 100644
index 052a8e3..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-update-cpu-name.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Cpu.c
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/linux/Cpu.c	2009-02-12 09:34:22.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Cpu.c	2009-02-12 09:34:51.000000000 -0600
-@@ -103,7 +103,10 @@
-     else if (strcmp(valBuf, "DM357 EVM") == 0) { 
-         *device = Cpu_Device_DM6446;
-     }
--    else if (strcmp(valBuf, "OMAP3EVM Board") == 0) {
-+    else if ((strcmp(valBuf, "OMAP3EVM Board") == 0) ||
-+	     (strcmp(valBuf, "OMAP3 EVM") == 0) ||
-+	     (strcmp(valBuf, "OMAP3 Beagle Board") == 0)
-+	    ){
-         *device = Cpu_Device_OMAP3530;
-     }
-     else {
diff --git a/recipes-ti/dmai/ti-dmai/dmai-update-fb-display.patch b/recipes-ti/dmai/ti-dmai/dmai-update-fb-display.patch
deleted file mode 100644
index 91c1dd1..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-update-fb-display.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Display_fbdev.c
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/linux/Display_fbdev.c	2009-02-11 19:59:57.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Display_fbdev.c	2009-02-11 20:02:46.000000000 -0600
-@@ -41,10 +41,7 @@
- #include <sys/ioctl.h>
- #include <linux/fb.h>
- 
--#ifdef Dmai_Device_omap3530
--/* OMAP specific kernel headers */
--#include <video/omapfbdev.h>
--#else
-+#ifndef Dmai_Device_omap3530
- /* Davinci specific kernel headers */
- #include <video/davincifb_ioctl.h>
- #endif
-@@ -184,11 +181,13 @@
-     }
- #endif
- 
-+#if 0
-     /* Set up the sysfs variables before opening the display device */
-     if (_Display_sysfsSetup(attrs, channel) < 0) {
-         cleanup(hDisplay);
-         return NULL;
-     }
-+#endif
- 
-     /* Open video display device */
-     hDisplay->fd = open(attrs->displayDevice, O_RDWR);
-@@ -423,6 +422,7 @@
-  ******************************************************************************/
- Int Display_fbdev_get(Display_Handle hDisplay, Buffer_Handle *hBufPtr)
- {
-+#if defined (FBIO_WAITFORVSYNC)
-     BufTab_Handle hBufTab = hDisplay->hBufTab;
-     int           dummy;
- 
-@@ -436,7 +436,8 @@
-     }
- 
-     *hBufPtr = BufTab_getBuf(hBufTab, hDisplay->workingIdx);
--
-+    
-+#endif
-     return Dmai_EOK;
- }
- 
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Display.c
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/linux/Display.c	2009-02-11 20:00:10.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Display.c	2009-02-11 20:02:07.000000000 -0600
-@@ -80,18 +80,18 @@
- 
- const Display_Attrs Display_Attrs_O3530_VID_DEFAULT = {
-     3,
--    Display_Std_V4L2,
--    VideoStd_VGA,
--    Display_Output_LCD,
--    "/dev/video1",
-+    Display_Std_FBDEV,
-+    VideoStd_D1_NTSC,
-+    Display_Output_DVI,
-+    "/dev/fb2",
-     0
- };
- 
- const Display_Attrs Display_Attrs_O3530_OSD_DEFAULT = {
-     1,
-     Display_Std_FBDEV,
--    VideoStd_VGA,
--    Display_Output_LCD,
-+    VideoStd_D1_NTSC,
-+    Display_Output_DVI,
-     "/dev/fb0",
-     0
- };
diff --git a/recipes-ti/dmai/ti-dmai/dmai-update-v4l2-display.patch b/recipes-ti/dmai/ti-dmai/dmai-update-v4l2-display.patch
deleted file mode 100644
index 8bb77d8..0000000
--- a/recipes-ti/dmai/ti-dmai/dmai-update-v4l2-display.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-Index: dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Display_v4l2.c
-===================================================================
---- dmai_1_20_00_06.orig/packages/ti/sdo/dmai/linux/Display_v4l2.c	2009-02-11 19:22:51.000000000 -0600
-+++ dmai_1_20_00_06/packages/ti/sdo/dmai/linux/Display_v4l2.c	2009-02-11 19:27:02.000000000 -0600
-@@ -120,7 +120,9 @@
-     struct v4l2_format         fmt;
-     enum v4l2_buf_type         type;
-     Display_Handle             hDisplay;
--    Int                        channel;
-+#if defined(Dmai_Device_omap3530) && defined(V4L2_CID_ROTATION)
-+    struct v4l2_control        control;
-+#endif
- 
-     assert(attrs);
- 
-@@ -134,44 +136,6 @@
- 
-     hDisplay->userAlloc = TRUE;
- 
--#ifdef Dmai_Device_omap3530
--    /* channel = 0 - digital video path
--     * channel = 1 - analog video path
--     */
--    switch (attrs->videoOutput) {
--        case Display_Output_SVIDEO:
--        case Display_Output_COMPOSITE:
--            channel = 1;
--            break;
--        case Display_Output_DVI:
--        case Display_Output_LCD:
--        case Display_Output_SYSTEM:
--            channel = 0;
--            break;
--        default:
--            /* do nothing */
--            break;
--    }
--#else
--    if (strcmp(attrs->displayDevice, "/dev/video2") == 0) {
--        channel = 0;
--    }
--    else if (strcmp(attrs->displayDevice, "/dev/video3") == 0) {
--        channel = 1;
--    }
--    else {
--        Dmai_err1("%s not a display device\n", attrs->displayDevice);
--        cleanup(hDisplay);
--        return NULL;
--    }
--#endif
--
--    /* Set up the sysfs variables before opening the display device */
--    if (_Display_sysfsSetup(attrs, channel) < 0) {
--        cleanup(hDisplay);
--        return NULL;
--    }
--
-     /* Open video capture device */
-     hDisplay->fd = open(attrs->displayDevice, O_RDWR, 0);
- 
-@@ -182,9 +146,8 @@
-         return NULL;
-     }
- 
--#ifdef Dmai_Device_omap3530
--#define VIDIOC_S_OMAP2_ROTATION     _IOW ('V', 3,  int)
--
-+    
-+#if defined(Dmai_Device_omap3530) && defined(V4L2_CID_ROTATION)
-     if (attrs->rotation != 0 && attrs->rotation != 90 &&
-         attrs->rotation != 180 && attrs->rotation != 270) {
- 
-@@ -193,49 +156,16 @@
-         return NULL;
-     }
- 
--    if (ioctl(hDisplay->fd, VIDIOC_S_OMAP2_ROTATION, &attrs->rotation) < 0) {
--        Dmai_err2("Failed VIDIOC_S_OMAP2_ROTATION on %s (%s)\n",
-+    control.id = V4L2_CID_ROTATION;
-+    control.value = attrs->rotation;
-+
-+    if (ioctl(hDisplay->fd, VIDIOC_S_CTRL, &control) < 0) {
-+        Dmai_err2("Failed VIDIOC_S_CTRL on %s (%s)\n",
-                   attrs->displayDevice, strerror(errno));
-         cleanup(hDisplay);
-         return NULL;
-     }
- 
--    switch (attrs->videoStd) {
--        case VideoStd_D1_NTSC:
--            fmt.fmt.pix.width = VideoStd_D1_WIDTH;
--            fmt.fmt.pix.height = VideoStd_D1_NTSC_HEIGHT;
--            break;
--        case VideoStd_D1_PAL:
--            fmt.fmt.pix.width = VideoStd_D1_WIDTH;
--            fmt.fmt.pix.height = VideoStd_D1_PAL_HEIGHT;
--            break;
--        case VideoStd_VGA:
--            fmt.fmt.pix.width = VideoStd_VGA_WIDTH;
--            fmt.fmt.pix.height = VideoStd_VGA_HEIGHT;
--            break;
--        case VideoStd_480P:
--            fmt.fmt.pix.width = VideoStd_480P_WIDTH;
--            fmt.fmt.pix.height = VideoStd_480P_HEIGHT;
--            break;
--        case VideoStd_720P_60:
--            fmt.fmt.pix.width = VideoStd_480P_WIDTH;
--            fmt.fmt.pix.height = VideoStd_480P_HEIGHT;
--            break;
--        default:
--            Dmai_err1("Unknown video standard %d\n", attrs->videoStd);
--            cleanup(hDisplay);
--            return NULL;
--    }
--
--    fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
--    fmt.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
--
--    if (ioctl(hDisplay->fd, VIDIOC_S_FMT, &fmt) == -1) {
--        Dmai_err2("Failed VIDIOC_S_FMT on %s (%s)\n", attrs->displayDevice,
--                                                      strerror(errno));
--        cleanup(hDisplay);
--        return NULL;
--    }
- #endif /* Dmai_Device_omap3530 */
- 
-     /* Determine the video image dimensions */
diff --git a/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff b/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff
index 5496354..63f9cc6 100644
--- a/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff
+++ b/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff
@@ -1,19 +1,32 @@
-Index: dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
-===================================================================
---- dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h	(revisione 642)
-+++ dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h	(copia locale)
-@@ -34,7 +34,6 @@
- #ifndef ti_sdo_dai_linux_priv__VideoBuf_h_
- #define ti_sdo_dai_linux_priv__VideoBuf_h_
- 
+From 06c4cfeec98f4f1e31543878ceb74c5fff1907e4 Mon Sep 17 00:00:00 2001
+From: Enrico Butera <ebutera@users.berlios.de>
+Date: Thu, 22 Dec 2011 11:01:58 +0100
+Subject: [PATCH 1/2] adjust videdev headers for recent kernels
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ .../packages/ti/sdo/dmai/linux/omap3530/Capture.c  |    1 -
+ .../ti/sdo/dmai/linux/omap3530/Display_v4l2.c      |    1 -
+ .../ti/sdo/dmai/linux/omap3530/_VideoBuf.c         |    1 -
+ .../ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h    |    1 -
+ 4 files changed, 0 insertions(+), 4 deletions(-)
+
+diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
+index a924169..c2b45d2 100644
+--- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
++++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
+@@ -40,7 +40,6 @@
+ #include <sys/mman.h>
+ #include <sys/ioctl.h>
+ #include <asm/types.h>
 -#include <linux/videodev.h>
  #include <linux/videodev2.h>
  
- #include <ti/sdo/dmai/BufferGfx.h>
-Index: dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
-===================================================================
---- dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c	(revisione 642)
-+++ dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c	(copia locale)
+ #include <xdc/std.h>
+diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
+index 0d01b39..0c35efe 100644
+--- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
++++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
 @@ -38,7 +38,6 @@
  #include <sys/ioctl.h>
  #include <sys/mman.h>
@@ -22,22 +35,10 @@ Index: dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
  #include <linux/videodev2.h>
  
  #include <xdc/std.h>
-Index: dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
-===================================================================
---- dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c	(revisione 642)
-+++ dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c	(copia locale)
-@@ -40,7 +40,6 @@
- #include <sys/mman.h>
- #include <sys/ioctl.h>
- #include <asm/types.h>
--#include <linux/videodev.h>
- #include <linux/videodev2.h>
- 
- #include <xdc/std.h>
-Index: dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
-===================================================================
---- dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c	(revisione 642)
-+++ dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c	(copia locale)
+diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
+index 5615e2f..5cb712d 100644
+--- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
++++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
 @@ -38,7 +38,6 @@
  #include <sys/ioctl.h>
  #include <sys/mman.h>
@@ -46,3 +47,18 @@ Index: dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
  #include <linux/videodev2.h>
  
  #include <xdc/std.h>
+diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
+index b2128a3..dbaa4eb 100644
+--- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
++++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
+@@ -34,7 +34,6 @@
+ #ifndef ti_sdo_dai_linux_priv__VideoBuf_h_
+ #define ti_sdo_dai_linux_priv__VideoBuf_h_
+ 
+-#include <linux/videodev.h>
+ #include <linux/videodev2.h>
+ 
+ #include <ti/sdo/dmai/BufferGfx.h>
+-- 
+1.7.2.5
+
diff --git a/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff b/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
index 06ffbec..2f328c0 100644
--- a/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
+++ b/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
@@ -1,8 +1,18 @@
-Index: dmai/packages/config.bld
-===================================================================
---- dmai/packages/config.bld	(revisione 642)
-+++ dmai/packages/config.bld	(copia locale)
-@@ -44,29 +44,9 @@
+From 86e89bb160cfe67c173f1260b93066b12dd73580 Mon Sep 17 00:00:00 2001
+From: Enrico Butera <ebutera@users.berlios.de>
+Date: Thu, 22 Dec 2011 11:03:58 +0100
+Subject: [PATCH 2/2] fix toolchain names in config.bld
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ .../dmai/packages/config.bld                       |   24 +------------------
+ 1 files changed, 2 insertions(+), 22 deletions(-)
+
+diff --git a/davinci_multimedia_application_interface/dmai/packages/config.bld b/davinci_multimedia_application_interface/dmai/packages/config.bld
+index 8c2e96e..566f907 100644
+--- a/davinci_multimedia_application_interface/dmai/packages/config.bld
++++ b/davinci_multimedia_application_interface/dmai/packages/config.bld
+@@ -44,28 +44,8 @@ var C6X = xdc.useModule('ti.targets.C64P');
  C6X.rootDir = codegen;
  C6X.platform = xdcplat;
  
@@ -10,9 +20,7 @@ Index: dmai/packages/config.bld
 -   Then the TOOLDIR and LONGNAME are derived based on a regex of CROSS_COMPILE
 -*/
 -var crosscompile = "" + java.lang.System.getenv("CROSS_COMPILE");
-+var tooldir = "" + java.lang.System.getenv("CSTOOL_DIR");
-+var longName = "" + java.lang.System.getenv("MVTOOL_PREFIX") + "gcc";
- 
+-
 -var tooldir = "";
 -var longName = "";
 -
@@ -30,7 +38,11 @@ Index: dmai/packages/config.bld
 -} else {
 -    longName = crosscompile + "gcc";
 -}
--
++var tooldir = "" + java.lang.System.getenv("CSTOOL_DIR");
++var longName = "" + java.lang.System.getenv("MVTOOL_PREFIX") + "gcc";
+ 
  /* location of the GCC Arm9 tools */
  var GCArmv5T = xdc.useModule('gnu.targets.arm.GCArmv5T');
- GCArmv5T.LONGNAME = longName;
+-- 
+1.7.2.5
+
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index cae4c1f..43b2833 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -3,15 +3,13 @@ require ti-dmai.inc
 # Hack to be able to use recent kernel headers from userspace
 TARGET_CC_ARCH += " -D__EXPORTED_HEADERS__"
 
-DEFAULT_PREFERENCE = "-1"
-
 PV = "2_10_00_01+svnr${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54d7fa607"
 
 # This package has high dependence on kernel, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "n"
+PR_append = "o"
 
 DMAIBRANCH_dm6446     = "trunk"
 DMAIBRANCH_dm6467     = "branches/GITPSP_INT_101009"
@@ -20,7 +18,7 @@ DMAIBRANCH_dm355      = "branches/GITPSP_INT_101009"
 DMAIBRANCH_dm365      = "trunk"
 DMAIBRANCH_omapl137   = "trunk"
 DMAIBRANCH_omapl138   = "trunk"
-DMAIBRANCH           ?= "<UNDEFINED_DMAIBRANCH>"
+DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
 
 SRCREV_dm6446         = "482"
 SRCREV_dm6467         = "441"
@@ -29,9 +27,9 @@ SRCREV_dm355          = "424"
 SRCREV_dm365          = "570"
 SRCREV_omapl137       = "482"
 SRCREV_omapl138       = "570"
-SRCREV               ?= "<UNDEFINED_SRCREV>"
+SRCREV               ?= "UNDEFINED_SRCREV"
 
-SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff \
-                   file://r642-fix-config-bld.diff \
+SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=2 \
+                   file://r642-fix-config-bld.diff;striplevel=2 \
                  "
 
-- 
1.7.2.5


