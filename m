Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84614E0027F
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 16:59:42 -0700 (PDT)
Received: by oagn16 with SMTP id n16so5111203oag.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 16:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=OlURjIJjZyDJFvQWralecp7qOJSHuSwoL+x6SojK1w0=;
	b=AayHPjHtD95h2raX42WmCh5VlnQnFS7hYypbaf3Xh+eKXa/BZE8wCG9OvRKYsOuPJJ
	y7izxXbFudo9BINK5JUonAYCa4LOSoQZZsHqRlEadH06P0pwWgcgZ9Da0Vuj3Qzntg0n
	0ZRyGlXzDlEaeZXkZWV6AzeVB6eSddVmSBy3aT1n7UhQLOXn9znnMTdQfNLaUkgNr7dQ
	qJQz4DuxQnLqUU/Gnv19NUvMHs7xd2ObMfQMQXVKTMx1uHi8obb9nWjj91xY9Z/hhFeP
	7OYzZWteXdhl1VOSWR7O1g9liTIyl3dZPYvA1Q+zKaq6TEk9DfpIS4AkLWh9rE017gTV
	/Dtg==
Received: by 10.182.145.35 with SMTP id sr3mr5039721obb.98.1348271981967;
	Fri, 21 Sep 2012 16:59:41 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id th3sm9272175obb.6.2012.09.21.16.59.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 16:59:41 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 21 Sep 2012 19:23:03 -0500
Message-Id: <1348273383-26479-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bt-firmware: Port bt-firmware recipe
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
X-List-Received-Date: Fri, 21 Sep 2012 23:59:42 -0000

* Port bt-firmware recipe from arago.
* Bt-firmware provides the bluetooth firmware for the TI wl12xx
  Wi+Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...01-Makefile-allow-building-within-the-SDK.patch |   50 ++++++++++++++++++++
 recipes-bsp/bt-firmware/bt-firmware_git.bb         |   31 ++++++++++++
 2 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-SDK.patch
 create mode 100644 recipes-bsp/bt-firmware/bt-firmware_git.bb

diff --git a/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-SDK.patch b/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-SDK.patch
new file mode 100644
index 0000000..38bd3c5
--- /dev/null
+++ b/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-SDK.patch
@@ -0,0 +1,50 @@
+From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 14:11:42 -0600
+Subject: [PATCH] Makefile: allow building within the SDK
+
+* Use defaults and source values that allow building this
+  component within the SDK as well as with OE.
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
+ 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
+ 	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
+-- 
+1.7.0.4
+
diff --git a/recipes-bsp/bt-firmware/bt-firmware_git.bb b/recipes-bsp/bt-firmware/bt-firmware_git.bb
new file mode 100644
index 0000000..181b228
--- /dev/null
+++ b/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Firmware files for Bluetooth"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+                    file://am1808/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+                    file://omap3evm/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0+gitr${SRCREV}"
+
+COMPATIBLE_MACHINE = "am37x-evm|am180x-evm|da850-omapl138-evm|am335x-evm"
+
+SRCREV = "db43d1f05efda9777d7ac1ac366637e29e21f77f"
+SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
+           file://0001-Makefile-allow-building-within-the-SDK.patch"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	:
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware
+	oe_runmake 'DEST_DIR=${D}' 'BASE_LIB_DIR=${base_libdir}' 'PLATFORM=${MACHINE}' install
+}
+
+FILES_${PN} += "${base_libdir}/firmware"
+
+
-- 
1.7.0.4


