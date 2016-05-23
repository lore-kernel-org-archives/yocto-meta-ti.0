Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E5D5E00E38; Mon, 23 May 2016 07:18:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9528E00CB0
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 07:18:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4NEIKYw011547
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 09:18:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4NEIKHX013575
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 09:18:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 May 2016 09:18:20 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4NEIJms020514;	Mon, 23 May 2016 09:18:19 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 May 2016 10:18:18 -0400
Message-ID: <1464013098-46279-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] linux-ti-staging: Update pru uio dtb entries
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
X-List-Received-Date: Mon, 23 May 2016 14:18:26 -0000
Content-Type: text/plain

added additional entries to allow access to ecap and uart regions
Update Kernel PR to force rebuild

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi | 8 ++++++--
 recipes-kernel/linux/linux-ti-staging_4.4.bb          | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
index 577603a..fe21b2f 100644
--- a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
@@ -11,10 +11,12 @@
 			      <0x4b210000 0x8000>,
 			      <0x4b220000 0x2000>,
 			      <0x4b226000 0x2000>,
+			      <0x4b228000 0x38>,
 			      <0x4b22e000 0x31c>,
+			      <0x4b230000 0x60>,
 			      <0x4b232000 0x58>;
 			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
+				    "ecap", "iep", "uart", "mii_rt";
 			status = "okay";
 		};
 		uio_pruss1_evt0: uio_pruss1_evt0 {
@@ -90,10 +92,12 @@
 			      <0x4b290000 0x8000>,
 			      <0x4b2a0000 0x2000>,
 			      <0x4b2a6000 0x2000>,
+			      <0x4b2a8000 0x38>,
 			      <0x4b2ae000 0x31c>,
+			      <0x4b2b0000 0x60>,
 			      <0x4b2b2000 0x58>;
 			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
+				    "ecap", "iep", "uart", "mii_rt";
 			status = "okay";
 		};
 		uio_pruss2_evt0: uio_pruss2_evt0 {
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index a712127..cba9c89 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -75,7 +75,7 @@ SRCREV = "1d85a66844655b0cbd99c00870d77956494c59ab"
 PV = "4.4.11+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
1.9.1


