Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5361C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 00:21:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2157.1714609283026510363
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 17:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1106B40C79
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:21:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Crt0RPu-UzV for <meta-ti@lists.yoctoproject.org>;
	Thu,  2 May 2024 00:21:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F381840A46
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:21:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 17CB3163F53
	for <meta-ti@lists.yoctoproject.org>; Wed,  1 May 2024 20:21:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/scarthgap][PATCH] conf: machine: am69-sk: Create a new am69.inc file
Date: Wed,  1 May 2024 20:21:21 -0400
Message-Id: <20240502002121.3455785-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 00:21:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17623

From: Ryan Eatmon <reatmon@ti.com>

Reusing the j784s4.inc file presents problems as the am69-sk platform
does not support GP.  So copy the j784s4.inc to am69.inc and update
accordingly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
No changes from the original patch, just formatted as copy/diff for revie=
w

 meta-ti-bsp/conf/machine/am69-sk.conf                     | 2 +-
 meta-ti-bsp/conf/machine/include/{j784s4.inc =3D> am69.inc} | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)
 copy meta-ti-bsp/conf/machine/include/{j784s4.inc =3D> am69.inc} (63%)

diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/mac=
hine/am69-sk.conf
index 233a4618..6341a6fa 100644
--- a/meta-ti-bsp/conf/machine/am69-sk.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -2,7 +2,7 @@
 #@NAME: AM69 SK
 #@DESCRIPTION: Machine configuration for the TI AM69 SK
=20
-require conf/machine/include/j784s4.inc
+require conf/machine/include/am69.inc
=20
 TFA_K3_USART =3D "0x8"
 OPTEE_K3_USART =3D "0x8"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/am69.inc
similarity index 63%
copy from meta-ti-bsp/conf/machine/include/j784s4.inc
copy to meta-ti-bsp/conf/machine/include/am69.inc
index 92062cdf..81be1397 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -6,13 +6,10 @@ MACHINE_FEATURES +=3D "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
-# Default tiboot3.bin on J784S4 is for GP
-IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-gp-evm.bin"
-
-# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0=
 HS-FS
+# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
=20
-# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0=
 HS-SE
+# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.=
0 HS-SE
 IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
=20
 TFA_BOARD =3D "j784s4"
--=20
2.25.1


