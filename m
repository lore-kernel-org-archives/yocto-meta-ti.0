Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD59C4167E
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.11578.1651503086661993085
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 807DF40C98
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaDrnDPJrYeB for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74F7940CB0
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B371317492B
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 22/26] k3conf: Update SRCREV to pick AM62x support
Date: Mon,  2 May 2022 14:51:16 +0000
Message-Id: <20220502145120.726632-23-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14659

From: Praneeth Bajjuri <praneeth@ti.com>

Update the k3conf to the latest SHA.
This adds AM62x support.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-=
bsp/recipes-devtools/k3conf/k3conf_git.bb
index 0f2705b8..3f542da4 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV =3D "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "79f007cd462384ce22e750e9002b714878f56892"
+SRCREV =3D "966a5695b73bc53039ca60d196b77de0640088d4"
=20
 SRC_URI =3D "git://git.ti.com/k3conf/k3conf.git;protocol=3Dgit;branch=3D=
${BRANCH}"
=20
--=20
2.25.1


