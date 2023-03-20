Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F20BC77B6D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6338.1679283570987307041
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8273540301
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-CsyKImxkJS for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3951D40C93
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 48A361637C7
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 25/53] conf: machine: j784s4-evm: Add support for J784S4 HS-FS
Date: Mon, 20 Mar 2023 03:38:57 +0000
Message-Id: <20230320033925.1306823-26-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16097

From: Dasnavis <sabiya.d@ti.com>

Add the basic J784S4 HS-FS configuration.
* Add configurations to support both HS-FS and GP keeping GP as default.
* Add ti-sci-firmware overrides for HS-FS.
* Remove evm conf file inclusion in hs-evm conf.
* Add j784s4 hs-evm specific config to hs-evm conf.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/j784s4-evm-k3r5-gp.conf      | 20 +++++++++++++++++++
 .../machine/j784s4-evm-k3r5-sr1-hs-fs.conf    | 16 +++++++++++++++
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  9 +++++++++
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf   | 16 ++++++++++++++-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 ++-
 5 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.co=
nf

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf b/meta-ti-b=
sp/conf/machine/j784s4-evm-k3r5-gp.conf
new file mode 100644
index 00000000..6f7ef92e
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: J784S4 GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 GP EVM (R5F core)
+
+# Booting GP requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-gp"
+
+SYSFW_SOC =3D "j784s4"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+SYSFW_TIBOOT3_SYMLINK =3D "tiboot3.bin"
+
+UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf b/me=
ta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..18b38305
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS-FS EVM (R5F co=
re)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-sr1-hs-fs"
+
+SYSFW_SOC =3D "j784s4"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+SYSFW_TIBOOT3_SYMLINK =3D ""
+SYSFW_SYMLINK =3D ""
+
+UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index 73f3eb8c..4e0bfba6 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -14,3 +14,12 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
+
+# Default tiboot3.bin on J784S4 is for GP
+BBMULTICONFIG =3D "k3r5-gp"
+do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0=
 HS-FS
+BBMULTICONFIG +=3D "k3r5-sr1-hs-fs"
+IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/j784s4-hs-evm.conf
index 62357d62..1c56f55a 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -2,10 +2,24 @@
 #@NAME: J784S4 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
=20
-require conf/machine/j784s4-evm.conf
+require conf/machine/include/j784s4.inc
+
+SERIAL_CONSOLES =3D "115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+TFA_K3_USART =3D "0x8"
+OPTEEMACHINE =3D "k3-j784s4"
+OPTEE_K3_USART =3D "0x8"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-j784s4-evm.dtb \
+"
=20
 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
=20
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD =3D "j784s4"
+
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 5fb16642..4fcda026 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -36,7 +36,8 @@ SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-evm-k3r5-gp =3D "fs"
 SYSFW_PREFIX:j721s2-evm-k3r5-sr1-hs-fs =3D "fs"
 SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
-SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j784s4-evm-k3r5-gp =3D "fs"
+SYSFW_PREFIX:j784s4-evm-k3r5-sr1-hs-fs =3D "fs"
 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-gp =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-se =3D "fs"
--=20
2.25.1


