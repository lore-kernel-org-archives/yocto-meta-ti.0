Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0243DE0080A; Mon, 14 Nov 2016 14:13:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E020E007D3
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2016 14:13:20 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B6609209D7;
	Mon, 14 Nov 2016 22:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id U13QvNiIH5T3; Mon, 14 Nov 2016 22:13:19 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 973292091B;
	Mon, 14 Nov 2016 22:13:18 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id F03F0162199;
	Mon, 14 Nov 2016 17:13:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Nov 2016 17:13:04 -0500
Message-Id: <1479161584-22499-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cmem: add special handling for dra72x variant
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
X-List-Received-Date: Mon, 14 Nov 2016 22:13:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/cmem.inc                      |  7 +++++-
 recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index b60909c..d4edc60 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -4,17 +4,22 @@
 CMEM_MACHINE = "${MACHINE}"
 CMEM_MACHINE_am57xx-evm = "am571x am572x"
 CMEM_MACHINE_am57xx-hs-evm = "am571x am572x"
+CMEM_MACHINE_dra7xx-evm = "dra72x dra74x"
+CMEM_MACHINE_dra7xx-hs-evm = "dra72x dra74x"
 
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
 CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
 
 # Split device trees between variants
 CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
 CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd.dtb am571x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am572x-idk.dtb \
                           am572x-idk-lcd-osd.dtb am572x-idk-lcd-osd101t2587.dtb"
-
+CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb dra72-evm-lcd-osd101t2587.dtb \
+                          dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra7-evm-lcd-osd101t2587.dtb"
 
 # Flag to enable CMEM injection
 RESERVE_CMEM ?= "0"
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
new file mode 100644
index 0000000..ebd6129
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
@@ -0,0 +1,29 @@
+/ {
+        reserved-memory {
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                cmem_block_mem_0: cmem_block_mem@a0000000 {
+                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
+                        no-map;
+                        status = "okay";
+                };
+        };
+
+        cmem {
+                compatible = "ti,cmem";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+		#pool-size-cells = <2>;
+
+                status = "okay";
+
+                cmem_block_0: cmem_block@0 {
+                        reg = <0>;
+                        memory-region = <&cmem_block_mem_0>;
+                        cmem-buf-pools = <1 0x0 0x0c000000>;
+                };
+        };
+};
-- 
2.7.4


