Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8C60E0027E
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2012 07:56:52 -0700 (PDT)
Received: by mail-oa0-f48.google.com with SMTP id h2so243452oag.35
	for <meta-ti@yoctoproject.org>; Mon, 08 Oct 2012 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8J0Ww3LMUQXoayqj8iwWNRbo8M/7EMKwS3Wr1QtC154=;
	b=qzqebfIbLW2gwZ4tMHXGstiMbfcC3SCa8D8bpt6fSo5w/yajtcMLtITjb0XgTa7Uam
	9TqCqtV68Fv1DOpeIYtLkwyojyGm7BUR+wNGYNKShxhUN4cMh8XG4jRkCSYOXv8ck+Au
	Nse4hgoV9MLL2QG39YEvhdBChWapLoHPeefuOGT/G9vdqhImbQ7fDEjwHcds/MHW+Nwj
	kqkz3EZsjewPwlf5F8lCN51RK+CV7KWJIHGny4QKJdqhXHuzUpfk9uQaqoh9OaxYWexa
	ywKqeYv3uim9vo1Mg0Fm9VPGSBKEhNv6O3Zh7258euct7Qb6dqZ7A/8XqxcYTbQEwiW2
	oW+w==
Received: by 10.182.95.142 with SMTP id dk14mr319392obb.2.1349708209775;
	Mon, 08 Oct 2012 07:56:49 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o4sm14411069oef.11.2012.10.08.07.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 07:56:49 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  8 Oct 2012 10:26:21 -0500
Message-Id: <1349709981-5570-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] bt-firmware: Port bt-firmware recipe
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
X-List-Received-Date: Mon, 08 Oct 2012 14:56:52 -0000

* Port bt-firmware recipe from arago.
* Bt-firmware provides the bluetooth firmware for the TI wl12xx
  Wi+Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update ordering based on OE Styling Guide:
    http://www.openembedded.org/wiki/Styleguide
Remove unneeded DEPENDS and PACKAGE_ARCH setting
Use updated package strip syntax.
Remove the machine da850-omapl138-evm from the recipe
Remove tab from oe_runmake
Appending to EXTRA_OEMAKE instead of overriding it

 ...001-Makefile-allow-building-within-the-OE.patch |   49 ++++++++++++++++++++
 recipes-bsp/bt-firmware/bt-firmware_git.bb         |   41 ++++++++++++++++
 2 files changed, 90 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
 create mode 100644 recipes-bsp/bt-firmware/bt-firmware_git.bb

diff --git a/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch b/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
new file mode 100644
index 0000000..49caa85
--- /dev/null
+++ b/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
@@ -0,0 +1,49 @@
+From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 14:11:42 -0600
+Subject: [PATCH] Makefile: allow building with OE
+
+* Use defaults and source values that allow building this
+  component with OE.
+
+Upstread-Status: Pending
+    * Will be accepted into next release
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ Makefile |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9035e40..bd94881 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,26 @@
+ # Installs the the Bluetooth firmware files into the root file system
+
++-include ../../../Rules.make
++
++# If KERNEL_DIR is not set then use the default in Rules.make
++DEST_DIR ?= ${DESTDIR}
++
++PLATFORM ?= "unknown"
++MACHINE_NAME ?= "unknown"
++
++ifeq ($(PLATFORM), am335x-evm)
++    MACHINE_NAME := am335x
++endif
++ifeq ($(PLATFORM), am180x-evm)
++    MACHINE_NAME := am1808
++endif
++ifeq ($(PLATFORM), da850-omapl138-evm)
++    MACHINE_NAME := am1808
++endif
++ifeq ($(PLATFORM), am37x-evm)
++    MACHINE_NAME := omap3evm
++endif
++
+ install:
+	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
+	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
+--
+1.7.0.4
diff --git a/recipes-bsp/bt-firmware/bt-firmware_git.bb b/recipes-bsp/bt-firmware/bt-firmware_git.bb
new file mode 100644
index 0000000..f6888d4
--- /dev/null
+++ b/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Firmware files for Bluetooth"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+                    file://am1808/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+                    file://omap3evm/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# This recipe provides the latest firmware files for wl12xx.
+# Therefore, use the contents of this recipe instead of the contents
+# of linux-firmware-wl12xx.
+RCONFLICTS_${PN} = "linux-firmware-wl12xx"
+RREPLACES_${PN}  = "linux-firmware-wl12xx"
+
+PR = "r0+gitr${SRCREV}"
+
+COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
+
+SRCREV = "db43d1f05efda9777d7ac1ac366637e29e21f77f"
+SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
+           file://0001-Makefile-allow-building-within-the-OE.patch"
+
+PLATFORM = "unknown"
+PLATFORM_ti33x = "am335x-evm"
+PLATFORM_omap3 = "am37x-evm"
+PLATFORM_omapl138 = "am180x-evm"
+PLATFORM_da850-omapl138-evm = "am180x-evm"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	:
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware
+	oe_runmake 'DEST_DIR=${D}' 'BASE_LIB_DIR=${base_libdir}' 'PLATFORM=${PLATFORM}' install
+}
+
+FILES_${PN} += "${base_libdir}/firmware"
-- 
1.7.0.4


