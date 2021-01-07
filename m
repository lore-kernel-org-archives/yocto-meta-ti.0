Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.8207.1610025868688204261
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 05:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=cwIe16mu;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 13D6E38C04D7
	for <meta-ti@yoctoproject.org>; Thu,  7 Jan 2021 13:24:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107DORYa124416
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 07:24:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610025867;
	bh=SM8Kjrajua4uKrykKr7g7ghrvY2qaNtBRftkD8xoR9Y=;
	h=From:To:CC:Subject:Date;
	b=cwIe16muqzvvTtsC/invdYQ5ac3biet1wv0piY+RIIH6B19RRmmcev4skOEGE6Gr7
	 6HyO/F4ASVQx/n0WDEj4XRkiiTUbUoJc9/1NjMhqGYd9DZ0dyKUGkX6u9mGxnknvuS
	 4N2GNQ82WYDQYmEuuhJTUeFEAFonqBCjJdrq5nsQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107DORea104466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 07:24:27 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 07:24:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 07:24:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107DOQVi039066;
	Thu, 7 Jan 2021 07:24:26 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] am64xx: Add combined boot build support
Date: Thu, 7 Jan 2021 07:24:25 -0600
Message-ID: <20210107132425.23218-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add combined boot flow support for the AM64XX device.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/am64xx-evm-k3r5.conf      |  4 +++-
 conf/machine/am64xx-evm.conf           |  4 ++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 16 ++++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-=
k3r5.conf
index b788e634699d..dfeaeb570a55 100644
--- a/conf/machine/am64xx-evm-k3r5.conf
+++ b/conf/machine/am64xx-evm-k3r5.conf
@@ -7,6 +7,8 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC =3D "am64x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
-SYSFW_SYMLINK =3D "sysfw.itb"
=20
 UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index c6ba2a8735f3..9336d4ae4c54 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -4,4 +4,8 @@
=20
 require conf/machine/include/am64xx.inc
=20
+IMAGE_BOOT_FILES =3D "tispl.bin u-boot.img"
+
 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
index 310c7d544030..4d4a9a349c70 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,6 +2,7 @@ require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
=20
 DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS_append_j7200-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS_append_am64xx-evm-k3r5 =3D " virtual/bootloader"
=20
 CLEANBROKEN =3D "1"
 PR =3D "r1"
@@ -52,6 +53,7 @@ EXTRA_OEMAKE_HS =3D " \
 EXTRA_OEMAKE_append =3D "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}'=
 =3D=3D 'hs']}"
=20
 EXTRA_OEMAKE_append_j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
+EXTRA_OEMAKE_append_am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
=20
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -98,4 +100,18 @@ do_deploy_j7200-evm-k3r5() {
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 }
=20
+do_install_am64xx-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy_am64xx-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+}
+
 addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot=
-ti.inc
index b7fd246aca6c..7ce3d7019431 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -41,6 +41,7 @@ PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarc=
h_base_libdir}/firmware/pdk-i
=20
 PACKAGECONFIG_append_aarch64 =3D " atf optee"
 PACKAGECONFIG_append_j7 =3D " dm"
+PACKAGECONFIG_append_am64xx =3D " dm"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
=20
@@ -65,6 +66,7 @@ SPL_UART_BINARY_keystone =3D ""
 SPL_UART_BINARY_k3r5 =3D ""
 SPL_UART_BINARY_lego-ev3 =3D ""
 SPL_UART_BINARY_j7200-evm-k3r5 =3D "u-boot-spl.bin"
+SPL_UART_BINARY_am64xx-evm-k3r5 =3D "u-boot-spl.bin"
=20
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
@@ -395,4 +397,8 @@ do_deploy_append_j7200-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
 }
=20
+do_deploy_append_am64xx-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
+}
 TOOLCHAIN =3D "gcc"
--=20
2.29.2

