Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF22BE0027E
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2012 08:03:15 -0700 (PDT)
Received: by mail-ob0-f176.google.com with SMTP id x4so4585784obh.35
	for <meta-ti@yoctoproject.org>; Mon, 08 Oct 2012 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=unzdZhsTc/3j1+Pcxn7ihNqWeK+jFQ28irJWMmjl8Rc=;
	b=AxA20A2GuxyI4EkveP4bO2Em3TODGcE7DLVQYCXV7z70hfCU2+NdBlzDoASG1lCjs5
	Lt7ahq4r9UZnIzflJ9lkVBTnU3xqdJNBeWUncjgiMSSp0pvsU+sDmZ11DkFo9c2xgNgB
	qNGaoX0jNKe32SUhIzoHVdEJLZzuaBlXB9qSBSJldkq5jJ8stBMOGDGNuQmzNhJ12qap
	5OlA3r9INHpxTZBC8wPCVA38/Rq0fWm//CLxdZqtGeLr2Xl8PHckaHBS2gzMdx1XVS/D
	whSXNIqLzpwL3H6E7XJJ8ThxzU45NsQm4+QrEDc3mU7xGe9iS3uPReO82TikamdP+W3d
	GPDw==
Received: by 10.60.30.168 with SMTP id t8mr13761955oeh.89.1349708593338;
	Mon, 08 Oct 2012 08:03:13 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id n7sm9612344obd.16.2012.10.08.08.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 08:03:12 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  8 Oct 2012 10:32:47 -0500
Message-Id: <1349710367-6810-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] bt-enable: Add bt-enable recipe
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
X-List-Received-Date: Mon, 08 Oct 2012 15:03:16 -0000

* Port bt-enable recipe from arago.
* Bt-enable is used to enable the BT module on the TI wl12xx
  Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update ordering based on OE Styling Guide:
    http://www.openembedded.org/wiki/Styleguide
Remove unneeded DEPENDS and PACKAGE_ARCH
Use updated package strip syntax.
Remove the machine da850-omapl138-evm from the recipe.
Remove tab from oe_runmake
Appending to EXTRA_OEMAKE instead of overriding it

 ...kefile-Update-makefile-to-work-well-in-OE.patch |   78 ++++++++++++++++++++
 recipes-bsp/bt-enable/bt-enable_1.0.bb             |   32 ++++++++
 2 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
 create mode 100644 recipes-bsp/bt-enable/bt-enable_1.0.bb

diff --git a/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
new file mode 100644
index 0000000..7e6756c
--- /dev/null
+++ b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
@@ -0,0 +1,78 @@
+From a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 10:51:43 -0600
+Subject: [PATCH] Makefile: Update makefile to work with OE
+
+* Updated the makefile to with OE
+* Use the kernel install target for installing the module
+
+Upstream-Status: Pending
+    * will be in next release
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ Makefile |   45 ++++++++++++++++++++++++++++++++++++++++-----
+ 1 files changed, 40 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ebbcd11..b17d33e 100755
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,50 @@ else
+   EXTRA_CFLAGS += -O2
+ endif
+
++-include ../../../Rules.make
++
++# If KERNEL_DIR is not set then use the default in Rules.make
++KERNEL_DIR ?= ${LINUXKERNEL_INSTALL_DIR}
++DEST_DIR ?= ${DESTDIR}
++
++PLATFORM ?= "unknown"
++MACHINE_NAME ?= "unknown"
++
++# Use the PLATFORM value from the Rules.make if it was sourced
++ifeq ($(PLATFORM), am335x-evm)
++    MACHINE_NAME := "am335x"
++endif
++ifeq ($(PLATFORM), am180x-evm)
++    MACHINE_NAME := "am1808"
++endif
++ifeq ($(PLATFORM), da850-omapl138-evm)
++    MACHINE_NAME := "am1808"
++endif
++ifeq ($(PLATFORM), am37x-evm)
++    MACHINE_NAME := "omap3evm"
++endif
++
++# If CROSS_COMPILE is not set by Rules.make then set a sane default
++CROSS_COMPILE ?= arm-arago-linux-gnueabi-
++export CROSS_COMPILE
++
++# set the INSTALL_MOD_DIR so that the executables won't be placed in extra
++INSTALL_MOD_DIR = kernel/drivers/bt_enable
++export INSTALL_MOD_DIR
++
+ obj-m := gpio_en.o
+
++MAKE_ENV = ARCH=arm
++
+ PWD := $(shell pwd)
+ all:
+-	pwd
+-	@echo EXTRA_CFLAGS = $(EXTRA_CFLAGS)
+-	$(MAKE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=$(PWD) modules
++	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
++	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
++    M=$(PWD) modules
++
+ install:
+-	install -d ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
+-	install -m 0755 ./gpio_en.ko ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
++	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
++    M=$(PWD) INSTALL_MOD_PATH="${DEST_DIR}" modules_install
++
+ clean:
+	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.symvers
+--
+1.7.0.4
diff --git a/recipes-bsp/bt-enable/bt-enable_1.0.bb b/recipes-bsp/bt-enable/bt-enable_1.0.bb
new file mode 100644
index 0000000..27d8e1d
--- /dev/null
+++ b/recipes-bsp/bt-enable/bt-enable_1.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "BT GPIO Enable"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://gpio_en_am1808.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
+                    file://gpio_en_am335x.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
+                    file://gpio_en_omap3evm.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
+"
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+
+PR = "r0+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a"
+
+SRCREV = "97c4600ff7d39f1cc6079939248cd9ed15100db4"
+
+SRC_URI = "git://github.com/TI-ECS/bt_enable.git;protocol=git \
+           file://0001-Makefile-Update-makefile-to-work-well-in-OE.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit module
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+PLATFORM_ti33x = "am335x-evm"
+PLATFORM_omap3 = "am37x-evm"
+PLATFORM_omapl138 = "am180x-evm"
+
+EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR} PLATFORM=${PLATFORM}"
+
+do_install () {
+    oe_runmake 'DEST_DIR=${D}' install
+}
-- 
1.7.0.4


