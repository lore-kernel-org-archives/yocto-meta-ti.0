Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C1EC87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 20:49:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.29146.1753476551057442749
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 13:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FCE540BA9;
	Fri, 25 Jul 2025 20:49:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsoiX4UGgqd6; Fri, 25 Jul 2025 20:49:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6743040CC0;
	Fri, 25 Jul 2025 20:49:09 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 21A3216CE2D;
	Fri, 25 Jul 2025 16:49:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 2/3] meta-ti-bsp: generalize non-vendored DEVICETREE_FILES
Date: Fri, 25 Jul 2025 16:49:07 -0400
Message-Id: <20250725204908.2549495-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250725204908.2549495-1-denis@denix.org>
References: <20250725204908.2549495-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Jul 2025 20:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18833

From: Denys Dmytriyenko <denys@konsulko.com>

Automatically generate non-vendored DTBs list in DEVICETREE_FILES from
vendored KERNEL_DEVICETREE list for all platforms to use.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 4 +---
 meta-ti-bsp/conf/machine/include/ti-soc.inc   | 3 +++
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 4 +---
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 4 +---
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index a258decd..3b8eb0fd 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -19,15 +19,13 @@ UBOOT_ARCH =3D "arm"
 UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
=20
-DEVICETREE_FILE =3D "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("t=
i/omap/","").replace("ti/","")}"
-
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX =3D "1"
 UBOOT_EXTLINUX_ROOT =3D "root=3DPARTUUID=3D${uuid}"
 UBOOT_EXTLINUX_BOOT_FILES =3D " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${DEVICETREE_FILE} \
+    ${DEVICETREE_FILES} \
 "
=20
 SPL_BINARY =3D "MLO"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/co=
nf/machine/include/ti-soc.inc
index 27bb38b5..85f6f338 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -16,3 +16,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetre=
e"
 # the kernel
 KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
 KERNEL_DTBVENDORED =3D "1"
+
+# Also build a non-vendored list w/o dir structure
+DEVICETREE_FILES =3D "${@' '.join([os.path.basename(f) for f in d.getVar=
("KERNEL_DEVICETREE").split()])}"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 7e9eb48c..c47165e4 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -64,8 +64,6 @@ UBOOT_MACHINE =3D "am335x_evm_config"
 UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
=20
-DEVICETREE_FILE =3D "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("t=
i/omap/","")}"
-
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX =3D "1"
 UBOOT_EXTLINUX_ROOT =3D "root=3DPARTUUID=3D${uuid}"
@@ -73,7 +71,7 @@ UBOOT_EXTLINUX_KERNEL_ARGS =3D "rootwait rw earlycon"
 UBOOT_EXTLINUX_BOOT_FILES =3D " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${DEVICETREE_FILE} \
+    ${DEVICETREE_FILES} \
 "
=20
 SPL_BINARY =3D "MLO"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 2621d19a..a23b6518 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -37,15 +37,13 @@ UBOOT_MACHINE =3D "am43xx_evm_config"
 UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
=20
-DEVICETREE_FILE =3D "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("t=
i/omap/","")}"
-
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX =3D "1"
 UBOOT_EXTLINUX_ROOT =3D "root=3DPARTUUID=3D${uuid}"
 UBOOT_EXTLINUX_BOOT_FILES =3D " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${DEVICETREE_FILE} \
+    ${DEVICETREE_FILES} \
 "
=20
 SPL_BINARY =3D "MLO"
--=20
2.25.1


