Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A34C7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6728.1679285567887048374
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4274040C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMQry7rOwUSf for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 73BC840301
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 559B01637C8
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 04/54] conf: omap-a15: Fix parsing when KERNEL_DEVICETREE is not set
Date: Mon, 20 Mar 2023 04:11:51 +0000
Message-Id: <20230320041241.1293077-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16158

From: Zachary Booth <zachary.booth@garmin.com>

Correctly handle parsing when KERNEL_DEVICETREE is not set.

Signed-off-by: Zachary Booth <zachary.booth@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index bc6add02..49db1cb6 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -23,7 +23,7 @@ UBOOT_ARCH =3D "arm"
 UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
=20
-DEVICETREE_FILE =3D "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}=
"
+DEVICETREE_FILE =3D "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("t=
i/","")}"
=20
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX =3D "1"
--=20
2.25.1


