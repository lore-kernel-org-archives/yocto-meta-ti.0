Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE534D5C0F4
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 15:51:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15830.1731081063228790609
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Nov 2024 07:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25D4940C79;
	Fri,  8 Nov 2024 15:51:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 516HbKmMRkPt; Fri,  8 Nov 2024 15:51:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0AB3440B13;
	Fri,  8 Nov 2024 15:51:00 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3147F1640DD;
	Fri,  8 Nov 2024 10:50:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH v2 03/10] conf/machine: move "bb_org" BSP settings to meta-beagle
Date: Fri,  8 Nov 2024 10:50:51 -0500
Message-Id: <20241108155058.2729634-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108155058.2729634-1-denis@denix.org>
References: <20241108155058.2729634-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Nov 2024 15:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18055

From: Denys Dmytriyenko <denys@konsulko.com>

Define "bb_org" default BSP settings in meta-beagle layer that all Beagle
platforms will use.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/include/beagle-bsp.inc       | 24 +++++++++++++++++++
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 21 +---------------
 2 files changed, 25 insertions(+), 20 deletions(-)
 create mode 100644 meta-beagle/conf/machine/include/beagle-bsp.inc

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
new file mode 100644
index 00000000..77d0b483
--- /dev/null
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -0,0 +1,24 @@
+# Use meta-ti-bsp "multi-BSP" facility to create a custom "bb_org" BSP p=
rofile
+# with default preferences for Beagle platforms
+
+# Default is bb_org, but can override with any of the existing options
+TI_PREFERRED_BSP ?=3D "bb_org"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# bb_org
+# BeagleBoard.org kernel 6.1, u-boot 2023.04
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-bb_org =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org =3D "%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org =3D "%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/co=
nf/machine/include/ti-bsp.inc
index d27bbe3c..fcb7e2bc 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
=20
-# Supported options are: mainline, next, ti-6_6, ti-6_1, bb_org
+# Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
 TI_PREFERRED_BSP ??=3D "ti-6_6"
=20
 # Use bsp-* namespace for overrides
@@ -80,25 +80,6 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 =3D "23%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 =3D "23%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_1 =3D "22%"
=20
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-# bb_org
-# BeagleBoard.org kernel 6.1, u-boot 2023.04
-# based on TI staging trees with extra Beagle-specific features
-# but may not be up-to-date with TI version
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-BSP_KERNEL_PROVIDER:bsp-bb_org =3D "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org =3D "%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org =3D "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org =3D "%"
-
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org =3D "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org =3D "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org =3D "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
-
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # sane fallback defaults
 # if specific values are not defined or bsp is set incorrectly
--=20
2.25.1


