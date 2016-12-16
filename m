Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29FFCE00EC9; Fri, 16 Dec 2016 09:45:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92B24E00EC6
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 09:45:15 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BAC1E52A5A; Fri, 16 Dec 2016 17:45:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161216174514.BAC1E52A5A@arago-project.org>
Date: Fri, 16 Dec 2016 17:45:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : recipes-kernel:cmem.dtsi:Keystone2: Update to remove redefinition of mpm areas
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
X-List-Received-Date: Fri, 16 Dec 2016 17:45:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: d4be639847e6928ba189a222ec835f10086c75c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d4be639847e6928ba189a222ec835f10086c75c7

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Dec 16 01:55:52 2016 +0000

recipes-kernel:cmem.dtsi:Keystone2: Update to remove redefinition of mpm areas

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
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2e/cmem.dtsi      |   13 +++----------
 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi |   24 +++---------------------
 recipes-kernel/linux/files/k2l-evm/cmem.dtsi  |   19 +++----------------
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


