Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930D5CCD1B9
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 20:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22710.1761076971743082069
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 13:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A1FA40CBD;
	Tue, 21 Oct 2025 20:02:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8YE9yShoLcD; Tue, 21 Oct 2025 20:02:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2993E407DA;
	Tue, 21 Oct 2025 20:02:49 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id EE7C516A434;
	Tue, 21 Oct 2025 16:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
Date: Tue, 21 Oct 2025 16:02:46 -0400
Message-Id: <20251021200247.52202-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Oct 2025 20:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19149

From: Denys Dmytriyenko <denys@konsulko.com>

Upgrade U-boot to 2025.10.

PocketBeagle2 defconfigs and branch got slight name change.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/pocketbeagle2-k3r5.conf   |  2 +-
 meta-beagle/conf/machine/pocketbeagle2.conf        |  2 +-
 .../bootcmd-ti-mmc.cfg                             |  0
 ...-bb.org_2025.07.bb =3D> u-boot-bb.org_2025.10.bb} | 14 +++++++-------
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-beagle/recipes-bsp/u-boot/{u-boot-bb.org-2025.07+git =3D> u-=
boot-bb.org-2025.10+git}/bootcmd-ti-mmc.cfg (100%)
 rename meta-beagle/recipes-bsp/u-boot/{u-boot-bb.org_2025.07.bb =3D> u-b=
oot-bb.org_2025.10.bb} (44%)

diff --git a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf b/meta-beag=
le/conf/machine/pocketbeagle2-k3r5.conf
index 32e40312..b506cf7d 100644
--- a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
@@ -9,4 +9,4 @@ SYSFW_SOC =3D "am62x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs-fs"
=20
-UBOOT_MACHINE =3D "am6232_pocketbeagle2_r5_defconfig"
+UBOOT_MACHINE =3D "am62_pocketbeagle2_r5_defconfig"
diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/co=
nf/machine/pocketbeagle2.conf
index 6cbfeac4..7cfe6e30 100644
--- a/meta-beagle/conf/machine/pocketbeagle2.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2.conf
@@ -16,7 +16,7 @@ TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
 OPTEEMACHINE =3D "k3-am62x"
=20
-UBOOT_MACHINE =3D "am6232_pocketbeagle2_a53_defconfig"
+UBOOT_MACHINE =3D "am62_pocketbeagle2_a53_defconfig"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am6232 \
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.07+git/boo=
tcmd-ti-mmc.cfg b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+gi=
t/bootcmd-ti-mmc.cfg
similarity index 100%
rename from meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.07+git/boot=
cmd-ti-mmc.cfg
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/bootcm=
d-ti-mmc.cfg
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.07.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
similarity index 44%
rename from meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.07.bb
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index 716adaa9..5a8abec0 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.07.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -4,16 +4,16 @@ SUMMARY =3D "BeagleBoard.org U-Boot"
=20
 COMPATIBLE_MACHINE =3D "pocketbeagle2|beagle.*"
=20
-PV =3D "2025.07"
+PV =3D "2025.10"
=20
 UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL =3D "https"
-BRANCH =3D "v2025.07-Beagle"
-SRCREV =3D "919ec3cd84f39e6960d1705d4ba7f810bc1067fc"
+BRANCH =3D "v2025.10-Beagle"
+SRCREV =3D "6825d60bea17774358f4199c4c7062801cfb931e"
=20
-BRANCH:pocketbeagle2 =3D "v2025.07-am6232-pocketbeagle2"
-BRANCH:pocketbeagle2-k3r5 =3D "v2025.07-am6232-pocketbeagle2"
-SRCREV:pocketbeagle2 =3D "6d5b4abc28f036a4a83ccb234f04d72eceafdc4e"
-SRCREV:pocketbeagle2-k3r5 =3D "6d5b4abc28f036a4a83ccb234f04d72eceafdc4e"
+BRANCH:pocketbeagle2 =3D "v2025.10-am62-pocketbeagle2"
+BRANCH:pocketbeagle2-k3r5 =3D "v2025.10-am62-pocketbeagle2"
+SRCREV:pocketbeagle2 =3D "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
+SRCREV:pocketbeagle2-k3r5 =3D "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
=20
 SRC_URI:append:pocketbeagle2 =3D " file://bootcmd-ti-mmc.cfg"
--=20
2.35.3


