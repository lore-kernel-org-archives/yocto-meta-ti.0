Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081F9E77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:32:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8518.1734132729145336173
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 15:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DFDD540CC5;
	Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjGGvGQpXelS; Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2A3C40CCB;
	Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9D948164130;
	Fri, 13 Dec 2024 18:32:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 11/12] beagle-bsp, linux-bb.org, u-boot-bb.org: add support for 6.6 BSP
Date: Fri, 13 Dec 2024 18:32:02 -0500
Message-Id: <20241213233203.2688541-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213233203.2688541-1-denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 23:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18117

From: Denys Dmytriyenko <denys@konsulko.com>

Most Beagle platforms are switching to 6.6 based Linux kernel and U-boot
2024.10. Add corresponding recipes and extend beagle-bsp with required
settings.

BeagleY-AI for now remains on 6.1 BSP with U-boot 2023.04.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
Changes since RFC v2:
* bump kernel to 6.6.58 for 64-bit platforms
* add 6.6.32 for 32-bit platforms
* replace upstream 2024.07 u-boot with bb.org 2024.10
* make 6.6 the default for most platforms, except BeagleY-AI
* correct some leftovers of the old :bsp-bb_org override
* refresh device tree lists
* revise u-boot defconfig and config fragment selection
* apply required SWIG patch from meta-ti-bsp to u-boot recipe
* use unsigned SPL binaries

 meta-beagle/conf/machine/beagle-x15.conf      |  2 +-
 .../conf/machine/beaglebone-ai64-k3r5.conf    |  8 ++-
 meta-beagle/conf/machine/beaglebone-ai64.conf | 19 ++++--
 meta-beagle/conf/machine/beaglebone.conf      |  2 +-
 meta-beagle/conf/machine/beagleplay-k3r5.conf |  5 +-
 meta-beagle/conf/machine/beagleplay.conf      | 37 +++++++++-
 meta-beagle/conf/machine/beagley-ai-k3r5.conf |  4 +-
 meta-beagle/conf/machine/beagley-ai.conf      |  6 +-
 .../conf/machine/include/beagle-bsp.inc       | 47 +++++++++----
 .../u-boot/u-boot-bb.org_2024.10.bb           | 14 ++++
 .../linux/linux-bb.org-6.6/defconfig          |  1 +
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 68 +++++++++++++++++++
 12 files changed, 182 insertions(+), 31 deletions(-)
 create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.=
