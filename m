Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CF9C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47588.1751306138660151273
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 10:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 22E6B40CBE;
	Mon, 30 Jun 2025 17:55:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGHzox_CtXmw; Mon, 30 Jun 2025 17:55:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81FD540CC0;
	Mon, 30 Jun 2025 17:55:35 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B584316AFDC;
	Mon, 30 Jun 2025 13:55:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 4/6] meta-ti-bsp, meta-beagle: switch to the new FIT image wrapper
Date: Mon, 30 Jun 2025 13:55:14 -0400
Message-Id: <20250630175516.1782298-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630175516.1782298-1-denis@denix.org>
References: <20250630175516.1782298-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jun 2025 17:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18736

From: Denys Dmytriyenko <denys@konsulko.com>

Switch all kernel recipes and K3 based platforms to use the new
FIT image wrapper functionality.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb      | 2 +-
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb     | 2 +-
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb      | 2 +-
 meta-ti-bsp/conf/machine/include/k3.inc                   | 5 ++---
 meta-ti-bsp/conf/machine/include/ti-falcon.inc            | 3 ++-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
index 067c9ddf..320ee60b 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
=20
 COMPATIBLE_MACHINE =3D "beagle.*"
=20
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 6e221d1b..e11675c5 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
=20
 COMPATIBLE_MACHINE =3D "pocketbeagle2|beagle.*"
=20
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index cc7a56ac..28b6735b 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
=20
 COMPATIBLE_MACHINE =3D "beagle.*"
=20
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index ec9a8944..6b4ae2ad 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -9,8 +9,7 @@ require conf/machine/include/arm/armv8a/tune-cortexa72-co=
rtexa53.inc
 require conf/machine/include/ti-bsp.inc
=20
 KERNEL_IMAGETYPE =3D "Image"
-KERNEL_IMAGETYPES =3D "Image fitImage"
-KERNEL_CLASSES +=3D "kernel-fitimage-deprecated"
+KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"
=20
 UBOOT_ARCH =3D "arm"
 UBOOT_ENTRYPOINT =3D "0x81000000"
@@ -30,7 +29,7 @@ FIT_SIGN_ALG ?=3D "rsa4096"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-image"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-image ti-kernel-fiti=
mage"
=20
 TFA_PLATFORM =3D "k3"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp=
/conf/machine/include/ti-falcon.inc
index 252fb28a..590e5bc6 100644
--- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
@@ -1,5 +1,6 @@
 IMAGE_INSTALL:append =3D " u-boot-ti-staging-falcon"
-KERNEL_CLASSES:remove =3D "kernel-fitimage-deprecated"
+KERNEL_CLASSES:remove =3D "kernel-fit-extra-artifacts"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove =3D "ti-kernel-fitimage"
 KERNEL_CLASSES +=3D "kernel-fitimage-legacyhs"
 UBOOT_DTB_LOADADDRESS =3D "0x88000000"
 UBOOT_LOADADDRESS =3D "0x82000000"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 388110ad..4c740678 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "Mainline Linux kernel for TI devices"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/ti-kernel.inc
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 97fa6463..ac034c2c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
 inherit ti-secdev
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 15ff3311..37ae38cb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
 inherit ti-secdev
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 4714bba1..07cad78d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
 inherit ti-secdev
-inherit kernel_deprecated
+inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
--=20
2.25.1


