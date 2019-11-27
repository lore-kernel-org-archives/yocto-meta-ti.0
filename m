Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.6783.1574865009306117684
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 06:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iMKp8eum;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: d-senicic1@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D288BE00D8B; Wed, 27 Nov 2019 06:30:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85789E00B65
	for <meta-ti@yoctoproject.org>; Wed, 27 Nov 2019 06:30:06 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAREU5xh049275
	for <meta-ti@yoctoproject.org>; Wed, 27 Nov 2019 08:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574865005;
	bh=ozH9kKtucc5m3svRGMQEb7RkBimWsNHySaVN6fBMrCE=;
	h=From:To:CC:Subject:Date;
	b=iMKp8eumr1XKepSi4wKSrGjUN3Xb4jZuUSW9CVAuAaM/hRPSUTNHt6iBJaJBDXolv
	 YLdJU1sTczH0AtP+BjXNl+SwipWkzp3RozXlSQe2wgo/fwVTz2JBY4bSMwuBmpAKTY
	 htJ7c3j21B/kDeBCTCRPHGN84nfEsq+9nDSpOYfk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAREU5r4050762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 27 Nov 2019 08:30:05 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 08:30:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 08:30:05 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAREU4Mm088377;
	Wed, 27 Nov 2019 08:30:04 -0600
From: "djordje senicic" <d-senicic1@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <d-senicic1@ti.com>, Djordje Senicic <x0157990@ti.com>
Subject: [meta-ti][thud/master][PATCH] cmem: Adding am5729idk specific CMEM configuration
Date: Wed, 27 Nov 2019 09:28:16 -0500
Message-ID: <20191127142816.15503-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

- CMEM memory block increased to 512MB to enable TIDL using 4xEVE and 2xDSP

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-kernel/linux/cmem.inc                 |  9 +++--
 .../linux/files/dra7xx/cmem-am572i.dtsi       | 40 +++++++++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 8bd643f4..8d33fe35 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -2,14 +2,15 @@
 #
 # Use these for temporary overrides
 CMEM_MACHINE = "${MACHINE}"
-CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
-CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
+CMEM_MACHINE_am57xx-evm = "am571x am572x am572i am574x"
+CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am572i am574x"
 CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
 CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
 
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
 CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_am572i = "cmem-am572i.dtsi"
 CMEM_DTSI_am574x = "cmem-am574x.dtsi"
 CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
 CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
@@ -18,8 +19,8 @@ CMEM_DTSI_dra76x = "cmem-dra76x.dtsi"
 # Split device trees between variants
 CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
 CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb \
-                          am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb"
+CMEM_DEVICETREE_am572i = "am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
 CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
new file mode 100644
index 00000000..6c39e22c
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
@@ -0,0 +1,40 @@
+/ {
+        reserved-memory {
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                cmem_block_mem_0: cmem_block_mem@a0000000 {
+                        reg = <0x0 0xa0000000 0x0 0x20000000>;
+                        no-map;
+                        status = "okay";
+                };
+
+		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
+			reg = <0x0 0x40500000 0x0 0x100000>;
+			no-map;
+			status = "okay";
+		};
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
+                        cmem-buf-pools = <1 0x0 0x20000000>;
+                };
+
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			memory-region = <&cmem_block_mem_1_ocmc3>;
+		};
+        };
+};
-- 
2.17.1

