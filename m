Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B00C47089
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.834.1667602020375412737
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B2D3A40D81
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhjk3Rak9IzN for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A674140D86
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 452E61636B6
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 44/50] u-boot-ti-staging: update to the latest
Date: Fri,  4 Nov 2022 22:46:46 +0000
Message-Id: <20221104224653.1223044-45-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15312

From: Denys Dmytriyenko <denys@konsulko.com>

This matches current version in Dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index bac87cf4..1640d042 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -6,4 +6,4 @@ PR =3D "r33"
=20
 BRANCH =3D "ti-u-boot-2021.01"
=20
-SRCREV =3D "1c29865c3106a1e6c8e2036601ff61a8bf70590b"
+SRCREV =3D "78a217ca9ea687ee5c3e7dd3a339a1f7d136e93d"
--=20
2.25.1


