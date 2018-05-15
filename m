Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B66F7E00D4F; Tue, 15 May 2018 09:33:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9985DE00D47
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2018 09:33:34 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4FGXXrM006182
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2018 11:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526402013;
	bh=nH8861eg1uOOVkhas8zFOBYsWm/g7GPxn6Go6pGh/Ks=;
	h=From:To:CC:Subject:Date;
	b=DW0Gr5RfqeaJxv/JO2lEAXYGNq/IPrntjhmFootPKcskPcK++mu1x0gz7xTY8YDXy
	QQ/uFDO1oyO76hXlKvepNxEehk+uaSSvsFkzH0NHNXYP7OWzqokDg0quHW4/FM35gq
	RNgq+/TTqkI990miBLswDIF7rR8s/71c28sIHY4w=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FGXXfS030121
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2018 11:33:33 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 15 May 2018 11:33:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 15 May 2018 11:33:33 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FGXWDR010984;
	Tue, 15 May 2018 11:33:33 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 May 2018 12:33:22 -0400
Message-ID: <1526402002-4524-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH] linux-ti-staging: ti-uio: rebase pru-uio mdio entries to use offset for reg
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
X-List-Received-Date: Tue, 15 May 2018 16:33:35 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi    | 4 ++--
 recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi    | 2 +-
 recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi | 8 ++++----
 recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi     | 4 ++--
 recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi     | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
index 71e0516..4228827 100644
--- a/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
@@ -8,7 +8,7 @@
                         clocks = <&dpll_gmac_h13x2_ck>;
                         clock-names = "fck";
                         bus_freq = <1000000>;
-                        reg = <0x4b232400 0x90>;
+                        reg = <0x32400 0x90>;
 
                         reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
                         reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
@@ -119,7 +119,7 @@
                         clocks = <&dpll_gmac_h13x2_ck>;
                         clock-names = "fck";
                         bus_freq = <1000000>;
-                        reg = <0x4b2b2400 0x90>;
+                        reg = <0x32400 0x90>;
                         status = "okay";
 
                         reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
diff --git a/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
index f149cf1..17b3f96 100644
--- a/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
@@ -113,7 +113,7 @@
                     clocks = <&dpll_gmac_h13x2_ck>;
                     clock-names = "fck";
                     bus_freq = <1000000>;
-                    reg = <0x4b2b2400 0x90>;
+                    reg = <0x32400 0x90>;
                     status = "disabled";
                 };
 
diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
index 2ba57f0..e4baca5 100644
--- a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
@@ -1,7 +1,7 @@
 &pruss_soc_bus0 {
-		uio_pruss1_mdio: uio_mdio@20ab2400 {
+		uio_pruss1_mdio: uio_mdio@32400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x20ab2400 0x90>;
+			reg = <0x32400 0x90>;
 			clocks = <&k2g_clks 0x0014 1>;
 			clock-names = "fck";
 			#address-cells = <1>;
@@ -95,9 +95,9 @@
 };
 
 &pruss_soc_bus1 {
-		uio_pruss2_mdio: uio_mdio@20af2400 {
+		uio_pruss2_mdio: uio_mdio@32400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x20af2400 0x90>;
+			reg = <0x32400 0x90>;
 			clocks = <&k2g_clks 0x0015 1>;
 			clock-names = "fck";
 			#address-cells = <1>;
diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
index ddf4566..62340e5 100644
--- a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
@@ -1,7 +1,7 @@
 &pruss_soc_bus {
-		uio_pruss_mdio: uio_pruss_mdio@4a332400 {
+		uio_pruss_mdio: uio_pruss_mdio@32400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x4a332400 0x90>;
+			reg = <0x32400 0x90>;
 			clocks = <&dpll_core_m4_ck>;
 			clock-names = "fck";
 			bus_freq = <1000000>;
diff --git a/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi b/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
index 80993c4..81c16e3 100644
--- a/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
@@ -1,7 +1,7 @@
 &pruss_soc_bus {
-		uio_pruss2_mdio: uio_mdio@54432400 {
+		uio_pruss2_mdio: uio_mdio@32400 {
 			compatible = "ti,davinci_mdio";
-			reg = <0x54432400 0x90>;
+			reg = <0x32400 0x90>;
 			clocks = <&dpll_core_m4_ck>;
 			clock-names = "fck";
 			bus_freq = <1000000>;
-- 
1.9.1


