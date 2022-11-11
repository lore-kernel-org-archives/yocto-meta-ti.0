Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E73EC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 01:18:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.584.1668129499023268385
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 17:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D303A40DC1;
	Fri, 11 Nov 2022 01:18:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWw-jOBR7UYJ; Fri, 11 Nov 2022 01:18:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B271940DBF;
	Fri, 11 Nov 2022 01:18:16 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 20A2D163688;
	Thu, 10 Nov 2022 20:18:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] conf/machine/omapl138: correct few of the machine settings
Date: Fri, 11 Nov 2022 01:18:15 +0000
Message-Id: <20221111011815.1980210-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Nov 2022 01:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15341

From: Denys Dmytriyenko <denys@konsulko.com>

Cleanup and unify again - omapl138-lcdk is the only platform supported in
the OMAP-L1 family. Plus there's no longer DaVinci family with correspond=
ing
settings. Adjust accordingly.

Please note, there's currently a bug building Rust on ARMv5 platforms:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14967

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/omapl1.inc   |  2 --
 meta-ti-bsp/conf/machine/include/omapl138.inc | 14 +++++++++-
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  1 -
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  1 -
 .../linux/bundle-devicetree.inc               | 26 -------------------
 .../linux/linux-ti-staging_5.10.bb            |  1 -
 .../recipes-ti/includes/ti-paths.inc          |  3 ---
 7 files changed, 13 insertions(+), 35 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/omapl1.inc
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.in=
c

diff --git a/meta-ti-bsp/conf/machine/include/omapl1.inc b/meta-ti-bsp/co=
nf/machine/include/omapl1.inc
deleted file mode 100644
index d0262c3f..00000000
--- a/meta-ti-bsp/conf/machine/include/omapl1.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append =3D ":omapl1"
diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc b/meta-ti-bsp/=
conf/machine/include/omapl138.inc
index c6eb0cd9..2e4a47a5 100644
--- a/meta-ti-bsp/conf/machine/include/omapl138.inc
+++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
@@ -1,2 +1,14 @@
-require conf/machine/include/omapl1.inc
+require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append =3D ":omapl138"
+
+require conf/machine/include/arm/armv5/tune-arm926ejs.inc
+
+KERNEL_IMAGETYPE =3D "zImage"
+
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
+
+MACHINE_FEATURES =3D "kernel26 serial ethernet usbhost usbgadget mmc als=
a"
diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/co=
nf/machine/omapl138-lcdk.conf
index ba4d5645..b318f82d 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -2,7 +2,6 @@
 #@NAME: OMAP-L138 LCDK
 #@DESCRIPTION: Machine configuration for the TI OMAP-L138 LCDK board
=20
-require conf/machine/include/davinci.inc
 require conf/machine/include/omapl138.inc
=20
 UBOOT_MACHINE =3D "omapl138_lcdk_config"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index c0f876e3..d87dcbe1 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -55,7 +55,6 @@ SYSROOT_DIRS +=3D "/boot"
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY =3D "u-boot-spl.bin"
 SPL_UART_BINARY:k3r5 =3D ""
-SPL_UART_BINARY:lego-ev3 =3D ""
=20
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc b/met=
a-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc
deleted file mode 100644
index d259e58c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-# Upstream kernel-devicetree.bbclass only supports bundling the DTB with
-# zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage, so=
 we
-# append the DTB to the final uImage here.
-
-do_deploy:append() {
-    if [ "${KERNEL_DEVICETREE_BUNDLE}" =3D "1" ]; then
-        install -d ${DEPLOYDIR}
-        for dtbf in ${KERNEL_DEVICETREE}; do
-            dtb=3D`normalize_dtb "$dtbf"`
-            dtb_ext=3D${dtb##*.}
-            dtb_base_name=3D`basename $dtb .$dtb_ext`
-            for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-                if [ "$type" =3D "uImage" ]; then
-                    cat ${D}/${KERNEL_IMAGEDEST}/$type \
-                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext \
-                    > ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAM=
E}.$dtb_ext.bin
-                    ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext.bin \
-                    ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_=
NAME}.$dtb_ext.bin
-                    cat ${D}/${KERNEL_IMAGEDEST}/$type \
-                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext \
-                    > ${DEPLOYDIR}/$type
-                fi
-            done
-        done
-    fi
-}
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a0af03c5..bf230dbc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -8,7 +8,6 @@ inherit kernel
 DEFCONFIG_BUILDER =3D "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-uio.inc
-require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-ex=
tras/recipes-ti/includes/ti-paths.inc
index 5994ff0a..63c00e8c 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -104,8 +104,5 @@ export TI_CGT7X_INSTALL_DIR        =3D "${STAGING_DIR=
_NATIVE}${TI_CGT7X_INSTALL_DI
 export TI_K3_SECDEV_INSTALL_DIR =3D "${STAGING_DIR_NATIVE}${TI_K3_SECDEV=
_INSTALL_DIR_RECIPE}"
=20
=20
-DSPSUFFIX:omapl137 =3D "x674"
 DSPSUFFIX:omapl138 =3D "x674"
-DSPSUFFIX_ti816x =3D "xe674"
-DSPSUFFIX_ti814x =3D "xe674"
 DSPSUFFIX ?=3D "x64P"
--=20
2.25.1


