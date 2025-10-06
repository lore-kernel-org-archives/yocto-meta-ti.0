Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C93CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:50:38 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.31930.1759751424346372864
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 04:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cfKANV0x;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596BoN1X3600718;
	Mon, 6 Oct 2025 06:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759751423;
	bh=G8nittR5UgK1zGWboCYghtbYj1e0HJR+TcJ8LT9jNl0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cfKANV0xPz4VFCsTm8yh/JAuAo56HpT7X7mC/jeMvx+e8n2gBGkHLvY7PkQ8kv5/x
	 Jl1NsmV8qkV+EDeTjJbumWEvAgBX6JIrGHE47XeLCr9SLbHN3Q3CPjInuwWQddSQ9l
	 krjOtm+Pt+e2hkyIBXx9AHwyybkRAWCXoz2fL+XQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596BoNBX3280475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 06:50:23 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 06:50:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 06:50:23 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596BoAwP3371433;
	Mon, 6 Oct 2025 06:50:19 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v4 2/4] recipes-ti: initramfs: Make minimal initramfs image
Date: Mon, 6 Oct 2025 17:20:08 +0530
Message-ID: <20251006115010.1530509-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006115010.1530509-1-m-shah@ti.com>
References: <20251006115010.1530509-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Oct 2025 11:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19107

Introduce a new minimal initramfs image which will be used
for all K3 devices in the boot flow. The image will package
boot essential and other modules which will be modprobed by
initramfs-udev once the inbuilt drivers gets probed.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../packagegroup-ti-core-initramfs.bb         | 15 +++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
new file mode 100644
index 00000000..e9cf5e6b
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Minimal initramfs for boot requirements"
+
+require recipes-core/packagegroups/packagegroup-core-boot.bb
+
+RDEPENDS:${PN} += "\
+    ${TI_INITRAMFS_KERNEL_MODULES} \
+    initramfs-framework-base \
+    initramfs-module-udev \
+    initramfs-module-nfsrootfs \
+    cifs-utils \
+    nfs-utils \
+    nfs-utils-client \
+"
+
+RDEPENDS:${PN}:remove = "grub-efi kernel"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
new file mode 100644
index 00000000..236aa756
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -0,0 +1,33 @@
+SUMMARY = "TI SDK minimal initramfs image"
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
+IMAGE_NAME = "ti-core-initramfs"
+
+IMAGE_NAME_SUFFIX = ""
+
+IMAGE_FEATURES:remove = "package-management"
+
+INITRAMFS_FSTYPES = "cpio cpio.xz"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+PACKAGE_INSTALL = "packagegroup-ti-core-initramfs"
+
+export IMAGE_BASENAME = "${IMAGE_NAME}"
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


