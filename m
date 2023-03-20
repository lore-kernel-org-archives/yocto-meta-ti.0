Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD165C7EE32
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6711.1679285564756793157
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F9D440C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYK7DRea2YwF for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4516C40CB0
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2A2E41637CC
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 21/54] am62xx-evm: Add AM62x HS-FS evm configuration
Date: Mon, 20 Mar 2023 04:12:08 +0000
Message-Id: <20230320041241.1293077-22-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16117

From: Chirag Shilwant <c-shilwant@ti.com>

Lets add the basic AM62x HS-FS configuration
- Add machine conf for AM62x HS-FS.
- The wic images will boot on AM62x HS-FS devices by default.
- The sysfw image for GP and HS-SE will be packaged in the wic image as
  tiboot3-am62x-gp-evm.bin and tiboot3-am62x-hs-evm.bin respectively.
- Add ti-sci-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf   |  4 ++++
 .../conf/machine/am62xx-evm-k3r5-hs-fs.conf        | 14 ++++++++++++++
 meta-ti-bsp/conf/machine/include/am62xx.inc        | 12 +++++++++---
 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf       |  3 +++
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |  1 +
 5 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf b/meta-ti-b=
sp/conf/machine/am62xx-evm-k3r5-gp.conf
index d9867bc7..ab18301a 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
@@ -8,7 +8,11 @@ SYSFW_SOC =3D "am62x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
=20
+SPL_BINARY =3D ""
 UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
 UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf b/meta-t=
i-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
new file mode 100644
index 00000000..0dad1104
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62xx HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx HS-FS EVM (R5F co=
re)
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
+UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 53e48610..af6a6db4 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -8,10 +8,16 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
-BBMULTICONFIG =3D "k3r5-gp"
-do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+# Default tiboot3.bin on AM62x is for HS-FS
+BBMULTICONFIG =3D "k3r5-hs-fs"
+do_image_wic[mcdepends] =3D "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
=20
-# Since default tiboot3.bin on AM62x is for GP, add a version for HS-SE
+# Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
+BBMULTICONFIG +=3D "k3r5-gp"
+IMAGE_BOOT_FILES +=3D "tiboot3-am62x-gp-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-=
SE
 BBMULTICONFIG +=3D "k3r5-hs-se"
 IMAGE_BOOT_FILES +=3D "tiboot3-am62x-hs-evm.bin"
 do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf b/meta-ti-bsp/c=
onf/multiconfig/k3r5-hs-fs.conf
new file mode 100644
index 00000000..e22204ee
--- /dev/null
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE:append =3D "-hs-fs"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 798131d4..8004c227 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-gp =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-se =3D "fs"
+SYSFW_PREFIX:am62xx-evm-k3r5-hs-fs =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5 =3D "fs"
--=20
2.25.1


