Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4351BE77189
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:32:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8566.1734132728369556230
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 15:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D028940C21;
	Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADeFnfNDF6F2; Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4F9540CC7;
	Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7D01B16412D;
	Fri, 13 Dec 2024 18:32:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 08/12] linux-bb.org: update Beagle BSP to 6.1.83
Date: Fri, 13 Dec 2024 18:31:59 -0500
Message-Id: <20241213233203.2688541-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213233203.2688541-1-denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 23:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18111

From: Denys Dmytriyenko <denys@konsulko.com>

Update Beagle BSP to the latest 6.1.83 kernel version.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
No changes since RFC v2

 .../recipes-kernel/linux/linux-bb.org_git.bb     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_git.bb
index ef79bfb7..986eda68 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
@@ -52,14 +52,14 @@ PB-MIKROBUS-1.dtbo \
=20
 S =3D "${WORKDIR}/git"
=20
-# 6.1.80 version for 32-bit
-SRCREV:armv7a =3D "4ca9ea30768d58c8d4d56d03dd1eaf8c8feb7ef9"
-PV:armv7a =3D "6.1.80+git"
-BRANCH:armv7a =3D "v6.1.80-ti-r34"
+# 6.1.83 version for 32-bit
+SRCREV:armv7a =3D "be9b910b08dfd674e47a2643f35080b005ac3792"
+PV:armv7a =3D "6.1.83+git"
+BRANCH:armv7a =3D "v6.1.83-ti-r35"
=20
-# 6.1.80 version for 64-bit
-SRCREV:aarch64 =3D "977c75e082620f15c06c72bcced30f787c14b390"
-PV:aarch64 =3D "6.1.80+git"
-BRANCH:aarch64 =3D "v6.1.80-ti-arm64-r49"
+# 6.1.83 version for 64-bit
+SRCREV:aarch64 =3D "135558243d5a98ed39812b797d2ba6295ef3b86a"
+PV:aarch64 =3D "6.1.83+git"
+BRANCH:aarch64 =3D "v6.1.83-ti-arm64-r64"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
--=20
2.25.1


