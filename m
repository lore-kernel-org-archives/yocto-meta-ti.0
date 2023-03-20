Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54337C77B7A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6432.1679283568947337939
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B3D8640C60
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAGG4HYBiiFX for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A911540CB6
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9529B1637D3
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 32/53] conf: machine: j721s2: Add FPDLink overlays for am68-sk
Date: Mon, 20 Mar 2023 03:39:04 +0000
Message-Id: <20230320033925.1306823-33-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16083

From: Sinthu Raja <sinthu.raja@ti.com>

Add the overlay files, over AM68 SK, for the following:

 1. Fusion board (For FPDLink-III cameras).
 2. IMX390 FPDLink-III camera module which includes both the CM and
    RCM type of modules.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 7fb00f35..791ccbbc 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -13,7 +13,24 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am68-sk-base-board.dtb \
     ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
+    ti/k3-am68-sk-fpdlink-fusion.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
--=20
2.25.1


