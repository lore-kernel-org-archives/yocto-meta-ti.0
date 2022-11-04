Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B296C6370C
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.935.1667602019238748090
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0218640D93
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIdgaRMkKVdP for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC40D40D90
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 980C1163694
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 25/50] conf: machine: am64xx-evm: Switch to SR2.0 HS-FS build by default
Date: Fri,  4 Nov 2022 22:46:27 +0000
Message-Id: <20221104224653.1223044-26-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15288

From: Andrew Davis <afd@ti.com>

AM64x devices will only be available as SR2.0 HS-FS. Set this as the
default type provided by the SDK. To allow SR2.0 HS-SE to continue to
boot, like we did with GP, we add an extra machine to build SR2.0 HS-SE
SYSFW. To use on SR2.0 HS-SE boards simply switch out the SYSFW image:

$ cd /mnt/sd-card/boot
$ mv tiboot3-am64x_sr2-hs-evm.bin tiboot3.bin

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/am64xx-evm-k3r5-hs-se.conf   | 14 -------------
 .../machine/am64xx-evm-k3r5-sr2-hs-fs.conf    | 14 +++++++++++++
 .../machine/am64xx-evm-k3r5-sr2-hs-se.conf    | 20 +++++++++++++++++++
 meta-ti-bsp/conf/machine/am64xx-evm.conf      |  8 +++++++-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  6 +++---
 .../conf/multiconfig/k3r5-sr2-hs-fs.conf      |  3 +++
 .../{k3r5-hs-se.conf =3D> k3r5-sr2-hs-se.conf}  |  2 +-
 7 files changed, 48 insertions(+), 19 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.co=
nf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.co=
nf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
 rename meta-ti-bsp/conf/multiconfig/{k3r5-hs-se.conf =3D> k3r5-sr2-hs-se=
.conf} (55%)

diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf b/meta-t=
i-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf
deleted file mode 100644
index 7e737b12..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx HS-SE EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx HS-SE EVM (R5F co=
re)
-
-# Booting HS-SE requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append =3D ":k3r5-hs-se"
-
-SYSFW_SOC =3D "am64x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-
-UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf b/me=
ta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
new file mode 100644
index 00000000..42ddbb4c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM64xx SR2.0 HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-FS EVM (=
R5F core)
+
+# Booting SR2.0 HS-FS requires different SYSFW, the rest is handled at r=
untime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-sr2-hs-fs"
+
+SYSFW_SOC =3D "am64x_sr2"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+
+UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf b/me=
ta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
new file mode 100644
index 00000000..a1c2b3e6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: AM64xx SR2.0 HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-SE EVM (=
R5F core)
+
+# Booting SR2.0 HS-SE requires different SYSFW, the rest is handled at r=
untime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-sr2-hs-se"
+
+SYSFW_SOC =3D "am64x_sr2"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs"
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
+UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-sr2-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBO=
OT_SUFFIX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-sr2-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/=
machine/am64xx-evm.conf
index 6e1c87ec..67f1be5b 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -6,8 +6,14 @@ require conf/machine/include/am64xx.inc
=20
 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
=20
-# Since default tiboot3.bin on AM64x is for HS-SE, add a version for GP
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or GP
 BBMULTICONFIG +=3D "k3r5-gp"
 IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
 do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or SR2.0 HS-SE
+BBMULTICONFIG +=3D "k3r5-sr2-hs-se"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 00ee31b8..4d26732c 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -14,9 +14,9 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am642-evm-nand.dtbo \
 "
=20
-BBMULTICONFIG =3D "k3r5-hs-se"
-do_image_wic[mcdepends] =3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+BBMULTICONFIG =3D "k3r5-sr2-hs-fs"
+do_image_wic[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am64x"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf b/meta-ti-b=
sp/conf/multiconfig/k3r5-sr2-hs-fs.conf
new file mode 100644
index 00000000..98972326
--- /dev/null
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
@@ -0,0 +1,3 @@
+require k3r5-sr2.conf
+
+MACHINE:append =3D "-hs-fs"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf b/meta-ti-bsp/c=
onf/multiconfig/k3r5-sr2-hs-se.conf
similarity index 55%
rename from meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
rename to meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
index 7e3d7dae..8b98fc0a 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
@@ -1,3 +1,3 @@
-require k3r5.conf
+require k3r5-sr2.conf
=20
 MACHINE:append =3D "-hs-se"
--=20
2.25.1


