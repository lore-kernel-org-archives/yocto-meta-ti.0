Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2208CCD195
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:00:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.14459.1760529646919406797
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 05:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YpT8mCs0;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-shah@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FC0it31747710;
	Wed, 15 Oct 2025 07:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760529644;
	bh=G8nittR5UgK1zGWboCYghtbYj1e0HJR+TcJ8LT9jNl0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YpT8mCs014+sfG0UXLdq6zyvNJQVhiiMlIKln/VWbDfqavIfpBb2duHNl+09PmjrN
	 5lvyqI0GL/mMb+YeJPrPK86ubyEdZrUbNyLU5/Hu6LHv7kZAP27jJbx+Q8V4bNp9By
	 j9h2YZiM3KxGAd2aJLvZU5VxM55NZ7huBvkfHDCA=
Received: from DFLE204.ent.ti.com (dfle204.ent.ti.com [10.64.6.62])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FC0i0b794713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:00:44 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:00:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:00:44 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FC0W7L1859032;
	Wed, 15 Oct 2025 07:00:41 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v5 2/4] recipes-ti: initramfs: Make minimal initramfs image
Date: Wed, 15 Oct 2025 17:30:30 +0530
Message-ID: <20251015120032.288741-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015120032.288741-1-m-shah@ti.com>
References: <20251015120032.288741-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 12:00:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19128

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


