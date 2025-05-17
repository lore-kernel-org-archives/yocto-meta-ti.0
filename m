Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418B2C3ABC9
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:54:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4228.1747443279540575016
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 May 2025 17:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9FD3140CC3;
	Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiAFyZCdtKhf; Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8471740BD4;
	Sat, 17 May 2025 00:54:37 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9813116854B;
	Fri, 16 May 2025 20:54:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/6] linux-bb.org: bump to the latest 6.6
Date: Fri, 16 May 2025 20:54:25 -0400
Message-Id: <20250517005430.3648211-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 May 2025 00:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18564

From: Denys Dmytriyenko <denys@konsulko.com>

Update BB.org BSP to the latest 6.6 LTS.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index c50802e4..3183a0bd 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -55,15 +55,15 @@ ${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
=20
 S =3D "${WORKDIR}/git"
=20
-# 6.6.32 version for 32-bit
-SRCREV:armv7a =3D "525684d28fadc2bdae5424f28b219377bd5d4639"
-PV:armv7a =3D "6.6.32+git"
-BRANCH:armv7a =3D "v6.6.32-ti-arm32-r7"
+# 6.6.58 version for 32-bit
+SRCREV:armv7a =3D "0d043a88f69f48789e43526d7a807ab744708071"
+PV:armv7a =3D "6.6.58+git"
+BRANCH:armv7a =3D "v6.6.58-ti-arm32-r10"
=20
 # 6.6.58 version for 64-bit
-SRCREV:aarch64 =3D "9beffa9162f6a0f5de7e25bbb66026a579376428"
+SRCREV:aarch64 =3D "0987ef737c9812374607475972f0868b8fecbbf7"
 PV:aarch64 =3D "6.6.58+git"
-BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r16"
+BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r23"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
=20
--=20
2.25.1


