Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33BBC04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 04:43:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3621.1666413801673733687
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 21:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0C8040DDD;
	Sat, 22 Oct 2022 04:43:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2U64a3vt7bj; Sat, 22 Oct 2022 04:43:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB58A40DEE;
	Sat, 22 Oct 2022 04:43:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B491A174A3B;
	Sat, 22 Oct 2022 00:43:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] u-boot: drop 2020.01
Date: Sat, 22 Oct 2022 04:43:07 +0000
Message-Id: <20221022044307.3385136-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221022044307.3385136-1-denis@denix.org>
References: <20221022044307.3385136-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 22 Oct 2022 04:43:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15194

From: Denys Dmytriyenko <denys@konsulko.com>

Deprecated in favor of 2021.01

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb        | 7 -------
 1 file changed, 7 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2020=
.01.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
deleted file mode 100644
index e1bdae46..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require u-boot-ti.inc
-
-PR =3D "r36"
-
-BRANCH =3D "ti-u-boot-2020.01"
-
-SRCREV =3D "2781231a33c3d779e32445f4fe55164c45d6d7c1"
--=20
2.25.1


