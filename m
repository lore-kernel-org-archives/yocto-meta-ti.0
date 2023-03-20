Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D452C77B77
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6718.1679285565778465994
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6129640C93
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_IJEFd7Ep6N for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5133C40C16
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5B5A61637D1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 25/54] am62axx-evm: Add AM62A HS-FS evm configuration
Date: Mon, 20 Mar 2023 04:12:12 +0000
Message-Id: <20230320041241.1293077-26-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16139

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Lets add the basic AM62A configuration
- Add machine conf for AM62A.
- The wic images will boot on AM62A HS-FS devices by default.
- The sysfw image for GP and HS-SE will be packaged in the wic image as
  tiboot3-am62ax-gp-evm.bin and tiboot3-am62ax-hs-evm.bin respectively.
- Add ti-sci-firmware overrides.
- Sign ATF, OPTEE and RTOS Firmware.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/am62axx-evm-k3r5-gp.conf     | 19 ++++++++++++++++
 .../conf/machine/am62axx-evm-k3r5-hs-fs.conf  | 14 ++++++++++++
 .../conf/machine/am62axx-evm-k3r5-hs-se.conf  | 22 +++++++++++++++++++
 .../conf/machine/am62axx-evm-k3r5.conf        | 11 ----------
 meta-ti-bsp/conf/machine/am62axx-evm.conf     |  4 ++++
 meta-ti-bsp/conf/machine/include/am62axx.inc  | 15 +++++++++++--
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  4 +++-
 7 files changed, 75 insertions(+), 14 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf b/meta-ti-=
bsp/conf/machine/am62axx-evm-k3r5-gp.conf
new file mode 100644
index 00000000..962413c3
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@NAME: AM62A GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A GP EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "am62ax"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+SYSFW_TIBOOT3_SYMLINK =3D ""
+SYSFW_SYMLINK =3D ""
+
+UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf b/meta-=
ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
new file mode 100644
index 00000000..256f021a
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62A HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A HS-FS EVM (R5F cor=
e)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-hs-fs"
+
+SYSFW_SOC =3D "am62ax"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+
+UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf b/meta-=
ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..c7cb0681
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: AM62A HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A HS-SE EVM (R5F cor=
e)
+
+# Booting HS-SE requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append =3D ":k3r5-hs-se"
+
+SYSFW_SOC =3D "am62ax"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs"
+
+SYSFW_TIBOOT3_SYMLINK =3D ""
+SYSFW_SYMLINK =3D ""
+
+UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_S=
UFFIX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62axx-evm-k3r5.conf
deleted file mode 100644
index ca30537f..00000000
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62AXX EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "am62ax"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
-UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf=
/machine/am62axx-evm.conf
index 4eb179f3..5e11d19b 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -9,3 +9,7 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
+
+SPL_BINARY =3D "tispl.bin_HS"
+UBOOT_BINARY =3D "u-boot.img_HS"
+UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/c=
onf/machine/include/am62axx.inc
index cc477366..d0970948 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -8,8 +8,19 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+# Default tiboot3.bin on AM62A is for HS-FS
+BBMULTICONFIG =3D "k3r5-hs-fs"
+do_image_wic[mcdepends] =3D "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
+BBMULTICONFIG +=3D "k3r5-gp"
+IMAGE_BOOT_FILES +=3D "tiboot3-am62ax-gp-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-=
SE
+BBMULTICONFIG +=3D "k3r5-hs-se"
+IMAGE_BOOT_FILES +=3D "tiboot3-am62ax-hs-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am62x"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 18153d37..5fb16642 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -44,7 +44,9 @@ SYSFW_PREFIX:am62xx-evm-k3r5-hs-fs =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs =3D "fs"
-SYSFW_PREFIX:am62axx-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:am62axx-evm-k3r5-gp =3D "fs"
+SYSFW_PREFIX:am62axx-evm-k3r5-hs-fs =3D "fs"
+SYSFW_PREFIX:am62axx-evm-k3r5-hs-se =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
=20
--=20
2.25.1


