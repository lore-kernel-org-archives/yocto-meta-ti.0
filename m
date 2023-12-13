Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7265C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:48:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.44773.1702493285967030573
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 10:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D7E140CA8;
	Wed, 13 Dec 2023 18:48:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PU7OXN1V7AoI; Wed, 13 Dec 2023 18:48:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 175AE40C50;
	Wed, 13 Dec 2023 18:48:03 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A3B58163DC8;
	Wed, 13 Dec 2023 13:48:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH] README: update with kirkstone-specific info
Date: Wed, 13 Dec 2023 18:48:03 +0000
Message-Id: <20231213184803.3427347-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Dec 2023 18:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17350

From: Denys Dmytriyenko <denys@konsulko.com>

Update READMEs to mention kirkstone instead of master.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/README    | 4 ++--
 meta-ti-extras/README | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
index c5780531..17f87597 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-bsp/README
@@ -8,11 +8,11 @@ This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: kirkstone
=20
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: kirkstone
=20
=20
 The base BSP part of meta-ti should work with different OpenEmbedded/Yoc=
to
diff --git a/meta-ti-extras/README b/meta-ti-extras/README
index 1b38921a..c9beb150 100644
--- a/meta-ti-extras/README
+++ b/meta-ti-extras/README
@@ -8,14 +8,14 @@ This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: kirkstone
=20
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: kirkstone
=20
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-ti-bsp
=20
--=20
2.25.1


