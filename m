Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE49C021B2
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 01:13:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.79227.1740359601651121560
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 23 Feb 2025 17:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CCB6040C88;
	Mon, 24 Feb 2025 01:13:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWkMYoa6FOPU; Mon, 24 Feb 2025 01:13:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AFA6E40C85;
	Mon, 24 Feb 2025 01:13:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E164916428D;
	Sun, 23 Feb 2025 20:13:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] conf: machine: j742s2: skip HS-SE SPL for 6.12
Date: Sun, 23 Feb 2025 20:13:18 -0500
Message-Id: <20250224011318.2801708-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Feb 2025 01:13:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18335

From: Denys Dmytriyenko <denys@konsulko.com>

It appears there's no HS-SE SPL being produced with TI BSP 6.12, as there=
's
no tiboot3-j742s2-hs-evm.bin being deployed. Disable it for now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/j742s2.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/co=
nf/machine/include/j742s2.inc
index 9a54e11e..67e30fe9 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -12,7 +12,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_=
DRIVER_PROVIDER}"
 IMAGE_BOOT_FILES +=3D "tiboot3-j742s2-hs-fs-evm.bin"
=20
 # Since default tiboot3.bin on J742S2 is for HS-FS, add a version for SR=
1.0 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j742s2-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j742s2-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES:bsp-ti-6_12 =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"
=20
 TFA_BOARD =3D "j784s4"
=20
--=20
2.25.1


