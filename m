Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA073C77B71
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.406.1680899814342193590
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 72FB940C6B;
	Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIlayHuKWAnI; Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 552A640C52;
	Fri,  7 Apr 2023 20:36:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B41A21637FC;
	Fri,  7 Apr 2023 16:36:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [master/kirkstone][PATCH 2/5] u-boot-bb.org: use dedicated branch for beaglebone-ai64
Date: Fri,  7 Apr 2023 20:36:33 +0000
Message-Id: <20230407203636.3265548-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407203636.3265548-1-denis@denix.org>
References: <20230407203636.3265548-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16328

From: Denys Dmytriyenko <denys@konsulko.com>

Use dedicated branch for BB-AI64 that includes recent changes for new
memory part.

Cc: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index bdc40c0f..579b5570 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -12,3 +12,8 @@ UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.=
git"
 UBOOT_GIT_PROTOCOL =3D "https"
 BRANCH =3D "v2021.01-ti-08.05.00.005-SDK-8.5"
 SRCREV =3D "46ff4982b41067e5c93369bddd49b1541856d80b"
+
+BRANCH:beaglebone-ai64 =3D "v2021.01-ti-08.05.00.001"
+BRANCH:beaglebone-ai64-k3r5 =3D "v2021.01-ti-08.05.00.001"
+SRCREV:beaglebone-ai64 =3D "ea96725b5156135d5875415f75d2188f6f56622a"
+SRCREV:beaglebone-ai64-k3r5 =3D "ea96725b5156135d5875415f75d2188f6f56622=
a"
--=20
2.25.1


