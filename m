Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ACFCA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 10:53:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10323.1757328805310420451
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 03:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aZKmqqNR;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ArOoY3776130
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757328804;
	bh=S4RVbXU5jBT1AvVaMOTEROyn5KdZEhgBM1LUN8pabJo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aZKmqqNR+B/BSxoHV5F+9+7tlHHn9yNwb+Pw2PJ0ZWyEAfX8LachExdyH+B9dhivR
	 C2GNYlU0vy9PYpKnIeeEJvxhdRxuopCKmiA6gHOfX+0dgHX2iRk25qEYhKcutzSYxI
	 dmFnghlhscCBbCMS0w5flVZ0X8nYZeIxRGcEOrtY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ArNKH2950467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:53:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 05:53:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 05:53:23 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ArGNe479541;
	Mon, 8 Sep 2025 05:53:20 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>
Subject: [master][PATCH 1/2] recipes-ti: initrd: Make minimal initrd image
Date: Mon, 8 Sep 2025 16:23:14 +0530
Message-ID: <20250908105315.19583-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908105315.19583-1-m-shah@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Sep 2025 10:53:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18980

Introduce a new minimal initramfs image which will be used
for all K3 devices in the boot flow. The image will package
boot essential and other modules which will be modprobed by
initramfs-udev once the inbuilt drivers gets probed.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initrd/packagegroup-ti-initrd.bb          |  5 ++
 .../recipes-ti/initrd/ti-initrd-image.bb      | 56 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb

diff --git a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
new file mode 100644
index 00000000..8847cb2e
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
@@ -0,0 +1,5 @@
+SUMMARY = "Minimal initrd for boot requirements"
+
+require recipes-core/packagegroups/packagegroup-core-boot.bb
+
+RDEPENDS:${PN}:remove = "grub-efi kernel"
diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
new file mode 100644
index 00000000..f6b99073
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
@@ -0,0 +1,56 @@
+SUMMARY = "TI SDK minimal initrd image"
+
+DESCRIPTION = "Image meant to probe boot essential modules\
+ and other modules to reach the userspace, which cannot be\
+ built inside the upstream linux kernel image.\ 
+"
+
+LICENSE = "MIT"
+
+inherit core-image
+
+IMAGE_NAME = "initrd"
+
+IMAGE_NAME_SUFFIX = ""
+
+IMAGE_FEATURES:remove = "package-management"
+
+INITRAMFS_FSTYPES = "cpio cpio.xz"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+INITRAMFS_SCRIPTS ?= "\
+    initramfs-framework-base \
+    initramfs-module-udev \
+    initramfs-module-nfsrootfs \
+"
+
+MODULES = "\
+    kernel-module-cdns-pltfrm \
+    kernel-module-ti-j721e-ufs \
+    kernel-module-tps6594-i2c \
+"
+
+UTILS = "\
+    cifs-utils \
+    nfs-utils \
+    nfs-utils-client \
+"
+
+PACKAGE_INSTALL = "\
+    ${INITRAMFS_SCRIPTS} \
+    ${UTILS} \
+    ${MODULES} \
+    packagegroup-ti-initrd \
+"
+
+export IMAGE_BASENAME = "ti-initrd-image"
+
+# To further reduce the size of the rootfs, remove the /boot directory from
+# the final image this is usually done by adding RDEPENDS_kernel-base = ""
+# in the configuration file. In our case we can't use this method. Instead we
+# just wipe out the content of "/boot" before creating the image.
+ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
+empty_boot_dir () {
+	rm -rf ${IMAGE_ROOTFS}/boot/*
+}
-- 
2.34.1


