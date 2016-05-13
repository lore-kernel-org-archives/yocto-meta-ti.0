Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B3CEE00C1E; Fri, 13 May 2016 11:57:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24EE7E00B70
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 11:57:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 50EB3529D0; Fri, 13 May 2016 18:57:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160513185742.50EB3529D0@arago-project.org>
Date: Fri, 13 May 2016 18:57:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Update to 2.0.0.0 GA version
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
X-List-Received-Date: Fri, 13 May 2016 18:57:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 7656af805fb763cc4a69a2e8f7d7365940da5c6e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7656af805fb763cc4a69a2e8f7d7365940da5c6e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri May 13 21:32:39 2016 +0000

uio-module-drv: Update to 2.0.0.0 GA version

Reformatted recipes to have one common PV between module and test
recipes

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../uio-module-drv/uio-module-drv-test_git.bb      |    3 ++-
 recipes-bsp/uio-module-drv/uio-module-drv.inc      |    6 ++++--
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb   |    3 +--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 1080a91..3134a03 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
-PV = "1.0.2.3"
+
+PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"
 RDEPENDS_${PN} = "uio-module-drv"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index ed34a8a..161c45b 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -1,10 +1,12 @@
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
-BRANCH = "linux4.1"
-# This corresponds to version 02.00.00.00_eng
+BRANCH = "master"
+# This corresponds to version 02.00.00.00
 SRCREV = "6a7eda36e390658593a5b8d87b0f00beb3997240"
 
+PV = "2.0.0.0+git${SRCPV}"
+
 SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index 401fdbe..15a7691 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -1,10 +1,9 @@
 DESCRIPTION="User space IO (UIO) driver for on-chip modules"
 
 include uio-module-drv.inc
-PV = "2.0.0.0+git${SRCPV}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 module_auto_load_uio-module-drv = "uio-module-drv"


