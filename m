Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 515BCE0044F; Thu, 24 May 2018 10:02:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37E79E006B4
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2018 10:02:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4OH2SHc029201
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2018 12:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1527181348;
	bh=7RXecG03S8gcLOWwBMRLDVKyY4c1BJeNtB61WQdZxqI=;
	h=From:To:CC:Subject:Date;
	b=hEhI2iyI0yLJJqjAhl6TQ/irIOc6+5UOjlZ/cL4caeOk+v60GbuEdmOsnJSirGTYi
	pqTTMAuBJTfPis7S/MSQadVeVWPRv4a6v4qZavuQD//Ub1SdMvxEdfPsUluTNDySwV
	JYaiEj4e6dnN8KOXqujcgMkaK7oKTw4lEFUlqGaY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4OH2Sh7000617
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2018 12:02:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 24 May 2018 12:02:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 24 May 2018 12:02:28 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4OH2SgH016372;
	Thu, 24 May 2018 12:02:28 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 24 May 2018 13:02:26 -0400
Message-ID: <1527181346-17613-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH] linux-ti-staging: ti-uio: update the baseline dts for am3 pru-uio
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
X-List-Received-Date: Thu, 24 May 2018 17:02:32 -0000
Content-Type: text/plain

* am335x-icev2-prueth.dts is newly added in kernel 4.14, and shall be
  used as the baseline to create am335x-icev2-pru-excl-uio.dts

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi | 8 ++++++++
 recipes-kernel/linux/ti-uio.inc                      | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
index 62340e5..714b1d7 100644
--- a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
@@ -182,3 +182,11 @@
 &pruss_mdio {
 	status = "disabled";
 };
+
+&pruss_emac0 {
+        status = "disabled";
+};
+
+&pruss_emac1 {
+        status = "disabled";
+};
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 852c9ab..934982c 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -59,7 +59,7 @@ do_setup_uio_append_ti33x() {
     then
         dts="am335x-icev2-pru-excl-uio.dts"
         dtsi="am335x-pru-uio.dtsi"
-        cp ${S}/arch/arm/boot/dts/am335x-icev2.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${S}/arch/arm/boot/dts/am335x-icev2-prueth.dts ${S}/arch/arm/boot/dts/$dts
         cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
         echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
     fi
-- 
1.9.1


