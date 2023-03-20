Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1254EC7618D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11378.1679311501749980170
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C6A540301
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KII1RZ5UBJ1 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:25:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E55340CB6
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:55 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 739B01637E6
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 34/53] conf: machine: j721s2: Add ehrpwm overlay for am68-sk
Date: Mon, 20 Mar 2023 11:24:33 +0000
Message-Id: <20230320112452.2813505-35-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16210

From: Sinthu Raja <sinthu.raja@ti.com>

The AM68 SK has PWM output pins connected to its RPi headers. Add
overlay file to enable PWM pins.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 791ccbbc..ea727bd3 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -14,6 +14,7 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
     ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
     ti/k3-am68-sk-fpdlink-fusion.dtbo \
+    ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
     ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
--=20
2.25.1


