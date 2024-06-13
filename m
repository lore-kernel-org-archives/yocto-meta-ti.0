Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AD2C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 17:23:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.184.1718299386209316047
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 10:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E587940CC8;
	Thu, 13 Jun 2024 17:23:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-U1Rdc8UnLm; Thu, 13 Jun 2024 17:23:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C5B0740CC4;
	Thu, 13 Jun 2024 17:23:03 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 74942163FA2;
	Thu, 13 Jun 2024 13:23:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 2/4] conf/machine/j721e: some BSPs don't support all SR and HS variants
Date: Thu, 13 Jun 2024 13:22:52 -0400
Message-Id: <20240613172254.770920-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613172254.770920-1-denis@denix.org>
References: <20240613172254.770920-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jun 2024 17:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17720

From: Denys Dmytriyenko <denys@konsulko.com>

Adjust IMAGE_BOOT_FILES list as some BSPs do not support all combinations
of SR1.1, SR2.0, HS-FS and HS-SE variants.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/j721e.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index a54c3f2f..62487aa9 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -13,20 +13,22 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
 IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
=20
 # Since default on J721e is for GP, add a version for SR1.1 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
+IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j72=
1e_sr1_1-hs-fs-evm.itb"
+IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
=20
 # Since default on J721e is for GP, add a version for SR1.1 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
+IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_=
sr1_1-hs-evm.itb"
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
=20
 # Since default on J721e is for GP, add a version for SR2.0 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
+IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_s=
r2-hs-fs-evm.itb"
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
=20
 # Since default on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
+IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-=
hs-evm.itb"
+IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
=20
 TFA_BOARD =3D "generic"
=20
--=20
2.25.1


