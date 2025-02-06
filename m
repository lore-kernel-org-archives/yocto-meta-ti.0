Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0591C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:40:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.42567.1738852850882163077
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 06:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cm3Y4aA4;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Eense2746007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Feb 2025 08:40:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738852849;
	bh=Kk/JeSvaPkhR+1QsB8AjwNTKbLz/ZC85k9RM0hLMV+w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Cm3Y4aA4KX37LhvMt/nfxBnU6DMR6pqVOQV+31w/CnWf4+/nVe9bo5BqhyfIH3Bi/
	 9A/UxBceB9si/YziYkOKM+QRUWYpnyULBcwi/m3bimfKwDZQnBrF08PGZ+rgDtSBc/
	 baNMUKszS8nTuPs1Tp2pMGnXjox+wuscz7WdzggU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Een6N041433;
	Thu, 6 Feb 2025 08:40:49 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:40:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:40:49 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Eemtc070789;
	Thu, 6 Feb 2025 08:40:48 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v3 4/5] meta-ti-bsp: Add Support for AM62L
Date: Thu, 6 Feb 2025 20:10:20 +0530
Message-ID: <20250206144021.3007831-5-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206144021.3007831-1-c-shilwant@ti.com>
References: <20250206144021.3007831-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 14:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18284

- Add machine configuration for am62lxx-evm

- Add TFA, OPTEE, firmware & u-boot overrides

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf     | 13 ++++++++++++
 meta-ti-bsp/conf/machine/include/am62lxx.inc  | 12 +++++++++++
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  2 ++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  6 ++++++
 .../trusted-firmware-a-ti.inc                 |  3 +++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 21 +++++++++++++++++++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 7 files changed, 58 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
new file mode 100644
index 00000000..ff373238
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM62L EVM
+#@DESCRIPTION: Machine configuration for the TI AM62L EVM
+
+require conf/machine/include/am62lxx.inc
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am62l \
+"
+
+KERNEL_DEVICETREE = ""
+
+UBOOT_MACHINE = "am62lx_evm_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/conf/machine/include/am62lxx.inc
new file mode 100644
index 00000000..d3bc81df
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -0,0 +1,12 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append = ":am62lxx"
+
+MACHINE_FEATURES += "screen"
+
+# Default tiboot3.bin on AM62L is for HS-FS
+IMAGE_BOOT_FILES += "tiboot3-am62lx-hs-fs-evm.bin"
+
+TFA_BOARD = "am62l"
+TFA_K3_SYSTEM_SUSPEND = "1"
+
+OPTEEMACHINE = "k3-am62lx"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 0b6792b6..638138f4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -31,6 +31,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
+PLAT_SFX:am62lxx = "am62lxx"
 PLAT_SFX:am62pxx = "am62pxx"
 
 DM_FW_DIR = "ti-dm/${PLAT_SFX}"
@@ -50,6 +51,7 @@ DM_FW_LIST:am65xx =  ""
 DM_FW_LIST:am64xx =  ""
 DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
 DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
+DM_FW_LIST:am62lxx = ""
 DM_FW_LIST:am62pxx = "${DM_FIRMWARE}"
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 12292c88..0d724862 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -26,4 +26,10 @@ do_deploy:k3r5() {
 	install -m 644 ${S}/ti-sysfw/ti-fs-stub-firmware-* ${DEPLOYDIR}/ti-sysfw
 }
 
+do_deploy:am62lxx(){
+        install -d ${DEPLOYDIR}/ti-sysfw
+        install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
+        install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sysfw
+}
+
 addtask deploy before do_build after do_compile
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index c628eb15..9971e960 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -7,5 +7,8 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
+# For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
+TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
+
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 0e7e2c6e..41d4abdd 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -53,8 +53,10 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
+PLAT_SFX:am62lxx = "am62lxx"
 PLAT_SFX:am62pxx = "am62pxx"
 
+PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
 PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
 PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
@@ -68,6 +70,7 @@ PACKAGECONFIG:append:j722s = " dm"
 PACKAGECONFIG:append:j742s2 = " dm"
 PACKAGECONFIG:append:am62xx = " dm"
 PACKAGECONFIG:append:am62axx = " dm"
+PACKAGECONFIG:append:am62lxx = " ap-trusted-rom"
 PACKAGECONFIG:append:am62pxx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
@@ -226,6 +229,16 @@ uboot_deploy_config:append:k3r5 () {
 	done
 }
 
+uboot_deploy_config:append:am62lxx () {
+	for f in ${B}/${config}/tiboot3-*.bin; do
+		if [ -f "$f" ]; then
+			f_base=$(basename $f)
+			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
+			ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+		fi
+	done
+}
+
 uboot_deploy:append:k3r5 () {
     for f in ${B}/tiboot3-*.bin; do
 		if [ -f "$f" ]; then
@@ -240,6 +253,14 @@ uboot_deploy:append:k3r5 () {
 	done
 }
 
+uboot_deploy:append:am62lxx () {
+	for f in ${B}/tiboot3*.bin; do
+		if [ -f "$f" ]; then
+			install -m 644 $f ${DEPLOYDIR}/
+		fi
+	done
+}
+
 uboot_deploy_config:append () {
     cd ${DEPLOYDIR}
     if [ "x${SPL_UART_BINARY}" != "x" ]; then
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index f131f1ff..5756f3ff 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -6,6 +6,7 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
-- 
2.34.1


