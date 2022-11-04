Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EC5C43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.200.1667598065010811106
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 77F3140D7A
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guw8hbC5hEUR for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E177140D98
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 63B6F16368A
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 17/47] conf: machine: am64xx-evm: Make HS-SE the default
Date: Fri,  4 Nov 2022 21:40:25 +0000
Message-Id: <20221104214055.1221197-18-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15271

From: Andrew Davis <afd@ti.com>

The HS-SE AM64xx machine can now be run on GP devices and built without
needing the TI_SECURE_DEV_PKG for the same. AM64xx will only be available
in the HS-FS type going forward. Make the HS-SE the default and remove
the original GP machine.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...m-k3r5-gp.conf =3D> am64xx-evm-k3r5-gp.conf} |  6 ++++-
 .../conf/machine/am64xx-evm-k3r5-hs-se.conf   | 14 +++++++++++
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 11 --------
 meta-ti-bsp/conf/machine/am64xx-evm.conf      |  6 +++++
 .../conf/machine/am64xx-hs-evm-k3r5.conf      | 12 ---------
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf   | 25 -------------------
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 ++--
 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf  |  3 +++
 .../trusted-firmware-a_%.bbappend             |  2 +-
 .../optee/optee-os_%.bbappend                 |  2 +-
 10 files changed, 33 insertions(+), 53 deletions(-)
 rename meta-ti-bsp/conf/machine/{am64xx-hs-evm-k3r5-gp.conf =3D> am64xx-=
evm-k3r5-gp.conf} (78%)
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf

diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf b/meta-t=
i-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
similarity index 78%
rename from meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf
rename to meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
index 41c7027f..50bf6a07 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
@@ -4,12 +4,16 @@
=20
 # Booting GP requires different SYSFW, the rest is handled at runtime
=20
-require conf/machine/am64xx-hs-evm-k3r5.conf
+require conf/machine/include/k3r5.inc
 SOC_FAMILY:append =3D ":k3r5-gp"
=20
+SYSFW_SOC =3D "am64x"
+SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
 SYSFW_TIBOOT3_SYMLINK =3D ""
=20
+UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
+
 SPL_BINARY =3D ""
 UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
 UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf b/meta-t=
i-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..7e737b12
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-hs-se.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM64xx HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx HS-SE EVM (R5F co=
re)
+
+# Booting HS-SE requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-hs-se"
+
+SYSFW_SOC =3D "am64x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs"
+
+UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/am64xx-evm-k3r5.conf
deleted file mode 100644
index afd36b72..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "am64x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
-UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/=
machine/am64xx-evm.conf
index 2cb7f55a..ef3e356d 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -9,3 +9,9 @@ UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
+
+# Since default tiboot3.bin on AM64x is for HS-SE, add a version for GP
+BBMULTICONFIG +=3D "k3r5-gp"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am64xx-hs-evm-k3r5.conf
deleted file mode 100644
index 95e68751..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,12 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "am64x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-SYSFW_SYMLINK =3D ""
-
-UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am64xx-hs-evm.conf
deleted file mode 100644
index 1149d4c7..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx HS EVM
-#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM
-
-require conf/machine/include/am64xx.inc
-
-UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
-
-UBOOT_ENTRYPOINT =3D       "0x80080000"
-UBOOT_LOADADDRESS =3D      "0x80080000"
-UBOOT_RD_LOADADDRESS =3D   "0x84000000"
-UBOOT_RD_ENTRYPOINT =3D    "0x84000000"
-UBOOT_DTB_LOADADDRESS =3D  "0x83000000"
-UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
-UBOOT_DTBO_OFFSET =3D      "0x00010000"
-
-SPL_BINARY =3D "tispl.bin_HS"
-UBOOT_BINARY =3D "u-boot.img_HS"
-UBOOT_SYMLINK =3D "u-boot.img"
-
-# Since default tiboot3.bin on AM64x is for HS, add a version for GP
-BBMULTICONFIG +=3D "k3r5-gp"
-IMAGE_BOOT_FILES +=3D " tiboot3-am64x-gp-evm.bin"
-do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 297d6007..00ee31b8 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -14,8 +14,9 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am642-evm-nand.dtbo \
 "
=20
-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+BBMULTICONFIG =3D "k3r5-hs-se"
+do_image_wic[mcdepends] =3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am64x"
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
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 916d8773..41516e06 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -30,7 +30,7 @@ do_compile:append:am65xx-hs-evm() {
 	tfa_sign_k3hs
 }
=20
-do_compile:append:am64xx-hs-evm() {
+do_compile:append:am64xx-evm() {
 	tfa_sign_k3hs
 }
=20
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index e268a542..e59a8e79 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -64,7 +64,7 @@ do_compile:append:am65xx-hs-evm() {
     optee_sign_k3hs
 }
=20
-do_compile:append:am64xx-hs-evm() {
+do_compile:append:am64xx-evm() {
     optee_sign_k3hs
 }
=20
--=20
2.25.1


