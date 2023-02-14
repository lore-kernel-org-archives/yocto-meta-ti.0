Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DA2C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 11:48:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4734.1676375313617259358
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 03:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=imIB6fP3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EBmSHF061572;
	Tue, 14 Feb 2023 05:48:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676375308;
	bh=4cCoB4a8H8cZRJA9y5u/H9Vsq/bamVBPhu1YL2MZYbM=;
	h=From:To:CC:Subject:Date;
	b=imIB6fP3mb6LkIXHXyqKQdAWVL8zd7KsPASt4an+siNfXNEjffIARfwJshI0pyI1D
	 w08xBF9xDqPsqn9MGeuGcDoahXcg3FeoshClHAsCJUauUywAWWCJfXqIZsGF5ixaGy
	 fY6j8wdwiaOvAzfI+9gAvVH/vmNrkKJfZAT93zaE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EBmSCJ100428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 05:48:28 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 05:48:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 05:48:27 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EBmQRg008572;
	Tue, 14 Feb 2023 05:48:27 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH] am62axx-evm: Add AM62A HS-FS evm configuration
Date: Tue, 14 Feb 2023 17:18:24 +0530
Message-ID: <20230214114824.3863393-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 11:48:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15834

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Lets add the basic AM62A configuration
- Add machine conf for AM62A.
- The wic images will boot on AM62A HS-FS devices by default. The sysfw image for GP and HS-SE will be packaged in the wic image as tiboot3-am62ax-gp-evm.bin and tiboot3-am62ax-hs-evm.bin respectively.
- Add ti-sci-firmware overrides.
- Sign ATF, OPTEE and RTOS Firmware.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 conf/machine/am62axx-evm-k3r5-gp.conf         | 19 ++++++++++++++++
 conf/machine/am62axx-evm-k3r5-hs-fs.conf      | 14 ++++++++++++
 conf/machine/am62axx-evm-k3r5-hs-se.conf      | 22 +++++++++++++++++++
 conf/machine/am62axx-evm-k3r5.conf            | 11 ----------
 conf/machine/am62axx-evm.conf                 |  4 ++++
 conf/machine/include/am62axx.inc              | 18 +++++++++++++--
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  4 +++-
 .../trusted-firmware-a_%.bbappend             |  4 ++++
 recipes-security/optee/optee-os_%.bbappend    |  4 ++++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 16 ++++++++++++++
 10 files changed, 102 insertions(+), 14 deletions(-)
 create mode 100644 conf/machine/am62axx-evm-k3r5-gp.conf
 create mode 100644 conf/machine/am62axx-evm-k3r5-hs-fs.conf
 create mode 100644 conf/machine/am62axx-evm-k3r5-hs-se.conf
 delete mode 100644 conf/machine/am62axx-evm-k3r5.conf

diff --git a/conf/machine/am62axx-evm-k3r5-gp.conf b/conf/machine/am62axx-evm-k3r5-gp.conf
new file mode 100644
index 00000000..962413c3
--- /dev/null
+++ b/conf/machine/am62axx-evm-k3r5-gp.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@NAME: AM62A GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A GP EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62ax"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+SYSFW_TIBOOT3_SYMLINK = ""
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am62axx-evm-k3r5-hs-fs.conf b/conf/machine/am62axx-evm-k3r5-hs-fs.conf
new file mode 100644
index 00000000..2d69d06c
--- /dev/null
+++ b/conf/machine/am62axx-evm-k3r5-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62A HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A HS-FS EVM (R5F core)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-hs-fs"
+
+SYSFW_SOC = "am62ax"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
diff --git a/conf/machine/am62axx-evm-k3r5-hs-se.conf b/conf/machine/am62axx-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..c828606c
--- /dev/null
+++ b/conf/machine/am62axx-evm-k3r5-hs-se.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: AM62A HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A HS-SE EVM (R5F core)
+
+# Booting HS-SE requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-hs-se"
+
+SYSFW_SOC = "am62ax"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+SYSFW_TIBOOT3_SYMLINK = ""
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am62axx-evm-k3r5.conf b/conf/machine/am62axx-evm-k3r5.conf
deleted file mode 100644
index ca30537f..00000000
--- a/conf/machine/am62axx-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62AXX EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am62ax"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
index e7a59d2e..9dcb6e55 100644
--- a/conf/machine/am62axx-evm.conf
+++ b/conf/machine/am62axx-evm.conf
@@ -23,3 +23,7 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
+
+SPL_BINARY = "tispl.bin_HS"
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/include/am62axx.inc b/conf/machine/include/am62axx.inc
index 383d1c3f..6ee3accc 100644
--- a/conf/machine/include/am62axx.inc
+++ b/conf/machine/include/am62axx.inc
@@ -8,8 +8,22 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+# Default tiboot3.bin on AM62A is for HS-FS
+BBMULTICONFIG = "k3r5-hs-fs"
+do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
+BBMULTICONFIG += "k3r5-gp"
+IMAGE_BOOT_FILES += " tiboot3-am62ax-gp-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
+BBMULTICONFIG += "k3r5-hs-se"
+IMAGE_BOOT_FILES += " tiboot3-am62ax-hs-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 7896c366..f266d2df 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -41,7 +41,9 @@ SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
-SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
+SYSFW_PREFIX_am62axx-evm-k3r5-gp = "fs"
+SYSFW_PREFIX_am62axx-evm-k3r5-hs-fs = "fs"
+SYSFW_PREFIX_am62axx-evm-k3r5-hs-se = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 41071676..70406724 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -39,6 +39,10 @@ do_compile_append_am62xx-lp-evm() {
         tfa_sign_k3hs
 }
 
+do_compile_append_am62axx-evm() {
+        tfa_sign_k3hs
+}
+
 do_compile_append_j7-hs-evm() {
 	tfa_sign_k3hs
 }
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 5c6c9d4a..7a22b1d7 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -80,6 +80,10 @@ do_compile_append_am62xx-lp-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_am62axx-evm() {
+    optee_sign_k3hs
+}
+
 do_compile_append_j7-hs-evm() {
     optee_sign_k3hs
 }
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 982171e6..e2703070 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -186,6 +186,20 @@ do_install_prepend_am62xx() {
         )
 }
 
+do_install_prepend_am62axx-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh am62a-mcu-r5f0_0-fw \
+                    am62a-mcu-r5f0_0-fw.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
+                    ipc_echo_test_c7x_1_release_strip.xe71.signed; \
+        )
+}
+
 #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
 do_install() {
 
@@ -367,8 +381,10 @@ do_install_am62axx() {
     install -d ${LEGACY_IPC_FW_DIR}
     # DM+IPC Firmware
     install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw.signed ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
 }
 
 do_deploy() {
-- 
2.34.1


