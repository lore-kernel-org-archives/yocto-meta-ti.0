Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5047.1575584901102123864
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 14:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=D9R+wT1E;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: d-senicic1@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0F9AE01145; Thu,  5 Dec 2019 14:28:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8F31E007EE
	for <meta-ti@yoctoproject.org>; Thu,  5 Dec 2019 14:28:18 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5MSH9q079316
	for <meta-ti@yoctoproject.org>; Thu, 5 Dec 2019 16:28:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575584897;
	bh=x1WijEev+wTyTX1PMra+B2+3u7pgCQE1qMBntep70PU=;
	h=From:To:CC:Subject:Date;
	b=D9R+wT1EDmXAuGzed0HyogIFcsJ9tU+5Hsq6tQyZB/4L7Uk0E3opyflIzKC0loemv
	 5DXkqDS9XMEY/42GcFiWTv46mCLi7q3r5VGlfXko9BZxRgDuf3qIhB0SMn65L2h3hM
	 dq8WNoWv7TjMu2DqvVdlErtRvtjI/jCUq6OPYSak=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5MSHcA042439
	for <meta-ti@yoctoproject.org>; Thu, 5 Dec 2019 16:28:17 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 16:28:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 16:28:16 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5MSGOJ025505;
	Thu, 5 Dec 2019 16:28:16 -0600
From: "djordje senicic" <d-senicic1@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <d-senicic1@ti.com>, Djordje Senicic <x0157990@ti.com>
Subject: [meta-ti][thud/master][PATCHv2] cmem: am5729idk has specific CMEM cfg increased to 512MB
Date: Thu, 5 Dec 2019 17:26:12 -0500
Message-ID: <20191205222612.31112-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

- CMEM memory block increased to 512MB to enable TIDL using 4xEVE and 2xDSP

Signed-off-by: Djordje Senicic <x0157990@ti.com>

---
 recipes-kernel/linux/cmem.inc                 |  9 +++--
 .../linux/files/dra7xx/cmem-am572idk.dtsi     | 40 +++++++++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 8bd643f4..23e48f12 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -2,14 +2,15 @@
 #
 # Use these for temporary overrides
 CMEM_MACHINE = "${MACHINE}"
-CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
-CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
+CMEM_MACHINE_am57xx-evm = "am571x am572x am572idk am574x"
+CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am572idk am574x"
 CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
 CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
 
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
 CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_am572idk = "cmem-am572idk.dtsi"
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
+CMEM_DEVICETREE_am572idk = "am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
 CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
new file mode 100644
index 00000000..6c39e22c
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
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

