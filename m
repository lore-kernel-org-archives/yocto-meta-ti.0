Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC16AE00ED0; Fri, 16 Dec 2016 09:45:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC5FEE00ECD
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 09:45:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D4BCB52A5B; Fri, 16 Dec 2016 17:45:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161216174518.D4BCB52A5B@arago-project.org>
Date: Fri, 16 Dec 2016 17:45:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : recipes-kernel:cmem.dtsi:K2G: Update to remove redefinition of mpm areas
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
X-List-Received-Date: Fri, 16 Dec 2016 17:45:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 47e2a2e97a9da758cbe39d97057f7d5adbda6af6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=47e2a2e97a9da758cbe39d97057f7d5adbda6af6

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Dec 16 01:55:53 2016 +0000

recipes-kernel:cmem.dtsi:K2G: Update to remove redefinition of mpm areas

Cleaning up redefinition of mpm areas and moving to use what is defined
in the base device tree files as is.
This effectively changes to a new memory partition.
Note that this change needs a corresponding change in the dts files in
the kernel tree to adjust the mpm memory area to the new memory
partition.

The CMEM areas here are adjusted such that there is no overlap with the
mpm areas defined in the dts files in the kernel tree.
Note also the address ranges are arranged differently for K2G compared
to  the other Keystone platforms.
(This is to accomodate common memory map for multiple k2g platforms)

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2g/cmem.dtsi |   24 +++---------------------
 1 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/recipes-kernel/linux/files/k2g/cmem.dtsi b/recipes-kernel/linux/files/k2g/cmem.dtsi
index 4716581..4c68d82 100644
--- a/recipes-kernel/linux/files/k2g/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2g/cmem.dtsi
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
+		cmem_block_mem_0: cmem_block_mem@818000000 {
+			reg = <0x00000008 0x18000000 0x00000000 0x5000000>;
 			no-map;
 			status = "okay";
 		};
@@ -26,28 +20,16 @@
 		cmem_block_0: cmem_block@0 {
 			reg = <0>;
 			memory-region = <&cmem_block_mem_0>;
-			cmem-buf-pools = <1 0x00000000 0x17000000>;
+			cmem-buf-pools = <1 0x00000000 0x5000000>;
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
 	sram_cmem: sram-cmem@a0000 {
 		reg = <0xa0000 0x57000>;


