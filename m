Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CB7C2BA15
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 19:40:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3591.1718739614859816682
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 12:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 39B5D40C2A;
	Tue, 18 Jun 2024 19:40:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TaNG8C91S5g; Tue, 18 Jun 2024 19:40:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C65DD40C8F;
	Tue, 18 Jun 2024 19:40:11 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A262D163FB7;
	Tue, 18 Jun 2024 15:40:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [master/scarthgap][PATCH 2/2] j7200: mainline BSP doesn't support all SR and HS variants
Date: Tue, 18 Jun 2024 15:39:47 -0400
Message-Id: <20240618193947.2632957-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618193947.2632957-1-denis@denix.org>
References: <20240618193947.2632957-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Jun 2024 19:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17764

From: Denys Dmytriyenko <denys@konsulko.com>

Adjust IMAGE_BOOT_FILES list as mainline BSP does not support all combina=
tions
of SR1.0, SR2.0, HS-FS and HS-SE variants.

Suggested-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/j7200.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/con=
f/machine/include/j7200.inc
index caa79876..2a11e3dd 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -5,10 +5,14 @@ SOC_FAMILY:append =3D ":j7200"
 IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"
=20
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 =
HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
+IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"
+IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"
=20
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 =
HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"
=20
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 =
HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"
--=20
2.25.1


