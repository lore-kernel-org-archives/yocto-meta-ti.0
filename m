Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F59BC43217
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.233.1651772675529377283
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE88E40A3D;
	Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_50tv8f949G; Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8AB8240C3A;
	Thu,  5 May 2022 17:44:33 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A34D0174920;
	Thu,  5 May 2022 13:44:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 4/5] conf/machine: remove default setting for xorg
Date: Thu,  5 May 2022 17:44:21 +0000
Message-Id: <20220505174422.334666-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505174422.334666-1-denis@denix.org>
References: <20220505174422.334666-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 17:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14709

From: Denys Dmytriyenko <denys@konsulko.com>

meta-ti does not provide official X.org support, so no reason to set any
defaults, just assume the ones from OE-Core.

Also, drop setting MACHINE_GUI_CLASS, which is now only used by the kerne=
l
from meta-openembedded to determine the size of the Tux during boot. Keep
those for now in community Beagle machines.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf      |  1 -
 meta-ti-bsp/conf/machine/am437x-evm.conf      |  1 -
 meta-ti-bsp/conf/machine/include/k3.inc       |  2 --
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  7 -------
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  9 ---------
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 12 ------------
 6 files changed, 32 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/=
machine/am335x-evm.conf
index 09bd3934..9301406b 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -4,7 +4,6 @@
=20
 require conf/machine/include/ti33x.inc
=20
-MACHINE_GUI_CLASS =3D "smallscreen"
 MACHINE_FEATURES +=3D "screen touchscreen"
=20
 IMAGE_FSTYPES +=3D "ubifs ubi"
diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/=
machine/am437x-evm.conf
index 4e3681d5..98602add 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -4,7 +4,6 @@
=20
 require conf/machine/include/ti43x.inc
=20
-MACHINE_GUI_CLASS =3D "smallscreen"
 MACHINE_FEATURES +=3D "touchscreen"
=20
 IMAGE_FSTYPES +=3D "ubifs ubi"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 7b353129..911b59bd 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -29,8 +29,6 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
 TFA_PLATFORM =3D "k3"
 TFA_BOARD =3D "generic"
=20
-MACHINE_GUI_CLASS =3D "smallscreen"
-
 # Use the expected value of the ubifs filesystem's volume name in the ke=
rnel
 # and u-boot.
 UBI_VOLNAME =3D "rootfs"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 8ab614f0..f548f3fd 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -40,13 +40,6 @@ UBOOT_SUFFIX =3D "img"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
-PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
-XSERVER =3D "xserver-xorg \
-           xf86-input-evdev \
-           xf86-video-fbdev"
-
-MACHINE_GUI_CLASS =3D "smallscreen"
-
 # Use the expected value of the ubifs filesystem's volume name in the ke=
rnel
 # and u-boot.
 UBI_VOLNAME =3D "rootfs"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 06d35f09..cfacc30d 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -4,15 +4,6 @@ SOC_FAMILY:append =3D ":ti33x"
 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/arm/armv7a/tune-cortexa8.inc
=20
-PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
-
-# For built-in LCD, add xf86-input-tslib
-XSERVER =3D "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-fbdev \
-           xf86-input-keyboard"
-
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r22"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 98b374a1..0da5f761 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -4,18 +4,6 @@ SOC_FAMILY:append =3D ":ti43x"
 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/arm/armv7a/tune-cortexa9.inc
=20
-PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
-
-# For built-in LCD, add xf86-input-tslib
-XSERVER =3D "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-fbdev \
-           xf86-input-keyboard"
-
-# Default to external video, change to smallscreen for built-in LCD
-MACHINE_GUI_CLASS =3D "bigscreen"
-
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r3"
=20
--=20
2.25.1


