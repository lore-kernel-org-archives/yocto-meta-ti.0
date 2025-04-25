Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83677C369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:26:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.9181.1745594797229588960
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 08:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pypRW7OY;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQZcZ2822640
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 10:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745594795;
	bh=xB0tJsxD9odBpYvuwnia/zzciCsKRoEfuOS/xPKYN0I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pypRW7OYbhz0ZYXdGWjSN0r2FMojPR66YFA4jzE1jOw10Niacnj9huPwtn5hDGQR0
	 eiopkr//Rxsjg3ZuuwFJBfKCaGVk+uEg/TEsTZ2vHa9XpZoyw/DKWCKlT/N7IZHoq+
	 DGwYKsEqNRZwXv24FxzCC6JOaENK8xEBkOb27KdE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQZbg042909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 10:26:35 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 10:26:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 10:26:34 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PFQXXB094890;
	Fri, 25 Apr 2025 10:26:34 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <vigneshr@ti.com>
Subject: [PATCH v3 2/4] bsp: conf: machine: add ti-falcon.inc
Date: Fri, 25 Apr 2025 20:56:08 +0530
Message-ID: <20250425152613.2470204-3-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425152613.2470204-1-anshuld@ti.com>
References: <20250425152613.2470204-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18506

ti-falcon.inc configures the following things for enabling falcon boot:

1. Change fitImage class to kernel-fitimage-legacyhs
2. Update kernel and dtb address for falcon boot
3. Disable kernel compression

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc        |  5 +++++
 meta-ti-bsp/conf/machine/include/ti-falcon.inc |  5 +++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 12 ++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index ea6a5028..2f8b17ca 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -56,3 +56,8 @@ TI_WKS_BOOTLOADER_APPEND ?= ""
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
+
+FALCON_INCLUDE = ""
+FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
+
+require ${FALCON_INCLUDE}
diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
new file mode 100644
index 00000000..55a4daa6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
@@ -0,0 +1,5 @@
+KERNEL_CLASSES:remove = "kernel-fitimage"
+KERNEL_CLASSES += "kernel-fitimage-legacyhs"
+UBOOT_DTB_LOADADDRESS = "0x88000000"
+UBOOT_LOADADDRESS = "0x82000000"
+FIT_KERNEL_COMP_ALG = "none"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 41d4abdd..baa05e78 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -373,4 +373,16 @@ do_deploy:append:am62pxx() {
 	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
 }
 
+do_install:append:ti-falcon() {
+	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
+}
+
+FALCON_PKG = ""
+FALCON_PKG:ti-falcon = "${PN}-falcon "
+
+PACKAGES:prepend:am62xx-evm = "${FALCON_PKG} "
+PACKAGES:prepend:am62axx-evm = "${FALCON_PKG} "
+PACKAGES:prepend:am62pxx-evm = "${FALCON_PKG} "
+PACKAGES:prepend:am62xx-lp-evm = "${FALCON_PKG} "
+
 TOOLCHAIN = "gcc"

