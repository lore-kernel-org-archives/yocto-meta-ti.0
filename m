Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D9C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 23:42:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1531.1676158935959677609
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 11 Feb 2023 15:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9D0F40C16;
	Sat, 11 Feb 2023 23:42:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVo9FEkyITOA; Sat, 11 Feb 2023 23:42:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D3B3940ACD;
	Sat, 11 Feb 2023 23:42:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 421811636F8;
	Sat, 11 Feb 2023 18:41:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] conf/machine/k3r5.inc: update bootflow links
Date: Sat, 11 Feb 2023 23:42:05 +0000
Message-Id: <20230211234205.3042518-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 11 Feb 2023 23:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15814

From: Denys Dmytriyenko <denys@konsulko.com>

Original READMEs with bootflows were reworked and moved to a dedicated do=
c/
folder in more recent U-boot versions. Update links in the k3r5 config fi=
le
accordingly to provide some basic explanation of K3 bootflows.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf=
/machine/include/k3r5.inc
index 48202154..880ec3a6 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -8,8 +8,9 @@ DEFAULTTUNE =3D "armv7athf"
 require conf/machine/include/arm/armv7a/tune-cortexa8.inc
=20
 # R5 runs early bootloader and loads SYSFW
-# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
-# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/j721e/README
+# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_ev=
m.rst
+# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk=
.rst
+# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-dummy"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
--=20
2.25.1


