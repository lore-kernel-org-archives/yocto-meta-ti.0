Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195FFCF2580
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 21:17:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19571.1728767834484374330
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Oct 2024 14:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 97D3C41267;
	Sat, 12 Oct 2024 21:17:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l27oFVQGoGJL; Sat, 12 Oct 2024 21:17:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BA0C41266;
	Sat, 12 Oct 2024 21:17:12 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9DED516408C;
	Sat, 12 Oct 2024 17:17:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] layer.conf: add compatibility with walnascar
Date: Sat, 12 Oct 2024 17:17:10 -0400
Message-Id: <20241012211710.54173-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 12 Oct 2024 21:17:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18004

From: Denys Dmytriyenko <denys@konsulko.com>

The next Yocto Project release is called walnascar and OE-Core master bra=
nch
is now marked accordingly. Add layer compatibility with walnascar.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index e87221f3..1fffb971 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-bsp =3D "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "scarthgap styhead walnascar"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index a8c68343..5c493daa 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-extras =3D "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-ti-extras =3D "scarthgap styhead walnascar"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
--=20
2.25.1


