Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F32C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 06:43:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8358.1672987422778348172
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 22:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XlG5nIQi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3066hcBD033326;
	Fri, 6 Jan 2023 00:43:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672987418;
	bh=lhbylv8fj+nCfbNnno9OvBTXv13hXR40ugUhflfL3LY=;
	h=From:To:CC:Subject:Date;
	b=XlG5nIQi0llTuRf44eZn+XqtjCyslBDyyL0Y8LXZfyynrJHUEYLTTd+EVSiI/SNee
	 hcKDiow6mE4ScvYQzO8ufBM7ZYJKlqYPkcvQUZZPes0eWrGBIXk1t2myyd4CLQHsq5
	 BsxYMp8hk67R4fbc7K6HenmlaPAaayyH1XfmlYm0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3066hcGA062380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Jan 2023 00:43:38 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 6
 Jan 2023 00:43:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 6 Jan 2023 00:43:38 -0600
Received: from chirag (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3066hbMi026704;
	Fri, 6 Jan 2023 00:43:37 -0600
Received: from sadivi by chirag with local (Exim 4.90_1)
	(envelope-from <c-shilwant@ti.com>)
	id 1pDgRz-0006yr-Th; Fri, 06 Jan 2023 12:13:35 +0530
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH v2] machine: Add AM62Q HS-SE evm configuration
Date: Fri, 6 Jan 2023 12:13:30 +0530
Message-ID: <20230106064330.26777-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Jan 2023 06:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15535

Lets add the basic AM62Q HS-SE configuration.
- Add configurations.
- Add ti-sci-firmware overrides.
- Add u-boot overrides.
- Add optee overrides.
- Add ti-rtos-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 conf/machine/am62xx-lp-evm-k3r5-hs-se.conf    | 14 +++++++++
 conf/machine/am62xx-lp-evm-k3r5.conf          | 12 ++++++--
 conf/machine/am62xx-lp-evm.conf               |  6 +++-
 conf/machine/include/am62xx-lp.inc            | 18 +++++++++++
 conf/multiconfig/k3r5-hs-se.conf              |  3 ++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  1 +
 .../trusted-firmware-a_%.bbappend             |  4 +++
 recipes-bsp/u-boot/u-boot-ti.inc              |  1 +
 recipes-security/optee/optee-os_%.bbappend    |  4 +++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 30 +++++++++++++++++++
 10 files changed, 90 insertions(+), 3 deletions(-)
 create mode 100644 conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
 create mode 100644 conf/machine/include/am62xx-lp.inc
 create mode 100644 conf/multiconfig/k3r5-hs-se.conf

diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..b752ee7e
--- /dev/null
+++ b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62xx LPSK HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-SE EVM (R5F core)
+
+# Booting HS-SE requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-hs-se"
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
diff --git a/conf/machine/am62xx-lp-evm-k3r5.conf b/conf/machine/am62xx-lp-evm-k3r5.conf
index ca4ced5a..0aaca286 100644
--- a/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -1,11 +1,19 @@
 #@TYPE: Machine
-#@NAME: AM62XX LP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
+#@NAME: AM62XX LP GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-gp"
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
+SYSFW_TIBOOT3_SYMLINK = ""
+
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am62xx-lp-evm.conf b/conf/machine/am62xx-lp-evm.conf
index ef8e8692..3230b84d 100644
--- a/conf/machine/am62xx-lp-evm.conf
+++ b/conf/machine/am62xx-lp-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: AM62XX LP EVM
 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
 
-require conf/machine/include/am62xx.inc
+require conf/machine/include/am62xx-lp.inc
 
 MACHINE_FEATURES += "gpu"
 
