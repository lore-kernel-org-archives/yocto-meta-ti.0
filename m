Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4749C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 04:56:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3492.1666414593134956010
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 21:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED76240DF2;
	Sat, 22 Oct 2022 04:56:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1L5JAQnupRd; Sat, 22 Oct 2022 04:56:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D127540D84;
	Sat, 22 Oct 2022 04:56:30 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BE7B2174A39;
	Sat, 22 Oct 2022 00:56:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/2] u-boot-ti-mainline: update to the latest 2022.10
Date: Sat, 22 Oct 2022 04:56:24 +0000
Message-Id: <20221022045625.3385830-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 22 Oct 2022 04:56:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15196

From: Denys Dmytriyenko <denys@konsulko.com>

Update to the latest release version.
bzip2 license was added to the list, update checksum.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/m=
eta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 76aaa4b2..ebeb4d42 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -1,10 +1,10 @@
 require u-boot-ti.inc
=20
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
+LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19=
756634782f1"
=20
 PR =3D "r0"
=20
-PV =3D "2021.10"
+PV =3D "2022.10"
=20
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -15,4 +15,4 @@ PV =3D "2021.10"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL a=
s https
 UBOOT_GIT_URI =3D "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL =3D "https"
-SRCREV =3D "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
+SRCREV =3D "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
--=20
2.25.1


