Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33467E008CE; Thu, 26 Feb 2015 09:12:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2276E0088A
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:12:35 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B3B57529E0; Thu, 26 Feb 2015 17:12:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150226171235.B3B57529E0@arago-project.org>
Date: Thu, 26 Feb 2015 17:12:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : cmem: Bump version to 4.10.0. 1 and enable autoload of module.
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
X-List-Received-Date: Thu, 26 Feb 2015 17:12:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b490d090a1bb1f7fd0f4ecc507bb4518167ba72d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b490d090a1bb1f7fd0f4ecc507bb4518167ba72d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Feb 26 01:23:55 2015 +0000

cmem: Bump version to 4.10.0.1 and enable autoload of module.

* This version introduces the ability to configure CMEM through
  the device tree.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem-mod_git.bb |    4 +++-
 recipes-bsp/cmem/cmem.inc        |    6 +++---
 recipes-bsp/cmem/cmem_git.bb     |    2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index 2bdf9c0..0cc0b46 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,10 +3,12 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
 
 EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'
 MAKE_TARGETS = "module"
+
+module_autoload_cmemk = "cmemk"
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 7927839..ff7a8a0 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -1,11 +1,11 @@
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
+LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH ?= "master"
-# This corresponds to version 4.00.01.08
-SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
+# This corresponds to version 4.10.00.01
+SRCREV = "0d2fac7187ca1f6af62a98dee5b3621908cf5831"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index b633d74..540c2f6 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -4,7 +4,7 @@ include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 PACKAGES =+ "${PN}-test"
 


