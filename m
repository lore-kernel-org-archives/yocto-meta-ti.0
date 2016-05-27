Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 595D3E00DE6; Thu, 26 May 2016 19:02:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DF80E00C2B
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 19:02:22 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2EDB752AE8; Fri, 27 May 2016 02:02:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160527020221.2EDB752AE8@arago-project.org>
Date: Fri, 27 May 2016 02:02:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-ti-staging: Update pru uio dtb entries
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
X-List-Received-Date: Fri, 27 May 2016 02:02:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: d098dfccc1ecc40b6ea78ca9de913e0a80660807
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d098dfccc1ecc40b6ea78ca9de913e0a80660807

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon May 23 20:18:18 2016 +0000

linux-ti-staging: Update pru uio dtb entries

added additional entries to allow access to ecap and uart regions
Update Kernel PR to force rebuild

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/files/dra7xx/am572x-pru-uio.dtsi         |    8 ++++++--
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |    2 +-
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


