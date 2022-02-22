Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8946.1645503249171150570
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D0D140C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1AzbhisFfCJ for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9399140C30
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7BC25174775
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 15/17] ti33x: move screen feature to machine configs
Date: Tue, 22 Feb 2022 04:13:59 +0000
Message-Id: <20220222041401.2840172-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Vivien Didelot <vivien.didelot@gmail.com>

The AM335x SoC has a built-in 16bit/24bit RGB LCD controller, and
the BeagleBone Black uses an external chip to convert this to HDMI.

But the SoC does not have a video output port per-se, thus the "screen"
machine feature does not belong to its configuration but rather to
the machine configurations.

Move the feature (and the MACHINE_GUI_CLASS definition) out of
ti33x.inc into am335x-evm.conf and beaglebone.conf respectively.

At the same time, drop the irrelevant comments regarding the external
screen, since MACHINE_GUI_CLASS is unlikely used and the BeagleBone
Black has a micro HDMI port, not a DVI port.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf   | 2 +-
 meta-ti-bsp/conf/machine/beaglebone.conf   | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc | 5 +----
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/=
machine/am335x-evm.conf
index 469c4d37..09bd3934 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/ti33x.inc
=20
 MACHINE_GUI_CLASS =3D "smallscreen"
-MACHINE_FEATURES +=3D "touchscreen"
+MACHINE_FEATURES +=3D "screen touchscreen"
=20
 IMAGE_FSTYPES +=3D "ubifs ubi"
=20
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index bc66102b..413a960d 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -8,8 +8,8 @@ KERNEL_DEVICETREE =3D "am335x-bone.dtb am335x-boneblue.dt=
b \
                     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
                     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
=20
-# Only has DVI connector for external screen
 MACHINE_GUI_CLASS =3D "bigscreen"
+MACHINE_FEATURES +=3D "screen"
=20
 SERIAL_CONSOLES =3D "115200;ttyS0"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index afb80fd6..38b0b66e 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -13,9 +13,6 @@ XSERVER =3D "xserver-xorg \
            xf86-video-fbdev \
            xf86-input-keyboard"
=20
-# Default to external video, change to smallscreen for built-in LCD
-MACHINE_GUI_CLASS =3D "bigscreen"
-
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r22"
=20
@@ -62,7 +59,7 @@ UBI_VOLNAME =3D "rootfs"
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
 # List common SoC features, may need to add touchscreen for specific mac=
hines
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu"
+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 alsa ethe=
rnet gpu"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz"
 WKS_FILE ?=3D "sdimage-2part.wks"
--=20
2.25.1

