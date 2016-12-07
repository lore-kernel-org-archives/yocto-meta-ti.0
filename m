Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C6D8E00D01; Tue,  6 Dec 2016 16:47:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 924ACE00C88
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2016 16:47:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4895F52AD2; Wed,  7 Dec 2016 00:47:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161207004717.4895F52AD2@arago-project.org>
Date: Wed,  7 Dec 2016 00:47:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : Revert "linux/cmem: patch keystone dtsi files to co-exist with new sram driver"
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
X-List-Received-Date: Wed, 07 Dec 2016 00:47:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 7efb2338a9f2c0cc0d2ff4c821a81938428bf458
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7efb2338a9f2c0cc0d2ff4c821a81938428bf458

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec  3 07:18:38 2016 +0000

Revert "linux/cmem: patch keystone dtsi files to co-exist with new sram driver"

This reverts commit b9dbc83d7663d5517fd9cbcf4bb651e039f134a4.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/cmem.inc                      |    3 -
 ...stone-Remove-reg-entry-from-the-sram-node.patch |   79 --------------------
 2 files changed, 0 insertions(+), 82 deletions(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 649b59d..d4edc60 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -24,9 +24,6 @@ CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb
 # Flag to enable CMEM injection
 RESERVE_CMEM ?= "0"
 
-# Need to patch main keystone dtsi files sram entry
-SRC_URI_append_keystone = "${@base_conditional("RESERVE_CMEM", "1", " file://0001-ARM-dts-keystone-Remove-reg-entry-from-the-sram-node.patch", "", d)}"
-
 # Add correct cmem.dtsi to SRC_URI for each variant for a given machine
 python() {
     old_overrides = d.getVar('OVERRIDES', False)
diff --git a/recipes-kernel/linux/files/0001-ARM-dts-keystone-Remove-reg-entry-from-the-sram-node.patch b/recipes-kernel/linux/files/0001-ARM-dts-keystone-Remove-reg-entry-from-the-sram-node.patch
deleted file mode 100644
index 1813986..0000000
--- a/recipes-kernel/linux/files/0001-ARM-dts-keystone-Remove-reg-entry-from-the-sram-node.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c7e576590e45f9fb86a9d74fa66b4fd4f8eca803 Mon Sep 17 00:00:00 2001
-From: Sam Nelson <sam.nelson@ti.com>
-Date: Fri, 11 Nov 2016 10:32:48 -0500
-Subject: [PATCH] ARM: dts: keystone: Remove reg entry from the sram node
-
-Currently the reg entry reserves the whole MSMC ram range to be used
-only through the mmio-sram driver. (See LCPD-7801)
-
-Given that other modules (like CMEM) also currently reserve memory from
-MSMC, the reg entry which takes over the whole memory breaks those
-functionality. So currently recommending to remove this for now.
-Still the ranges entry will capture the total memory available.
-
-This will allow module like CMEM to reserve and use a non-overlapping
-section of memory not marked reserved by the sub nodes here.
-
-Resolves current issue with CMEM module reporting error allocating MSMC
-memory.
-
-Signed-off-by: Sam Nelson <sam.nelson@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- arch/arm/boot/dts/keystone-k2e.dtsi  | 1 -
- arch/arm/boot/dts/keystone-k2g.dtsi  | 1 -
- arch/arm/boot/dts/keystone-k2hk.dtsi | 1 -
- arch/arm/boot/dts/keystone-k2l.dtsi  | 1 -
- 4 files changed, 4 deletions(-)
-
-diff --git a/arch/arm/boot/dts/keystone-k2e.dtsi b/arch/arm/boot/dts/keystone-k2e.dtsi
-index 553c423..5b9252a 100644
---- a/arch/arm/boot/dts/keystone-k2e.dtsi
-+++ b/arch/arm/boot/dts/keystone-k2e.dtsi
-@@ -98,7 +98,6 @@
- 
- 		msm_ram: msmram@0c000000 {
- 			compatible = "mmio-sram";
--			reg = <0x0c000000 0x200000>;
- 			ranges = <0x0 0x0c000000 0x200000>;
- 			#address-cells = <1>;
- 			#size-cells = <1>;
-diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
-index 45faf40..e953d82 100644
---- a/arch/arm/boot/dts/keystone-k2g.dtsi
-+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
-@@ -99,7 +99,6 @@
- 
- 		msm_ram: msmram@0c000000 {
- 			compatible = "mmio-sram";
--			reg = <0x0c000000 0x100000>;
- 			ranges = <0x0 0x0c000000 0x100000>;
- 			#address-cells = <1>;
- 			#size-cells = <1>;
-diff --git a/arch/arm/boot/dts/keystone-k2hk.dtsi b/arch/arm/boot/dts/keystone-k2hk.dtsi
-index edca6aa..f3f1932 100644
---- a/arch/arm/boot/dts/keystone-k2hk.dtsi
-+++ b/arch/arm/boot/dts/keystone-k2hk.dtsi
-@@ -111,7 +111,6 @@
- 
- 		msm_ram: msmram@0c000000 {
- 			compatible = "mmio-sram";
--			reg = <0x0c000000 0x600000>;
- 			ranges = <0x0 0x0c000000 0x600000>;
- 			#address-cells = <1>;
- 			#size-cells = <1>;
-diff --git a/arch/arm/boot/dts/keystone-k2l.dtsi b/arch/arm/boot/dts/keystone-k2l.dtsi
-index 76caff6..4ee7439 100644
---- a/arch/arm/boot/dts/keystone-k2l.dtsi
-+++ b/arch/arm/boot/dts/keystone-k2l.dtsi
-@@ -284,7 +284,6 @@
- 
- 		msm_ram: msmram@0c000000 {
- 			compatible = "mmio-sram";
--			reg = <0x0c000000 0x200000>;
- 			ranges = <0x0 0x0c000000 0x200000>;
- 			#address-cells = <1>;
- 			#size-cells = <1>;
--- 
-2.7.4
-


