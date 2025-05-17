Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52713C5475C
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:54:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4212.1747443281199728012
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 May 2025 17:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE96640C8A;
	Sat, 17 May 2025 00:54:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPKmJIXT0Qru; Sat, 17 May 2025 00:54:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CEA5D40CB0;
	Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D3CAE16855A;
	Fri, 16 May 2025 20:54:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 6/6] pocketbeagle2: add configs for new PocketBeagle2 platform
Date: Fri, 16 May 2025 20:54:30 -0400
Message-Id: <20250517005430.3648211-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250517005430.3648211-1-denis@denix.org>
References: <20250517005430.3648211-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 May 2025 00:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18569

From: Denys Dmytriyenko <denys@konsulko.com>

Add configuration files for the new PocketBeagle2 platform.

U-boot support for this platform is still in its own branch.

Adjust U-boot bootcmd, since EFI boot doesn't seem to work.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/pocketbeagle2-k3r5.conf      | 12 ++++++++
 meta-beagle/conf/machine/pocketbeagle2.conf   | 28 +++++++++++++++++++
 .../u-boot/u-boot-bb.org_2025.04.bb           |  9 +++++-
 .../recipes-kernel/linux/linux-bb.org_6.12.bb |  2 +-
 4 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
 create mode 100644 meta-beagle/conf/machine/pocketbeagle2.conf

diff --git a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf b/meta-beag=
le/conf/machine/pocketbeagle2-k3r5.conf
new file mode 100644
index 00000000..32e40312
--- /dev/null
+++ b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
@@ -0,0 +1,12 @@
+#@TYPE: Machine
+#@NAME: PocketBeagle2 (R5F)
+#@DESCRIPTION: Machine configuration for the PocketBeagle2 (R5F core)
+
+require conf/machine/include/k3r5.inc
+require conf/machine/include/beagle-bsp.inc
+
+SYSFW_SOC =3D "am62x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+
+UBOOT_MACHINE =3D "am6232_pocketbeagle2_r5_defconfig"
diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/co=
nf/machine/pocketbeagle2.conf
new file mode 100644
index 00000000..3d9651bd
--- /dev/null
+++ b/meta-beagle/conf/machine/pocketbeagle2.conf
@@ -0,0 +1,28 @@
+#@TYPE: Machine
+#@NAME: PocketBeagle2 (A53)
+#@DESCRIPTION: Machine configuration for the PocketBeagle2 board (A53 co=
re)
+
+require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
+require conf/machine/include/beagle-bsp.inc
+
+SOC_FAMILY:append =3D ":am62xx"
+
+SERIAL_CONSOLES =3D "115200;ttyS2"
+
+TFA_BOARD =3D "lite"
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
+OPTEEMACHINE =3D "k3-am62x"
+
+UBOOT_MACHINE =3D "am6232_pocketbeagle2_a53_defconfig"
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am6232 \
+"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am6232-pocketbeagle2.dtb \
+    ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
+"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
index 9fc4015e..aa825d99 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
@@ -2,7 +2,7 @@ require recipes-bsp/u-boot/u-boot-ti.inc
=20
 SUMMARY =3D "BeagleBoard.org U-Boot"
=20
-COMPATIBLE_MACHINE =3D "beagle.*"
+COMPATIBLE_MACHINE =3D "pocketbeagle2|beagle.*"
=20
 PV =3D "2025.04"
=20
@@ -17,3 +17,10 @@ SRCREV:beagley-ai =3D "cc376f9faef201670c7bb1734f42f54=
75c73f85d"
 SRCREV:beagley-ai-k3r5 =3D "cc376f9faef201670c7bb1734f42f5475c73f85d"
=20
 SRC_URI:append:beagley-ai =3D " file://bootcmd-ti-mmc.cfg"
+
+BRANCH:pocketbeagle2 =3D "v2025.04-pocketbeagle2"
+BRANCH:pocketbeagle2-k3r5 =3D "v2025.04-pocketbeagle2"
+SRCREV:pocketbeagle2 =3D "f7439516453b7728bda496ff6496ef6f1411aae3"
+SRCREV:pocketbeagle2-k3r5 =3D "f7439516453b7728bda496ff6496ef6f1411aae3"
+
+SRC_URI:append:pocketbeagle2 =3D " file://bootcmd-ti-mmc.cfg"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 2ef82e0c..bdfd4646 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -6,7 +6,7 @@ SUMMARY =3D "BeagleBoard.org Linux kernel"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
-COMPATIBLE_MACHINE =3D "beagle.*"
+COMPATIBLE_MACHINE =3D "pocketbeagle2|beagle.*"
=20
 inherit kernel
=20
--=20
2.25.1


