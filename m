Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93CA2E00734
	for <meta-ti@yoctoproject.org>; Mon, 24 Jun 2013 18:53:38 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MOX004JEEKS4WM1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 24 Jun 2013 20:53:26 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0E23A2004C; Mon,
	24 Jun 2013 21:53:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Jun 2013 21:52:59 -0400
Message-id: <1372125179-6458-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] u-boot: add support for SPL UART variant
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
X-List-Received-Date: Tue, 25 Jun 2013 01:53:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is an adaptation of a patch by Carlos Hernandez

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |  3 ++-
 recipes-bsp/u-boot/u-boot-ti.inc                   | 24 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index 5fbd0c9..ea72e4d 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -2,7 +2,7 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
@@ -12,3 +12,4 @@ BRANCH ?= "ti-u-boot-2013.01.01"
 SRCREV = "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
 
 SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 968f3e4..c024e96 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -15,3 +15,27 @@ PKG_${PN}-dbg = "u-boot-dbg"
 S = "${WORKDIR}/git"
 
 UBOOT_SUFFIX = "img"
+
+# SPL (Second Program Loader) to be loaded over UART
+SPL_UART_BINARY ?= ""
+SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
+SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
+
+do_install_append () {
+    if [ "x${SPL_UART_BINARY}" != "x" ]
+    then
+        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+        ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
+    fi
+}
+
+do_deploy_append () {
+    cd ${DEPLOYDIR}
+    if [ "x${SPL_UART_BINARY}" != "x" ]
+    then
+        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
+        rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
+        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+    fi
+}
-- 
1.8.2.1


