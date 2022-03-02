Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.2099.1646179749168975937
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 16:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bGQVd1dF;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222094O0062284;
	Tue, 1 Mar 2022 18:09:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646179744;
	bh=Rmo2Vqi2KptvtlvJv0NihGQyAtGkuZpOxojhWbUMTqE=;
	h=From:To:CC:Subject:Date;
	b=bGQVd1dFXenebDWlqEjtseBdfBPjw8sOw+iOa9gpD+EYTpdjp3AG7y7TDTl3CAH/O
	 BlN+idxStw2uu8nw0p0MTAzSqE8yBrrGVFIR2gkxCBZTK8eTFW9Z2vXs8dAgL/Mz3p
	 rQOWIusdUFhupG/TfCFv7OfjqRjMTK/03mmDhs8Q=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222094k4066359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Mar 2022 18:09:04 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 1
 Mar 2022 18:09:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 1 Mar 2022 18:09:04 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222091Mq083112;
	Tue, 1 Mar 2022 18:09:02 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <devarsht@ti.com>, <nikhil.nd@ti.com>, <nsekhar@ti.com>,
        Aparna M
	<a-m1@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Include required boot binaries in wic image
Date: Wed, 2 Mar 2022 05:38:57 +0530
Message-ID: <20220302000857.28932-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The wic image generated for HS platforms do not contain all required
boot files. This happens because the IMAGE_BOOT_FILES variable that
contains boot binaries to be included in the wic image is not set
correctly. Populate this variable to include all boot binaries required.

All the HS platforms generate the u-boot binary as u-boot.img_HS but the
bootloader expects the binary to be named as u-boot.img. Use UBOOT_IMAGE
variable to include the binary as u-boot.img in the wic image.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 conf/machine/am64xx-hs-evm.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index 44e81463..960f63cf 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_IMAGE = "u-boot.img"
+IMAGE_BOOT_FILES = "tiboot3.bin ${SPL_BINARYNAME} ${UBOOT_IMAGE}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.17.1

