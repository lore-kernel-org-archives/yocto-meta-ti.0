Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8981.1645503271814153423
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4763A40C06
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBkejaIqjamX for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3A38B40C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 013D917476C
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 01/29] machine: Add j721s2 evm configuration
Date: Tue, 22 Feb 2022 04:14:02 +0000
Message-Id: <20220222041430.2840289-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nishanth Menon <nm@ti.com>

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 ++++++++++
 meta-ti-bsp/conf/machine/j721s2-evm.conf      | 22 +++++++++++++++++++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 22 +++++++++++++++++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  6 +++++
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm.conf

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/j721s2-evm-k3r5.conf
new file mode 100644
index 00000000..508e96e5
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J721S2 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "j721s2"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
new file mode 100644
index 00000000..82fd33da
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J721S2 EVM
+#@DESCRIPTION: Machine configuration for the TI J721S2 EVM
+
+require conf/machine/include/j7.inc
+
+SERIAL_CONSOLES =3D "115200;ttyS10"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+TFA_K3_USART =3D "0x8"
+OPTEE_K3_USART =3D "0x8"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-j721s2-common-proc-board.dtb \
+"
+
+UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
+
+# J721S2 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 2dad0fe0..dda47797 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,11 +3,12 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS:append:j7200-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:j7200-hs-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS:append:j721s2-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am64xx-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am64xx-hs-evm-k3r5 =3D " virtual/bootloader"
=20
 CLEANBROKEN =3D "1"
-PR =3D "${INC_PR}.1"
+PR =3D "${INC_PR}.2"
=20
 # Loaded by R5F core
 COMPATIBLE_MACHINE =3D "k3r5"
@@ -23,10 +24,11 @@ SYSFW_CONFIG ?=3D "unknown"
=20
 SYSFW_PREFIX =3D "ti-sci-firmware"
 SYSFW_PREFIX:j7-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j7200-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j7-hs-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j7-hs-evm-k3r5-sr1-1 =3D "ti-fs-firmware"
+SYSFW_PREFIX:j7200-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "ti-fs-firmware"
+SYSFW_PREFIX:j721s2-evm-k3r5 =3D "ti-fs-firmware"
=20
 SYSFW_SUFFIX ?=3D "unknown"
=20
@@ -63,6 +65,7 @@ EXTRA_OEMAKE:append =3D "${@['',' ${EXTRA_OEMAKE_HS}'][=
'${SYSFW_SUFFIX}' =3D=3D 'hs']}
=20
 EXTRA_OEMAKE:append:j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
 EXTRA_OEMAKE:append:j7200-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/b=
oot/u-boot-spl.bin""
+EXTRA_OEMAKE:append:j721s2-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
=20
@@ -127,6 +130,21 @@ do_deploy:j7200-hs-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
=20
+do_install:j721s2-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy:j721s2-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 do_install:am64xx-evm-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 4b9f543c..e8d199f1 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -65,6 +65,7 @@ SPL_UART_BINARY:k3r5 =3D ""
 SPL_UART_BINARY:lego-ev3 =3D ""
 SPL_UART_BINARY:j7200-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:j7200-hs-evm-k3r5 =3D "u-boot-spl.bin"
+SPL_UART_BINARY:j721s2-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-hs-evm-k3r5 =3D "u-boot-spl.bin"
=20
@@ -277,6 +278,11 @@ do_deploy:append:j7200-hs-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
 }
=20
+do_deploy:append:j721s2-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
+}
+
 do_deploy:append:am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
--=20
2.25.1

