Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9E9C77B7F
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6331.1679283569011183752
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFCB240CB4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZgJ_AOqPf2y for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B621340CB0
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C8F011637C3
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 15/53] k3conf update SRCREV to add am62ax support
Date: Mon, 20 Mar 2023 03:38:47 +0000
Message-Id: <20230320033925.1306823-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16086

From: Bryan Brattlof <bb@ti.com>

update the SHA of k3conf to pickup am62ax support

Signed-off-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-=
bsp/recipes-devtools/k3conf/k3conf_git.bb
index 10e2631e..c6d3773e 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV =3D "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
+SRCREV =3D "982f5c2f02f732b5829861218812904cd776773d"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
=20
--=20
2.25.1


