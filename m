Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5AFC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6795.1679285565367556534
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9A2D240CB3
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xp3CAF2Qey4M for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8DB5D40CB1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 73F9B1637C7
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 27/54] conf: machine: am62xx: Add missing overlays for AM625 SK
Date: Mon, 20 Mar 2023 04:12:14 +0000
Message-Id: <20230320041241.1293077-28-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16121

From: Aradhya Bhatia <a-bhatia1@ti.com>

Add the overlay files, over AM625 SK, for the following:

1. Technexion OV5640 Camera
2. Enhanced Capture (ECAP)
3. HDMI Audio Output
4. MCAN Transceiver
5. Microtips OLDI Panel

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
index 96355411..8892a05f 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -9,6 +9,11 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am625-skeleton.dtb \
     ti/k3-am625-sk-lpmdemo.dtb \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
+    ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
+    ti/k3-am625-sk-ecap-capture.dtbo \
+    ti/k3-am625-sk-hdmi-audio.dtbo \
+    ti/k3-am625-sk-mcan.dtbo \
+    ti/k3-am625-sk-oldi-panel.dtbo \
 "
=20
 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
--=20
2.25.1


