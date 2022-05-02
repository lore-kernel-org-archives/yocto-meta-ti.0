Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5F6C3527C
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11503.1651503085734836730
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 870B940C85
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEtpb6QPeCta for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7DCFD40C87
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5A959174922
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 13/26] pru-icss_git.bb: update to PSSP v6.1.0
Date: Mon,  2 May 2022 14:51:07 +0000
Message-Id: <20220502145120.726632-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14650

From: Nick Saulnier <nsaulnier@ti.com>

Update the SDK folder example-applications/pru-icss-x.x.x to install the =
latest
version of the PRU Software Support Package (PSSP).

This also uses PSSP v6.1.0 to generate the PRU Halt and RPMsg binaries in=
 the
Linux SDK default filesystem image under /lib/firmware.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-ext=
ras/recipes-bsp/pru/pru-icss_git.bb
index 130fd3d5..49f29086 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-=
support-package.git;protocol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "8eee431384b6a1a9c96ae91a8e99485176b4d2b3"
+SRCREV =3D "ae1decf0b494b2904e6157e1379691ffc468f0cf"
=20
-PV =3D "6.0.1"
+PV =3D "6.1.0"
 PR =3D "r0"
=20
 require recipes-ti/includes/ti-paths.inc
--=20
2.25.1


