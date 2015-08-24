Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31E6EE00BAE; Mon, 24 Aug 2015 11:21:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2DB3E00B9D
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 11:20:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A989E52A0F; Mon, 24 Aug 2015 18:20:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150824182056.A989E52A0F@arago-project.org>
Date: Mon, 24 Aug 2015 18:20:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : cmem: Bump SRCREV to fix build with GCC 4.9 and Linux 4.1
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
X-List-Received-Date: Mon, 24 Aug 2015 18:21:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2ea16a954200f6092435985a4430c772b0c36d8e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2ea16a954200f6092435985a4430c772b0c36d8e

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Aug 21 19:41:05 2015 +0000

cmem: Bump SRCREV to fix build with GCC 4.9 and Linux 4.1

* Changes retain compatibility with older tolchain and kernl.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem-mod_git.bb |    2 +-
 recipes-bsp/cmem/cmem.inc        |    8 ++++----
 recipes-bsp/cmem/cmem_git.bb     |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index b36eb09..6b2303c 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 23e5f2e..0d3e918 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
-BRANCH ?= "master"
-# This corresponds to version 4.10.01.02
-SRCREV = "a51d9770021fd16c97fc59b320286a3fa43278bc"
+BRANCH ?= "lu-next"
+# This corresponds to version 4.10.02.03
+SRCREV = "d47ac635699da6bee6daff31b87b0123e13af4ac"
 
-PV = "4.10.01.02+git${SRCPV}"
+PV = "4.10.02.03+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index b30029d..bab9238 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -4,7 +4,7 @@ include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-PR = "r1"
+PR = "r0"
 
 PACKAGES =+ "${PN}-test"
 


