Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1700.1610047593408703883
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 11:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=oD38FH8o;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2F51538C0627
	for <meta-ti@yoctoproject.org>; Thu,  7 Jan 2021 19:26:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107JQWwZ001564
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 13:26:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610047592;
	bh=uMg2AYfaH7biRztCf98+8UF9GLhS2nGfg/CBkFkPDq4=;
	h=From:To:CC:Subject:Date;
	b=oD38FH8o/h6uqlGyQBYkKeIsnn3+88sGgAeW8WhSVmsRZ8dJDwtsXt7cXUsMTzMrm
	 STOsjG63i4F4/rYd+eUcukqB22jWP/bUwMS/HYrAR+RUoyM9Si7Bl3v8ccq6dA+DQo
	 Gs9WJj5qPH99DIqmKb/3knrtsz8jENmQPIqZYRPM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107JQWs0101628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 13:26:32 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 13:26:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 13:26:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107JQW2o049727;
	Thu, 7 Jan 2021 13:26:32 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3] am64xx: Add combined boot build support
Date: Thu, 7 Jan 2021 13:26:25 -0600
Message-ID: <20210107192625.24167-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add combined boot flow support for the AM64XX device.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/am64xx-evm-k3r5.conf      |  4 +++-
 conf/machine/am64xx-evm.conf           |  8 ++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc    |  6 +++---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 16 ++++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
 5 files changed, 36 insertions(+), 4 deletions(-)

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
index c6ba2a8735f3..eda310a32b14 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -4,4 +4,12 @@
=20
 require conf/machine/include/am64xx.inc
=20
+IMAGE_BOOT_FILES =3D "tispl.bin u-boot.img"
+
 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
+
+do_image_wic[depends] +=3D "trusted-firmware-a:do_deploy"
+do_image_tar[depends] +=3D "trusted-firmware-a:do_deploy"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/=
ti-sci-fw.inc
index 174d9539e152..ae22b7a59fca 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -4,11 +4,11 @@ LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
 PV =3D "2020.08b"
-PV_am64xx-evm-k3r5 =3D "2020.23"
+PV_am64xx-evm-k3r5 =3D "2020.12"
=20
-SRCREV =3D "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
+SRCREV =3D "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
 BRANCH ?=3D "ti-linux-firmware"
-SRCREV_imggen =3D "6d023674b0655f1a7bba192d2600c08be314e9ef"
+SRCREV_imggen =3D "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
 SRCREV_FORMAT =3D "imggen"
=20
 SRC_URI =3D " \
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
index b7fd246aca6c..dc8d6b060529 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -65,6 +65,7 @@ SPL_UART_BINARY_keystone =3D ""
 SPL_UART_BINARY_k3r5 =3D ""
 SPL_UART_BINARY_lego-ev3 =3D ""
 SPL_UART_BINARY_j7200-evm-k3r5 =3D "u-boot-spl.bin"
+SPL_UART_BINARY_am64xx-evm-k3r5 =3D "u-boot-spl.bin"
=20
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
@@ -395,4 +396,9 @@ do_deploy_append_j7200-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
 }
=20
+do_deploy_append_am64xx-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
+}
+
 TOOLCHAIN =3D "gcc"
--=20
2.29.2

