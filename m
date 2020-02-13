Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.8721.1581611399979354613
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 08:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ESyXCZsE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DGTxGw003354
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 10:29:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581611399;
	bh=J6HYV9rmuOFe7F5D52MxU+JOf8gvgPtScnocO2i6ptM=;
	h=From:To:CC:Subject:Date;
	b=ESyXCZsE8JVVeWGaHxIEsbL5KXviWHRhMtxNTDnAU0j9zqJYnDJtssozlS5tjZI+g
	 nSF5tWHvLFEeNGedONx5kMkCZitxpJ9GkC+5taoOaDMasQn5HSfGtaD9I+N75au6b/
	 Zg9zRErYe4erxUjc0S5ef0i6r/nEO7Qv9QgxuMV4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DGTxNn103397
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 10:29:59 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 10:29:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 10:29:58 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DGTwuv105102;
	Thu, 13 Feb 2020 10:29:58 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][zeus/master][PATCH 1/2] ti-sgx-ddk-um: bump SRCREV for zeus support
Date: Thu, 13 Feb 2020 11:29:57 -0500
Message-ID: <20200213162958.7600-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This also allows us to do two extra tasks so lets do them here:
 - Add support back for Beagleboard and Pandaboard
 - Remove plugins workaround as SO names are handled correctly now

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index ecf3ffcc..129d5cee 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -4,19 +4,21 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
 
-PR = "r34"
+PR = "r35"
 
-BRANCH = "ti-img-sgx/thud/${PV}"
+BRANCH = "ti-img-sgx/zeus/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
+SRCREV = "ce7b96b88d31da27af5b3a2a890aba180a014fc4"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
 TARGET_PRODUCT_k3 = "ti654x"
+TARGET_PRODUCT_beagleboard = "ti343x"
+TARGET_PRODUCT_pandaboard = "ti443x"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
@@ -59,14 +61,7 @@ FILES_${PN} += " ${libdir}/*"
 FILES_${PN} +=  "${includedir}/*"
 FILES_${PN} +=  "${sysconfdir}/*"
 
-PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
-RDEPENDS_${PN} += "${PN}-plugins"
-
-ALLOW_EMPTY_${PN}-plugins = "1"
-
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
-INSANE_SKIP_${PN}-plugins = "dev-so"
-INSANE_SKIP_${PN} += "already-stripped"
+INSANE_SKIP_${PN} += "already-stripped dev-deps"
 
 CLEANBROKEN = "1"
-- 
2.17.1

