Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434F0C3ABD8
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:54:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4211.1747443280157150646
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 May 2025 17:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 846A940C2B;
	Sat, 17 May 2025 00:54:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFTt6pEyCpXq; Sat, 17 May 2025 00:54:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6792240CC1;
	Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BC46C168552;
	Fri, 16 May 2025 20:54:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 4/6] beagle-bsp.inc: add BSP definitions for 6.12
Date: Fri, 16 May 2025 20:54:28 -0400
Message-Id: <20250517005430.3648211-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250517005430.3648211-1-denis@denix.org>
References: <20250517005430.3648211-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 May 2025 00:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18568

From: Denys Dmytriyenko <denys@konsulko.com>

Add BSP definitions for "bsp-bb_org-6_12".

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/include/beagle-bsp.inc       | 56 +++++++++++++------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index dbfd70bd..7dff583e 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -1,30 +1,30 @@
 # Use meta-ti-bsp "multi-BSP" facility to create a custom "bb_org" BSP p=
rofile
 # with default preferences for Beagle platforms
=20
-# Default is bb_org-6_6, but can override with any of the existing optio=
ns
-TI_PREFERRED_BSP ?=3D "bb_org-6_6"
+# Default is bb_org-6_12, but can override with any of the existing opti=
ons
+TI_PREFERRED_BSP ?=3D "bb_org-6_12"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-# bb_org-6_1
-# BeagleBoard.org kernel 6.1, u-boot 2023.04
+# bb_org-6_12
+# BeagleBoard.org kernel 6.12, Upstream u-boot 2025.04
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 =3D "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org-6_1 =3D "6.1.%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 =3D "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 =3D "2023.%"
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_12 =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_12 =3D "6.12.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_12 =3D "2025.%"
=20
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 =3D "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_12 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_12 =3D "24%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
=20
-# GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.1
-MACHINE_FEATURES:remove:bsp-bb_org-6_1 =3D "gc320"
+# GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.6
+MACHINE_FEATURES:remove:bsp-bb_org-6_12 =3D "gc320"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # bb_org-6_6
@@ -47,3 +47,25 @@ BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "24%"
=20
 # GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.6
 MACHINE_FEATURES:remove:bsp-bb_org-6_6 =3D "gc320"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# bb_org-6_1
+# BeagleBoard.org kernel 6.1, u-boot 2023.04
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_1 =3D "6.1.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 =3D "2023.%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
+
+# GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.1
+MACHINE_FEATURES:remove:bsp-bb_org-6_1 =3D "gc320"
--=20
2.25.1


