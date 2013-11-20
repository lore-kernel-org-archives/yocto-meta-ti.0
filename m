Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A022E004E5
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 03:05:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKB5fsi022326
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 05:05:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKB5f9D029603
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 05:05:41 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 05:05:40 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKB5der026425	for
	<meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 05:05:40 -0600
Date: Wed, 20 Nov 2013 16:35:38 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131120110538.GA22903@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] ipc: IPC for communication between multiple processors
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
X-List-Received-Date: Wed, 20 Nov 2013 11:05:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ...nstallation-prefix-feature-to-products.ma.patch |   38 ++++++++++++++++++++
 recipes-ti/ipc/ti-ipc_3.10.00.08.bb                |   30 ++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 recipes-ti/ipc/0001-ipc-Added-installation-prefix-feature-to-products.ma.patch
 create mode 100644 recipes-ti/ipc/ti-ipc_3.10.00.08.bb

diff --git a/recipes-ti/ipc/0001-ipc-Added-installation-prefix-feature-to-products.ma.patch b/recipes-ti/ipc/0001-ipc-Added-installation-prefix-feature-to-products.ma.patch
new file mode 100644
index 0000000..7d5ff94
--- /dev/null
+++ b/recipes-ti/ipc/0001-ipc-Added-installation-prefix-feature-to-products.ma.patch
@@ -0,0 +1,38 @@
+From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00 2001
+From: Mrinmayee Hingolikar <mrinmayee@ti.com>
+Date: Thu, 5 Sep 2013 17:01:15 +0530
+Subject: [PATCH] ipc: Added installation prefix feature to products.mak
+
+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
+---
+ ipc-linux.mak |    1 +
+ products.mak  |    1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ipc-linux.mak b/ipc-linux.mak
+index 788a5a2..01579e4 100644
+--- a/ipc-linux.mak
++++ b/ipc-linux.mak
+@@ -38,6 +38,7 @@ include products.mak
+ config:
+ 	@echo "Configuring Linux Ipc ..."
+ 	./configure --host=$(TOOLCHAIN_LONGNAME) \
++            --prefix=$(PREFIX) \
+             CC=$(TOOLCHAIN_PREFIX)gcc \
+             PLATFORM=$(PLATFORM) \
+             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
+diff --git a/products.mak b/products.mak
+index e418d2f..4578a1e 100644
+--- a/products.mak
++++ b/products.mak
+@@ -55,6 +55,7 @@ PLATFORM ?=
+ TOOLCHAIN_LONGNAME ?= arm-none-linux-gnueabi
+ TOOLCHAIN_INSTALL_DIR ?= $(DEPOT)/_your_arm_code_gen_install_
+ TOOLCHAIN_PREFIX ?= $(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
++PREFIX ?= /usr/local
+ 
+ # Optional: Path to Linux Kernel - needed to build the MmRpc user libraries
+ # (for devices that support it)
+-- 
+1.7.9.5
+
diff --git a/recipes-ti/ipc/ti-ipc_3.10.00.08.bb b/recipes-ti/ipc/ti-ipc_3.10.00.08.bb
new file mode 100644
index 0000000..645061d
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc_3.10.00.08.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
+HOMEPAGE = "https://git.ti.com/ipc/pages/Home"
+LICENSE = "BSD"
+
+PV = "3_10_00_08"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
+
+PLATFORM_omap5-evm = "omap54xx_smp"
+PLATFORM_dra7xx-evm = "dra7xx"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
+           file://0001-ipc-Added-installation-prefix-feature-to-products.ma.patch \
+           "
+SRCREV = "b11251f705f84f32740cd288afe9281e653bd8eb"
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+	sed -i -e "s#^KERNEL_INSTALL_DIR ?=.*#KERNEL_INSTALL_DIR = ${STAGING_KERNEL_DIR}#" ${S}/products.mak	
+	sed -i -e "s#^TOOLCHAIN_INSTALL_DIR ?=.*#TOOLCHAIN_INSTALL_DIR = ${TOOLCHAIN_PATH}#" ${S}/products.mak
+	sed -i -e "s#^TOOLCHAIN_LONGNAME ?=.*#TOOLCHAIN_LONGNAME = arm-linux-gnueabihf#" ${S}/products.mak
+	sed -i -e "s#^PLATFORM ?=.*#PLATFORM = ${PLATFORM}#" ${S}/products.mak
+	sed -i -e "s#^PREFIX ?=.*#PREFIX = /usr#" ${S}/products.mak
+
+	make -f ${S}/ipc-linux.mak config
+}
-- 
1.7.9.5


