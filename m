Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1397.1580498474393958302
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qgKLOPX8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJLDRO074126
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:21:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580498473;
	bh=8YI0TEi9maeDtvyvJXqqarifZRP0bhKgVKPjMxw6BvQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qgKLOPX8vYswKWP8vfCn0C9GtPueNuADjBOkBA0PCQCyoedXaraHNAHaeByOgkCaH
	 tC2GKm2xfYm+jCL7WPm73lkyvkTfeWEeZ68kV/UOTHB3cJQ60AYpg4q5FH7N5Qcns3
	 DYBe+JQx+mwEIQGjVgBm5AWucvtPQt97zwyHmcq8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJLDWH001761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:21:13 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:21:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:21:13 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJLCee002626;
	Fri, 31 Jan 2020 13:21:12 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH 3/3] recipes-graphics: Use M for kernel build subdirectory over SUBDIRS
Date: Fri, 31 Jan 2020 14:21:11 -0500
Message-ID: <20200131192111.29813-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131192111.29813-1-afd@ti.com>
References: <20200131192111.29813-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

SUBDIRS has been deprecated for a while and as of k5.4 no longer works.
Use M= instead.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb          | 2 +-
 recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
index 2f4b7ac5..bc907263 100644
--- a/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
@@ -32,5 +32,5 @@ PVR_WS = "wayland"
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
 }
diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
index 5c1a50de..751dfc74 100644
--- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
@@ -38,9 +38,9 @@ do_compile_prepend() {
 }
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
 do_install_k3() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
 }
-- 
2.17.1

