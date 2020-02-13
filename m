Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8673.1581611400243876315
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 08:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rroum1hB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DGTxYV003358
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 10:29:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581611399;
	bh=WiNJhaSEE/ayLVGmmsE0ljdvaordr3gIvAFrLsDMuNw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rroum1hBCbnaiYBkkVhO6qG/v0bzd/fOhkmAc6nlc+4/5PSBxTCc2iY3hRyIZwRLr
	 s1YaZ+EpioTje951OHygirvfxcREVN+QUOpINy9KGxna0dGDCoQDu36tIg8ConU2gR
	 Zf6QIMeRKVmI7fCNTZIiDO/8eHBaxayjdh05oLpU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DGTxVE052433
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 10:29:59 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 10:29:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 10:29:59 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DGTwuw105102;
	Thu, 13 Feb 2020 10:29:58 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][zeus/master][PATCH 2/2] ti-sgx-ddk-km: Enable SGX driver for Beagleboard and Pandaboard
Date: Thu, 13 Feb 2020 11:29:58 -0500
Message-ID: <20200213162958.7600-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213162958.7600-1-afd@ti.com>
References: <20200213162958.7600-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

These boards have SGX GPUs but do not build as this recipe is not
compatible with them, add compatibles for these machines.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 47581f63..14010137 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
 
 inherit module
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
 
 MACHINE_KERNEL_PR_append = "t"
 PR = "${MACHINE_KERNEL_PR}"
@@ -30,6 +30,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
 TARGET_PRODUCT_k3 = "ti654x"
+TARGET_PRODUCT_beagleboard = "ti343x"
+TARGET_PRODUCT_pandaboard = "ti443x"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
 
-- 
2.17.1

