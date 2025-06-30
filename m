Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF49FC83038
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47584.1751306137282874012
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 10:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90E0D40CC1;
	Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiJS5XuvRvQu; Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7448D407DA;
	Mon, 30 Jun 2025 17:55:35 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9C10916AF78;
	Mon, 30 Jun 2025 13:55:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/6] beagle-bsp: unset KERNEL_DEVICETREE_PREFIX
Date: Mon, 30 Jun 2025 13:55:11 -0400
Message-Id: <20250630175516.1782298-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jun 2025 17:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18733

From: Denys Dmytriyenko <denys@konsulko.com>

Beagle machines define both static KERNEL_DEVICETREE list and dynamic
KERNEL_DEVICETREE_PREFIX matching. But BB.org kernel recipes only use
the static list, while TI kernel recipes use dynamic prefix matching
by default.

Since devicetree lists now need to be used outside of the kernel
build, specifically for the new FIT processing wrapper, explicitly
unset KERNEL_DEVICETREE_PREFIX to disable dynamic devicetree prefix
matching, when BB.org BSPs are selected.

This way both kernel build and FIT image wrapper will have the same
list of DTBs to handle, based on the BSP selection.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/include/beagle-bsp.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index 7dff583e..af8e4b01 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -14,6 +14,7 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_12 =3D "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_12 =3D "6.12.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 =3D "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_12 =3D "2025.%"
+KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
=20
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
@@ -36,6 +37,7 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_6 =3D "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_6 =3D "6.6.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 =3D "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 =3D "2024.%"
+KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 =3D ""
=20
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
@@ -58,6 +60,7 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 =3D "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_1 =3D "6.1.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 =3D "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 =3D "2023.%"
+KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_1 =3D ""
=20
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 =3D "1.17%"
--=20
2.25.1


