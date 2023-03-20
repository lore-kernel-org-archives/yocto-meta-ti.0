Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AEAC77B7D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6392.1679283525870000183
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8E9740CC6
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beXVzASDkRSh for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 91CCA40CC4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2FB401637DA
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 22/54] am62xx-lp-evm: Add AM62x LP HS-FS evm configuration
Date: Mon, 20 Mar 2023 03:38:08 +0000
Message-Id: <20230320033840.1193963-23-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16029

From: Chirag Shilwant <c-shilwant@ti.com>

Lets add the basic AM62x LP HS-FS configuration
- Add machine conf for AM62x LP HS-FS.
- The wic images will boot on AM62x LP HS-FS devices by default.
- The sysfw image for HS-SE will be packaged in the wic image as
  tiboot3-am62x-hs-evm.bin.
- Add ti-sci-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf     | 14 ++++++++++++++
 .../conf/machine/am62xx-lp-evm-k3r5-hs-se.conf     |  7 +++++++
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc     |  7 ++++++-
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.con=
f

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf b/met=
a-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
new file mode 100644
index 00000000..9026b67c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62xx LPSK HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-FS EVM (R5F=
 core)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-hs-fs"
+
+SYSFW_SOC =3D "am62x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+
+UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/met=
a-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
index 11e70342..c126de0f 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
@@ -11,4 +11,11 @@ SYSFW_SOC =3D "am62x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
=20
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
 UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_S=
UFFIX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp=
/conf/machine/include/am62xx-lp.inc
index df113003..d37d4673 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
@@ -8,8 +8,13 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
-# Default tiboot3.bin on AM62x LP is for HS-SE
+# Default tiboot3.bin on AM62x LP is for HS-FS
+BBMULTICONFIG =3D "k3r5-hs-fs"
+do_image_wic[mcdepends] =3D "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for =
HS-SE
 BBMULTICONFIG +=3D "k3r5-hs-se"
+IMAGE_BOOT_FILES +=3D "tiboot3-am62x-hs-evm.bin"
 do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 8004c227..75b9f8a6 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -42,6 +42,7 @@ SYSFW_PREFIX:am62xx-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-fs =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs =3D "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5 =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
--=20
2.25.1


