Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B47C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 07:05:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13070.1706943927938162099
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Feb 2024 23:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fgC7zoj2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41375Q5t021584;
	Sat, 3 Feb 2024 01:05:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706943926;
	bh=JDLFhX5X1/0ixeCj12DPm76JuQigaIXA7M+us0Yyeeo=;
	h=From:To:CC:Subject:Date;
	b=fgC7zoj2BmFFrE1QkuwKAbSPvExWq3N0BDlyNn7vk4UUokC3KBckJV6FT5BTsV0mI
	 dTL3WduYwNRMbHjrvv4kuLgUoq9Xlv2bqZyqTtxNYPzwZSWmpy/vq1YtvBGXZK0PPg
	 BMkoiFpQxHZEMrMqMVS/mIUn+qL2PcYHRiFoI7/k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41375QI5024794
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 3 Feb 2024 01:05:26 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 3
 Feb 2024 01:05:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 3 Feb 2024 01:05:26 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41375Psl057615;
	Sat, 3 Feb 2024 01:05:26 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <vigneshr@ti.com>,
        <a-bhatia1@ti.com>, <j-luthra@ti.com>, <c-shilwant@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH v2] meta-ti-bsp: Add bootsplash image file for AM62P
Date: Sat, 3 Feb 2024 12:35:25 +0530
Message-ID: <20240203070525.1728676-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 03 Feb 2024 07:05:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17438

Add TI logo image as bootsplash image file for AM62P and install it in
boot directory from where u-boot can read from and display during
boot-up time.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: Rebase to updated uboot recipes
---
 meta-ti-bsp/conf/machine/include/am62pxx.inc |  3 +++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index bac68253..38e35851 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -17,3 +17,6 @@ OPTEEMACHINE = "k3-am62x"
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
 
 SERIAL_CONSOLES = "115200;ttyS2"
+
+# Bitmap image tarball for early splashscreen
+IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 493c1c31..42ddf40f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -341,4 +341,14 @@ do_deploy:append:am62xx() {
 	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
 }
 
+do_install:append:am62pxx() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
+}
+
+do_deploy:append:am62pxx() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
+}
+
 TOOLCHAIN = "gcc"
-- 
2.34.1


