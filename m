Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCC5C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 18:49:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21409.1753210179093761485
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 11:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B269940C8A;
	Tue, 22 Jul 2025 18:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8b8PIyivFwL; Tue, 22 Jul 2025 18:49:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7839440C83;
	Tue, 22 Jul 2025 18:49:34 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id DE70916CA15;
	Tue, 22 Jul 2025 14:49:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Andrew Davis <afd@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [master][PATCH v2 3/3] meta-beagle: beagle-bsp.inc: Fix versions in comments
Date: Tue, 22 Jul 2025 14:49:17 -0400
Message-Id: <20250722184917.53901-3-denis@denix.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250722184917.53901-1-denis@denix.org>
References: <20250722184917.53901-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Jul 2025 18:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18808

From: Andrew Davis <afd@ti.com>

Minor comment changes, fix versions listed for some items.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - rebased on latest master

 meta-beagle/conf/machine/include/beagle-bsp.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index 7368b3af..d180c297 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -4,12 +4,12 @@
 # Default is bb_org-6_12, but can override with any of the existing opti=
ons
 TI_PREFERRED_BSP ?=3D "bb_org-6_12"
=20
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # bb_org-6_12
-# BeagleBoard.org kernel 6.12, Upstream u-boot 2025.04
+# BeagleBoard.org kernel 6.12, u-boot 2025.04
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 BSP_KERNEL_PROVIDER:bsp-bb_org-6_12 =3D "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_12 =3D "6.12.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 =3D "u-boot-bb.org"
@@ -24,12 +24,12 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_12 =3D "24%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
=20
-# GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.6
+# GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.12
 MACHINE_FEATURES:remove:bsp-bb_org-6_12 =3D "gc320"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # bb_org-6_6
-# BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
+# BeagleBoard.org kernel 6.6, u-boot 2024.10
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.35.3


