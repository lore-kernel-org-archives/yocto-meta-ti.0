Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1291C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:45:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8191.1790257501162200248
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 06:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2976A40C82;
	Thu, 24 Sep 2026 13:45:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xelie-G7rlfP; Thu, 24 Sep 2026 13:45:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F3A3340BD4;
	Thu, 24 Sep 2026 13:44:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id F324C17E3F6;
	Thu, 24 Sep 2026 09:44:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
Date: Thu, 24 Sep 2026 09:44:57 -0400
Message-Id: <20260924134457.1405695-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 13:45:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20413

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

The upcoming 6.1 "Blacksail" release is around the corner and OE-Core
set the layer compatibility requirements accordingly:
https://git.openembedded.org/openembedded-core/commit/?id=3D37623ffbdd34a=
5c6b3e12ee33195f8e82343f198

While at it, drop "whinlatter" compatibility, which is now EOL.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-beagle/conf/layer.conf    | 2 +-
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 meta-ti-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
index 5ef549d9..d70b9762 100644
--- a/meta-beagle/conf/layer.conf
+++ b/meta-beagle/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-beagle"
 BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-beagle =3D "6"
=20
-LAYERSERIES_COMPAT_meta-beagle =3D "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-beagle =3D "wrynose blacksail"
=20
 LAYERDEPENDS_meta-beagle =3D " \
     meta-ti-bsp \
diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 809104f7..5ae078dd 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-bsp =3D "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "wrynose blacksail"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index 6f130442..b3cc5c99 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-extras =3D "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-ti-extras =3D "wrynose blacksail"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
index 39a9b6de..24a22074 100644
--- a/meta-ti-test/conf/layer.conf
+++ b/meta-ti-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-test"
 BBFILE_PATTERN_meta-ti-test :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-test =3D "10"
=20
-LAYERSERIES_COMPAT_meta-ti-test =3D "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-ti-test =3D "wrynose blacksail"
=20
 # Set a variable to get to the top of the metadata location
 TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
--=20
2.25.1


