Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D1CC3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 21:25:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.150.1746221111350915217
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 May 2025 14:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ce/dbbW6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542LPA9i3949709
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 16:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746221110;
	bh=jXYzyztaWuxW+nApvusg18qVRUDCH7w2yahVlsoOXSQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ce/dbbW6y4v6zgVwuS/buigCaD5sKAZXzVcI/JPuDTaGCo9OjNrAXBJovhKSKDbXB
	 4KIbvoKFPqWweQkV684JDDGJGHOsbHKxuB/FcQk3y3xUk+yLYxqsnFjb8ZqQqSpHLt
	 TdqlABJM5QH5bHbxpyy7maNGrnUg2pEv53FeGDig=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542LPAdi034595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 16:25:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 16:25:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 16:25:09 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542LP9aO095517;
	Fri, 2 May 2025 16:25:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v2 3/3] ti-linux-fw: Split firmware in to machine packages
Date: Fri, 2 May 2025 16:25:07 -0500
Message-ID: <20250502212507.78984-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250502212507.78984-1-afd@ti.com>
References: <20250502212507.78984-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 May 2025 21:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18530

Firmware, like kernel modules, may be only relevant to a small subset of
hardware. Shipping all firmware for all hardware can waste space. For
this reason modules are split out into packages, and the same should
be done for firmware.

What we do currently is change the content of the package itself based
on what device we are building for. Having a package change content for
each machine means we cannot generate one image that supports multiple
machines, nor host a common machine agnostic package repo.

Instead we can generate different packages for the different firmwares
and only include the firmware packages needed for each machine.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am69.inc     |  2 +-
 meta-ti-bsp/conf/machine/include/j7200.inc    |  2 +-
 meta-ti-bsp/conf/machine/include/j721e.inc    |  2 +-
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  2 +-
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        | 76 ++++++++++---------
 5 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index da8a5a8b..1a19410a 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -18,4 +18,4 @@ TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index b60b98e1..3cba71b6 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -26,4 +26,4 @@ TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw-j7200"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index b5ba448e..30aa2a69 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -40,4 +40,4 @@ TI_VXE_VXD_DRIVER = "ti-vxe-vxd-driver"
 TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
 TI_VXE_VXD_DRIVER:bsp-ti-6_1 = ""
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw ${TI_VXE_VXD_DRIVER}"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index fd3990a6..33224ee3 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -21,4 +21,4 @@ TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 8037ac6c..04e43609 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9d
 
 COMPATIBLE_MACHINE = "j721e|j7200|j784s4"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit update-alternatives
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,50 +15,60 @@ PR = "${INC_PR}.0"
 # Secure Build
 inherit ti-secdev
 
-PLAT_SFX = ""
-PLAT_SFX:j721e = "j721e"
-PLAT_SFX:j7200 = "j7200"
-PLAT_SFX:j784s4 = "j784s4"
-
-ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
-
-INSTALL_ETH_FW_DIR = "${nonarch_base_libdir}/firmware/${ETH_FW_DIR}"
+PACKAGES += " \
+    ${PN}-j721e \
+    ${PN}-j7200 \
+    ${PN}-j784s4 \
+"
+# Disable arch checking as firmware is likely to be a different arch from the Yocto build
+INSANE_SKIP:${PN}-j721e += "arch"
+INSANE_SKIP:${PN}-j7200 += "arch"
+INSANE_SKIP:${PN}-j784s4 += "arch"
+
+RDEPENDS:${PN} += " \
+    ${PN}-j721e \
+    ${PN}-j7200 \
+    ${PN}-j784s4 \
+"
+
+PLATS = "\
+    j721e \
+    j7200 \
+    j784s4 \
+"
 
 ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
 
-ETH_FW_LIST = ""
-ETH_FW_LIST:j721e =   "${ETH_FW}"
-ETH_FW_LIST:j7200 =   "${ETH_FW}"
-ETH_FW_LIST:j784s4 =  "${ETH_FW}"
-
 do_install() {
-    # ETH firmware
-    for FW_NAME in ${ETH_FW_LIST}
+    for PLAT in ${PLATS}
     do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${ETH_FW_DIR}/${FW_NAME} ${S}/${ETH_FW_DIR}/${FW_NAME}.signed
-    done
+        # Sign ETH firmware
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/ti-eth/${PLAT}/${ETH_FW} ${S}/ti-eth/${PLAT}/${ETH_FW}.signed
 
-    # ETH firmware
-    install -d ${D}${INSTALL_ETH_FW_DIR}
-    for FW_NAME in ${ETH_FW_LIST}
-    do
-        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}        ${D}${INSTALL_ETH_FW_DIR}
-        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_ETH_FW_DIR}
+        # Install ETH firmware
+        install -d ${D}${nonarch_base_libdir}/firmware/ti-eth/${PLAT}
+        install -m 0644 ${S}/ti-eth/${PLAT}/${ETH_FW}        ${D}${nonarch_base_libdir}/firmware/ti-eth/${PLAT}
+        install -m 0644 ${S}/ti-eth/${PLAT}/${ETH_FW}.signed ${D}${nonarch_base_libdir}/firmware/ti-eth/${PLAT}
     done
 }
 
+FILES:${PN} = ""
+FILES:${PN}-j721e = "${nonarch_base_libdir}/firmware/ti-eth/j721e"
+FILES:${PN}-j7200 = "${nonarch_base_libdir}/firmware/ti-eth/j7200"
+FILES:${PN}-j784s4 = "${nonarch_base_libdir}/firmware/ti-eth/j784s4"
+
 # Set up names for the firmwares
-ALTERNATIVE:${PN}:j721e = "\
+ALTERNATIVE:${PN}-j721e = "\
                     j7-main-r5f0_0-fw \
                     j7-main-r5f0_0-fw-sec \
                     "
 
-ALTERNATIVE:${PN}:j7200 = "\
+ALTERNATIVE:${PN}-j7200 = "\
                     j7200-main-r5f0_0-fw \
                     j7200-main-r5f0_0-fw-sec \
                     "
 
-ALTERNATIVE:${PN}:j784s4 = "\
+ALTERNATIVE:${PN}-j784s4 = "\
                     j784s4-main-r5f0_0-fw \
                     j784s4-main-r5f0_0-fw-sec \
                     "
@@ -76,13 +84,13 @@ ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmw
 ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw-sec"
 
 # Create the firmware alternatives
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]        = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec]    = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]        = "${nonarch_base_libdir}/firmware/ti-eth/j721e/${ETH_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec]    = "${nonarch_base_libdir}/firmware/ti-eth/j721e/${ETH_FW}.signed"
 
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/ti-eth/j7200/${ETH_FW}"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ti-eth/j7200/${ETH_FW}.signed"
 
-ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/ti-eth/j784s4/${ETH_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ti-eth/j784s4/${ETH_FW}.signed"
 
 ALTERNATIVE_PRIORITY = "5"
-- 
2.39.2


