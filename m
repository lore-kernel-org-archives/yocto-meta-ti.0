Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4EC7EE2A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6388.1679283524859395755
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4CE040CB4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anHgR92H61Nm for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A806C40C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E86481637D4
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 16/54] machine: Add AM62x HS-SE evm configuration
Date: Mon, 20 Mar 2023 03:38:02 +0000
Message-Id: <20230320033840.1193963-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16018

From: Chirag Shilwant <c-shilwant@ti.com>

Lets add the basic AM62x HS-SE configuration.
- Add machine conf for AM62x HS-SE.
- The wic images will boot on AM62x GP devices by default.
- To boot on AM62x HS-SE, simply switch out the SYSFW image:
           $ cd /mnt/sd-card/boot
           $ mv tiboot3-am62x-hs-evm.bin tiboot3.bin

- Add ti-sci-firmware overrides.
- Add support to sign ATF and OPTEE.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...-evm-k3r5.conf =3D> am62xx-evm-k3r5-gp.conf} |  3 +++
 .../conf/machine/am62xx-evm-k3r5-hs-se.conf   | 21 +++++++++++++++++++
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  4 ++++
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  8 +++++++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 ++-
 5 files changed, 38 insertions(+), 1 deletion(-)
 rename meta-ti-bsp/conf/machine/{am62xx-evm-k3r5.conf =3D> am62xx-evm-k3=
r5-gp.conf} (67%)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/am62xx-evm-k3r5-gp.conf
similarity index 67%
rename from meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
index 724a8d4a..d9867bc7 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
@@ -9,3 +9,6 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
+
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf b/meta-t=
i-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..7bca513a
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
@@ -0,0 +1,21 @@
+#@TYPE: Machine
+#@NAME: AM62xx HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5F co=
re)
+
+# Booting HS-SE requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-hs-se"
+
+SYSFW_SOC =3D "am62x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs"
+
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
+UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_S=
UFFIX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
index 73859d5f..96355411 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -12,3 +12,7 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
+
+SPL_BINARY =3D "tispl.bin_HS"
+UBOOT_BINARY =3D "u-boot.img_HS"
+UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 98df24b2..53e48610 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -8,6 +8,14 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
+BBMULTICONFIG =3D "k3r5-gp"
+do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62x is for GP, add a version for HS-SE
+BBMULTICONFIG +=3D "k3r5-hs-se"
+IMAGE_BOOT_FILES +=3D "tiboot3-am62x-hs-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+
 TFA_BOARD =3D "lite"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 77709689..798131d4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -37,7 +37,8 @@ SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
-SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:am62xx-evm-k3r5-gp =3D "fs"
+SYSFW_PREFIX:am62xx-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5 =3D "fs"
--=20
2.25.1


