Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E63C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 23:46:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.17072.1754783187571032719
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 09 Aug 2025 16:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54F1E40CB7;
	Sat,  9 Aug 2025 23:46:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GaYKH-949b7; Sat,  9 Aug 2025 23:46:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E57F40CB4;
	Sat,  9 Aug 2025 23:46:25 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7BB6716F91C;
	Sat,  9 Aug 2025 19:46:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/4] u-boot-bb.org: upgrade 2025.04 -> 2025.07
Date: Sat,  9 Aug 2025 19:46:14 -0400
Message-Id: <20250809234616.3626274-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250809234616.3626274-1-denis@denix.org>
References: <20250809234616.3626274-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 09 Aug 2025 23:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18915

From: Denys Dmytriyenko <denys@konsulko.com>

Upgrade BB.org U-boot from 2025.04 to 2025.07

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../bootcmd-ti-mmc.cfg                        |  0
 ...rg_2025.04.bb =3D> u-boot-bb.org_2025.07.bb} | 21 +++++++------------
 2 files changed, 7 insertions(+), 14 deletions(-)
 rename meta-beagle/recipes-bsp/u-boot/{u-boot-bb.org-2025.04+git =3D> u-=
boot-bb.org-2025.07+git}/bootcmd-ti-mmc.cfg (100%)
 rename meta-beagle/recipes-bsp/u-boot/{u-boot-bb.org_2025.04.bb =3D> u-b=
oot-bb.org_2025.07.bb} (30%)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/boo=
tcmd-ti-mmc.cfg b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.07+gi=
t/bootcmd-ti-mmc.cfg
similarity index 100%
rename from meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/boot=
cmd-ti-mmc.cfg
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.07+git/bootcm=
d-ti-mmc.cfg
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.07.bb
similarity index 30%
rename from meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.07.bb
index aa825d99..716adaa9 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.07.bb
@@ -4,23 +4,16 @@ SUMMARY =3D "BeagleBoard.org U-Boot"
=20
 COMPATIBLE_MACHINE =3D "pocketbeagle2|beagle.*"
=20
-PV =3D "2025.04"
+PV =3D "2025.07"
=20
 UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL =3D "https"
-BRANCH =3D "v2025.04-Beagle"
-SRCREV =3D "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
+BRANCH =3D "v2025.07-Beagle"
+SRCREV =3D "919ec3cd84f39e6960d1705d4ba7f810bc1067fc"
=20
-BRANCH:beagley-ai =3D "v2025.04-rc3-BeagleY-AI"
-BRANCH:beagley-ai-k3r5 =3D "v2025.04-rc3-BeagleY-AI"
-SRCREV:beagley-ai =3D "cc376f9faef201670c7bb1734f42f5475c73f85d"
-SRCREV:beagley-ai-k3r5 =3D "cc376f9faef201670c7bb1734f42f5475c73f85d"
-
-SRC_URI:append:beagley-ai =3D " file://bootcmd-ti-mmc.cfg"
-
-BRANCH:pocketbeagle2 =3D "v2025.04-pocketbeagle2"
-BRANCH:pocketbeagle2-k3r5 =3D "v2025.04-pocketbeagle2"
-SRCREV:pocketbeagle2 =3D "f7439516453b7728bda496ff6496ef6f1411aae3"
-SRCREV:pocketbeagle2-k3r5 =3D "f7439516453b7728bda496ff6496ef6f1411aae3"
+BRANCH:pocketbeagle2 =3D "v2025.07-am6232-pocketbeagle2"
+BRANCH:pocketbeagle2-k3r5 =3D "v2025.07-am6232-pocketbeagle2"
+SRCREV:pocketbeagle2 =3D "6d5b4abc28f036a4a83ccb234f04d72eceafdc4e"
+SRCREV:pocketbeagle2-k3r5 =3D "6d5b4abc28f036a4a83ccb234f04d72eceafdc4e"
=20
 SRC_URI:append:pocketbeagle2 =3D " file://bootcmd-ti-mmc.cfg"
--=20
2.25.1


