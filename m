Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4955CA0EC0
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 23:46:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17022.1754783187566447818
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 09 Aug 2025 16:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B4F440CB1;
	Sat,  9 Aug 2025 23:46:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjOftgSr-R5S; Sat,  9 Aug 2025 23:46:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26FAB40C56;
	Sat,  9 Aug 2025 23:46:25 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6F9FB16EF1D;
	Sat,  9 Aug 2025 19:46:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/4] linux-bb.org_6.6: update to the latest
Date: Sat,  9 Aug 2025 19:46:13 -0400
Message-Id: <20250809234616.3626274-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 09 Aug 2025 23:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18914

From: Denys Dmytriyenko <denys@konsulko.com>

Update BB.org 6.6 kernel to the latest tags.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index a6098712..4873500d 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -56,14 +56,14 @@ KERNEL_DEVICETREE:append:armv7a =3D " \
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 # 6.6.58 version for 32-bit
-SRCREV:armv7a =3D "0d043a88f69f48789e43526d7a807ab744708071"
+SRCREV:armv7a =3D "3d519995234675748a38b1e3bc087baa03e3ac25"
 PV:armv7a =3D "6.6.58+git"
-BRANCH:armv7a =3D "v6.6.58-ti-arm32-r10"
+BRANCH:armv7a =3D "v6.6.58-ti-arm32-r12"
=20
 # 6.6.58 version for 64-bit
-SRCREV:aarch64 =3D "0987ef737c9812374607475972f0868b8fecbbf7"
+SRCREV:aarch64 =3D "1de9481cd5749807550148086aea959295bd11db"
 PV:aarch64 =3D "6.6.58+git"
-BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r23"
+BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r30"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
=20
--=20
2.25.1


