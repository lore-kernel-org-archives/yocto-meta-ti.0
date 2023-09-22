Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA77E7D0D0
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:34:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15508.1695364455488825176
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 23:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6313840C3E;
	Fri, 22 Sep 2023 06:34:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LjOm7pfoPJ1; Fri, 22 Sep 2023 06:34:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 47A6C40C16;
	Fri, 22 Sep 2023 06:34:13 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5063E163CAB;
	Fri, 22 Sep 2023 02:34:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] k3r5: u-boot: prevent overlapping deployed SPL symlinks
Date: Fri, 22 Sep 2023 06:34:09 +0000
Message-Id: <20230922063409.3061-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Sep 2023 06:34:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17009

From: Denys Dmytriyenko <denys@konsulko.com>

Make sure shortname R5 SPL symlink is not the same as the main K3 SPL
one, as they will overlap/overwrite each other when deployed into a
common location. Latest code in master now checks for this and errors
out.

Also remove unused UBOOT_SPI_* variables.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc    |  4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 15 +--------------
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf=
/machine/include/k3r5.inc
index 3619d300..184d3a09 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -19,9 +19,9 @@ SPL_SUFFIX =3D "bin"
 SPL_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${S=
PL_SUFFIX}"
 SPL_SYMLINK =3D "tiboot3.${SPL_SUFFIX}"
 UBOOT_SUFFIX =3D "bin"
-UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
 UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}=
"
-UBOOT_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
=20
 PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
 PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 92eaf0cc..4f72c867 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -82,19 +82,6 @@ SPL_UART_BINARY:k3r5 =3D ""
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
=20
-# SPI NOR Flash binaries
-UBOOT_SPI_SPL_BINARY =3D "u-boot-spl.bin"
-UBOOT_SPI_BINARY =3D "u-boot.img"
-UBOOT_SPI_GPH_BINARY =3D "u-boot-spi.gph"
-
-# SPI NOR Flash deployed images
-UBOOT_SPI_SPL_IMAGE =3D "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_SPI_SPL_SYMLINK =3D "u-boot-spl-${MACHINE}.bin"
-UBOOT_SPI_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SPI_SYMLINK =3D "u-boot-${MACHINE}.img"
-UBOOT_SPI_GPH_IMAGE =3D "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
-UBOOT_SPI_GPH_SYMLINK =3D "u-boot-spi-${MACHINE}.gph"
-
 # HS XLD
 UBOOT_HS_XLD_BINARY =3D "u-boot-spl_HS_X-LOADER"
 UBOOT_HS_XLD_IMAGE =3D "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
@@ -117,7 +104,7 @@ UBOOT_HS_2ND_SYMLINK =3D "u-boot-spl_HS_2ND-${MACHINE=
}"
=20
 do_compile:append:k3r5 () {
 	if ! [ -f ${B}/${UBOOT_BINARY} ]; then
-		ln -s spl/${UBOOT_BINARY} ${B}/${UBOOT_BINARY}
+		ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
 	fi
 }
=20
--=20
2.25.1


