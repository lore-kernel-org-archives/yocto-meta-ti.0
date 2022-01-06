Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4028.1641439444475388790
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 19:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ewFHrSjf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-humphreys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2063O3YD118340
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jan 2022 21:24:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1641439443;
	bh=uogSZunYSLF/l0xiqhXvEhwGTxpZNffDzEXYKTDGJ9E=;
	h=From:To:CC:Subject:Date;
	b=ewFHrSjfeYZMP07nHMxpSaWVpDMqtLDGwrsFOe0jgZRlPFe6oHeRRsAzk87wSOXJj
	 w/A4ZRXl5EBW5NBamPMfEbbCKHkZZ+zr8YA5QruYIlrCGb7C3A5RlPuv4LKL65R1wt
	 lbU89/LxyUCbnc0MtEc5chn5+Qa43uH/8VPZ1kws=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2063O3aH009947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jan 2022 21:24:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 5
 Jan 2022 21:23:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 5 Jan 2022 21:23:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2063NJOn014988;
	Wed, 5 Jan 2022 21:23:19 -0600
From: "Jonathan Humphreys" <j-humphreys@ti.com>
To: <j-humphreys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master][PATCH] conf: Enable bmap file for wic images on legacy platforms
Date: Wed, 5 Jan 2022 21:23:09 -0600
Message-ID: <20220106032309.32549-1-j-humphreys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

To allow a consistent experience across current devices, enable wic.bmap file
generation for AM3/4/5 images.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
---
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/ti33x.inc    | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 923a19d3..02225a4e 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -49,7 +49,7 @@ UBI_VOLNAME = "rootfs"
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
 
-IMAGE_FSTYPES += "tar.xz wic.xz"
+IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 35e057d5..eae46c71 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -68,7 +68,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 TI_PDK_LIMIT_SOCS = "am335x"
 TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 
-IMAGE_FSTYPES += "tar.xz wic.xz"
+IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 6376a278..fc9af949 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -65,7 +65,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 TI_PDK_LIMIT_SOCS = "am437x"
 TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
 
-IMAGE_FSTYPES += "tar.xz wic.xz"
+IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "u-boot:do_deploy"
-- 
2.17.1

