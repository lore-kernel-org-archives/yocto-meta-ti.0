Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78168C4167B
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.557.1652119192579061989
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8454F40C60
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhJeIW5o59ua for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 73B7740C56
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 18FC7174927
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 06/10] u-boot-ti-staging: Bump to 08.03.00.003 release
Date: Mon,  9 May 2022 17:59:43 +0000
Message-Id: <20220509175947.1994132-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14723

From: Ryan Eatmon <reatmon@ti.com>

Updated the u-boot version for 08.03.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 03c73112..e3214c37 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
=20
 LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
=20
-PR =3D "r24"
+PR =3D "r25"
=20
 BRANCH =3D "ti-u-boot-2021.01"
=20
-SRCREV =3D "edbebb6447c16241031c21b47d27bd3484f78f42"
+SRCREV =3D "70c33dd821811a05c595f29ecac5abae23534768"
--=20
2.25.1


