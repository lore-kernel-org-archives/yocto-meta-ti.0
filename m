Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A9BC63704
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.193.1667598060848764762
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC45B40D9E
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0iZIMLTI7-S for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E026F40D96
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 56E49163688
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 15/47] ti-sci-fw: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Date: Fri,  4 Nov 2022 21:40:23 +0000
Message-Id: <20221104214055.1221197-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15248

From: Andrew Davis <afd@ti.com>

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 21a38d34..1b0dc4a1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,4 +1,5 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+require recipes-ti/includes/ti-paths.inc
=20
 DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual/boo=
tloader"
 DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
@@ -8,6 +9,7 @@ DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 =3D "virtual/bootlo=
ader"
 DEPENDS:remove:j721e-evm-k3r5 =3D "virtual/bootloader"
 DEPENDS:remove:j721e-hs-evm-k3r5 =3D "virtual/bootloader"
 DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 =3D "virtual/bootloader"
+DEPENDS:append =3D " ${@ '' if '${TI_SECURE_DEV_PKG_K3}' else 'ti-k3-sec=
dev-native' }"
=20
 CLEANBROKEN =3D "1"
 PR =3D "${INC_PR}.2"
@@ -18,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-TI_SECURE_DEV_PKG ?=3D ""
+TI_SECURE_DEV_PKG =3D "${@ '${TI_SECURE_DEV_PKG_K3}' or '${TI_K3_SECDEV_=
INSTALL_DIR}' }"
 export TI_SECURE_DEV_PKG
=20
 SYSFW_SOC ?=3D "unknown"
--=20
2.25.1


