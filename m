Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C210C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 15:56:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15334.1718380571487619794
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 08:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8936C40CC8;
	Fri, 14 Jun 2024 15:56:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LZltRS3Dkkm; Fri, 14 Jun 2024 15:56:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6FDAD40CC7;
	Fri, 14 Jun 2024 15:56:09 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CF744163FA3;
	Fri, 14 Jun 2024 11:56:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] layer.conf, TODO: drop nanbield compatibility
Date: Fri, 14 Jun 2024 11:56:06 -0400
Message-Id: <20240614155606.792020-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614155606.792020-1-denis@denix.org>
References: <20240614155606.792020-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 15:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17735

From: Denys Dmytriyenko <denys@konsulko.com>

As nanbield has been EOL-ed recently.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 TODO                           | 7 -------
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/TODO b/TODO
index e1aeba53..40d82c10 100644
--- a/TODO
+++ b/TODO
@@ -1,9 +1,2 @@
-
 This TODO list allows us to track certain actions and lists of patches t=
hat
 need to be removed at a future date.
-
-
-May 2024 - nanbield EOL
------------------------
-  - Remove python3-yamllint: Temporarily carry this new recipe
-
diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 03cbd7ea..e87221f3 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-bsp =3D "nanbield scarthgap styhead"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "scarthgap styhead"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index f2d6b250..a8c68343 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-extras =3D "nanbield scarthgap styhead"
+LAYERSERIES_COMPAT_meta-ti-extras =3D "scarthgap styhead"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
--=20
2.25.1


