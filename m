Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C87C761AF
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11296.1679311499668467860
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A94A40301
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlbgH6ZCis_b for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:24:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 166E540CB4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:55 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 50CAD1637E1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 29/53] conf: machine: am62axx: Add overlays for IMX390 cameras
Date: Mon, 20 Mar 2023 11:24:28 +0000
Message-Id: <20230320112452.2813505-30-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16207

From: Jai Luthra <j-luthra@ti.com>

IMX390 is a 2MP FPDLink-III raw camera. This sensor was originally
targeted for J7-based devices, but AM62A can re-use the existing
overlays. Both the CM and RCM type of modules are supported.

As AM62A only has one CSI-RX port, we only use 4 out of the 8 total
FPDLink ports on the fusion board.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf=
/machine/am62axx-evm.conf
index 12492095..9dcb6e55 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -12,6 +12,14 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am62a7-fpdlink-ov2312-0-3.dtbo \
     ti/k3-am62a7-fpdlink-sk-fusion.dtbo \
     ti/k3-am62a7-sk-csi2-imx219.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
 "
=20
 UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
--=20
2.25.1


