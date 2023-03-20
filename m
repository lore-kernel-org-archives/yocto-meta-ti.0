Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80864C77B7D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6789.1679285564386960090
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B140740C98
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrD9TTNjeAA0 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B9CE40C46
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6CF7B1637CA
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 06/54] machine: Add am62axx evm configuration
Date: Mon, 20 Mar 2023 04:11:53 +0000
Message-Id: <20230320041241.1293077-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16111

From: Paresh Bhagat <p-bhagat@ti.com>

Lets add the basic AM62Axx-evm configuration.
- Add configurations.
- Add firmware overrides.
- Add u-boot overrides.
- Add tifs-lpm-stub.
- Add cnm-wave-fw.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/am62axx-evm-k3r5.conf        | 11 ++++
 meta-ti-bsp/conf/machine/am62axx-evm.conf     | 11 ++++
 meta-ti-bsp/conf/machine/include/am62axx.inc  | 15 +++++
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  1 +
 .../recipes-kernel/linux/kernel-rdepends.inc  |  2 +
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 65 +++++++++++++------
 9 files changed, 87 insertions(+), 23 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62axx.inc

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62axx-evm-k3r5.conf
new file mode 100644
index 00000000..ca30537f
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62AXX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "am62ax"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf=
/machine/am62axx-evm.conf
new file mode 100644
index 00000000..4eb179f3
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62AXX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62AXX EVM
+
+require conf/machine/include/am62axx.inc
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am62a7-sk.dtb \
+"
+
+UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/c=
onf/machine/include/am62axx.inc
new file mode 100644
index 00000000..cc477366
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -0,0 +1,15 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append =3D ":am62axx"
+
+MACHINE_FEATURES +=3D "screen touchscreen"
+
+SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD =3D "lite"
+OPTEEMACHINE =3D "k3-am62x"
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index e7aa9ef4..2f75f4e3 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR =3D "${INC_PR}.1"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j721s2|j784s4"
+COMPATIBLE_MACHINE =3D "j721s2|j784s4|am62axx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index eb641270..37d022e9 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:am62axx-evm-k3r5 =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
=20
diff --git a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b=
/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
index ce5f4e1f..2db761ba 100644
--- a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ b/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -7,7 +7,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "am62xx"
+COMPATIBLE_MACHINE =3D "am62xx|am62axx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 83c4af59..4f73a7b9 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -37,6 +37,7 @@ PACKAGECONFIG:append:j7200 =3D " dm"
 PACKAGECONFIG:append:j721s2 =3D " dm"
 PACKAGECONFIG:append:j784s4 =3D " dm"
 PACKAGECONFIG:append:am62xx =3D " dm"
+PACKAGECONFIG:append:am62axx =3D " dm"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 808a4766..69796915 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -30,6 +30,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D "=
 vxd-dec-fw"
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cnm-wave-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " cnm-wave-fw"
=20
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx =3D " tifs-lpm-stub"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " tifs-lpm-stub"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index ddfa07be..9b94a61e 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -20,6 +20,7 @@ PLAT_SFX:j784s4 =3D "j784s4"
 PLAT_SFX:am65xx =3D "am65xx"
 PLAT_SFX:am64xx =3D "am64xx"
 PLAT_SFX:am62xx =3D "am62xx"
+PLAT_SFX:am62axx =3D "am62axx"
=20
 FILESEXTRAPATHS:prepend :=3D "${METATIBASE}/recipes-bsp/ti-sci-fw/files/=
:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -63,31 +64,34 @@ C7X_4_FW   =3D "ipc_echo_test_c7x_4_release_strip.xe7=
1"
 ETH_FW =3D "app_remoteswitchcfg_server_strip.xer5f"
=20
 DM_FW_LIST =3D ""
-DM_FW_LIST:am65xx =3D ""
-DM_FW_LIST:j721e =3D  "${DM_FIRMWARE}"
-DM_FW_LIST:j7200 =3D  "${DM_FIRMWARE}"
-DM_FW_LIST:j721s2 =3D "${DM_FIRMWARE}"
-DM_FW_LIST:am64xx =3D ""
-DM_FW_LIST:am62xx =3D "${DM_FIRMWARE}"
-DM_FW_LIST:j784s4 =3D "${DM_FIRMWARE}"
+DM_FW_LIST:am65xx =3D  ""
+DM_FW_LIST:j721e =3D   "${DM_FIRMWARE}"
+DM_FW_LIST:j7200 =3D   "${DM_FIRMWARE}"
+DM_FW_LIST:j721s2 =3D  "${DM_FIRMWARE}"
+DM_FW_LIST:am64xx =3D  ""
+DM_FW_LIST:am62xx =3D  "${DM_FIRMWARE}"
+DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"
+DM_FW_LIST:j784s4 =3D  "${DM_FIRMWARE}"
=20
 IPC_FW_LIST =3D ""
