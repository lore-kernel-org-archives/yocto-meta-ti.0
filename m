Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFFBFD9E35
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 03:23:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87594.1772162602400177624
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 19:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D35E40C81;
	Fri, 27 Feb 2026 03:23:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtUysYKxBhav; Fri, 27 Feb 2026 03:23:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 59C1C40A20;
	Fri, 27 Feb 2026 03:23:20 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 9DC7E179331;
	Thu, 26 Feb 2026 22:23:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] beagle-bsp: unset TI_CORE_INITRAMFS_KERNEL_MODULES
Date: Thu, 26 Feb 2026 22:23:18 -0500
Message-Id: <20260227032318.30573-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Feb 2026 03:23:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19619

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

As BB.org kernel comes with own custom defconfig, there are no modules
required to be loaded from initramfs in order to boot the platforms, as
required drivers are built in. Unset the list of such modules to avoid
breakage.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-beagle/conf/machine/include/beagle-bsp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index 5060e286..09c66668 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -15,6 +15,7 @@ BSP_KERNEL_VERSION:bsp-bb_org-6_12 =3D "6.12.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 =3D "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_12 =3D "2025.%"
 KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-bb_org-6_12 =3D ""
=20
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
@@ -36,6 +37,7 @@ BSP_KERNEL_VERSION:bsp-bb_org-6_6 =3D "6.6.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 =3D "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 =3D "2024.%"
 KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 =3D ""
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-bb_org-6_6 =3D ""
=20
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
--=20
2.35.3


