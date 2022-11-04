Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB3AC4167E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.826.1667602017114540106
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8848A40D85
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQPTAHg3Zicb for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7107C40D81
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E87A316367C
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 03/50] ti-sci-fw: Deploy all SYSFW firmware types
Date: Fri,  4 Nov 2022 22:46:05 +0000
Message-Id: <20221104224653.1223044-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15275

From: Andrew Davis <afd@ti.com>

This allows us to rebuild and re-sign the SYSFW image if needed from
the deploy directory for any SoC type.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 64c71292..61afeaeb 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -22,24 +22,20 @@ TI_SECURE_DEV_PKG ?=3D ""
 export TI_SECURE_DEV_PKG
=20
 SYSFW_SOC ?=3D "unknown"
-SYSFW_CONFIG ?=3D "unknown"
-
-SYSFW_PREFIX =3D "ti-sci-firmware"
-SYSFW_PREFIX:j721e-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j721e-hs-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j7200-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j721s2-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "ti-fs-firmware"
-SYSFW_PREFIX:am62xx-evm-k3r5 =3D "ti-fs-firmware"
-
 SYSFW_SUFFIX ?=3D "unknown"
+SYSFW_CONFIG ?=3D "unknown"
=20
-SYSFW_BASE =3D "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
-SYSFW_BASE:append =3D "${@['','*']['${SYSFW_SUFFIX}' =3D=3D 'hs']}"
-
-SYSFW_TISCI =3D "${S}/ti-sysfw/${SYSFW_BASE}.bin"
+SYSFW_PREFIX =3D "sci"
+SYSFW_PREFIX:j721e-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j721e-hs-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 =3D "fs"
+SYSFW_PREFIX:j7200-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
+
+SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
=20
 SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
--=20
2.25.1


