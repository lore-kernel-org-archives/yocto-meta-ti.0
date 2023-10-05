Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3A6E92717
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 17:09:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21215.1696525753776749419
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 10:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A83B240CF7;
	Thu,  5 Oct 2023 17:09:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xdh3wvDjkpl3; Thu,  5 Oct 2023 17:09:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FF1B40BA7;
	Thu,  5 Oct 2023 17:09:11 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A0B85163CC7;
	Thu,  5 Oct 2023 13:09:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] u-boot: set the correct latest LIC_FILES_CHKSUM generically
Date: Thu,  5 Oct 2023 17:09:09 +0000
Message-Id: <20231005170909.4285-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 17:09:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17060

From: Denys Dmytriyenko <denys@konsulko.com>

The common u-boot-ti.inc file still uses the old license checksum
from 2021 U-boot. There were formatting changes in the license text
between 2021 and 2023 and version-specific recipes had the license
checksum updated to the new value. Since there are no 2021 recipes
remaining, the new license checksum can be set in the common .inc
file generically.

Note: U-boot license hasn't changed and the same checksum is simply
being moved from the recipes to the common .inc file.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb    | 2 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/m=
eta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 64bb1441..e98d584a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -1,7 +1,5 @@
 require u-boot-ti.inc
=20
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19=
756634782f1"
-
 PR =3D "r0"
=20
 PV =3D "2023.07"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 10bcc475..7e8b973e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -2,8 +2,6 @@ require u-boot-ti.inc
=20
 include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') =
else ''}
=20
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19=
756634782f1"
-
 PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2023.04"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 2c4ddcc2..21b2d3bb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -14,7 +14,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
 SUMMARY =3D "u-boot bootloader for TI devices"
=20
 LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D30503fd321432fc713238=
f582193b78e"
+LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19=
756634782f1"
=20
 BRANCH ?=3D "master"
 UBOOT_GIT_URI ?=3D "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
--=20
2.25.1


