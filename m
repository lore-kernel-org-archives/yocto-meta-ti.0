Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94F6C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 18:16:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.115751.1683569769739526636
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 May 2023 11:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0F85340C5D;
	Mon,  8 May 2023 18:16:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-1yTHeq6lPW; Mon,  8 May 2023 18:16:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DD6B040A03;
	Mon,  8 May 2023 18:16:05 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 75945163843;
	Mon,  8 May 2023 14:15:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Randolph Sapp <rs@ti.com>
Subject: [master][PATCH] linux-bb.org: also package DT overlays in separate dir
Date: Mon,  8 May 2023 18:15:51 +0000
Message-Id: <20230508181551.2404141-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 May 2023 18:16:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16502

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core recently added non-flat directory structure for device trees
and overlays packaging:
https://git.openembedded.org/openembedded-core/commit/?id=3D04ab57d20009d=
85eb566e83ae6fe1dcea4db7300

But it only packages 2 levels - top KERNEL_DTBDEST and one level down
for vendored device trees. But linux-bb.org installs own overlays in
"overlays" subdir of the "ti" vendor directory, making it the third
level. Add those overlays into the package as weel.

Cc: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 8604e028..ca137c71 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -33,3 +33,7 @@ SRC_URI =3D "git://github.com/beagleboard/linux.git;pro=
tocol=3Dhttps;branch=3D${BRANCH
=20
 SRC_URI:append:armv7a =3D " file://0001-defconfig-switch-default-kernel-=
compression-to-LZMA.patch"
=20
+FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D " \
+    /${KERNEL_DTBDEST}/*/overlays/*.dtb \
+    /${KERNEL_DTBDEST}/*/overlays/*.dtbo \
+"
--=20
2.25.1


