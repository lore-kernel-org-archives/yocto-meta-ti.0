Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8807.1645503275866965507
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF37C40C87
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBAxQn1Zcqw6 for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E512E40C06
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A1E15174774
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:34 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 29/29] u-boot-ti-staging: Bump to 08.02.00.003 release
Date: Tue, 22 Feb 2022 04:14:30 +0000
Message-Id: <20220222041430.2840289-30-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ryan Eatmon <reatmon@ti.com>

Updated the u-boot version for 08.02.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 16bb1521..701b802a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
=20
 LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
=20
-PR =3D "r18"
+PR =3D "r19"
=20
 BRANCH =3D "ti-u-boot-2021.01"
=20
-SRCREV =3D "ebc8dca63dd961aaf5f5f626a19c6f6bfd7428f0"
+SRCREV =3D "bd58b61277a189ee49e0d6e9fd03d52996685d98"
--=20
2.25.1

