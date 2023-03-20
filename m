Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C485C7EE21
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6304.1679283526981442760
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D022140CAA
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SI9tX0kpzD8 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0D4440CD5
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6A8231637C4
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 50/54] ti-k3-secdev: update to the latest from Dunfell
Date: Mon, 20 Mar 2023 03:38:36 +0000
Message-Id: <20230320033840.1193963-51-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16051

From: Denys Dmytriyenko <denys@konsulko.com>

Match the latest sha used in Dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-=
bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index b4c26f68..87987ae0 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -15,7 +15,7 @@ COMPATIBLE_MACHINE:class-nativesdk =3D "(.*)"
 GIT_URI =3D "git://git.ti.com/git/security-development-tools/core-secdev=
-k3.git"
 GIT_PROTOCOL =3D "https"
 GIT_BRANCH =3D "master"
-GIT_SRCREV =3D "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
+GIT_SRCREV =3D "bba9cabaeee96f7f287385188ff289b46769a4bf"
=20
 SRC_URI =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${GIT_BRANCH=
}"
 SRCREV =3D "${GIT_SRCREV}"
--=20
2.25.1


