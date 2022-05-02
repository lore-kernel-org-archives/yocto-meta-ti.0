Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1D3C43217
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11692.1651503086681692589
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8622940C93
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZO4I9QkkWkO for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75B4440CB1
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 886D9174927
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 18/26] linux-ti-staging: Bump to 08.03.00.001 release
Date: Mon,  2 May 2022 14:51:12 +0000
Message-Id: <20220502145120.726632-19-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14663

From: Ryan Eatmon <reatmon@ti.com>

Updated the linux version for 08.03.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a1a68a9b..c54890c4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,8 +25,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.10.y"
=20
-SRCREV =3D "7a7a3af903da2b2d551d058f8262a66e6b42b6b1"
-PV =3D "5.10.100+git${SRCPV}"
+SRCREV =3D "3297d854f0fbdc7940878a5d5caa0bd823be5207"
+PV =3D "5.10.109+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR:append =3D "b"
--=20
2.25.1