@@ -13,4 +13,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
+SPL_BINARY = "tispl.bin_HS"	
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
+
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/conf/machine/include/am62xx-lp.inc b/conf/machine/include/am62xx-lp.inc
new file mode 100644
index 00000000..c38de868
--- /dev/null
+++ b/conf/machine/include/am62xx-lp.inc
@@ -0,0 +1,18 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY_append = ":am62xx"
+
+MACHINE_FEATURES += "screen touchscreen"
+
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+TFA_K3_SYSTEM_SUSPEND = "1"
+
+# Default tiboot3.bin on AM62x LP is for HS-SE
+BBMULTICONFIG += "k3r5-hs-se"
+do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+
+TFA_BOARD = "lite"
+OPTEEMACHINE = "k3-am62x"
+OPTEEOUTPUTMACHINE = "k3"
diff --git a/conf/multiconfig/k3r5-hs-se.conf b/conf/multiconfig/k3r5-hs-se.conf
new file mode 100644
index 00000000..701f8e88
--- /dev/null
+++ b/conf/multiconfig/k3r5-hs-se.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE_append = "-hs-se"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 1b8530ec..0fb3a832 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -39,6 +39,7 @@ SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index e3c171dc..bb969da2 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -31,6 +31,10 @@ do_compile_append_am64xx-evm() {
 	tfa_sign_k3hs
 }
 
+do_compile_append_am62xx-lp-evm() {
+        tfa_sign_k3hs
+}
+
 do_compile_append_j7-hs-evm() {
 	tfa_sign_k3hs
 }
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 90f60980..7932e072 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -34,6 +34,7 @@ PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
 PACKAGECONFIG_append_aarch64 = " atf optee"
 PACKAGECONFIG_append_j7 = " dm"
 PACKAGECONFIG_append_am62xx = " dm"
+PACKAGECONFIG_append_am62xx-lp-evm = " dm"
 PACKAGECONFIG_append_am62axx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 751dc3d0..89a86a91 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -66,6 +66,10 @@ do_compile_append_am64xx-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_am62xx-lp-evm() {
+    optee_sign_k3hs
+}
+
 do_compile_append_j7-hs-evm() {
     optee_sign_k3hs
 }
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 59145740..47b29632 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -24,6 +24,7 @@ PLAT_SFX_j784s4-hs-evm = "j784s4"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
 PLAT_SFX_am62xx = "am62xx"
+PLAT_SFX_am62xx-lp-evm = "am62xx"
 PLAT_SFX_am62axx = "am62axx"
 
 FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
@@ -180,6 +181,15 @@ do_install_prepend_am62xx() {
         )
 }
 
+# AM62Q HS-SE support
+do_install_prepend_am62xx-lp-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
+}
+
 #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
 do_install() {
 
@@ -355,6 +365,13 @@ do_install_am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
 }
 
+do_install_am62xx-lp-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR} 
+}
+
 do_install_am62axx() {
     install -d ${LEGACY_IPC_FW_DIR}
     # DM+IPC Firmware
@@ -372,6 +389,11 @@ do_deploy_am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
 }
 
+do_deploy_am62xx-lp-evm() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
+}
+
 do_deploy_am62axx() {
     install -d ${DEPLOYDIR}
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
@@ -395,6 +417,11 @@ ALTERNATIVE_${PN}_am62xx = "\
                     am62-main-r5f0_0-fw \
                     "
 
+ALTERNATIVE_${PN}_am62xx-lp-evm = "\
+                    am62-mcu-m4f0_0-fw \
+                    am62-main-r5f0_0-fw \
+                    "
+
 ALTERNATIVE_${PN}_am62axx = "\
                     am62a-mcu-r5f0_0-fw \
                     am62a-c71_0-fw \
@@ -532,6 +559,9 @@ TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
 TARGET_MAIN_R5FSS0_0_am62xx = "am62-main-r5f0_0-fw"
 TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
 
+TARGET_MAIN_R5FSS0_0_am62xx-lp-evm = "am62-main-r5f0_0-fw"
+TARGET_MCU_M4FSS0_0_am62xx-lp-evm = "am62-mcu-m4f0_0-fw"
+
 TARGET_C7X_0_am62axx = "am62a-c71_0-fw"
 TARGET_MCU_R5F0_0_am62axx = "am62a-mcu-r5f0_0-fw"
 
-- 
2.17.1


