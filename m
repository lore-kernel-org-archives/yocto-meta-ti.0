Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1708.1610047470097106902
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 11:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=RojTjqOj;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3FD4D38C0627
	for <meta-ti@yoctoproject.org>; Thu,  7 Jan 2021 19:24:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107JOS0X000996
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 13:24:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610047468;
	bh=pKwsuZBZb/gs6I0Wp+/CHqO40IYcoweyrISttAjbOBM=;
	h=From:To:CC:Subject:Date;
	b=RojTjqOj0+EiB6ZB0ms7BDInshfJlQ4/EVysFBzU55f7b4WRH7VM8hx2YisZiAzAS
	 WBGmFCXxmU6uBZbyx5lceMycrli25VQO20ZS7TJ/0eM85n5KUxtRicDIWgJ2KbWojM
	 W8uPeTUokSvVU70A7lv91WymWBQebku7qKwZxQNM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107JOSDY028791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 13:24:28 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 13:24:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 13:24:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107JOS40046590;
	Thu, 7 Jan 2021 13:24:28 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2] am64xx: Add combined boot build support
Date: Thu, 7 Jan 2021 13:24:22 -0600
Message-ID: <20210107192422.23876-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add combined boot flow support for the AM64XX device.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/am64xx-evm.conf           | 4 ++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 -
 recipes-bsp/u-boot/u-boot-ti.inc       | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index 9336d4ae4c54..eda310a32b14 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -7,5 +7,9 @@ require conf/machine/include/am64xx.inc
 IMAGE_BOOT_FILES =3D "tispl.bin u-boot.img"
=20
 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
+
+do_image_wic[depends] +=3D "trusted-firmware-a:do_deploy"
+do_image_tar[depends] +=3D "trusted-firmware-a:do_deploy"
+
 do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
index 7e4809cecc50..4d4a9a349c70 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -4,7 +4,6 @@ DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-nat=
ive"
 DEPENDS_append_j7200-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 =3D " virtual/bootloader"
=20
-
 CLEANBROKEN =3D "1"
 PR =3D "r1"
=20
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot=
-ti.inc
index 7ce3d7019431..dc8d6b060529 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -41,7 +41,6 @@ PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarc=
h_base_libdir}/firmware/pdk-i
=20
 PACKAGECONFIG_append_aarch64 =3D " atf optee"
 PACKAGECONFIG_append_j7 =3D " dm"
-PACKAGECONFIG_append_am64xx =3D " dm"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
=20
@@ -401,4 +400,5 @@ do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
 }
+
 TOOLCHAIN =3D "gcc"
--=20
2.29.2

