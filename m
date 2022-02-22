Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8974.1645503245112189556
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C5EB40C8E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8fdb2V8owC5 for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77C8840C7B
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3DF84174773
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 08/17] meta-ti-extras: setup layer custom licenses
Date: Tue, 22 Feb 2022 04:13:52 +0000
Message-Id: <20220222041401.2840172-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Those were moved from meta-ti-bsp and used by CodeGen Tools.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index 9d809bf0..5cca22f8 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -11,6 +11,8 @@ BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
 LAYERSERIES_COMPAT_meta-ti-extras =3D "honister"
=20
+LICENSE_PATH +=3D "${LAYERDIR}/licenses"
+
 LAYERDEPENDS_meta-ti-extras =3D " \
     meta-ti-bsp \
 "
--=20
2.25.1

