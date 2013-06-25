Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6DBBE01565
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2013 11:13:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 78D7C52995; Tue, 25 Jun 2013 18:13:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130625181305.78D7C52995@arago-project.org>
Date: Tue, 25 Jun 2013 18:13:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: add support for SPL UART variant
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
X-List-Received-Date: Tue, 25 Jun 2013 18:13:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 1c09e95bef33b32921f9302ce088ad0cacdde944
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1c09e95bef33b32921f9302ce088ad0cacdde944

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jun 24 20:14:37 2013 -0400

u-boot: add support for SPL UART variant

This is an adaptation of a patch by Carlos Hernandez

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    3 +-
 recipes-bsp/u-boot/u-boot-ti.inc                   |   24 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletions(-)

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


