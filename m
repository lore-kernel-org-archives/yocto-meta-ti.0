Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CB4C6370B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.804.1667602019268478099
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AED240D90
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VzBDGvkWcTn for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0050940D8E
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9A1CD163695
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 26/50] conf: machine: am64xx: Move multi-config targets into base SoC include
Date: Fri,  4 Nov 2022 22:46:28 +0000
Message-Id: <20221104224653.1223044-27-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15290

From: Andrew Davis <afd@ti.com>

The supported device types depends on the SoC, not on any specific
board or EVM. Any board can be populated with any of the 3 supported
AM64x types. Move these into the AM64x common include.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am64xx-evm.conf    | 12 ------------
 meta-ti-bsp/conf/machine/include/am64xx.inc | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/=
machine/am64xx-evm.conf
index 67f1be5b..c6ba2a87 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -5,15 +5,3 @@
 require conf/machine/include/am64xx.inc
=20
 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
-
-# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or GP
-BBMULTICONFIG +=3D "k3r5-gp"
-IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
-do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
-
-# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or SR2.0 HS-SE
-BBMULTICONFIG +=3D "k3r5-sr2-hs-se"
-IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
-do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 4d26732c..055f6036 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -14,10 +14,23 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am642-evm-nand.dtbo \
 "
=20
+# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG =3D "k3r5-sr2-hs-fs"
 do_image_wic[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
=20
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or GP
+BBMULTICONFIG +=3D "k3r5-gp"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or SR2.0 HS-SE
+BBMULTICONFIG +=3D "k3r5-sr2-hs-se"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am64x"
 OPTEEOUTPUTMACHINE =3D "k3"
--=20
2.25.1


