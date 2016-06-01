Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E803E00E02; Tue, 31 May 2016 21:11:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39EABE00DED
	for <meta-ti@yoctoproject.org>; Tue, 31 May 2016 21:11:44 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u514Bdp8029007
	for <meta-ti@yoctoproject.org>; Tue, 31 May 2016 23:11:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u514BhGW004991
	for <meta-ti@yoctoproject.org>; Tue, 31 May 2016 23:11:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 31 May 2016 23:11:43 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u514Bg4A021591;	Tue, 31 May 2016 23:11:43 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 1 Jun 2016 00:11:40 -0400
Message-ID: <1464754300-31679-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] linux-ti-staging: Update uio entries for am572x
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
X-List-Received-Date: Wed, 01 Jun 2016 04:11:51 -0000
Content-Type: text/plain

Rearranged memory sections
Added additional memory section to accomodate required sections more
than 8
Incremented PR append for linux-ti-staging

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../linux/files/dra7xx/am572x-pru-uio.dtsi         | 36 +++++++++++-----------
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |  2 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
index fe21b2f..828a0ce 100644
--- a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
@@ -11,12 +11,18 @@
 			      <0x4b210000 0x8000>,
 			      <0x4b220000 0x2000>,
 			      <0x4b226000 0x2000>,
-			      <0x4b228000 0x38>,
 			      <0x4b22e000 0x31c>,
-			      <0x4b230000 0x60>,
 			      <0x4b232000 0x58>;
 			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "ecap", "iep", "uart", "mii_rt";
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss1_mem2: uio_pruss1_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b228000 0x38>,
+			      <0x4b230000 0x60>,
+			      <0x4b232400 0x90>;
+			mem-names = "uart", "ecap", "mdio";
 			status = "okay";
 		};
 		uio_pruss1_evt0: uio_pruss1_evt0 {
@@ -78,12 +84,6 @@
 			status = "okay";
 		};
 
-		uio_pruss1_mdio: uio_pruss1_mdio {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b232400 0x90>;
-			status = "okay";
-		};
-
 		uio_pruss2_mem: uio_pruss2_mem {
 			compatible = "ti,uio-module-drv";
 			ti,hwmods = "pruss2";
@@ -92,12 +92,18 @@
 			      <0x4b290000 0x8000>,
 			      <0x4b2a0000 0x2000>,
 			      <0x4b2a6000 0x2000>,
-			      <0x4b2a8000 0x38>,
 			      <0x4b2ae000 0x31c>,
-			      <0x4b2b0000 0x60>,
 			      <0x4b2b2000 0x58>;
 			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "ecap", "iep", "uart", "mii_rt";
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_mem2: uio_pruss2_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2a8000 0x38>,
+			      <0x4b2b0000 0x60>,
+			      <0x4b2b2400 0x90>;
+			mem-names = "uart", "ecap", "mdio";
 			status = "okay";
 		};
 		uio_pruss2_evt0: uio_pruss2_evt0 {
@@ -157,12 +163,6 @@
 			mem-names = "iram", "control", "debug";
 			status = "okay";
 		};
-		uio_pruss2_mdio: uio_pruss2_mdio {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b2b2400 0x90>;
-			mem-names = "mdio";
-			status = "okay";
-		};
 	};
 };
 
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index cba9c89..2ce97e5 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -75,7 +75,7 @@ SRCREV = "1d85a66844655b0cbd99c00870d77956494c59ab"
 PV = "4.4.11+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
1.9.1


