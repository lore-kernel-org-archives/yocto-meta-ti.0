Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD97DC7EE29
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11289.1679311497768137950
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 687F640CAB
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v37vUKh0kQs4 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:24:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 318E440CA7
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:55 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AB8551637EE
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 40/53] conf: machine: j784s4-evm: Add camera overlays for J784S4 EVM
Date: Mon, 20 Mar 2023 11:24:39 +0000
Message-Id: <20230320112452.2813505-41-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16191

From: Vaishnav Achath <vaishnav.a@ti.com>

Add the following overlay files on J784S4 EVM:

1. Fusion board (For FPDLink-III cameras)
2. OV5640 camera module

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index 40e71b6a..02f3f4c4 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -33,6 +33,8 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
     ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j784s4-evm.dtb \
+    ti/k3-j784s4-evm-csi2-ov5640.dtbo \
+    ti/k3-j784s4-fpdlink-fusion.dtbo \
 "
=20
 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
--=20
2.25.1


