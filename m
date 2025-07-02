Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A062C8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:46:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.13491.1751420781072142287
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 18:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D06F440CC3;
	Wed,  2 Jul 2025 01:46:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhvogRMcU_gq; Wed,  2 Jul 2025 01:46:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B129540ACD;
	Wed,  2 Jul 2025 01:46:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7FAC216B1A9;
	Tue,  1 Jul 2025 21:46:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH v2 1/6] beagle-bsp: unset KERNEL_DEVICETREE_PREFIX
Date: Tue,  1 Jul 2025 21:46:11 -0400
Message-Id: <20250702014616.100136-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Jul 2025 01:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18756

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
v2 - no changes

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


