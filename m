Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08DE2E007C9; Mon, 30 Nov 2015 10:40:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5488E005B3
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 10:40:53 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAUIeqjr019538
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 12:40:52 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAUIeq3o008237
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 12:40:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Nov 2015 12:40:52 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAUIeqQQ022555;	Mon, 30 Nov 2015 12:40:52 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 30 Nov 2015 13:40:45 -0500
Message-ID: <1448908845-25310-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] uio-module-drv: Update to new version 2.0.0.0_eng
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
X-List-Received-Date: Mon, 30 Nov 2015 18:40:59 -0000
Content-Type: text/plain

- Update to eng release 2.0.0.0
- Added install append for new API header file

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv.inc    | 6 +++---
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb | 7 ++++++-
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
-- 
1.9.1


