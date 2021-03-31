Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.303.1617209498442098744
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=msaQLRrV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpZ28077637;
	Wed, 31 Mar 2021 11:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209495;
	bh=uj2nZFTUM5La3larbWuUjyDPTy/SX5q8PFjbaU20EAQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=msaQLRrV1WE2iZcFK32berIASQ6fuX2kF9Z/GLK5X830qU4aFPHP2juwOfzCl8XX0
	 e4amQgQsca0El+kvC6XNCoiyeBkwJVA57AtBrVEvoqVVRMq89PqPCFtZRSqm38rZke
	 r//bNcs5PrFkq4kemQUDjeLFxIx0hyfo/GziY7x4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYC4113419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:35 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYxI085070;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 7/7] conf/machine: k3: Lets build bmap files by default
Date: Wed, 31 Mar 2021 11:51:33 -0500
Message-ID: <20210331165133.3746-8-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331165133.3746-1-nm@ti.com>
References: <20210331165133.3746-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets generate bmap files for bmaptool to use as well as default to use
with wic files.

https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#flashing-images-using-bmaptool

Signed-off-by: Nishanth Menon <nm@ti.com>
---
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

