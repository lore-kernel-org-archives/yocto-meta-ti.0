Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1C5C77B71
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6438.1679283571126811369
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 99ED640CC1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HlBXzQbxYF9 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 22BA540CC3
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:28 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 30E1E1637D2
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 45/53] conf: machine: j721e-evm: Add MCSPI loopback overlay for J721E
Date: Mon, 20 Mar 2023 03:39:17 +0000
Message-Id: <20230320033925.1306823-46-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16100

From: Vaishnav Achath <vaishnav.a@ti.com>

Add the MCSPI loopback overlay file for J721E EVM which helps
users to enable MCU-MAIN MCSPI loopback applications, even though
the overlay is named j7200-mcspi-loopback.dtbo, same can be used
for testing on other J7 platforms as well.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721e-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/m=
achine/j721e-evm.conf
index 7249ecb2..029b1fe7 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -33,6 +33,7 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-j721e-sk-csi2-ov5640.dtbo \
     ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
     ti/k3-j721e-common-proc-board-uarts.dtbo \
+    ti/k3-j7200-mcspi-loopback.dtbo \
 "
=20
 UBOOT_MACHINE =3D "j721e_evm_a72_config"
--=20
2.25.1


