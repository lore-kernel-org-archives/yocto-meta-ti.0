Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAF4C63707
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.217.1667598059831638411
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CDEE40D82
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsmGDXnsdyaA for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC28D40D8A
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3F5FF163685
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 12/47] ti-sci-fw: Add am65xx-evm-k3r5-sr2 to combined R5 boot list
Date: Fri,  4 Nov 2022 21:40:20 +0000
Message-Id: <20221104214055.1221197-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15235

From: Andrew Davis <afd@ti.com>

This machine was missed when making combined R5 boot the default.
Add this machine to fix build failure.

Reported-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index ae90e877..21a38d34 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,6 +2,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
=20
 DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual/boo=
tloader"
 DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
+DEPENDS:remove:am65xx-evm-k3r5-sr2 =3D "virtual/bootloader"
 DEPENDS:remove:am65xx-hs-evm-k3r5 =3D "virtual/bootloader"
 DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 =3D "virtual/bootloader"
 DEPENDS:remove:j721e-evm-k3r5 =3D "virtual/bootloader"
@@ -57,6 +58,7 @@ EXTRA_OEMAKE =3D "\
     SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
 "
 EXTRA_OEMAKE:remove:am65xx-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:am65xx-evm-k3r5-sr2 =3D "SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
 EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/b=
oot/u-boot-spl.bin""
 EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5-sr2 =3D "SBL=3D"${STAGING_DIR_HOS=
T}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE:remove:j721e-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/boot/=
u-boot-spl.bin""
--=20
2.25.1


