Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1433.1580498722242325463
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PVPfEH9j;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJPLHT075650
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:25:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580498721;
	bh=vIXviNwivB/qzRuNzZ5EqH2s9Q9ptHXHAfIbkddah9A=;
	h=From:To:CC:Subject:Date;
	b=PVPfEH9jKK2ze5Xr1U7Sw4FCcnvkqQgAktGlR7pMKDKtLyEziTeofoIsNWjHOteU+
	 tYZbksBnCn3xISd7elGGPZf4J1B0yKgd6A1laKBDiTd/2WKpypxlCX7SoPLM1DyAm3
	 nBmlalpbsDs+pG7OeiRwOZx9Mfaku6Us7CjzApNE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJPLVK039278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:25:21 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:25:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:25:21 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJPK6c044021;
	Fri, 31 Jan 2020 13:25:21 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][RFC] recipes-graphics: Enable SGX drivers for Beagleboard and Pandaboard
Date: Fri, 31 Jan 2020 14:25:20 -0500
Message-ID: <20200131192520.29950-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

These boards have SGX GPUs but do not build as this recipe is not
compatible with them, add compatibles for these machines.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---

Currently and RFC until I can get these binaries pushed to the
git.ti.com/graphics/omap5-sgx-ddk repos.

Tested working locally on latest with a Beagleboard and a Pandaboard.

 recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb | 4 +++-
 recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
index 751dfc74..05bca918 100644
--- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
 
 inherit module
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
 
 MACHINE_KERNEL_PR_append = "s"
 PR = "${MACHINE_KERNEL_PR}"
@@ -30,6 +30,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
 TARGET_PRODUCT_k3 = "ti654x"
+TARGET_PRODUCT_beagleboard = "ti343x"
+TARGET_PRODUCT_pandaboard = "ti443x"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
 
diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
index ecf3ffcc..e3b9b4d1 100644
--- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
 
 PR = "r34"
 
@@ -17,6 +17,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
 TARGET_PRODUCT_k3 = "ti654x"
+TARGET_PRODUCT_beagleboard = "ti343x"
+TARGET_PRODUCT_pandaboard = "ti443x"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.17.1