bb
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/def=
config
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/=
machine/beagle-x15.conf
index e9ab5d40..8ad028f4 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -7,7 +7,7 @@ require conf/machine/include/beagle-bsp.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
-DT_VENDOR_PREFIX:bsp-bb_org =3D ""
+DT_VENDOR_PREFIX:bsp-bb_org-6_1 =3D ""
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
 ${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-be=
agle/conf/machine/beaglebone-ai64-k3r5.conf
index 95d3abc0..4574f82b 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -15,8 +15,10 @@ UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
 UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
=20
-UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_6 =3D "j721e_beagleboneai64_r5_defconfig"
+UBOOT_MACHINE =3D "j721e_beagleboneai64_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "j721e_beagleboneai64_r5.config"
+UBOOT_MACHINE:bsp-ti-6_1 =3D "j721e_evm_r5_defconfig"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "j721e_beagleboneai64_r5.config"
+
+UBOOT_MACHINE:bsp-bb_org-6_1 =3D "j721e_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "j721e_beagleboneai64_r5.confi=
g"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/=
conf/machine/beaglebone-ai64.conf
index faffd0bb..a521c8cf 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -5,18 +5,25 @@
 require conf/machine/include/j721e.inc
 require conf/machine/include/beagle-bsp.inc
=20
-IMAGE_SR1_1_HS_FS_FILES:bsp-bb_org =3D ""
-IMAGE_SR2_HS_SE_FILES:bsp-bb_org =3D ""
+IMAGE_SR1_1_HS_FS_FILES =3D ""
+IMAGE_SR1_1_HS_SE_FILES =3D ""
+IMAGE_SR2_HS_FS_FILES =3D ""
+IMAGE_SR2_HS_SE_FILES =3D ""
=20
-UBOOT_MACHINE =3D "j721e_evm_a72_config"
-UBOOT_MACHINE:bsp-ti-6_6 =3D "j721e_beagleboneai64_a72_defconfig"
+UBOOT_MACHINE =3D "j721e_beagleboneai64_a72_defconfig"
=20
+UBOOT_MACHINE:bsp-ti-6_1 =3D "j721e_evm_a72_config"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "j721e_beagleboneai64_a72.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "j721e_beagleboneai64_a72.config"
+
+UBOOT_MACHINE:bsp-bb_org-6_1 =3D "j721e_evm_a72_config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "j721e_beagleboneai64_a72.conf=
ig"
=20
 SPL_BINARY:bsp-ti-6_6 =3D "tispl.bin_unsigned"
 SPL_BINARYNAME:bsp-ti-6_6 =3D "tispl.bin"
=20
+SPL_BINARY:bsp-bb_org-6_6 =3D "tispl.bin_unsigned"
+SPL_BINARYNAME:bsp-bb_org-6_6 =3D "tispl.bin"
+
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-j721e \
 "
@@ -29,7 +36,7 @@ ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
 ti/k3-j721e-sk.dtb \
 "
=20
-KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
+KERNEL_DEVICETREE:append:bsp-bb_org-6_1 =3D " \
 ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
 ti/k3-j721e-common-proc-board-infotainment.dtbo \
 ti/k3-j721e-evm-csi2-ov5640.dtbo \
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/=
machine/beaglebone.conf
index 6048383b..456da618 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -7,7 +7,7 @@ require conf/machine/include/beagle-bsp.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
-DT_VENDOR_PREFIX:bsp-bb_org =3D ""
+DT_VENDOR_PREFIX:bsp-bb_org-6_1 =3D ""
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
 ${DT_VENDOR_PREFIX}am335x-bone \
diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/=
conf/machine/beagleplay-k3r5.conf
index 1423aa10..3e7f0c1b 100644
--- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
+++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
@@ -3,6 +3,9 @@
 #@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
=20
 require conf/machine/beagleplay-ti-k3r5.conf
+
 require conf/machine/include/beagle-bsp.inc
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_r5.config"
+UBOOT_MACHINE:bsp-bb_org-6_6 =3D "am62x_beagleplay_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/=
machine/beagleplay.conf
index 1977b4c1..b1a463e1 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -3,11 +3,17 @@
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
=20
 require conf/machine/beagleplay-ti.conf
+
 require conf/machine/include/beagle-bsp.inc
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am625_beagleplay_a53.config"
+UBOOT_MACHINE:bsp-bb_org-6_6 =3D "am62x_beagleplay_a53_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am625_beagleplay_a53.config"
+
+SPL_BINARY:bsp-bb_org-6_6 =3D "tispl.bin_unsigned"
+SPL_BINARYNAME:bsp-bb_org-6_6 =3D "tispl.bin"
=20
-KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
+KERNEL_DEVICETREE:append:bsp-bb_org-6_1 =3D " \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
 ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
@@ -43,3 +49,30 @@ ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
 ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
 ti/k3-am62x-sk-mcan.dtbo \
 "
+
+KERNEL_DEVICETREE:append:bsp-bb_org-6_6 =3D " \
+ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-beagleplay.dtb \
+ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-minimal.dtb \
+ti/k3-am625-sk.dtb \
+ti/k3-am625-sk-ecap-capture.dtbo \
+ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk-m2-cc3301.dtbo \
+ti/k3-am625-sk-mcspi-loopback.dtbo \
+ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
+ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
+ti/k3-am62x-sk-csi2-imx219.dtbo \
+ti/k3-am62x-sk-csi2-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
+ti/k3-am62x-sk-dmtimer-pwm.dtbo \
+ti/k3-am62x-sk-eqep.dtbo \
+ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
+ti/k3-am62x-sk-hdmi-audio.dtbo \
+ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
+ti/k3-am62x-sk-mcan.dtbo \
+ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
+ti/k3-am62x-sk-pwm.dtbo \
+"
diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/=
conf/machine/beagley-ai-k3r5.conf
index 87462e72..6cc370d1 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -3,6 +3,8 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
=20
 require conf/machine/include/k3r5.inc
+
+TI_PREFERRED_BSP ?=3D "bb_org-6_1"
 require conf/machine/include/beagle-bsp.inc
=20
 SYSFW_SOC =3D "j722s"
@@ -11,4 +13,4 @@ SYSFW_SUFFIX =3D "hs-fs"
=20
 UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am67a_beagley_ai_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/=
machine/beagley-ai.conf
index 8dcc9b14..9b1832d2 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -3,11 +3,13 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
=20
 require conf/machine/include/j722s.inc
+
+TI_PREFERRED_BSP ?=3D "bb_org-6_1"
 require conf/machine/include/beagle-bsp.inc
=20
 UBOOT_MACHINE =3D "j722s_evm_a53_config"
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am67a_beagley_ai_a53.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am67a_beagley_ai_a53.config"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-j722s \
@@ -15,7 +17,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
=20
 KERNEL_DEVICETREE =3D ""
=20
-KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
+KERNEL_DEVICETREE:append:bsp-bb_org-6_1 =3D " \
 ti/k3-j722s-evm.dtb \
 ti/k3-am67a-beagley-ai.dtb \
 "
diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index 77d0b483..34889b41 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -1,24 +1,43 @@
 # Use meta-ti-bsp "multi-BSP" facility to create a custom "bb_org" BSP p=
rofile
 # with default preferences for Beagle platforms
=20
-# Default is bb_org, but can override with any of the existing options
-TI_PREFERRED_BSP ?=3D "bb_org"
+# Default is bb_org-6_6, but can override with any of the existing optio=
ns
+TI_PREFERRED_BSP ?=3D "bb_org-6_6"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-# bb_org
+# bb_org-6_1
 # BeagleBoard.org kernel 6.1, u-boot 2023.04
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-BSP_KERNEL_PROVIDER:bsp-bb_org =3D "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org =3D "%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org =3D "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org =3D "%"
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_1 =3D "6.1.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 =3D "2023.%"
=20
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org =3D "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org =3D "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org =3D "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# bb_org-6_6
+# BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_6 =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_6 =3D "6.6.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 =3D "2024.%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "24%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "23%"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
new file mode 100644
index 00000000..389893b0
--- /dev/null
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -0,0 +1,14 @@
+require recipes-bsp/u-boot/u-boot-ti.inc
+
+SUMMARY =3D "BeagleBoard.org U-Boot"
+
+COMPATIBLE_MACHINE =3D "beagle.*"
+
+PV =3D "2024.10"
+
+SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
+
+UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
+UBOOT_GIT_PROTOCOL =3D "https"
+BRANCH =3D "v2024.10-Beagle"
+SRCREV =3D "bf0e9d0b7274d2b561bd24c858affec2038250f9"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig =
b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig
new file mode 100644
index 00000000..a5de2e24
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig
@@ -0,0 +1 @@
+use-kernel-config=3Dbb.org_defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
new file mode 100644
index 00000000..bf8f8a24
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -0,0 +1,68 @@
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
+
+SECTION =3D "kernel"
+SUMMARY =3D "BeagleBoard.org Linux kernel"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+
+COMPATIBLE_MACHINE =3D "beagle.*"
+
+inherit kernel
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/ti-kernel.inc
+
+DEPENDS +=3D "gmp-native libmpc-native"
+
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
+
+# Extra DT overlays/capes
+KERNEL_DEVICETREE:append:armv7a =3D " \
+${DT_VENDOR_PREFIX}AM335X-PRU-UIO-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-ADC-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BBBW-WL1835-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BBGG-WL1835-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BBGW-WL1835-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-4D5R-01-00A1.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-eMMC1-01-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-LCD4-01-00A1.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-NH7C-01-A0.dtbo \
+${DT_VENDOR_PREFIX}BB-CAPE-DISP-CT4-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-HDMI-TDA998x-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C1-MCP7940X-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C1-RTC-DS3231.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C1-RTC-PCF8563.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C2-BME680.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C2-MPU6050.dtbo \
+${DT_VENDOR_PREFIX}BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-NHDMI-TDA998x-00A0.dtbo \
+${DT_VENDOR_PREFIX}BBORG_COMMS-00A2.dtbo \
+${DT_VENDOR_PREFIX}BBORG_FAN-A000.dtbo \
+${DT_VENDOR_PREFIX}BBORG_RELAY-00A2.dtbo \
+${DT_VENDOR_PREFIX}BB-SPIDEV0-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-SPIDEV1-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-UART1-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-UART2-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-UART4-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-W1-P9.12-00A0.dtbo \
+${DT_VENDOR_PREFIX}BONE-ADC.dtbo \
+${DT_VENDOR_PREFIX}M-BB-BBG-00A0.dtbo \
+${DT_VENDOR_PREFIX}M-BB-BBGG-00A0.dtbo \
+${DT_VENDOR_PREFIX}PB-MIKROBUS-0.dtbo \
+${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
+"
+
+S =3D "${WORKDIR}/git"
+
+# 6.6.32 version for 32-bit
+SRCREV:armv7a =3D "525684d28fadc2bdae5424f28b219377bd5d4639"
+PV:armv7a =3D "6.6.32+git"
+BRANCH:armv7a =3D "v6.6.32-ti-arm32-r7"
+
+# 6.6.58 version for 64-bit
+SRCREV:aarch64 =3D "9beffa9162f6a0f5de7e25bbb66026a579376428"
+PV:aarch64 =3D "6.6.58+git"
+BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r16"
+
+KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
--=20
2.25.1


