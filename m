Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789AFC4167D
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.602.1652119192579577536
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 888AD40C56
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRLHJsON1-ri for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7EFA840C8E
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 39CCF17492A
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 09/10] libdce: upgrade to 3.00.15.00 and specify
 branch
Date: Mon,  9 May 2022 17:59:46 +0000
Message-Id: <20220509175947.1994132-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14722

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes these warnings:

| WARNING: libdce-3.00.14.00-r1 do_fetch: URL: git://git.omapzoom.org/rep=
o/libdce.git;protocol=3Dgit
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.
| WARNING: libdce-3.00.14.00-r1 do_unpack: URL: git://git.omapzoom.org/re=
po/libdce.git;protocol=3Dgit
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libdce/{libdce_3.00.14.00.bb =3D> libdce_3.00.15.00.bb}   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-ti-extras/recipes-multimedia/libdce/{libdce_3.00.14.00.bb =3D=
> libdce_3.00.15.00.bb} (75%)

diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.b=
b b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
similarity index 75%
rename from meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
rename to meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index a6dc1d1d..54f6ff8a 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -6,10 +6,8 @@ inherit autotools pkgconfig
=20
 DEPENDS =3D "libdrm ti-ipc"
=20
-SRC_URI =3D "git://git.omapzoom.org/repo/libdce.git;protocol=3Dgit"
-SRCREV =3D "f72096090e3063e85ea77cae66b2d99a48d91727"
-
-PR =3D "r1"
+SRC_URI =3D "git://git.omapzoom.org/repo/libdce.git;protocol=3Dgit;branc=
h=3Dmaster"
+SRCREV =3D "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
=20
 S =3D "${WORKDIR}/git"
 EXTRA_OECONF +=3D "IPC_HEADERS=3D${STAGING_INCDIR}/ti/ipc/mm"
--=20
2.25.1


