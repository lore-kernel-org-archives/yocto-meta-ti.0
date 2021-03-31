Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.474.1617235062356346025
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LpX+jvzV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveFa124641;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=Va2tOCHmpgsFYZRth0g+/wKGNCENktzt3IwJkWqg3aw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LpX+jvzVw2pSJ4tbkbYf07BdFwBZ66NzUZE6FAzAvyBiYewO2dRcrhyLOmuXpYz0x
	 w+JxFpvqDA9jHJzs31IErGZsMTPApuVyFKQtC7hsZ+8DfA7O4Ofku7jHvmGfCIxZhJ
	 JLyKqgCw04PtAXGPpDZTHli5AXLg/ffzPklYd/fg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNvePA001479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveX5093159;
	Wed, 31 Mar 2021 18:57:40 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH V2 8/8] conf/machine: k3: Lets build bmap files by default
Date: Wed, 31 Mar 2021 18:57:36 -0500
Message-ID: <20210331235736.30481-9-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331235736.30481-1-nm@ti.com>
References: <20210331235736.30481-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets generate bmap files for bmaptool to use as well as default to use
with wic files.

NOTE: bmaptool can speed up flashing SD cards by 2x-3x by skipping
empty blocks of the image.

https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#flashing-images-using-bmaptool

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---
Changes since V1:
- picked up reviewed-by
- Minor updates in commit message from Deny's comments :D

V1: https://lists.yoctoproject.org/g/meta-ti/message/13614
 conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 56ad40c3f963..e0970698b33d 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -38,7 +38,7 @@ UBI_VOLNAME = "rootfs"
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
 
-IMAGE_FSTYPES += "tar.xz wic.xz"
+IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
 IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
 IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
-- 
2.31.0

