Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5C1CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 10:53:33 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10274.1757328807934434534
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 03:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mrQ3yi4m;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ArRxl037228
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757328807;
	bh=Ly3x5ai/mZCeieuakO/MQQkNH8Fo8W6wbKCTeuPP2tY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mrQ3yi4m+vaS0nZzG4gPZj4Vc1dPufiDSL1MPqDyrsVyVsd8qewEl41iTU9ZLdAfS
	 uUWskr0i90iCVibFqL0LI+vf1zhyo1o1UepElSasurSGCTFu6720SnJVZiJf5Dpmvv
	 JizWqycDglE1eW0KQ6mvWJqAJnF4Q74zJdZ7kMvI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ArRxv2950476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:53:27 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 05:53:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 05:53:27 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ArGNf479541;
	Mon, 8 Sep 2025 05:53:24 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>
Subject: [master][PATCH 2/2] meta-ti-bsp: wic: Add a new GRUB config for ti platforms
Date: Mon, 8 Sep 2025 16:23:15 +0530
Message-ID: <20250908105315.19583-3-m-shah@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18981

Add a new grub config for TI specific platforms. While,
only supporting to boot linux from filesystem on MMC for
now, it will support booting linux and initrd image from
OSPI, UFS later down the line. Hence, make a new config
altogether for easier development.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in |  2 +-
 meta-ti-bsp/wic/ti-grub.cfg              | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
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
index 00000000..7fcaf275
--- /dev/null
+++ b/meta-ti-bsp/wic/ti-grub.cfg
@@ -0,0 +1,14 @@
+# Set timeout and default options
+set timeout=3
+set default=0
+set root_part=(hd0,msdos2)
+
+# Define paths to kernel and initrd in root partition
+set kernel_path="${root_part}/boot/Image"
+set initrd_path="${root_part}/boot/initrd.cpio"
+
+# Main boot entry
+menuentry "Boot Linux" {
+    linux ${kernel_path} root=/dev/disk/by-label/root rootwait rootfstype=ext4  
+    initrd ${initrd_path}
+}
-- 
2.34.1


