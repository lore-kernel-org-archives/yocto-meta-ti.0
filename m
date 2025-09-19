Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFACCAC5A9
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 09:38:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.12490.1758274730158590166
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 02:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FMm4wc5b;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J9cnUn215962;
	Fri, 19 Sep 2025 04:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758274729;
	bh=lr5FGNhsJJtmd+DbY9QipeJchk3O6eQP3hnu9xPBG5Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FMm4wc5bPIP1a+td8d+SA7NzvMpVpgff+IcE4rB2g2TpMIjjwzSvokcnDRXSo4k5S
	 vGW9PTB/VziWQxEWtD6IYd7Ll2JdN794ROc7m3BY5GystAxFnMcasjACqXhHjBQXja
	 xs4A5CsHbt3afTW5vSh2d0+VaiZa7Jd639GyatkA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J9cnCh2805518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 19 Sep 2025 04:38:49 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 04:38:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 04:38:48 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J9cWHj2367778;
	Fri, 19 Sep 2025 04:38:45 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB config for TI platforms
Date: Fri, 19 Sep 2025 15:08:30 +0530
Message-ID: <20250919093831.20609-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919093831.20609-1-m-shah@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Sep 2025 09:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19046

Add a new grub config for TI specific platforms. While,
only supporting to boot linux from filesystem on MMCSD, it
will support booting linux and initrd image from eMMC, OSPI,
UFS later down the line. Hence, make a new config altogether
for easier development.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
 meta-ti-bsp/wic/ti-grub.cfg              | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index ae38daa7..11912606 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -3,6 +3,6 @@
 # supports EFI.  Boot files are located in the first vfat partition with extra
 # reserved space.  We cannot use a GPT here.
 
-bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
+bootloader --configfile="ti-grub.cfg"
 part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
diff --git a/meta-ti-bsp/wic/ti-grub.cfg b/meta-ti-bsp/wic/ti-grub.cfg
new file mode 100644
index 00000000..b32b378f
--- /dev/null
+++ b/meta-ti-bsp/wic/ti-grub.cfg
@@ -0,0 +1,9 @@
+# Set timeout and default options
+set timeout=3
+set default=0
+
+# Main boot entry
+menuentry "Boot Linux" {
+    linux /Image root=/dev/disk/by-label/root rootwait rootfstype=ext4
+    initrd /initrd.cpio.xz
+}
-- 
2.34.1


