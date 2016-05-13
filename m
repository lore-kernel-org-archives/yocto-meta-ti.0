Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 358DDE00888; Fri, 13 May 2016 08:32:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 582F8E0086E
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 08:32:41 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4DFWfMl010419
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 10:32:41 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4DFWfY5002415
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 10:32:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 13 May 2016 10:32:40 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4DFWeG0023020;	Fri, 13 May 2016 10:32:40 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 May 2016 11:32:39 -0400
Message-ID: <1463153559-18238-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] uio-module-drv: Update to 2.0.0.0 GA version
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
X-List-Received-Date: Fri, 13 May 2016 15:32:43 -0000
Content-Type: text/plain

Reformatted recipes to have one common PV between module and test
recipes

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- Added common PV in uio-module-drv.inc
---
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 3 ++-
 recipes-bsp/uio-module-drv/uio-module-drv.inc         | 6 ++++--
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb      | 3 +--
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
-- 
1.9.1


