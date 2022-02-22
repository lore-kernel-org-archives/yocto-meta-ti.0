Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8958.1645503275840665324
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E243B40C86
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1YgAThYYZNb for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D805640C06
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9664F174773
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:34 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 28/29] linux-ti-staging-rt: Bump to 08.02.00.003 release
Date: Tue, 22 Feb 2022 04:14:29 +0000
Message-Id: <20220222041430.2840289-29-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ryan Eatmon <reatmon@ti.com>

Updated the linux rt version for 08.02.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index fcce8de6..5de1c918 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"
=20
 BRANCH =3D "ti-rt-linux-5.10.y"
=20
-SRCREV =3D "1f6e95d4b12d73bd1728286f3ccc938df7b77954"
-PV =3D "5.10.65+git${SRCPV}"
+SRCREV =3D "b975aee14750c395bf5251ba4042cb0be1afa206"
+PV =3D "5.10.100+git${SRCPV}"
--=20
2.25.1

