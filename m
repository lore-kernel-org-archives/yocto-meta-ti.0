Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184BCC77B60
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6307.1679283531522634862
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB0B840C60
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1nkhtoqA-UQ for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C77FB40CBA
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9652A1637E4
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 32/54] conf: machine: j721s2: Fix DTB overlay extension for OV5640
Date: Mon, 20 Mar 2023 03:38:18 +0000
Message-Id: <20230320033840.1193963-33-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16058

From: Sinthu Raja <sinthu.raja@ti.com>

The extension for OV5640 overlay is incorrect. Therefore, update the
correct extension to build the overlay with .dtbo

Fixes: f67e9805 ("conf: machine: j721s2: Add AM68 SK specific dtb and dtb=
o to KERNEL_DEVICETREE")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index e3e52b49..7fb00f35 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -11,7 +11,7 @@ OPTEE_K3_USART =3D "0x8"
=20
 KERNEL_DEVICETREE =3D " \
     ti/k3-am68-sk-base-board.dtb \
-    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
+    ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
--=20
2.25.1


