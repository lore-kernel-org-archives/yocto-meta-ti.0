Return-Path: <d-senicic1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEC8EE00AC5; Mon, 20 Aug 2018 13:32:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4F85E00A86
	for <meta-ti@yoctoproject.org>; Mon, 20 Aug 2018 13:32:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KKWmvA019981
	for <meta-ti@yoctoproject.org>; Mon, 20 Aug 2018 15:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534797168;
	bh=fHrZs9hH/owSOtvWIMCfVy8XQggbUIxUcR7urv0misI=;
	h=From:To:CC:Subject:Date;
	b=Ip4MaAtyLHRq74vwGa4pR/7EQDXpKUhAm7arjrpvPQOjaT5g2ruZM/mxAjNpB7+Uk
	J/Xfc6S78oujtcgbWpQNMHVB2AJDoTccmXlK4vfM5SjIG5tsZPhEEzRktWFb31TNHQ
	U3IyAGAUxPuVUwhn64bKyBJb0S5OkrE7y4knooj0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KKWl28015924
	for <meta-ti@yoctoproject.org>; Mon, 20 Aug 2018 15:32:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 15:32:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 15:32:47 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KKWi5e016107;
	Mon, 20 Aug 2018 15:32:45 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 20 Aug 2018 16:32:41 -0400
Message-ID: <1534797161-10972-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] linux-ti-staging: Increase CMEM for am574x only
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
X-List-Received-Date: Mon, 20 Aug 2018 20:32:50 -0000
Content-Type: text/plain

* CMEM increased to 384MB is required by TIDL to run both DSP and EVEs concurrently

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-kernel/linux/cmem.inc                      |  1 +
 recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi | 29 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 8325c00..b17ca9d 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -10,6 +10,7 @@ CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x"
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
 CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_am574x = "cmem-am574x.dtsi"
 CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
 CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
 
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
new file mode 100644
index 0000000..9d207db
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
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
1.9.1


