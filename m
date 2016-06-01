Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFDE3E008B8; Wed,  1 Jun 2016 12:47:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8BE5E0084A
	for <meta-ti@yoctoproject.org>; Wed,  1 Jun 2016 12:46:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7028152996; Wed,  1 Jun 2016 19:46:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160601194657.7028152996@arago-project.org>
Date: Wed,  1 Jun 2016 19:46:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-ti-staging: Update uio entries for am572x
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
X-List-Received-Date: Wed, 01 Jun 2016 19:47:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ee2a4b433bcb44dcd3c41b9c1187473ce2d22985
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ee2a4b433bcb44dcd3c41b9c1187473ce2d22985

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Jun  1 10:11:40 2016 +0000

linux-ti-staging: Update uio entries for am572x

Rearranged memory sections
Added additional memory section to accomodate required sections more
than 8
Incremented PR append for linux-ti-staging

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/files/dra7xx/am572x-pru-uio.dtsi         |   36 ++++++++++----------
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |    2 +-
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


