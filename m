Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66D81E0053A; Mon, 19 Oct 2015 11:41:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B16DE0048C
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 11:41:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8B71952A08; Mon, 19 Oct 2015 18:41:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019184136.8B71952A08@arago-project.org>
Date: Mon, 19 Oct 2015 18:41:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : omapdrm-pvr: bump SRCREV for am3 and am4
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
X-List-Received-Date: Mon, 19 Oct 2015 18:41:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f2dab4ab9cac5c5c0283739ac3c1a1d8eb4c23fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f2dab4ab9cac5c5c0283739ac3c1a1d8eb4c23fb

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Oct 15 20:10:38 2015 +0000

omapdrm-pvr: bump SRCREV for am3 and am4

* Remove the OCP_SYSCONFIG setting so that power management capability
  will not be disabled
* Put SGX device in reset state when PVRSRV driver is removed
* Disable the Interrupt Sync Check unless SUPPORT_LISR_MISR_SYNC is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 15ccb54..5d5119e 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -7,7 +7,7 @@ inherit module
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
-MACHINE_KERNEL_PR_append = "h"
+MACHINE_KERNEL_PR_append = "i"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -20,8 +20,8 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
 S = "${WORKDIR}/git"
 
 SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
-SRCREV_ti33x = "ad7c4fa37897b59b6d9ddabb9aba03fd515ffa29"
-SRCREV_ti43x = "ad7c4fa37897b59b6d9ddabb9aba03fd515ffa29"
+SRCREV_ti33x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
+SRCREV_ti43x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
 
 PVR_NULLDRM_ti33x = "1"
 PVR_NULLDRM_ti43x = "1"


