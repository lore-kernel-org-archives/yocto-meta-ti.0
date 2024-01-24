Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E696C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:46:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.24317.1706107580840191524
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 06:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vgJpeMku;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40OEkJQA016526;
	Wed, 24 Jan 2024 08:46:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706107579;
	bh=gwM35IgydYfloPHbVIxmndpeokuYmjruC2Fn4yy1dSA=;
	h=From:To:CC:Subject:Date;
	b=vgJpeMkuYMi1vXbDryaAGmp4ehbGuOf2EC2VNIWgsJdMSVTgfB4meZjO/FDEweqa5
	 fFCaes6w58XZDZu/MXmHojbXXMX3jB9ihNuPslxM20SNZm49/fCCy6iT1IaGA9wGoA
	 mHLP2wslt057VmTfsZSZ5Rl2kl4l3e9CtNcsi7Go=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40OEkImk025839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jan 2024 08:46:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jan 2024 08:46:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jan 2024 08:46:18 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40OEkHBZ053886;
	Wed, 24 Jan 2024 08:46:18 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <n-jain1@ti.com>, <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH] meta-ti-bsp: Add bootsplash image file for AM62P
Date: Wed, 24 Jan 2024 20:16:17 +0530
Message-ID: <20240124144617.327734-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jan 2024 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17412

Add TI logo image as bootsplash image file for AM62P and install it in
boot directory from where u-boot can read from and display during
boot-up time.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62pxx.inc           |  3 +++
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb    | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index bac68253..20e0771e 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -9,6 +9,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 # Default tiboot3.bin on AM62Px is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
 
+# Bitmap image tarball for early splashscreen
+IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
+
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 4fe1218a..c98cbe61 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -17,3 +17,13 @@ do_deploy:append:am62xx() {
 	install -d ${DEPLOYDIR}
 	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
 }
+
+do_install:append:am62pxx() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
+}
+
+do_deploy:append:am62pxx() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
+}
-- 
2.34.1


