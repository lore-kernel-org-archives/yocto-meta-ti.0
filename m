Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8805.1645503274896316651
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 57E4F40C7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njwbeNi0gQty for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 495E540AE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4A09917476C
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 15/29] ipc: ti-rpmsg-char: Update library to 0.4.0
Date: Tue, 22 Feb 2022 04:14:16 +0000
Message-Id: <20220222041430.2840289-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Hari Nagalla <hnagalla@ti.com>

Update the ti-rpmsg-char library to 0.4.0 version that enables the
support for j721s2 SoC family remote processors.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/r=
ecipes-ti/ipc/ti-rpmsg-char.inc
index 140536e7..08066edf 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL =3D "git"
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=3D${PROTO=
COL};branch=3D${BRANCH};"
=20
-# Initial 0.3.1 release
-SRCREV =3D "0824546f61bda7715519841d9b9f0fb030ddfaf2"
+# Initial 0.4.0 release
+SRCREV =3D "92b464f1e7477f77e44ae18d87b3d369576d662e"
=20
-PV =3D "0.3.1+git${SRCPV}"
+PV =3D "0.4.0+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1

