Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DDDAE00B04; Thu, 15 Oct 2015 07:10:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 643E1E00978
	for <meta-ti@yoctoproject.org>; Thu, 15 Oct 2015 07:10:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9FEAfqE022924
	for <meta-ti@yoctoproject.org>; Thu, 15 Oct 2015 09:10:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FEAfIj005182
	for <meta-ti@yoctoproject.org>; Thu, 15 Oct 2015 09:10:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 15 Oct 2015 09:10:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9FEAe50026065;	Thu, 15 Oct 2015 09:10:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Oct 2015 10:10:38 -0400
Message-ID: <1444918238-11739-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] omapdrm-pvr: bump SRCREV for am3 and am4
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
X-List-Received-Date: Thu, 15 Oct 2015 14:10:46 -0000
Content-Type: text/plain

* Remove the OCP_SYSCONFIG setting so that power management capability
  will not be disabled
* Put SGX device in reset state when PVRSRV driver is removed
* Disable the Interrupt Sync Check unless SUPPORT_LISR_MISR_SYNC is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
1.9.1


