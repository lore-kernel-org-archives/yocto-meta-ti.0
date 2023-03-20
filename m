Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD00C7EE2C
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6299.1679283525930614825
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEC3B40CC4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlcjSbGh0cmw for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9259140CC5
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3C8F51637DC
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 24/54] conf: machine: j721s2-evm: Add support for J721S2 HS-FS
Date: Mon, 20 Mar 2023 03:38:10 +0000
Message-Id: <20230320033840.1193963-25-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16036

From: Sinthu Raja <sinthu.raja@ti.com>

Add the basic J721S2 HS-FS configuration.
    - Add configurations to support both HS-FS and GP keeping GP
      as default.
    - Add ti-sci-firmware overrides for HS-FS.
    - Remove evm conf file inclusion in hs-evm conf.
    - Add j721s2 hs-evm specific config to hs-evm conf.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/j721s2-evm-k3r5-gp.conf      | 20 +++++++++++++++++++
 .../machine/j721s2-evm-k3r5-sr1-hs-fs.conf    | 15 ++++++++++++++
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  9 +++++++++
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   | 15 +++++++++++++-
 .../conf/multiconfig/k3r5-sr1-hs-fs.conf      |  3 +++
 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf    |  3 +++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 ++-
 7 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.co=
nf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf b/meta-ti-b=
sp/conf/machine/j721s2-evm-k3r5-gp.conf
new file mode 100644
index 00000000..95771139
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: J721S2 GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 GP EVM (R5F core)
+
+# Booting GP requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-gp"
+
+SYSFW_SOC =3D "j721s2"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+SYSFW_TIBOOT3_SYMLINK =3D "tiboot3.bin"
+
+UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf b/me=
ta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..1a77830d
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: J721S2 HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 HS-FS EVM (R5F co=
re)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-sr1-hs-fs"
+
+SYSFW_SOC =3D "j721s2"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
+UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 3576414d..93efbb70 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -15,3 +15,12 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
+
+# Default tiboot3.bin on J721S2 is for GP
+BBMULTICONFIG =3D "k3r5-gp"
+do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0=
 HS-FS
+BBMULTICONFIG +=3D "k3r5-sr1-hs-fs"
+IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-hs-fs-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/j721s2-hs-evm.conf
index 3d737f44..8fa98440 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -2,10 +2,23 @@
 #@NAME: J721S2 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
=20
-require conf/machine/j721s2-evm.conf
+require conf/machine/include/j721s2.inc
+
+SERIAL_CONSOLES =3D "115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+TFA_K3_USART =3D "0x8"
+OPTEE_K3_USART =3D "0x8"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-j721s2-common-proc-board.dtb \
+    ti/k3-j721s2-gesi-exp-board.dtbo \
+"
=20
 UBOOT_MACHINE =3D "j721s2_hs_evm_a72_defconfig"
=20
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf b/meta-ti-b=
sp/conf/multiconfig/k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..505f08d5
--- /dev/null
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
@@ -0,0 +1,3 @@
+require k3r5-sr1.conf
+
+MACHINE:append =3D "-hs-fs"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf b/meta-ti-bsp/con=
f/multiconfig/k3r5-sr1.conf
new file mode 100644
index 00000000..1c8098cd
--- /dev/null
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE:append =3D "-sr1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index b65d8502..18153d37 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -33,7 +33,8 @@ SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 =3D "fs"
 SYSFW_PREFIX:beaglebone-ai64-k3r5 =3D "fs"
 SYSFW_PREFIX:j7200-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
-SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j721s2-evm-k3r5-gp =3D "fs"
+SYSFW_PREFIX:j721s2-evm-k3r5-sr1-hs-fs =3D "fs"
 SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
--=20
2.25.1


