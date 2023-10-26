Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DB6C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 22:39:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.214122.1698359973556877697
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 15:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z+shucMO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39QMdVi3017377;
	Thu, 26 Oct 2023 17:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698359971;
	bh=ou//goaAiR5C6CfMNJa3SRSnlYCXqbdZ5pRpTpA+wPU=;
	h=From:To:Subject:Date;
	b=Z+shucMOpghZAtErBoUobVcDCaq9Pg7VCtmZVrOblsuYchsfzYfN8PExnaRDl2B2Q
	 To+pE1GLgburNJtb5zOiXPwFWBnfT768dm4kPZK5qxTLzYcWydUxjj9aDcHcqXGlnI
	 ri8HErKb30+f9xh8D9lqFVmFdH0zpy+Pc8QBdbLU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39QMdVNm048068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Oct 2023 17:39:31 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Oct 2023 17:39:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Oct 2023 17:39:31 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39QMdVrr114367;
	Thu, 26 Oct 2023 17:39:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qw90k-0001mP-VS; Thu, 26 Oct 2023 17:39:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Add Support for am62pxx-evm
Date: Thu, 26 Oct 2023 17:39:30 -0500
Message-ID: <20231026223930.5086-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Oct 2023 22:39:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17198

From: Chirag Shilwant <c-shilwant@ti.com>

- Add A53 and R5 machine configurations for am62pxx-evm.
- Add firmware overrides.
- Add u-boot overrides.
- Add cnm-wave support.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../conf/machine/am62pxx-evm-k3r5.conf        | 11 +++++++++++
 meta-ti-bsp/conf/machine/am62pxx-evm.conf     | 13 +++++++++++++
 meta-ti-bsp/conf/machine/include/am62pxx.inc  | 19 +++++++++++++++++++
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  5 +++++
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  2 ++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 ++
 .../recipes-security/optee/optee-os-ti.inc    |  1 +
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 19 +++++++++++++++++++
 9 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62pxx.inc

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
new file mode 100644
index 00000000..33254bf2
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62PX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62px"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am62px_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
new file mode 100644
index 00000000..c0c62592
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM62PX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62PX EVM
+
+require conf/machine/include/am62pxx.inc
+
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am62p5"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am62p5-sk.dtb \
+"
+
+UBOOT_MACHINE = "am62px_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
new file mode 100644
index 00000000..d61ad62b
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append = ":am62pxx"
+
+MACHINE_FEATURES += "screen gpu"
+
+require conf/machine/include/mesa-pvr.inc
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+
+# Default tiboot3.bin on AM62Px is for HS-FS
+IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
+
+TFA_BOARD = "lite"
+TFA_K3_SYSTEM_SUSPEND = "1"
+
+OPTEEMACHINE = "k3-am62px"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
+
+SERIAL_CONSOLES = "115200;ttyS2"
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index a667d335..e35decee 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx"
+COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx|am62pxx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 49638ee9..8a52a800 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -31,6 +31,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
+PLAT_SFX:am62pxx = "am62pxx"
 
 DM_FW_DIR = "ti-dm/${PLAT_SFX}"
 
@@ -47,6 +48,7 @@ DM_FW_LIST:am65xx =  ""
 DM_FW_LIST:am64xx =  ""
 DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
 DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
+DM_FW_LIST:am62pxx = "${DM_FIRMWARE}"
 
 do_install() {
     # Sign the firmware
@@ -77,6 +79,7 @@ do_deploy() {
 
 # Set up names for the firmwares
 ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
+ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
@@ -85,6 +88,7 @@ ALTERNATIVE:${PN}:j784s4  = "j784s4-mcu-r5f0_0-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62p-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62p-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62a-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62a-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
@@ -93,6 +97,7 @@ ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j
 
 # Create the firmware alternatives
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[am62p-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw]     = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index e1d442d3..b343d268 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -30,6 +30,7 @@ PLAT_SFX:j784s4 = "j784s4"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
+PLAT_SFX:am62pxx = "am62pxx"
 PLAT_SFX:am62axx = "am62axx"
 
 ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
@@ -46,6 +47,7 @@ ETH_FW_LIST:j784s4 =  "${ETH_FW}"
 ETH_FW_LIST:am65xx =  ""
 ETH_FW_LIST:am64xx =  ""
 ETH_FW_LIST:am62xx =  ""
+ETH_FW_LIST:am62pxx =  ""
 ETH_FW_LIST:am62axx = ""
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 80e0e8df..2f15c4fb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -44,6 +44,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
+PLAT_SFX:am62pxx = "am62pxx"
 
 PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
@@ -56,6 +57,7 @@ PACKAGECONFIG:append:j721s2 = " dm"
 PACKAGECONFIG:append:j784s4 = " dm"
 PACKAGECONFIG:append:am62xx = " dm"
 PACKAGECONFIG:append:am62axx = " dm"
+PACKAGECONFIG:append:am62pxx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index 763dd1d5..91b66a36 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -7,6 +7,7 @@ inherit ti-secdev
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 751b10d6..3e2e2ada 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -21,6 +21,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
+PLAT_SFX:am62pxx = "am62pxx"
 
 FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -56,6 +57,7 @@ IPC_FW_LIST = ""
 IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
 IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW}"
 IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
+IPC_FW_LIST:am62pxx =  "                            ${MCU_2_0_FW}"
 IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
 IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
 IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
@@ -80,6 +82,13 @@ do_install:prepend:am62xx() {
         )
 }
 
+# Update the am62pxx ipc binaries to be consistent with other platforms
+do_install:prepend:am62pxx() {
+        ( cd ${S}/${IPC_FW_DIR}; \
+                ln -sf am62p-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
+        )
+}
+
 # Update the am62axx ipc binaries to be consistent with other platforms
 do_install:prepend:am62axx() {
         ( cd ${S}/${IPC_FW_DIR}; \
@@ -122,6 +131,10 @@ ALTERNATIVE:${PN}:am62xx = "\
                     am62-main-r5f0_0-fw   am62-main-r5f0_0-fw-sec \
                     "
 
+ALTERNATIVE:${PN}:am62pxx = "\
+                    am62p-mcu-r5f0_0-fw   am62p-mcu-r5f0_0-fw-sec \
+                    "
+
 ALTERNATIVE:${PN}:am62axx = "\
                     am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
                     am62a-c71_0-fw        am62a-c71_0-fw-sec \
@@ -191,6 +204,9 @@ ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw-sec] = "${nonarch_base_libdir}/firmware
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw-sec"
 
+ALTERNATIVE_LINK_NAME[am62p-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62p-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62p-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62p-mcu-r5f0_0-fw-sec"
+
 ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-mcu-r5f0_0-fw-sec"
 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
@@ -281,6 +297,9 @@ ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
 
+ALTERNATIVE_TARGET[am62p-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62p-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+
 ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
 ALTERNATIVE_TARGET[am62a-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
-- 
2.17.1


