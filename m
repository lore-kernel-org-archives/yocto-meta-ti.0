Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD3C5E00B8E; Tue,  8 May 2018 13:20:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15957E0084D
	for <meta-ti@yoctoproject.org>; Tue,  8 May 2018 13:20:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w48KKRrM006676
	for <meta-ti@yoctoproject.org>; Tue, 8 May 2018 15:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525810827;
	bh=6XXGJNw+kXoHhywCYX+CXbMNeSNiTgfXQYw+ND89Wjc=;
	h=From:To:CC:Subject:Date;
	b=a7FPqeuYPDahvMXgpLOKvif3NkycQaJnlBGh967OzgvtK/rM+sQW05mYUk2kvNEyK
	sMo5hA3vTXZQzESJDyAtCyU9OoaHRRn7IimDJO1hi98oylx4M/VI6aRPTeNh+VDysf
	xTzLEH9zTdXhUKD3FPl+i6nm5Yph4xQWhtXTpPsI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w48KKR1b003751
	for <meta-ti@yoctoproject.org>; Tue, 8 May 2018 15:20:27 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 8 May 2018 15:20:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 8 May 2018 15:20:26 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w48KKOvP014952;
	Tue, 8 May 2018 15:20:26 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 May 2018 16:20:22 -0400
Message-ID: <1525810822-7013-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH] linux-ti-staging: ti-uio: rebase pru-uio.dtsi for k2g and am3
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
X-List-Received-Date: Tue, 08 May 2018 20:20:28 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi | 4 ++--
 recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi     | 8 --------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
index 69955a4..2ba57f0 100644
--- a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
@@ -2,7 +2,7 @@
 		uio_pruss1_mdio: uio_mdio@20ab2400 {
 			compatible = "ti,davinci_mdio";
 			reg = <0x20ab2400 0x90>;
-			clocks = <&k2g_clks K2G_DEV_ICSS0 K2G_DEV_ICSS_CORE_CLK>;
+			clocks = <&k2g_clks 0x0014 1>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -98,7 +98,7 @@
 		uio_pruss2_mdio: uio_mdio@20af2400 {
 			compatible = "ti,davinci_mdio";
 			reg = <0x20af2400 0x90>;
-			clocks = <&k2g_clks K2G_DEV_ICSS1 K2G_DEV_ICSS_CORE_CLK>;
+			clocks = <&k2g_clks 0x0015 1>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
index 2d9127b..ddf4566 100644
--- a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
@@ -182,11 +182,3 @@
 &pruss_mdio {
 	status = "disabled";
 };
-
-&pruss_emac0 {
-	status = "disabled";
-};
-
-&pruss_emac1 {
-	status = "disabled";
-};
-- 
1.9.1


