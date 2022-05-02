Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBFAC43219
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11684.1651503084185282847
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E2E8340B86
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjppU_xbYAjq for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD20E40C3A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D2ECD174916
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 01/26] conf: Enable bmap file for wic images on legacy
 platforms
Date: Mon,  2 May 2022 14:50:55 +0000
Message-Id: <20220502145120.726632-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14645

From: Jonathan Humphreys <j-humphreys@ti.com>

To allow a consistent experience across current devices, enable wic.bmap =
file
generation for AM3/4/5 images.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 9a2e0044..94ecab34 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -49,7 +49,7 @@ UBI_VOLNAME =3D "rootfs"
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu mmip dsp gc320"
=20
-IMAGE_FSTYPES +=3D "tar.xz wic.xz"
+IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
 do_image_wic[depends] +=3D "u-boot:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 38b0b66e..083a24b6 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -61,7 +61,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 alsa ethe=
rnet gpu"
=20
-IMAGE_FSTYPES +=3D "tar.xz wic.xz"
+IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 2c3a3770..8757b545 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -61,7 +61,7 @@ EXTRA_IMAGEDEPENDS +=3D "u-boot"
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu"
=20
-IMAGE_FSTYPES +=3D "tar.xz wic.xz"
+IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
 do_image_wic[depends] +=3D "u-boot:do_deploy"
--=20
2.25.1


