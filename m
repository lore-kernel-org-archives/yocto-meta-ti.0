Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C478C6FA90
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.802.1663041349553017335
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 858FA40DA3
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CORBiy1JM_Ll for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6FA4440D91
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2D9AA174A0A
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 62/65] u-boot-ti: Do not prepend output
 files with DEPLOYDIR
Date: Tue, 13 Sep 2022 03:55:38 +0000
Message-Id: <20220913035541.2364351-63-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15078

From: Andrew Davis <afd@ti.com>

We already cd into DEPLOYDIR so this is not needed. This now matches the
keystone version below. Also fixes build in some odd situations.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 36 ++++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 7a22161d..d29c80cf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -174,15 +174,15 @@ do_deploy:append () {
 				then
 					cd ${DEPLOYDIR}
 					if [ "x${SPL_UART_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_U=
ART_IMAGE}-${type}
-						rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYML=
INK}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_BINARY}-$=
{type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_BINARY}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_SYMLINK}-=
${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+						install ${B}/${config}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}-${=
type}
+						rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT=
_HS_XLD_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE=
}-${type}
 						rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${typ=
e}
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
@@ -190,7 +190,7 @@ do_deploy:append () {
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT=
_HS_MLO_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE=
}-${type}
 						rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${typ=
e}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
@@ -198,7 +198,7 @@ do_deploy:append () {
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${DEPLOYDIR}/${UBOO=
T_HS_ISSW_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMA=
GE}-${type}
 						rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
 						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${t=
ype}
 						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
@@ -206,7 +206,7 @@ do_deploy:append () {
 						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT=
_HS_2ND_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE=
}-${type}
 						rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
 						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${typ=
e}
 						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
@@ -221,31 +221,31 @@ do_deploy:append () {
 	else
 		cd ${DEPLOYDIR}
 		if [ "x${SPL_UART_BINARY}" !=3D "x" ]; then
-			install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
-			rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK=
}
-			ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
-			ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+			install ${B}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}
+			rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
+			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
+			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
 		fi
 		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-			install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE=
}
+			install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
 			rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
 			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
 			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
 		fi
 		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-			install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE=
}
+			install ${B}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}
 			rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
 		fi
 		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
-			install ${B}/${UBOOT_HS_ISSW_BINARY} ${DEPLOYDIR}/${UBOOT_HS_ISSW_IMA=
GE}
+			install ${B}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}
 			rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
 			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
 			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
 		fi
 		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
-			install ${B}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE=
}
+			install ${B}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}
 			rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
--=20
2.25.1


