Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4317DC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.209.1667598058627636266
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B13A40D83
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIqk4B0x2dYB for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89C7740D7F
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0AF1616367D
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 04/47] ti-sci-fw: Use SYSFW_TIBOOT3 to point to the SYSFW image
Date: Fri,  4 Nov 2022 21:40:12 +0000
Message-Id: <20221104214055.1221197-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15225

From: Andrew Davis <afd@ti.com>

Currently we reuse UBOOT_* names which usually are the same we
want to give to the name of the SYSFW binary. This isn't always
correct, we should use a SYSFW specific variable in case the
UBOOT names are changed.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 61afeaeb..dc7cd588 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -37,6 +37,8 @@ SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
=20
+SYSFW_TIBOOT3 =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.=
bin"
+
 SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
@@ -78,10 +80,9 @@ do_install() {
 		fi
 	fi
=20
-	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMA=
GE}
-		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+	if [ -f "${WORKDIR}/imggen/${SYSFW_TIBOOT3}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${D}/boot/${SYSFW_TI=
BOOT3}
+		ln -sf ${SYSFW_TIBOOT3} ${D}/boot/tiboot3.bin
 	fi
 }
=20
@@ -100,10 +101,9 @@ do_deploy () {
 		fi
 	fi
=20
-	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_=
IMAGE}
-		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	if [ -f "${WORKDIR}/imggen/${SYSFW_TIBOOT3}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW=
_TIBOOT3}
+		ln -sf ${SYSFW_TIBOOT3} ${DEPLOYDIR}/tiboot3.bin
 	fi
=20
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
--=20
2.25.1


