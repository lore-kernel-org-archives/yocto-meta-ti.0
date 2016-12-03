Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62874E00CC9; Fri,  2 Dec 2016 17:18:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94619E00B8E
	for <meta-ti@yoctoproject.org>; Fri,  2 Dec 2016 17:18:45 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB31IilD029337
	for <meta-ti@yoctoproject.org>; Fri, 2 Dec 2016 19:18:44 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB31IiHi000614
	for <meta-ti@yoctoproject.org>; Fri, 2 Dec 2016 19:18:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 2 Dec 2016 19:18:44 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uB31IhVZ016023;	Fri, 2 Dec 2016 19:18:44 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Dec 2016 20:18:38 -0500
Message-ID: <1480727920-62651-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] Revert "linux/cmem: patch keystone dtsi files to co-exist with new sram driver"
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
X-List-Received-Date: Sat, 03 Dec 2016 01:18:48 -0000
Content-Type: text/plain

This reverts commit b9dbc83d7663d5517fd9cbcf4bb651e039f134a4.
---
 recipes-kernel/linux/cmem.inc                      |  3 -
 ...stone-Remove-reg-entry-from-the-sram-node.patch | 79 ----------------------
 2 files changed, 82 deletions(-)
 delete mode 100644 recipes-kernel/linux/files/0001-ARM-dts-keystone-Remove-reg-entry-from-the-sram-node.patch

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
-- 
1.9.1


