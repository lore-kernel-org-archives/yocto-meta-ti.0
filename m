Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BA2C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 03:33:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3596.1707795219824211648
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 19:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 31DFE40C56;
	Tue, 13 Feb 2024 03:33:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0K5Vgk35k3X; Tue, 13 Feb 2024 03:33:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 54F2640C2E;
	Tue, 13 Feb 2024 03:33:37 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 03DA3163E37;
	Mon, 12 Feb 2024 22:33:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] layer.conf: add compatibility with scarthgap
Date: Mon, 12 Feb 2024 22:33:35 -0500
Message-Id: <20240213033335.3884670-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Feb 2024 03:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17477

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core master has switched compatibility requirements from nanbield
to scarthgap in preparation for the upcoming 5.0 release.
https://wiki.yoctoproject.org/wiki/Releases

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index f0fcbc7b..502e355f 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-bsp =3D "kirkstone langdale mickledore nanbie=
ld"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "kirkstone langdale mickledore nanbie=
ld scarthgap"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index a7cca42e..a05dbe5f 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-extras =3D "kirkstone langdale mickledore nan=
bield"
+LAYERSERIES_COMPAT_meta-ti-extras =3D "kirkstone langdale mickledore nan=
bield scarthgap"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
--=20
2.25.1


