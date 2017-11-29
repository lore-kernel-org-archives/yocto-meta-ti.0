Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69CB5E00D39; Wed, 29 Nov 2017 14:42:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AE68E00D26
	for <meta-ti@yoctoproject.org>; Wed, 29 Nov 2017 14:42:26 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vATMgGHh000655
	for <meta-ti@yoctoproject.org>; Wed, 29 Nov 2017 16:42:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511995336;
	bh=pueSrGKF0vispP6ptodetyv75Tjzczoy8Ol5fKTaYqI=;
	h=From:To:CC:Subject:Date;
	b=JVrMRtcEu+hHSS9msIxp7CZc2rN+jGhKDBUFcPeaxhoyJfk8wHwd3DDe0fMwFiFyo
	+B8+X9fBiK6mjjKNidGp1v903r3Lz9Y44SoI79eR3LxHi7SzCzUYwOv9+ZvBZ/Ns5R
	BsMgpeKr9qw5YVmHGts8nXquZH14WOrJc5UiNg/4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vATMgBd4027487
	for <meta-ti@yoctoproject.org>; Wed, 29 Nov 2017 16:42:11 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 29 Nov 2017 16:42:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 29 Nov 2017 16:42:10 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vATMgAkp029351;
	Wed, 29 Nov 2017 16:42:10 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 29 Nov 2017 17:42:02 -0500
Message-ID: <1511995323-7285-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 1/2] linux: ti-uio: include pru-uio device tree file for am574x
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
X-List-Received-Date: Wed, 29 Nov 2017 22:42:29 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../files/dra7xx/{am572x-pru-uio.dtsi => am57xx-pru-uio.dtsi} |  0
 recipes-kernel/linux/ti-uio.inc                               | 11 ++++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)
 rename recipes-kernel/linux/files/dra7xx/{am572x-pru-uio.dtsi => am57xx-pru-uio.dtsi} (100%)

diff --git a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
rename to recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 3104f4e..852c9ab 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -3,7 +3,7 @@ SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
 SRC_URI_append_k2g = " file://keystone-k2g-pru-uio.dtsi"
-SRC_URI_append_dra7xx = " file://am572x-pru-uio.dtsi \
+SRC_URI_append_dra7xx = " file://am57xx-pru-uio.dtsi \
                           file://am571x-pru-uio.dtsi \
 "
 SRC_URI_append_ti33x = " file://am335x-pru-uio.dtsi"
@@ -34,10 +34,15 @@ do_setup_uio_append_dra7xx() {
 
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
     then
+        dtsi="am57xx-pru-uio.dtsi"
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+
         dts="am572x-idk-pru-excl-uio.dts"
-        dtsi="am572x-pru-uio.dtsi"
         cp ${S}/arch/arm/boot/dts/am572x-idk.dts ${S}/arch/arm/boot/dts/$dts
-        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+
+        dts="am574x-idk-pru-excl-uio.dts"
+        cp ${S}/arch/arm/boot/dts/am574x-idk.dts ${S}/arch/arm/boot/dts/$dts
         echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
 
         dts="am571x-idk-pru-excl-uio.dts"
-- 
1.9.1


