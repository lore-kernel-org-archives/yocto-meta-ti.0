Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657DEC77B77
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6290.1679283524851901566
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93C4540CA5
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHp18aAMXIGG for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 713F840C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BAA891637CF
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 11/54] machine: Add AM62Q HS-SE evm configuration
Date: Mon, 20 Mar 2023 03:37:57 +0000
Message-Id: <20230320033840.1193963-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16019

From: Chirag Shilwant <c-shilwant@ti.com>

Lets add the basic AM62Q HS-SE configuration.
- Add configurations.
- Add ti-sci-firmware overrides.
- Add u-boot overrides.
- Add optee overrides.
- Add ti-rtos-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/am62xx-lp-evm-k3r5-hs-se.conf   | 14 ++++++++++++++
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 12 ++++++++++--
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      |  6 +++++-
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc   | 16 ++++++++++++++++
 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf     |  3 +++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb       |  1 +
 6 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.con=
f
 create mode 100644 meta-ti-bsp/conf/machine/include/am62xx-lp.inc
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/met=
a-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..11e70342
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62xx LPSK HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-SE EVM (R5F=
 core)
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
+UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am62xx-lp-evm-k3r5.conf
index ca4ced5a..15ecc677 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -1,11 +1,19 @@
 #@TYPE: Machine
-#@NAME: AM62XX LP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
+#@NAME: AM62XX LP GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F co=
re)
=20
 require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-gp"
=20
 SYSFW_SOC =3D "am62x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
 UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xx-lp-evm.conf
index ec9ce596..be95f33a 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: AM62XX LP EVM
 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
=20
-require conf/machine/include/am62xx.inc
+require conf/machine/include/am62xx-lp.inc
=20
 KERNEL_DEVICETREE =3D " \
     ti/k3-am62x-lp-sk.dtb \
@@ -11,4 +11,8 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
=20
+SPL_BINARY =3D "tispl.bin_HS"
+UBOOT_BINARY =3D "u-boot.img_HS"
+UBOOT_SYMLINK =3D "u-boot.img"
+
 UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp=
/conf/machine/include/am62xx-lp.inc
new file mode 100644
index 00000000..df113003
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
@@ -0,0 +1,16 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append =3D ":am62xx"
+
+MACHINE_FEATURES +=3D "screen touchscreen"
+
+SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
+# Default tiboot3.bin on AM62x LP is for HS-SE
+BBMULTICONFIG +=3D "k3r5-hs-se"
+do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+
+TFA_BOARD =3D "lite"
+OPTEEMACHINE =3D "k3-am62x"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf b/meta-ti-bsp/c=
onf/multiconfig/k3r5-hs-se.conf
new file mode 100644
index 00000000..7e3d7dae
--- /dev/null
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE:append =3D "-hs-se"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 37d022e9..77709689 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5 =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
--=20
2.25.1


