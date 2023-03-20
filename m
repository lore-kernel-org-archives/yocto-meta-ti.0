Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE5EC77B7D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11285.1679311497649953219
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F8C340CCB
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6c2AXs0SDtd for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:24:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E80F840C90
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5B8401637E2
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 30/53] conf: machine: j784s4: Add AM69 SK specific dtb and dtbo to KERNEL_DEVICETREE
Date: Mon, 20 Mar 2023 11:24:29 +0000
Message-Id: <20230320112452.2813505-31-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16185

From: Dasnavis Sabiya <sabiya.d@ti.com>

AM69 Starter Kit is a single board designed based on TI's AM69 SOC
providing advanced system integration in automotive ADAS applications,
autonomous mobile robot and edge AI applications. Add support
for the same to include the board dtb file into the root filesystem.

Add DT overlays support for the following features on AM69 SK:
* Add DTBO entry to support OV5640 camera
* Add DTBO entry to support RPi(IMX219) camera
* Add DTBO entry for the DDR memory carveout.

[1]:https://www.ti.com/lit/zip/spruj52

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index 4e0bfba6..75ab484c 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -10,6 +10,10 @@ TFA_K3_USART =3D "0x8"
 OPTEE_K3_USART =3D "0x8"
=20
 KERNEL_DEVICETREE =3D " \
+    ti/k3-am69-sk.dtb \
+    ti/k3-am69-sk-csi2-ov5640.dtbo \
+    ti/k3-am69-sk-ddr-mem-carveout.dtbo \
+    ti/k3-am69-sk-rpi-cam-imx219.dtbo \
     ti/k3-j784s4-evm.dtb \
 "
=20
--=20
2.25.1


