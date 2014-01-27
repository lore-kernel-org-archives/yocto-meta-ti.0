Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E685FE006BE
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 11:28:37 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N020093MRF1KQD0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 27 Jan 2014 13:28:24 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 833E1200AC; Mon,
	27 Jan 2014 14:28:13 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 27 Jan 2014 14:28:12 -0500
Message-id: <1390850892-23833-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1387410879-23769-1-git-send-email-sam.nelson@ti.com>
References: <1387410879-23769-1-git-send-email-sam.nelson@ti.com>
Subject: [PATCH] cmem: numerous generic recipe fixes
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
X-List-Received-Date: Mon, 27 Jan 2014 19:28:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Sam, please review these fixes that I made on top of your submission. This is
just for your reference to illustrate the feedback comments given previously.
Feel free to ask questions. I'll squash this patch before pushing changes in.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb | 20 ++++----------------
 recipes-bsp/cmem/cmem.inc        |  4 +++-
 recipes-bsp/cmem/cmem_git.bb     |  4 +---
 3 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index 5809d08..2bdf9c0 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -1,24 +1,12 @@
-DESCRIPTION="Contiguous memory allocation kernel module for contiguous memory allocation from userspace "
+DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "a"
-
-S = "${WORKDIR}/git"
 
 inherit module
 
-do_compile () {
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-    cd ${S}
-    make -f lu.mak modules_clean
-    make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE}
-}
-
-do_install () {
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-    cd ${S}
-    make -f lu.mak modules_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
-}
+EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'
+MAKE_TARGETS = "module"
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index b1f441a..7927839 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -1,4 +1,4 @@
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
@@ -8,3 +8,5 @@ BRANCH ?= "master"
 SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index ca3ed89..bab9238 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -1,11 +1,9 @@
-DESCRIPTION="The cmem component supports contiguous memory allocation from userspace "
+DESCRIPTION = "The cmem component supports contiguous memory allocation from userspace"
 
 include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-S = "${WORKDIR}/git"
-
 PR = "r0"
 
 PACKAGES =+ "${PN}-test"
-- 
1.8.3.2


