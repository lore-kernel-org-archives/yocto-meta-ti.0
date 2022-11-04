Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5975C636F8
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.215.1667598060837175671
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA52340D9B
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95qrUOIn4N3A for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF57C40D91
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 58AA5163689
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 16/47] u-boot-ti-staging: Update to the latest ti-u-boot-2021.01
Date: Fri,  4 Nov 2022 21:40:24 +0000
Message-Id: <20221104214055.1221197-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15249

From: Andrew Davis <afd@ti.com>

Update to the latest commit of ti-u-boot-2021.01.

As part of this U-Boot update the non-HS AM64x-evm defconfig was removed.
This is okay as building this defconfig without defining TI_SECURE_DEV_PK=
G
will still result in usable binaries for the non-HS devices. Use the
HS defconfig for both the HS and non-HS machines.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am64xx-evm.conf                    | 4 ++++
 meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf            | 2 +-
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf                 | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/=
machine/am64xx-evm.conf
index c6ba2a87..2cb7f55a 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -5,3 +5,7 @@
 require conf/machine/include/am64xx.inc
=20
 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
+
+SPL_BINARY =3D "tispl.bin_HS"
+UBOOT_BINARY =3D "u-boot.img_HS"
+UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am64xx-hs-evm-k3r5.conf
index 647c8beb..95e68751 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
@@ -9,4 +9,4 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
 SYSFW_SYMLINK =3D ""
=20
-UBOOT_MACHINE =3D "am64x_hs_evm_r5_defconfig"
+UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am64xx-hs-evm.conf
index 9f076099..1149d4c7 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
@@ -4,7 +4,7 @@
=20
 require conf/machine/include/am64xx.inc
=20
-UBOOT_MACHINE =3D "am64x_hs_evm_a53_defconfig"
+UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
=20
 UBOOT_ENTRYPOINT =3D       "0x80080000"
 UBOOT_LOADADDRESS =3D      "0x80080000"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 5560d1a1..bac87cf4 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
=20
 LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
=20
-PR =3D "r32"
+PR =3D "r33"
=20
 BRANCH =3D "ti-u-boot-2021.01"
=20
-SRCREV =3D "a3f87b40a1b6744261d1ac351fe2566dbf64bc66"
+SRCREV =3D "1c29865c3106a1e6c8e2036601ff61a8bf70590b"
--=20
2.25.1


