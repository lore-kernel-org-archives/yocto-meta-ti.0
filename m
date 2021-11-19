Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.3250.1637288994117550601
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HEXEtnjf;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2TrZX037235;
	Thu, 18 Nov 2021 20:29:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637288993;
	bh=LoHbb1uooPCoqlqohwmQxqe8CYCcn6oBuB/5S4ADSP4=;
	h=From:To:Subject:Date;
	b=HEXEtnjfzVmFcp6XxBuoVX6cjahqqa23AeGZ5Da2yEpOxFsFUG702JpkmGfWxrGNO
	 igpNRwmkB1Q6JmE9k3V0XfvaoZdXive1lKsh3KmlTvfQH0NXx9OMgABhpJu+0rM9zx
	 +D6xn3U4IcGmSFA3NDI0XwLp307o/eebOhbCrpNs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJ2TrF5037525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 20:29:53 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 20:29:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 20:29:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2TqZH109060;
	Thu, 18 Nov 2021 20:29:52 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] wic: revert grub-efi patch
Date: Fri, 19 Nov 2021 02:29:52 +0000
Message-ID: <20211119022952.6588-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Revert "conf/machine: k3: Enable grub-efi by default in wic images"

This reverts commit d0b09833b44fa23cce86fd99dd8ca6631c61c476.
---
 conf/machine/include/k3.inc | 6 +-----
 wic/sdimage-2part-efi.wks   | 7 -------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 wic/sdimage-2part-efi.wks

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 166c0923..e0970698 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -44,12 +44,8 @@ IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysf
 IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
 
 IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
-IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
-EFI_PROVIDER ?= "grub-efi"
-MACHINE_FEATURES += "efi"
-
-WKS_FILE ?= "sdimage-2part-efi.wks"
+WKS_FILE ?= "sdimage-2part.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/wic/sdimage-2part-efi.wks b/wic/sdimage-2part-efi.wks
deleted file mode 100644
index ffb8d24b..00000000
--- a/wic/sdimage-2part-efi.wks
+++ /dev/null
@@ -1,7 +0,0 @@
-# short-description: Create SD card image with 2 partitions and EFI support
-# long-description: Creates a partitioned SD card image for TI platforms that
-# supports EFI.  Boot files are located in the first vfat partition with extra
-# reserved space.  We cannot use a GPT here.
-bootloader --append="rootfstype=ext4 ro"
-part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
-part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.17.1

