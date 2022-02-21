Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.8370.1645431224767676154
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 00:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cOB56DLu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21L8Dh3k099178
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 02:13:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645431223;
	bh=YX+g/JVYJrHr2UR/GuKoV9yXUMf2JSoj+u2fgBZoetU=;
	h=From:To:CC:Subject:Date;
	b=cOB56DLuSHc1i6QqOJJ2UNaRLgj0qqlPnqfHrBpsy/CWy1uZK/1XBZxTnXbN0of9B
	 pJw/b6NXot4iUA/tSCpCs2hZ7bwOOsmk2cSZqmqnCwq9/3vRJnyOKpTvRR9okM6oun
	 QM31EYfMB6oUYGeoJfsURHWAkUyBNd3WAP8353cc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21L8Dhc4092024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 02:13:43 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Feb 2022 02:13:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Feb 2022 02:13:43 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21L8DeDj067824;
	Mon, 21 Feb 2022 02:13:41 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <devarsht@ti.com>, <nikhil.nd@ti.com>, <nsekhar@ti.com>,
        Aparna M
	<a-m1@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Fix naming of u-boot.img
Date: Mon, 21 Feb 2022 13:43:31 +0530
Message-ID: <20220221081331.11263-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

All the HS platforms generate the u-boot binary as u-boot.img_HS
but the bootloader expects the binary to be named as u-boot.img

Due to this mismatch, script cannot find the required image to
be added in the WIC image. Fix this by overwriting the
UBOOT_IMAGE variable via conf file.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 conf/machine/am64xx-hs-evm.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index 44e81463..781b8318 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_IMAGE = "u-boot.img"
+IMAGE_BOOT_FILES = "${UBOOT_IMAGE}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.17.1

