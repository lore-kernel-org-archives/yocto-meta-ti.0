Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA090E00C6F; Wed, 21 May 2014 12:57:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E90C1E00C10
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 808E052A6D; Wed, 21 May 2014 19:57:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195733.808E052A6D@arago-project.org>
Date: Wed, 21 May 2014 19:57:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : ti-ipc: Add version 3.21.00.07
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
X-List-Received-Date: Wed, 21 May 2014 19:57:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 5e740e406e0bb28a7aad9389eb0af44c306302ad
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5e740e406e0bb28a7aad9389eb0af44c306302ad

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Tue May 20 01:19:41 2014 +0000

ti-ipc: Add version 3.21.00.07

* Added version 3.21.00.07 from the meta-ti-glsdk layer.
  Preserved authorship by Mrinmayee
* Cleaned up the recipe for upstream by removing the sed lines
  in do_configure and instead using EXTRA_OEMAKE values passed
  into the make process.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...nstallation-prefix-feature-to-products.ma.patch |   38 ++++++++++++++++++++
 recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |   31 ++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
new file mode 100644
index 0000000..58d77c7
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
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
+ TOOLCHAIN_LONGNAME = arm-none-linux-gnueabi
+ TOOLCHAIN_INSTALL_DIR = $(DEPOT)/_your_arm_code_gen_install_
+ TOOLCHAIN_PREFIX = $(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
++PREFIX = /usr/local
+ 
+ # Optional: Path to Linux Kernel - needed to build the MmRpc user libraries
+ # (for devices that support it)
+-- 
+1.7.9.5
+
diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
new file mode 100644
index 0000000..8131754
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
+HOMEPAGE = "https://git.ti.com/ipc/pages/Home"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
+
+DEPENDS += "virtual/kernel"
+
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PLATFORM_omap5-evm = "OMAP54XX"
+PLATFORM_dra7xx-evm = "DRA7XX"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
+           file://0002-ipc-Added-installation-prefix-feature-to-products.ma.patch \
+           "
+
+SRCREV = "c18fece0c9f0dc76361dc1ee11b7ee2417479847"
+
+S = "${WORKDIR}/git"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}:"
+
+EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_INSTALL_DIR=${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=${TOOLCHAIN_SYS} PLATFORM=${PLATFORM} PREFIX=${prefix}"
+
+do_configure() {
+	oe_runmake -f ${S}/ipc-linux.mak config
+}


