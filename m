Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1556FC02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:49:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.116224.1738676977089010135
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 05:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x8/Woun3;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514DnZ0W2402908
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 07:49:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738676975;
	bh=CGp+MjOU6QFcwCMpJEJHYHR0cPdzAy3NMVglodom1B8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x8/Woun3Se1arCDYKiQ0s64kvCEJzQK/7WYFjy6Hiy3RiWUHeusEKO0LPXDA3jxa3
	 OX/NQh1OW6BPh1eSVl8CYL8CkMSKKOhaB4d1ZG70YP18r2ORxiHHTwVlNWZmABYVWq
	 uwxveTIFy/3lkzJ0O2naz38LgnqS9nU0u5qUo8EY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514DnZE0068177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 07:49:35 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 07:49:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 07:49:35 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514DnY2l043506;
	Tue, 4 Feb 2025 07:49:35 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 2/3] meta-ti-bsp: Add Support for AM62L
Date: Tue, 4 Feb 2025 19:19:24 +0530
Message-ID: <20250204134925.968150-3-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204134925.968150-1-c-shilwant@ti.com>
References: <20250204134925.968150-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 13:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18257

- Add machine configuration for am62lxx-evm
- Add TFA, OPTEE, firmware & u-boot overrides

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf     | 16 ++++
 meta-ti-bsp/conf/machine/include/am62lxx.inc  | 14 ++++
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  2 +
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  6 ++
 .../trusted-firmware-a-ti.inc                 |  3 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 21 ++++++
 .../Add-initial-support-for-AM62Lx-SoC.patch  | 75 +++++++++++++++++++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 .../optee/optee-os_%.bbappend                 |  6 ++
 9 files changed, 144 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62Lx-SoC.patch

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
new file mode 100644
index 00000000..93ad0089
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -0,0 +1,16 @@
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
+KERNEL_DEVICETREE = " \
+    ti/k3-am62l.dtb \
+    ti/k3-am62l3-evm.dtb \
+"
+
+UBOOT_MACHINE = "am62lx_evm_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/conf/machine/include/am62lxx.inc
new file mode 100644
index 00000000..94eadd4b
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -0,0 +1,14 @@
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
+
+SERIAL_CONSOLES = "115200;ttyS2"
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
index e4a9c49b..9c7cae07 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,5 +8,8 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
+# For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
+TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
+
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 0e7e2c6e..80b79122 100644
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
+    for f in ${B}/${config}/tiboot3-*.bin; do
+                if [ -f "$f" ]; then
+            f_base=$(basename $f)
+                        install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
+            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+                fi
+    done
+}
+
 uboot_deploy:append:k3r5 () {
     for f in ${B}/tiboot3-*.bin; do
 		if [ -f "$f" ]; then
@@ -240,6 +253,14 @@ uboot_deploy:append:k3r5 () {
 	done
 }
 
+uboot_deploy:append:am62lxx () {
+    for f in ${B}/tiboot3*.bin; do
+                if [ -f "$f" ]; then
+                        install -m 644 $f ${DEPLOYDIR}/
+                fi
+    done
+}
+
 uboot_deploy_config:append () {
     cd ${DEPLOYDIR}
     if [ "x${SPL_UART_BINARY}" != "x" ]; then
diff --git a/meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62Lx-SoC.patch b/meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62Lx-SoC.patch
new file mode 100644
index 00000000..c0a42016
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62Lx-SoC.patch
@@ -0,0 +1,75 @@
+From 781cbb54ec52209af791aa5573b18b25cc0f4ca2 Mon Sep 17 00:00:00 2001
+From: Vignesh Raghavendra <vigneshr@ti.com>
+Date: Tue, 1 Oct 2024 10:30:11 +0530
+Subject: [PATCH] plat-k3: Add initial support for AM62Lx SoC
+
+AM62Lx newest among on the K3 class of SoCs designed to be low footprint
+system where DDR can be as small as 128M. Hence, move the DDR location
+to the beginning of DDR right after TF-A.
+
+Disable TI SCI, secure boot info and HW unique ID support for now, they
+will be incrementally at later point in time as the underlying
+communication layer is different than AM62x.
+
+This patch is posted upstream [1] & will be dropped once it's merged
+
+[1]: https://github.com/OP-TEE/optee_os/pull/7258
+
+Upstream-Status: Submitted
+
+Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+---
+ .github/workflows/ci.yml      | 2 ++
+ core/arch/arm/plat-k3/conf.mk | 5 +++++
+ core/arch/arm/plat-k3/main.c  | 2 ++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
+index 7df169729bf..b83d3b42f06 100644
+--- a/.github/workflows/ci.yml
++++ b/.github/workflows/ci.yml
+@@ -211,6 +211,8 @@ jobs:
+           _make PLATFORM=k3-am64x CFG_ARM64_core=y
+           _make PLATFORM=k3-am62x
+           _make PLATFORM=k3-am62x CFG_ARM64_core=y
++          _make PLATFORM=k3-am62lx
++          _make PLATFORM=k3-am62lx CFG_ARM64_core=y
+           _make PLATFORM=ti-dra7xx out/core/tee{,-pager,-pageable}.bin
+           _make PLATFORM=ti-am57xx
+           _make PLATFORM=ti-am43xx
+diff --git a/core/arch/arm/plat-k3/conf.mk b/core/arch/arm/plat-k3/conf.mk
+index 2fd235e22fb..217e28359e3 100644
+--- a/core/arch/arm/plat-k3/conf.mk
++++ b/core/arch/arm/plat-k3/conf.mk
+@@ -2,8 +2,13 @@ CFG_WITH_STATS ?= y
+ CFG_CRYPTO_WITH_CE ?= y
+ CFG_CONSOLE_UART ?= 0
+ 
++ifeq ($(PLATFORM_FLAVOR),am62lx)
++CFG_TZDRAM_START ?= 0x80200000
++CFG_TZDRAM_SIZE ?= 0x00400000 # 20MB
++else
+ CFG_TZDRAM_START ?= 0x9e800000
+ CFG_TZDRAM_SIZE ?= 0x01400000 # 20MB
++endif
+ CFG_SHMEM_START ?= ($(CFG_TZDRAM_START) + $(CFG_TZDRAM_SIZE))
+ CFG_SHMEM_SIZE ?= 0x00400000 # 4MB
+ 
+diff --git a/core/arch/arm/plat-k3/main.c b/core/arch/arm/plat-k3/main.c
+index ecfe4837d7a..d4561ae8492 100644
+--- a/core/arch/arm/plat-k3/main.c
++++ b/core/arch/arm/plat-k3/main.c
+@@ -49,6 +49,7 @@ void plat_console_init(void)
+ 	register_serial_console(&console_data.chip);
+ }
+ 
++#ifndef PLATFORM_FLAVOR_am62lx
+ static TEE_Result init_ti_sci(void)
+ {
+ 	TEE_Result ret = TEE_SUCCESS;
+@@ -105,3 +106,4 @@ TEE_Result tee_otp_get_hw_unique_key(struct tee_hw_unique_key *hwkey)
+ 
+ 	return TEE_SUCCESS;
+ }
++#endif
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
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 0cee127f..442c42ef 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -7,3 +7,9 @@ OPTEE_TI_OVERRIDES = ""
 OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
 
 require ${OPTEE_TI_OVERRIDES}
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI:append:am62lxx = " \
+    file://Add-initial-support-for-AM62Lx-SoC.patch \
+"
-- 
2.34.1


