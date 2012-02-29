Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69D89E013F2
	for <meta-ti@yoctoproject.org>; Wed, 29 Feb 2012 12:44:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5794E52A6C; Wed, 29 Feb 2012 20:44:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120229204410.5794E52A6C@arago-project.org>
Date: Wed, 29 Feb 2012 20:44:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: fix the remaining missing quotes
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
X-List-Received-Date: Wed, 29 Feb 2012 20:44:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f581b98514272f49c7a4a210a062ee0122b1908f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f581b98514272f49c7a4a210a062ee0122b1908f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Feb 29 15:43:39 2012 -0500

recipes: fix the remaining missing quotes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap4430-panda.conf         |    4 +---
 recipes-ti/gstreamer-ti/gstreamer-ti.inc |    3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/conf/machine/omap4430-panda.conf b/conf/machine/omap4430-panda.conf
index 8f9f86e..afa5806 100644
--- a/conf/machine/omap4430-panda.conf
+++ b/conf/machine/omap4430-panda.conf
@@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
 EXTRA_IMAGEDEPENDS = "x-load u-boot-sakoman "
 
 XLOAD_MACHINE = "omap4430panda_config"
-XLOAD_LOAD_ADDRESS = 0x40304350
+XLOAD_LOAD_ADDRESS = "0x40304350"
 
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-sakoman"
 UBOOT_MACHINE = "omap4_panda_config"
@@ -32,5 +32,3 @@ SERIAL_CONSOLE = "115200 ttyO2"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 MACHINE_FEATURES = "kernel26 alsa apm ext2 screen touchscreen usbgadget usbhost vfat"
-
-
diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index 401ee26..cb03266 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -60,7 +60,7 @@ export PLATFORM
 export GST_TI_PLATFORM
 export XDC_PLATFORM
 export XDC_TARGET      = "gnu.targets.arm.GCArmv5T"
-export PLATFORM_XDC    = ${XDC_PLATFORM}
+export PLATFORM_XDC    = "${XDC_PLATFORM}"
 export CSTOOL_DIR      = "${TOOLCHAIN_PATH}"
 export MVTOOL_DIR      = "${TOOLCHAIN_PATH}"
 export MVTOOL_PREFIX   = "${TARGET_PREFIX}"
@@ -162,4 +162,3 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INITSCRIPT_NAME = "gstti-init"
 INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
-


