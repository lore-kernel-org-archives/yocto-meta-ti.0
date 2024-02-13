Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB76FC4829E
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 03:19:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3323.1707794355629459845
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 19:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE82540C56;
	Tue, 13 Feb 2024 03:19:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7TAeu52kPa2; Tue, 13 Feb 2024 03:19:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9A7940C2E;
	Tue, 13 Feb 2024 03:19:12 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 844BF163E37;
	Mon, 12 Feb 2024 22:19:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] linux-bb.org: remove custom FILES:${KERNEL_PACKAGE_NAME}-devicetree
Date: Mon, 12 Feb 2024 22:19:04 -0500
Message-Id: <20240213031904.3883616-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Feb 2024 03:19:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17475

From: Denys Dmytriyenko <denys@konsulko.com>

Upstream now includes all DTB/DTBO files recursively, no need to extend
corresponding FILES list.

Revert "linux-bb.org: also package DT overlays in separate dir"
This reverts commit f22ea63f66b02297e5a1e66b1d90ebc356bc5eeb.

Note: adjust SRC_URI cosmetically, so it now matches kirkstone

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index cd472036..9d798b9f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -29,11 +29,7 @@ SRCREV:aarch64 =3D "f47f74d11b19d8ae2f146de92c258f40e0=
930d86"
 PV:aarch64 =3D "6.1.46+git${SRCPV}"
 BRANCH:aarch64 =3D "v6.1.46-ti-arm64-r13"
=20
-SRC_URI =3D "git://github.com/beagleboard/linux.git;protocol=3Dhttps;bra=
nch=3D${BRANCH} \
-           file://defconfig \
-"
-
-FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D " \
-    /${KERNEL_DTBDEST}/*/overlays/*.dtb \
-    /${KERNEL_DTBDEST}/*/overlays/*.dtbo \
+SRC_URI =3D " \
+    git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH} \
+    file://defconfig \
 "
--=20
2.25.1


