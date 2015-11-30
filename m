Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED4B8E00888; Mon, 30 Nov 2015 13:46:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2889E00888
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 13:46:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9EF6352AA0; Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151130214620.9EF6352AA0@arago-project.org>
Date: Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Update to new version 2.0.0.0_eng
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
X-List-Received-Date: Mon, 30 Nov 2015 21:46:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a4e8f5d53ef989aa494d689efd22ace15871ad7b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a4e8f5d53ef989aa494d689efd22ace15871ad7b

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Dec  1 00:40:45 2015 +0000

uio-module-drv: Update to new version 2.0.0.0_eng

- Update to eng release 2.0.0.0
- Added install append for new API header file

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/uio-module-drv/uio-module-drv.inc    |    6 +++---
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb |    7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 567f7f6..ed34a8a 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -1,9 +1,9 @@
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
-BRANCH = "master"
-# This corresponds to version 01.00.02.03
-SRCREV = "634a0c64763c5cd7840e2d439d0ee900455584c8"
+BRANCH = "linux4.1"
+# This corresponds to version 02.00.00.00_eng
+SRCREV = "6a7eda36e390658593a5b8d87b0f00beb3997240"
 
 SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index d75fda2..445dc1c 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION="User space IO (UIO) driver for on-chip modules"
 
 include uio-module-drv.inc
-PV = "1.0.2.3+git${SRCPV}"
+PV = "2.0.0.0+git${SRCPV}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
 MACHINE_KERNEL_PR_append = "b"
@@ -10,3 +10,8 @@ PR = "${MACHINE_KERNEL_PR}"
 module_auto_load_uio-module-drv = "uio-module-drv"
 
 inherit module
+
+do_install_append () {
+    install -d ${D}${includedir}
+    cp *.h ${D}${includedir}
+}


