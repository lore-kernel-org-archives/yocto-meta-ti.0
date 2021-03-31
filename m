Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.289.1617209498337890343
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HK85nGYn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpZi4077641;
	Wed, 31 Mar 2021 11:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209495;
	bh=D3DZ0BJpZO27fbvuR2xddPYq0Aa2tQZM78p0LvG5KtA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HK85nGYnesyER1i6kF1phh3PSCR892IuiWXlXSAJkTM20VGc2SgJBAfZfD1LCM7sC
	 ZhKWq5c8xdLQjYiSnpqR9mb1JOVYnwREL6NKrj0Q+RI9/HO7XF1g9p8/D1lOYSnGeS
	 S05cRiERQyq2f1j5EdPfkO+0k5gBmrEVKUrwakR4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpZr6079119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:35 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYR6085065;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 4/7] conf/machine: j7200-evm: Switch to multi-certificate boot images
Date: Wed, 31 Mar 2021 11:51:30 -0500
Message-ID: <20210331165133.3746-5-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331165133.3746-1-nm@ti.com>
References: <20210331165133.3746-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Switch to using all of multi-certificate boot images. This allows us
to create bootable images - in this case, we are missing tiboot3.bin

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 conf/machine/j7200-evm.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index dab6d8cb0cd8..b2079218d9fa 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -14,7 +14,8 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+# J7200 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 
 do_image_wic[depends] += "trusted-firmware-a:do_deploy"
 do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-- 
2.31.0

