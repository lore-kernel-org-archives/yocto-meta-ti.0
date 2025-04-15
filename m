Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6168C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:37:12 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.15951.1744709825249729366
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cpphOmpz;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53F9b4pU2952324
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 04:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744709824;
	bh=E2+bRNetS93hunLmXS7v5xWE9SEHUJjVERsEA/S7xbY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cpphOmpz124d8945NXwW4HHy+PE/daZjIWCXxlh6GqAE98m3+gVGUDP9iPWLAwjVG
	 6yeNLIevRskYXhugZEi1RbOjfWSYmlyblAtQWElAUO1+2AdDxpHsMv5+AcGHDaepzs
	 Q2XghxA0Weh9GJ37kSiJ9yQb0EcD/2dJNbz4zddg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53F9b4jp061173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 04:37:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 04:37:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 04:37:04 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53F9b3PN066294;
	Tue, 15 Apr 2025 04:37:04 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [master/scarthgap][PATCH v1 3/3] bsp: u-boot: deploy tispl_falcon.bin to rootfs
Date: Tue, 15 Apr 2025 15:06:44 +0530
Message-ID: <20250415093645.435281-3-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415093645.435281-1-anshuld@ti.com>
References: <20250415093645.435281-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 09:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18471

Falcon boot requires tispl_falcon.bin to be on the same filesystem
partition as the fitImage.

This patch creates a new u-boot package called
'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
ti-falcon is enabled which allows us to deploy the required files to
rootfs.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
index b571c04d..9f93c683 100644
--- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
@@ -1,3 +1,4 @@
+IMAGE_INSTALL:append = " u-boot-ti-staging-falcon"
 KERNEL_CLASSES:remove = "kernel-fitimage"
 KERNEL_CLASSES += "kernel-fitimage-legacyhs"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 41d4abdd..76803ae3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
 
+FILES:${PN}-falcon = "boot/tispl_falcon.bin"
+
 SUMMARY = "u-boot bootloader for TI devices"
 
 LICENSE = "GPL-2.0-or-later"
@@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
 	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
 }
 
+do_install:append:ti-falcon() {
+	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
+}
+
+PACKAGES:prepend:am62xx-evm = "${PN}-falcon "
+PACKAGES:prepend:am62axx-evm = "${PN}-falcon "
+PACKAGES:prepend:am62pxx-evm = "${PN}-falcon "
+PACKAGES:prepend:am62xx-lp-evm = "${PN}-falcon "
+
 TOOLCHAIN = "gcc"

