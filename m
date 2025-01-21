Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDABC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 19:09:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24252.1737486579149913221
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 11:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6657340BA7;
	Tue, 21 Jan 2025 19:09:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ra0xFZPu8-8K; Tue, 21 Jan 2025 19:09:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AA8A40B13;
	Tue, 21 Jan 2025 19:09:36 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 993D616415A;
	Tue, 21 Jan 2025 14:09:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Andrew Davis <afd@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH v2] conf: machine: k3: Use Cortex-A53/A72 CPU tune
Date: Tue, 21 Jan 2025 14:08:25 -0500
Message-Id: <20250121190825.817065-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2025 19:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18211

From: Andrew Davis <afd@ti.com>

All current K3 devices use either A53 or A72. Use the compile tune
configuration specific for these to allow the compiler to make
better optimizations.

Default tune here is weakly set to a lowest common denominator of
aarch64, as before, which is a recommended behavior for a BSP layer.

This allows for greater binary reuse (packages, sstate, etc.) across
different platforms of the same architecture in multi-BSP environments.

At the same time, since all the correct tunes are now configured for
K3 devices, one can elevate compiler optimization levels either from
local.conf or own Distro configuration on a per-SoC or per-device
basis, like so:

DEFAULTTUNE:k3 =3D "armv8a-crc"
DEFAULTTUNE:j721e =3D "cortexa72-cortexa53"
DEFAULTTUNE:beagleplay =3D "cortexa72-cortexa53"

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
There were several discussions on this topic, e.g. a v1 of this
patch and also a similar separate patch:
https://patchwork.yoctoproject.org/project/ti/patch/20240215212613.57012-=
1-afd@ti.com/
https://patchwork.yoctoproject.org/project/ti/patch/20241114140801.196452=
8-1-matthias.schiffer@ew.tq-group.com/

v2 sets back the lowest DEFAULTTUNE, explains why, and details
how to benefit from extra optimizations and where to set those.

 meta-ti-bsp/conf/machine/include/k3.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index a296f64f..dd3cbeca 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -3,7 +3,8 @@
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append =3D ":k3"
=20
-require conf/machine/include/arm/arch-arm64.inc
+DEFAULTTUNE ?=3D "aarch64"
+require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
=20
 require conf/machine/include/ti-bsp.inc
=20
--=20
2.25.1


