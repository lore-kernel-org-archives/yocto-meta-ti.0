Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8799.1645503247225108376
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8017A40AE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8od0dvLtpoGc for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9CFEF40C8C
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 668B417476C
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 13/17] meta-ti: set layer compatibility with kirkstone
Date: Tue, 22 Feb 2022 04:13:57 +0000
Message-Id: <20220222041401.2840172-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 309e3d2b..e3542f50 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-bsp =3D "honister"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "kirkstone"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index 5cca22f8..1fb77e2a 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-extras =3D "honister"
+LAYERSERIES_COMPAT_meta-ti-extras =3D "kirkstone"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
--=20
2.25.1

