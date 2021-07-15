Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.157.1626381182961568001
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jul 2021 13:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iEq07Nwk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16FKX1nC126187;
	Thu, 15 Jul 2021 15:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626381181;
	bh=RLFP6mCp/VFwgTZoziW27hIPeFf1oHmRC+L2CodBHYY=;
	h=From:To:Subject:Date;
	b=iEq07Nwkab6zmA2IG5Lp0OqmWcZZWRKwtfbNt/46Mf+Q6O50l8TgvT5GHkTTq/DtR
	 TP5h8hLjh/Vqb1MSgY1DmACyWlg3daCCknE+RToVAHqbFKX5AMIHQM1uth7gzCNMdE
	 PukkTDvsQyWXV0KBMgSgESu96jHeLjK9iUqPEW98=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16FKX15Z106968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jul 2021 15:33:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Jul 2021 15:33:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Jul 2021 15:33:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16FKX0In002293;
	Thu, 15 Jul 2021 15:33:00 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH] ti-rtos-firmware: update the source to ti-linux-firmware
Date: Thu, 15 Jul 2021 20:33:00 +0000
Message-ID: <20210715203300.13364-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This is temporary change to pick the 08.00.00.026 firmware from
ti-linux-firmware repos:
1) Using the ti-sci-fw to pick the latest firmware and support AUTOREV
2) Kept the destination folder name same to avoid wide-spead changes to
other recipes. Since that will be changed as part of over-all clean-up

TODO:
1) Re-structure rtos firmware repo and update all dependent firmware recipes.
2) Fix the destination folder name to match src folder

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 107 ++++++++-------------
 1 file changed, 42 insertions(+), 65 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e5a4c43b..54a99286 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -11,90 +11,67 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 inherit deploy
 
-DEFAULT_METADATA_FILE ?= "metadata.inc"
-DEFAULT_METADATA_FILE_am64xx ?= "mcusdk_metadata.inc"
-
-# First, let's try including metadata.inc that could be fetched and deployed
-# by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* variables
-include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
-
-# Set some defaults for when metadata.inc is not available
-DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_03_00_29"
-DEFAULT_RTOS_VERSION_DOT = "07.03.00.29"
-
-DEFAULT_RTOS_VERSION_am64xx = "07_03_00_19"
-DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.19"
-
-DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
-DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
-
-DEFAULT_RTOS_SOC = "undefined"
-DEFAULT_RTOS_SOC_j7 = "j721e"
-DEFAULT_RTOS_SOC_j7200-evm = "j7200"
-DEFAULT_RTOS_SOC_am65xx = "am65xx"
-DEFAULT_RTOS_SOC_am64xx = "am64x"
-
-DEFAULT_RTOS_WEBLINK = "undefined"
-DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
-DEFAULT_RTOS_WEBLINK_j7200-evm = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-j7200/firmware/${CORESDK_RTOS_VERSION}"
-DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
-DEFAULT_RTOS_WEBLINK_am64xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
-
-DEFAULT_FIRMWARE_FILE = "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_RTOS_VERSION}_firmware.tar.xz"
-DEFAULT_FIRMWARE_FILE_am64xx = "mcu_plus_sdk_${CORESDK_RTOS_SOC}_${CORESDK_RTOS_VERSION}_firmware.tar.xz"
-
-DEFAULT_FIRMWARE_URL = "file://empty"
-DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
-
-DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "1e306065d7273c4ac6f803d5b404ba5ff0ddd55a1afa2911944fe5e696629193"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "28fa4f5c57459ea0adc44e8c83b814a4adcfb887bee69769c5656adf628586b2"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx = "5d1785cbdb91904a5ef3027378061041c59186c4198d7ebcfa660a1ff513d528"
-
-# Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
-CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
-CORESDK_RTOS_VERSION ?= "${DEFAULT_RTOS_VERSION}"
-CORESDK_RTOS_VERSION_DOT ?= "${DEFAULT_RTOS_VERSION_DOT}"
-CORESDK_RTOS_SOC ?= "${DEFAULT_RTOS_SOC}"
-CORESDK_RTOS_WEBLINK ?= "${DEFAULT_RTOS_WEBLINK}"
-CORESDK_RTOS_FIRMWARE_URL ?= "${DEFAULT_FIRMWARE_URL}"
-CORESDK_RTOS_FIRMWARE_SHA256SUM ?= "${DEFAULT_FIRMWARE_SHA256SUM}"
-CORESDK_RTOS_FILE_PREFIX ?= ""
-CORESDK_RTOS_FILE_SUFFIX ?= ""
-
-# Common code below
-S = "${WORKDIR}/lib"
-
-PV = "${CORESDK_RTOS_VERSION_DOT}"
-
-SRC_URI = "${CORESDK_RTOS_FIRMWARE_URL}${CORESDK_RTOS_FILE_SUFFIX}"
-SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
+PLAT_SFX = ""
+PLAT_SFX_j7 = "j721e"
+PLAT_SFX_j7200-evm = "j7200"
+PLAT_SFX_am65xx = "am65xx"
 
+require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+
+CORESDK_RTOS_VERSION="08.00.00.26"
+PV = "${CORESDK_RTOS_VERSION}"
+
+CLEANBROKEN = "1"
+PR = "r1"
+
+
+# Secure Build 
 DEPENDS += "openssl-native"
 
 FILES_${PN} += "${base_libdir}"
 
 TI_SECURE_DEV_PKG ?= ""
 
+RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
+RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
+RTOS_IPC_FW_DIR = "${S}/ti-ipc/${PLAT_SFX}"
+
+# For back-ward compatability keeping legacy firmware folder name
+# TODO: fix this in next version
+LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw"
+LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc"
+LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/ethfw"
+
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
+# Install
 do_install_prepend_j7-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${S}/firmware/pdk-ipc/; \
+	( cd ${RTOS_DM_FW_DIR}; \
 		mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
 	)
 }
 
 do_install() {
-	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-	install -d ${D}${base_libdir}
-	cp ${CP_ARGS} ${S} ${D}
+  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+  install -d ${LEGACY_ETH_FW_DIR}
+  install -d ${LEGACY_IPC_FW_DIR}
+  cp ${CP_ARGS} "${RTOS_ETH_FW_DIR}/." ${LEGACY_ETH_FW_DIR}
+  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
+  cp ${CP_ARGS} "${RTOS_DM_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
+}
+
+do_install_am65xx() {
+  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+  install -d ${LEGACY_IPC_FW_DIR}
+  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
 }
 
-FILES_${PN} = "${base_libdir}"
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES_${PN} += "${base_libdir}/firmware"
+
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.17.1

