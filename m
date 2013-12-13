Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F856E007DF
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2013 20:06:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBD46dWF004624
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2013 22:06:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBD46dFK009582
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2013 22:06:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Dec 2013 22:06:39 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rBD46ddx002963;	Thu, 12 Dec 2013 22:06:39 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 12 Dec 2013 23:06:37 -0500
Message-ID: <1386907597-9989-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v4] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Fri, 13 Dec 2013 04:06:43 -0000
Content-Type: text/plain

- Cmem module is used for user space contiguous memory alloation

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb |    4 ++--
 recipes-bsp/cmem/cmem.inc        |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index a072f77..bbd81d4 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -13,13 +13,13 @@ inherit module
 do_compile () {
     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
     cd ${S}
-    make -f lu.mak module_clean
+    make -f lu.mak modules_clean
     make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE}
 }
 
 do_install () {
     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
     cd ${S}
-    make -f lu.mak module_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
+    make -f lu.mak modules_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
 }
 
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 094b2dc..b1f441a 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
 
 BRANCH ?= "master"
-# This corresponds to version 4.00.00.06
-SRCREV = "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
+# This corresponds to version 4.00.01.08
+SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
-- 
1.7.9.5


