Return-Path: <d-senicic1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18D28E00D38; Wed, 19 Jun 2019 15:50:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0388E00C7D
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 15:50:49 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JMonRx066099
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 17:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560984649;
	bh=riAPpm0EYkgs0IoknUDvoaPm1G2YF+4nb7EHzNhg+GI=;
	h=From:To:CC:Subject:Date;
	b=fxrOElLXACuGxwWvbdYO40mIqO2CL9g2R42X6SQo6XNY52TMdnaxv9WqiuRV4IzMq
	LJmWQ7YMZLxzxNB5oOd9KhriofZ0luxpxRKPdhO7xz1RnEyLViogHQYhuZsUKVkJgl
	EeXjI7fezuQvcTiid+5BBvlZ7e9/qFdkRRR7nwM8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JMonVq043208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 17:50:49 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 17:50:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 17:50:48 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JMomQf011031;
	Wed, 19 Jun 2019 17:50:48 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Jun 2019 13:41:01 -0400
Message-ID: <20190619174102.16280-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH 1/2] cmem: Add CMEM 384MB block to dra76xx to enable opencl and tidl
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
X-List-Received-Date: Wed, 19 Jun 2019 22:50:51 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-kernel/linux/cmem.inc                 |  6 ++--
 .../linux/files/dra7xx/cmem-dra76x.dtsi       | 29 +++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 5fd0b9d9..8bd643f4 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -4,8 +4,8 @@
 CMEM_MACHINE = "${MACHINE}"
 CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
 CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
-CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x"
-CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x"
+CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
+CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
 
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
@@ -13,6 +13,7 @@ CMEM_DTSI_am571x = "cmem-am571x.dtsi"
 CMEM_DTSI_am574x = "cmem-am574x.dtsi"
 CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
 CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
+CMEM_DTSI_dra76x = "cmem-dra76x.dtsi"
 
 # Split device trees between variants
 CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
@@ -24,6 +25,7 @@ CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
 CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
                           dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_dra76x = "dra76-evm.dtb dra76-evm-tfp410.dtb"
 
 # Flag to enable CMEM injection
 RESERVE_CMEM ?= "0"
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
new file mode 100644
index 00000000..9d207db5
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
@@ -0,0 +1,29 @@
+/ {
+        reserved-memory {
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                cmem_block_mem_0: cmem_block_mem@a0000000 {
+                        reg = <0x0 0xa0000000 0x0 0x18000000>;
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
+                        cmem-buf-pools = <1 0x0 0x18000000>;
+                };
+        };
+};
-- 
2.17.1


