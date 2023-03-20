Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27210C77B61
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6727.1679285566754101867
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4554540CAA
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS8t0pVy0nJq for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AFE040CB0
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4A5E51637D0
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 45/54] conf: machine: j784s4-evm: Add uarts overlay for J784S4
Date: Mon, 20 Mar 2023 04:12:32 +0000
Message-Id: <20230320041241.1293077-46-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16152

From: Bhavya Kapoor <b-kapoor@ti.com>

Add device tree overlay for extending support for mcu_uart0 as well as
wkup_uart0 for boards with J784S4 SoC. This overlay will mainly be used
for the purpose of testing uart instances.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index 02f3f4c4..b06153a8 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -35,6 +35,7 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-j784s4-evm.dtb \
     ti/k3-j784s4-evm-csi2-ov5640.dtbo \
     ti/k3-j784s4-fpdlink-fusion.dtbo \
+    ti/k3-j784s4-evm-uarts.dtbo \
 "
=20
 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
--=20
2.25.1


