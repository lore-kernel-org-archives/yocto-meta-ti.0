Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09119D5D69B
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 15:51:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15833.1731081064964623083
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Nov 2024 07:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 558E340C3E;
	Fri,  8 Nov 2024 15:51:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6YIiupbS2si; Fri,  8 Nov 2024 15:51:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5191D40C8F;
	Fri,  8 Nov 2024 15:51:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6C6A41640E5;
	Fri,  8 Nov 2024 10:50:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH v2 10/10] beagle-bsp, linux-bb.org, u-boot-bb.org: add support for 6.6 BSP
Date: Fri,  8 Nov 2024 10:50:58 -0500
Message-Id: <20241108155058.2729634-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108155058.2729634-1-denis@denix.org>
References: <20241108155058.2729634-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Nov 2024 15:51:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18061

From: Denys Dmytriyenko <denys@konsulko.com>

Some Beagle platforms are switching to 6.6 based Linux kernel and upstrea=
m
U-boot 2024.07. Add corresponding recipes and extend beagle-bsp with requ=
ired
settings.

Note that U-boot recipe added is not BeagleBoard.org or TI specific, but
version 2024.07 or later is required. Sufficiently newer version from OE-=
Core
can also be used, as master now has 2024.10, but scarthgap has an older
2024.01 version.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/include/beagle-bsp.inc       | 47 +++++++++++++------
 .../u-boot/u-boot-bb.org_2024.07.bb           | 12 +++++
 .../linux/linux-bb.org-6.6/defconfig          |  1 +
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 27 +++++++++++
 4 files changed, 73 insertions(+), 14 deletions(-)
 create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.07.=
bb
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/def=
config
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index 77d0b483..51de2b73 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -1,24 +1,43 @@
 # Use meta-ti-bsp "multi-BSP" facility to create a custom "bb_org" BSP p=
rofile
 # with default preferences for Beagle platforms
=20
-# Default is bb_org, but can override with any of the existing options
-TI_PREFERRED_BSP ?=3D "bb_org"
+# Default is bb_org-6_1, but can override with any of the existing optio=
ns
+TI_PREFERRED_BSP ?=3D "bb_org-6_1"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-# bb_org
+# bb_org-6_1
 # BeagleBoard.org kernel 6.1, u-boot 2023.04
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-BSP_KERNEL_PROVIDER:bsp-bb_org =3D "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org =3D "%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org =3D "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org =3D "%"
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_1 =3D "6.1.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 =3D "2023.%"
=20
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org =3D "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org =3D "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org =3D "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_or-6_1g =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# bb_org-6_6
+# BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_6 =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_6 =3D "6.6.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 =3D "2024.%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "24%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "23%"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.07.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.07.bb
new file mode 100644
index 00000000..ca1b051b
--- /dev/null
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.07.bb
@@ -0,0 +1,12 @@
+require recipes-bsp/u-boot/u-boot-ti.inc
+
+SUMMARY =3D "Upstream U-Boot for BeagleBoard.org devices"
+
+COMPATIBLE_MACHINE =3D "beagle.*"
+
+PV =3D "2024.07"
+
+UBOOT_GIT_URI =3D "git://github.com/u-boot/u-boot.git"
+UBOOT_GIT_PROTOCOL =3D "https"
+BRANCH =3D "master"
+SRCREV =3D "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig =
b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig
new file mode 100644
index 00000000..a5de2e24
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig
@@ -0,0 +1 @@
+use-kernel-config=3Dbb.org_defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
new file mode 100644
index 00000000..247c97f6
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -0,0 +1,27 @@
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
+
+SECTION =3D "kernel"
+SUMMARY =3D "BeagleBoard.org Linux kernel"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+
+COMPATIBLE_MACHINE =3D "beagle.*"
+
+inherit kernel
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/ti-kernel.inc
+
+DEPENDS +=3D "gmp-native libmpc-native"
+
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
+
+S =3D "${WORKDIR}/git"
+
+# 6.6.44 version for 64-bit
+SRCREV:aarch64 =3D "d66d2ae99dd7183277cad65bb2db0cc323a80c33"
+PV:aarch64 =3D "6.6.44+git"
+BRANCH:aarch64 =3D "v6.6.44-ti-arm64-r14"
+
+KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
--=20
2.25.1


