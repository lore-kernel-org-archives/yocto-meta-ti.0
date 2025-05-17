Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4B4C54795
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:54:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4209.1747443279391542673
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 May 2025 17:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A321F40BD4;
	Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6fMEXG5NT8G; Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 880E640CB0;
	Sat, 17 May 2025 00:54:37 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A574816854C;
	Fri, 16 May 2025 20:54:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/6] u-boot-bb.org: add 2025.04 version
Date: Fri, 16 May 2025 20:54:26 -0400
Message-Id: <20250517005430.3648211-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250517005430.3648211-1-denis@denix.org>
References: <20250517005430.3648211-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 May 2025 00:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18566

From: Denys Dmytriyenko <denys@konsulko.com>

Add BeagleBoard.org 2025.04 version of U-boot.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...{u-boot-bb.org_2024.10.bb =3D> u-boot-bb.org_2025.04.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 copy meta-beagle/recipes-bsp/u-boot/{u-boot-bb.org_2024.10.bb =3D> u-boo=
t-bb.org_2025.04.bb} (52%)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
similarity index 52%
copy from meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
copy to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
index 389893b0..492705c2 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
@@ -4,11 +4,9 @@ SUMMARY =3D "BeagleBoard.org U-Boot"
=20
 COMPATIBLE_MACHINE =3D "beagle.*"
=20
-PV =3D "2024.10"
-
-SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
+PV =3D "2025.04"
=20
 UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL =3D "https"
-BRANCH =3D "v2024.10-Beagle"
-SRCREV =3D "bf0e9d0b7274d2b561bd24c858affec2038250f9"
+BRANCH =3D "v2025.04-Beagle"
+SRCREV =3D "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
--=20
2.25.1


