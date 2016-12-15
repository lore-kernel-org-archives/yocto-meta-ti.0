Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96824E00DBB; Thu, 15 Dec 2016 11:55:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0453E00D73
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 11:55:57 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBFJtuXI013521
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 13:55:56 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBFJtuec013257
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 13:55:56 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Dec 2016 13:55:55 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBFJttZ5010022;	Thu, 15 Dec 2016 13:55:56 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Dec 2016 14:55:52 -0500
Message-ID: <1481831753-60784-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] recipes-kernel:cmem.dtsi:Keystone2: Update to remove redefinition of mpm areas
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
X-List-Received-Date: Thu, 15 Dec 2016 19:55:59 -0000
Content-Type: text/plain

Cleaning up redefinition of mpm areas and moving to use what is defined
in the base device tree files as is.
This effectively changes to a new memory partition.
Note that this change needs a corresponding change in the dts files in
the kernel tree to adjust the mpm memory area to the new memory
partition.

The CMEM areas here are adjusted such that there is no overlap with the
mpm areas defined in the dts files in the kernel tree.

Also fixes issue with K2L, by removing overlapping memory area section.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-kernel/linux/files/k2e/cmem.dtsi      | 13 +++----------
 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi | 24 +++---------------------
 recipes-kernel/linux/files/k2l-evm/cmem.dtsi  | 19 +++----------------
 3 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/recipes-kernel/linux/files/k2e/cmem.dtsi b/recipes-kernel/linux/files/k2e/cmem.dtsi
index 2a2909a..c233768 100644
--- a/recipes-kernel/linux/files/k2e/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2e/cmem.dtsi
@@ -1,7 +1,7 @@
 / {
 	reserved-memory {
-		cmem_block_mem_0: cmem_block_mem@829000000 {
-			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
+		cmem_block_mem_0: cmem_block_mem@830000000 {
+			reg = <0x00000008 0x30000000 0x00000000 0x18000000>;
 			no-map;
 			status = "okay";
 		};
@@ -19,7 +19,7 @@
 		cmem_block_0: cmem_block@0 {
 			reg = <0>;
 			memory-region = <&cmem_block_mem_0>;
-			cmem-buf-pools = <1 0x00000000 0x1E000000>;
+			cmem-buf-pools = <1 0x00000000 0x18000000>;
 		};
 
 		cmem_block_1: cmem_block@1 {
@@ -29,13 +29,6 @@
 	};
 };
 
-&dsp_common_mpm_area {
-	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-};
-&mpm_mem {
-	reg = <0xa0000000 0x02000000>;
-};
-
 &msm_ram {
 	sram_cmem: sram-cmem@80000 {
 		reg = <0x80000 0xc0000>;
diff --git a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
index e5927ba..400aa9d 100644
--- a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
@@ -1,14 +1,8 @@
 / {
 	reserved-memory {
 
-		cmem_block_mem_0: cmem_block_mem@829000000 {
-			reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
-			no-map;
-			status = "okay";
-		};
-
-		cmem_block_mem_2: cmem_block_mem@822000000 {
-			reg = <0x00000008 0x22000000 0x00000000 0x07000000>;
+		cmem_block_mem_0: cmem_block_mem@830000000 {
+			reg = <0x00000008 0x30000000 0x00000000 0x18000000>;
 			no-map;
 			status = "okay";
 		};
@@ -26,28 +20,16 @@
 		cmem_block_0: cmem_block@0 {
 			reg = <0>;
 			memory-region = <&cmem_block_mem_0>;
-			cmem-buf-pools = <1 0x00000000 0x17000000>;
+			cmem-buf-pools = <1 0x00000000 0x18000000>;
 		};
 
 		cmem_block_1: cmem_block@1 {
 			reg = <1>;
 			sram = <&sram_cmem>;
 		};
-
-		cmem_block_2: cmem_block@2 {
-			reg = <2>;
-			memory-region = <&cmem_block_mem_2>;
-		 };
 	};
 };
 
-&dsp_common_mpm_area {
-	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-};
-&mpm_mem {
-	reg = <0xa0000000 0x02000000>;
-};
-
 &msm_ram {
 	sram_cmem: sram-cmem@100000 {
 		reg = <0x100000 0x480000>;
diff --git a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
index 8b09642..da389e5 100644
--- a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
@@ -1,14 +1,8 @@
 / {
 	reserved-memory {
 
-		cmem_block_mem_0: cmem_block_mem@829000000 {
-			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
-			no-map;
-			status = "okay";
-		};
-
-		cmem_block_mem_1: cmem_block_mem@00c080000 {
-			reg = <0x00000000 0x0c080000 0x00000000 0x000c0000>;
+		cmem_block_mem_0: cmem_block_mem@830000000 {
+			reg = <0x00000008 0x30000000 0x00000000 0x18000000>;
 			no-map;
 			status = "okay";
 		};
@@ -26,7 +20,7 @@
 		cmem_block_0: cmem_block@0 {
 			reg = <0>;
 			memory-region = <&cmem_block_mem_0>;
-			cmem-buf-pools = <1 0x00000000 0x1E000000>;
+			cmem-buf-pools = <1 0x00000000 0x18000000>;
 		};
 
 		cmem_block_1: cmem_block@1 {
@@ -36,13 +30,6 @@
 	};
 };
 
-&dsp_common_mpm_area {
-	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-};
-&mpm_mem {
-	reg = <0xa0000000 0x02000000>;
-};
-
 &msm_ram {
 	sram_cmem: sram-cmem@80000 {
 		reg = <0x80000 0xc0000>;
-- 
1.9.1


