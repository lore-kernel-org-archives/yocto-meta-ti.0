Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82F7C636D3
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 23:46:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2039.1675122395184168777
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 15:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 309E840BEB;
	Mon, 30 Jan 2023 23:46:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4AXEQG80FpD; Mon, 30 Jan 2023 23:46:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 109EB408CD;
	Mon, 30 Jan 2023 23:46:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A90C5163712; Mon, 30 Jan 2023 18:46:11 -0500 (EST)
Date: Mon, 30 Jan 2023 18:46:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] meta-ti-bsp: add
 BeagleBone AI-64 support
Message-ID: <20230130234611.GM22689@denix.org>
References: <20230126014311.3879336-1-denis@denix.org>
 <1bc3c5a9-1747-c486-ee4f-c4c243f0a386@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bc3c5a9-1747-c486-ee4f-c4c243f0a386@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 23:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15711

On Mon, Jan 30, 2023 at 05:01:22PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> On 1/25/2023 19:43, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >BeagleBone AI-64 (https://beagleboard.org/ai-64) uses Texas Instruments
> >Jacinto TDA4VM/J721e SoC. Officially BeagleBone AI-64 supports Debian
> >Linux and builds its BSP on top of meta-ti and TI SDK, but adds custom
> >DTBs and DTBO overlays, plus integrates other drivers and features.
> >
> >Let's add corresponding recipes for beagleboard.org kernel and u-boot
> >along with the BeagleBone AI-64 machine config.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >RFC -> v1:
> >* sort KERNEL_DEVICETREE list
> >* stick to ttyS2 for the console
> >* add patch description
> >* minor cleanups in the config files
> >* tested by building and booting core-image-minimal
> >
> >  .../conf/machine/beaglebone-ai64-k3r5.conf    | 22 ++++++
> >  meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 79 +++++++++++++++++++
> >  .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 +
> >  .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   | 14 ++++
> >  .../recipes-kernel/linux/linux-bb.org_git.bb  | 35 ++++++++
> >  5 files changed, 153 insertions(+)
> >  create mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> >  create mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> >
> >diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> >new file mode 100644
> >index 00000000..21b8702b
> >--- /dev/null
> >+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> >@@ -0,0 +1,22 @@
> >+#@TYPE: Machine
> >+#@NAME: BeagleBone AI-64 (R5F)
> >+#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
> >+
> >+require conf/machine/include/k3r5.inc
> >+
> >+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> >+PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> >+
> >+SYSFW_SOC = "j721e"
> >+SYSFW_CONFIG = "evm"
> >+SYSFW_SUFFIX = "gp"
> >+
> >+SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
> >+SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
> >+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> >+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> >+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> >+
> >+UBOOT_MACHINE = "j721e_evm_r5_defconfig"
> >+
> >+TI_SECURE_DEV_PKG_K3 = "none"
> >diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >new file mode 100644
> >index 00000000..6e8c863c
> >--- /dev/null
> >+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >@@ -0,0 +1,79 @@
> >+#@TYPE: Machine
> >+#@NAME: BeagleBone AI-64 (A72)
> >+#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board (A72 core)
> >+
> >+require conf/machine/include/j721e.inc
> >+
> >+SERIAL_CONSOLES = "115200;ttyS2"
> >+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >+
> >+UBOOT_MACHINE = "j721e_evm_a72_config"
> >+
> >+PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> >+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> >+PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> >+
> >+KERNEL_DEVICETREE = " \
> >+ti/k3-j721e-beagleboneai64.dtb \
> 
> This is not building correctly.  The above file does not appear to
> exist in the repo.  I get this error:
> 
> make[2]: *** No rule to make target
> 'arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb'.  Stop.

Your setup, full log?
Doesn't appear you are building linux-bb.org kernel...
https://git.beagleboard.org/beagleboard/linux/-/blob/5.10-arm64/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts


> >+ti/k3-j721e-beagleboneai64-no-shared-mem.dtb \
> >+ti/k3-j721e-common-proc-board.dtb \
> >+ti/k3-j721e-common-proc-board-infotainment.dtbo \
> >+ti/k3-j721e-cpb-csi2-ov5640.dtbo \
> >+ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
> >+ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
> >+ti/k3-j721e-fpdlink-sk-fusion.dtbo \
> >+ti/k3-j721e-gesi-exp-board.dtbo \
> >+ti/k3-j721e-proc-board-tps65917.dtb \
> >+ti/k3-j721e-quad-port-eth-exp.dtbo \
> >+ti/k3-j721e-sk-csi2-ov5640.dtbo \
> >+ti/k3-j721e-sk.dtb \
> >+ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
> >+ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
> >+ti/overlays/BBAI64-CSI0-imx219.dtbo \
> >+ti/overlays/BBAI64-CSI1-imx219.dtbo \
> >+ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
> >+ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
> >+ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
> >+ti/overlays/BB-I2C2-MPU6050.dtbo \
> >+ti/overlays/BBORG_LOAD-00A2.dtbo \
> >+ti/overlays/BBORG_RELAY-00A2.dtbo \
> >+ti/overlays/BBORG_SERVO-00A2.dtbo \
> >+ti/overlays/BONE-FAN.dtbo \
> >+ti/overlays/BONE-I2C1.dtbo \
> >+ti/overlays/BONE-I2C2.dtbo \
> >+ti/overlays/BONE-I2C3.dtbo \
> >+ti/overlays/BONE-LED_P8_03.dtbo \
> >+ti/overlays/BONE-LED_P9_11.dtbo \
> >+ti/overlays/BONE-PWM0.dtbo \
> >+ti/overlays/BONE-PWM1.dtbo \
> >+ti/overlays/BONE-PWM2.dtbo \
> >+ti/overlays/BONE-SPI0_0.dtbo \
> >+ti/overlays/BONE-SPI0_1.dtbo \
> >+ti/overlays/BONE-UART1.dtbo \
> >+ti/overlays/BONE-USB0-host.dtbo \
> >+ti/overlays/J721E-PRU-UIO-00A0.dtbo \
> >+ti/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtbo \
> >+ti/overlays/robotics-cape.dtbo \
> >+"
> >+
> >+IMAGE_BOOT_FILES += "sysfw.itb"
> >+
> >+MACHINE_GUI_CLASS = "bigscreen"
> >+MACHINE_FEATURES += "screen"
> >+
> >+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> >diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >index c99cd660..8fbb0fcb 100644
> >--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >@@ -9,6 +9,7 @@ DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 = "virtual/bootloader"
> >  DEPENDS:remove:j721e-evm-k3r5 = "virtual/bootloader"
> >  DEPENDS:remove:j721e-hs-evm-k3r5 = "virtual/bootloader"
> >  DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 = "virtual/bootloader"
> >+DEPENDS:remove:beaglebone-ai64-k3r5 = "virtual/bootloader"
> >  DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> >  CLEANBROKEN = "1"
> >@@ -31,6 +32,7 @@ SYSFW_PREFIX = "sci"
> >  SYSFW_PREFIX:j721e-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:j721e-hs-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 = "fs"
> >+SYSFW_PREFIX:beaglebone-ai64-k3r5 = "fs"
> >  SYSFW_PREFIX:j7200-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:j7200-hs-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:j721s2-evm-k3r5 = "fs"
> >@@ -68,6 +70,7 @@ EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5-sr2 = "SBL="${STAGING_DIR_HOST}/boot/u-bo
> >  EXTRA_OEMAKE:remove:j721e-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >  EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >  EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5-sr1-1 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >+EXTRA_OEMAKE:remove:beaglebone-ai64-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> >  do_compile() {
> >  	cd ${WORKDIR}/imggen/
> >diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> >new file mode 100644
> >index 00000000..28a347be
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> >@@ -0,0 +1,14 @@
> >+require u-boot-ti.inc
> >+
> >+SUMMARY = "BeagleBoard.org U-Boot"
> >+
> >+COMPATIBLE_MACHINE = "beagle.*"
> >+
> >+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> >+
> >+PV = "2021.01"
> >+
> >+UBOOT_GIT_URI = "git://git.beagleboard.org/beagleboard/u-boot.git"
> >+UBOOT_GIT_PROTOCOL = "https"
> >+BRANCH = "v2021.01-ti-08.05.00.005-SDK-8.5"
> >+SRCREV = "46ff4982b41067e5c93369bddd49b1541856d80b"
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> >new file mode 100644
> >index 00000000..2e0f2448
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> >@@ -0,0 +1,35 @@
> >+SECTION = "kernel"
> >+SUMMARY = "BeagleBoard.org Linux kernel"
> >+LICENSE = "GPL-2.0-only"
> >+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >+
> >+COMPATIBLE_MACHINE = "beagle.*"
> >+
> >+inherit kernel
> >+
> >+require recipes-kernel/linux/ti-kernel.inc
> >+
> >+DEPENDS += "gmp-native libmpc-native"
> >+
> >+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+# 5.10.145 version
> >+SRCREV = "9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6"
> >+PV = "5.10.145+git${SRCPV}"
> >+BRANCH = "5.10"
> >+
> >+# 5.10.153 version
> >+SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
> >+PV:k3 = "5.10.153+git${SRCPV}"
> >+BRANCH:k3 = "5.10-arm64"
> >+
> >+SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH}"
> >+
> >+DEFCONFIG_NAME = "bb.org_defconfig"
> >+KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
> >+
> >+kernel_do_compile:append() {
> >+	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> >+}

