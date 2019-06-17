Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68DA7E00D4C; Mon, 17 Jun 2019 15:57:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0503EE00798
	for <meta-ti@yoctoproject.org>; Mon, 17 Jun 2019 15:57:17 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HMvH8q017879
	for <meta-ti@yoctoproject.org>; Mon, 17 Jun 2019 17:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560812237;
	bh=+vuT5oPoW1p3eIz+KCbDvZEQcE8AB6qR0pF5taNkk9M=;
	h=From:To:CC:Subject:Date;
	b=upvfcMm+UaqFgi8rs9lBaCq3x5mli7JibWjKrZPCCYj632o988Ba2Oa61O6cUR/D9
	A9nTnReliTdSbscPqrG/OG9Lv1gvqeTpCjRqGTb4K7H4MJyen2G/LBGp3Dcy7MsPKu
	dNjWyDm0tTJYOOrAfYObrKovcoQmfJtD+rqf28Iw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HMvH8e128926
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Jun 2019 17:57:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 17 Jun 2019 17:57:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 17 Jun 2019 17:57:17 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HMvGHY027152;
	Mon, 17 Jun 2019 17:57:16 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 17 Jun 2019 18:55:26 -0400
Message-ID: <20190617225526.26111-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master/ti2019.01] [PATCH] ti-uio: rebase pru-uio device tree files
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
X-List-Received-Date: Mon, 17 Jun 2019 22:57:19 -0000
Content-Type: text/plain

* Update mdio register entries to use the full address
* For AM571x, remove the entries which are available after using DT overlay

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../linux/files/dra7xx/am571x-pru-uio.dtsi    | 20 ++++---------------
 .../linux/files/dra7xx/am57xx-pru-uio.dtsi    |  4 ++--
 .../linux/files/k2g/keystone-k2g-pru-uio.dtsi |  8 ++++----
 .../linux/files/ti33x/am335x-pru-uio.dtsi     |  4 ++--
 .../linux/files/ti43x/am437x-pru-uio.dtsi     |  4 ++--
 5 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
index 4228827e..8ca11c78 100644
--- a/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
@@ -1,14 +1,14 @@
 &pruss_soc_bus1 {
-                uio_pruss1_mdio {
+                uio_pruss1_mdio: uio_mdio@4b232400 {
                         status = "okay";
 
                         compatible = "ti,davinci_mdio";
+                        reg = <0x4b232400 0x90>;
                         #address-cells = <1>;
                         #size-cells = <0>;
                         clocks = <&dpll_gmac_h13x2_ck>;
                         clock-names = "fck";
                         bus_freq = <1000000>;
-                        reg = <0x32400 0x90>;
 
                         reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
                         reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
@@ -112,14 +112,14 @@
 };
 
 &pruss_soc_bus2 {
-                uio_pruss2_mdio {
+                uio_pruss2_mdio: uio_mdio@4b2b2400 {
                         compatible = "ti,davinci_mdio";
+                        reg = <0x4b2b2400 0x90>;
                         #address-cells = <1>;
                         #size-cells = <0>;
                         clocks = <&dpll_gmac_h13x2_ck>;
                         clock-names = "fck";
                         bus_freq = <1000000>;
-                        reg = <0x32400 0x90>;
                         status = "okay";
 
                         reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
@@ -223,18 +223,6 @@
 		};
 	};
 
-&pruss1_eth {
-        status = "disabled";
-};
-
-&pruss1_emac0 {
-        status = "disabled";
-};
-
-&pruss1_emac1 {
-        status = "disabled";
-};
-
 &pruss2_emac0 {
         status = "disabled";
 };
diff --git a/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
index 17b3f963..4cc57118 100644
--- a/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
@@ -106,14 +106,14 @@
 };
 
 &pruss_soc_bus2 {
-                uio_pruss2_mdio: uio_pruss2_mdio {
+                uio_pruss2_mdio: uio_mdio@4b2b2400 {
                     compatible = "ti,davinci_mdio";
+                    reg = <0x4b2b2400 0x90>;
                     #address-cells = <1>;
                     #size-cells = <0>;
                     clocks = <&dpll_gmac_h13x2_ck>;
                     clock-names = "fck";
                     bus_freq = <1000000>;
-                    reg = <0x32400 0x90>;
                     status = "disabled";
                 };
 
diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
index e4baca50..49894e0d 100644
--- a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
@@ -1,7 +1,7 @@
 &pruss_soc_bus0 {
-		uio_pruss1_mdio: uio_mdio@32400 {
+		uio_pruss1_mdio: uio_mdio@20ab2400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x32400 0x90>;
+			reg = <0x20ab2400 0x90>;
 			clocks = <&k2g_clks 0x0014 1>;
 			clock-names = "fck";
 			#address-cells = <1>;
@@ -95,9 +95,9 @@
 };
 
 &pruss_soc_bus1 {
-		uio_pruss2_mdio: uio_mdio@32400 {
+		uio_pruss2_mdio: uio_mdio@20af2400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x32400 0x90>;
+		        reg = <0x20af2400 0x90>;
 			clocks = <&k2g_clks 0x0015 1>;
 			clock-names = "fck";
 			#address-cells = <1>;
diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
index 714b1d78..93a40ab5 100644
--- a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
@@ -1,7 +1,7 @@
 &pruss_soc_bus {
-		uio_pruss_mdio: uio_pruss_mdio@32400 {
+		uio_pruss_mdio: uio_mdio@4a332400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x32400 0x90>;
+			reg = <0x4a332400 0x90>;
 			clocks = <&dpll_core_m4_ck>;
 			clock-names = "fck";
 			bus_freq = <1000000>;
diff --git a/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi b/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
index 81c16e34..80993c4b 100644
--- a/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
@@ -1,7 +1,7 @@
 &pruss_soc_bus {
-		uio_pruss2_mdio: uio_mdio@32400 {
+		uio_pruss2_mdio: uio_mdio@54432400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x32400 0x90>;
+			reg = <0x54432400 0x90>;
 			clocks = <&dpll_core_m4_ck>;
 			clock-names = "fck";
 			bus_freq = <1000000>;
-- 
2.17.1


