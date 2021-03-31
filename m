Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.284.1617209500844839896
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lW3vwRT1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYIV091144;
	Wed, 31 Mar 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209494;
	bh=O0gl86wdyh7WafV4yncJ6QA/tbYi1WvkgU98CCaCJxo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lW3vwRT1TL2jBHNie4qkNCldikMy4vx/bbjhAKZWYad88XVEMBCCSj9hd4ts88xhG
	 PJlT32NeG8lTTjWgNM6WlnCwP29Y4VIEubZTMrhYXey+rhwfflLyEZqvk6hQLYbDVz
	 Y+IztQqaYhIKLffKJIPQPqGT5ErsblLQld91UYvM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYrd091692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:34 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYWR097032;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 6/7] conf/machine: am64xx: Switch to multi-certificate boot images
Date: Wed, 31 Mar 2021 11:51:32 -0500
Message-ID: <20210331165133.3746-7-nm@ti.com>
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
 conf/machine/include/am64xx.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 3173319df354..9d40b066a03a 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,7 +10,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
 "
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+# AM64 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 do_image_wic[depends] += "trusted-firmware-a:do_deploy"
 do_image_tar[depends] += "trusted-firmware-a:do_deploy"
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.31.0