-IPC_FW_LIST:am65xx =3D "${MCU_1_0_FW} ${MCU_1_1_FW}"
-IPC_FW_LIST:j721e =3D  "                            ${MCU_2_0_FW} ${MCU_=
2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
-IPC_FW_LIST:j7200 =3D  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_=
2_1_FW}"
-IPC_FW_LIST:j721s2 =3D "                            ${MCU_2_0_FW} ${MCU_=
2_1_FW} ${MCU_2_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} $=
{C7X_2_FW}"
-IPC_FW_LIST:am64xx =3D "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_=
2_1_FW} ${MCU_3_0_FW}"
-IPC_FW_LIST:am62xx =3D "                            ${MCU_2_0_FW}"
-IPC_FW_LIST:j784s4 =3D "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_=
2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} $=
{C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
+IPC_FW_LIST:am65xx =3D  "${MCU_1_0_FW} ${MCU_1_1_FW}"
+IPC_FW_LIST:j721e =3D   "                            ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
+IPC_FW_LIST:j7200 =3D   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW}"
+IPC_FW_LIST:j721s2 =3D  "                            ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_2_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} =
${C7X_2_FW}"
+IPC_FW_LIST:am64xx =3D  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW}"
+IPC_FW_LIST:am62xx =3D  "                            ${MCU_2_0_FW}"
+IPC_FW_LIST:am62axx =3D "                            ${MCU_2_0_FW}      =
                                                             ${C7X_1_FW}"
+IPC_FW_LIST:j784s4 =3D  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} =
${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
=20
 ETH_FW_LIST =3D ""
-ETH_FW_LIST:am65xx =3D ""
-ETH_FW_LIST:j721e =3D  "${ETH_FW}"
-ETH_FW_LIST:j7200 =3D  "${ETH_FW}"
-ETH_FW_LIST:j721s2 =3D ""
-ETH_FW_LIST:am64xx =3D ""
-ETH_FW_LIST:am62xx =3D ""
-ETH_FW_LIST:j784s4 =3D "${ETH_FW}"
+ETH_FW_LIST:am65xx =3D  ""
+ETH_FW_LIST:j721e =3D   "${ETH_FW}"
+ETH_FW_LIST:j7200 =3D   "${ETH_FW}"
+ETH_FW_LIST:j721s2 =3D  ""
+ETH_FW_LIST:am64xx =3D  ""
+ETH_FW_LIST:am62xx =3D  ""
+ETH_FW_LIST:am62axx =3D ""
+ETH_FW_LIST:j784s4 =3D  "${ETH_FW}"
=20
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
@@ -107,6 +111,13 @@ do_install:prepend:am62xx() {
         )
 }
=20
+# Update the am62axx ipc binaries to be consistent with other platforms
+do_install:prepend:am62axx() {
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                ln -s am62a-mcu-r5f0_0-fw ${MCU_1_0_FW}; \
+        )
+}
+
 # Sign the firmware
 do_install:prepend() {
     # DM Firmware
@@ -183,6 +194,11 @@ ALTERNATIVE:${PN}:am62xx =3D "\
                     am62-main-r5f0_0-fw \
                     "
=20
+ALTERNATIVE:${PN}:am62axx =3D "\
+                    am62a-mcu-r5f0_0-fw \
+                    am62a-c71_0-fw \
+                    "
+
 ALTERNATIVE:${PN}:j721e =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
@@ -257,6 +273,9 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D "${nona=
rch_base_libdir}/firmware/am6
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/am62-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/am62-mcu-m4f0_0-fw"
=20
+ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/am62a-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/am62a-c71_0-fw"
+
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/j7-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/j7-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/j7-main-r5f0_0-fw"
@@ -326,6 +345,10 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D "${nonarc=
h_base_libdir}/firmware/pdk-ip
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/pdk-ipc/${MCU_2_0_FW}"
=20
+ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62a-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/=
pdk-ipc/${C7X_1_FW}"
+
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwar=
e/pdk-ipc/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firmwar=
e/pdk-ipc/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/ethfw/${ETH_FW}"
--=20
2.25.1


