Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3D3C77B7F
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11286.1679311497650069001
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E60140CBF
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KK5fhgyBLLir for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:24:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E360240C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 45F9F1637E0
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 28/53] conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
Date: Mon, 20 Mar 2023 11:24:27 +0000
Message-Id: <20230320112452.2813505-29-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16184

From: Sinthu Raja <sinthu.raja@ti.com>

AM68 Starter Kit is a low cost, small form factor board designed for
TI's AM68/J721S2 SoC[1] which is optimized to provide best in class perfo=
rmance
for industrial applications. Add DTB entry for the same.

AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connect=
ors.
Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.

[1]:http://www.ti.com/lit/zip/spruj28

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 93efbb70..e3e52b49 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -10,6 +10,10 @@ TFA_K3_USART =3D "0x8"
 OPTEE_K3_USART =3D "0x8"
=20
 KERNEL_DEVICETREE =3D " \
+    ti/k3-am68-sk-base-board.dtb \
+    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
+    ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
+    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
--=20
2.25.1


