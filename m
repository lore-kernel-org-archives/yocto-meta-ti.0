Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25ABCCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:29:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1171.1761251393680573934
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 13:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2208C407DA;
	Thu, 23 Oct 2025 20:29:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeQpObERwjWq; Thu, 23 Oct 2025 20:29:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0932440C8A;
	Thu, 23 Oct 2025 20:29:51 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 9B4B616CCD3;
	Thu, 23 Oct 2025 16:29:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 2/2] linux-bb.org: update to 6.12.43
Date: Thu, 23 Oct 2025 16:29:47 -0400
Message-Id: <20251023202947.26604-2-denis@denix.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20251023202947.26604-1-denis@denix.org>
References: <20251023202947.26604-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 20:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19161

From: Denys Dmytriyenko <denys@konsulko.com>

Update bb.org kernel to 6.12.43 for 64-bit platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org_6.12.bb      | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 829dbaad..4a45c271 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -52,12 +52,6 @@ KERNEL_DEVICETREE:append:armv7a =3D " \
     ti/omap/PB-MIKROBUS-1.dtbo \
 "
=20
-KERNEL_DEVICETREE:append:aarch64 =3D " \
-    ti/BONE-I2C1.dtbo \
-    ti/BONE-I2C2.dtbo \
-    ti/BONE-I2C3.dtbo \
-"
-
 S =3D "${WORKDIR}/git"
=20
 # 6.12.34 version for 32-bit
@@ -65,9 +59,9 @@ SRCREV:armv7a =3D "9e419b26243bd7efcd103ae0f6456f828592=
b34b"
 PV:armv7a =3D "6.12.34+git"
 BRANCH:armv7a =3D "v6.12.34-ti-arm32-r12"
=20
-# 6.12.34 version for 64-bit
-SRCREV:aarch64 =3D "9ca36b8c54806a037f357efcd40eaa8399798b05"
-PV:aarch64 =3D "6.12.34+git"
-BRANCH:aarch64 =3D "v6.12.34-ti-arm64-r46"
+# 6.12.43 version for 64-bit
+SRCREV:aarch64 =3D "84c4b4613a852db269620a3fdfed65de90569fa1"
+PV:aarch64 =3D "6.12.43+git"
+BRANCH:aarch64 =3D "v6.12.43-ti-arm64-r54"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
--=20
2.35.3


