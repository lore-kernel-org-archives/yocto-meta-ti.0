Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473D2C77B77
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6430.1679283568840484066
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F2FD40CB3
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJ4m-jVU0EJ7 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3489940CAF
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 24D681637CE
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 22/53] ti-sci-fw: Add SYSFW_SUFFIX to sysfw.itb files
Date: Mon, 20 Mar 2023 03:38:54 +0000
Message-Id: <20230320033925.1306823-23-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16080

From: Ryan Eatmon <reatmon@ti.com>

With the advent of using multiconfigs to build all of the versions of
the machines (gp, hs-se, hs-fs, etc...) the sysfw.itb has become a point
of contention for do_deploy.  To resolve the duplicate file copy errors
from bitbake we need to uniquify the sysfw.itb file names.  So, let's do
the same thing we do with the tiboot3.bin file and add the SYSFW_SUFFIX
into the name.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 75b9f8a6..b65d8502 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -51,10 +51,26 @@ SYSFW_TIBOOT3 =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFI=
X}-${SYSFW_CONFIG}.bin"
 SYSFW_TIBOOT3_SYMLINK ?=3D "tiboot3.bin"
=20
 SYSFW_BINARY =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONF=
IG}.itb"
+SYSFW_IMAGE =3D "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_SYMLINK ?=3D "sysfw.itb"
=20
+SYSFW_VBINARY:am65xx-evm-k3r5 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONF=
IG}.itb"
+SYSFW_VBINARY:am65xx-evm-k3r5-sr2 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_=
CONFIG}.itb"
+SYSFW_VBINARY:am65xx-hs-evm-k3r5 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_C=
ONFIG}.itb"
+SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYS=
FW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-evm-k3r5 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFI=
G}.itb"
+SYSFW_VBINARY:j721e-hs-evm-k3r5 =3D "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CO=
NFIG}.itb"
+SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 =3D "sysfw-${PV}-${SYSFW_SOC}-${SY=
SFW_CONFIG}.itb"
+
+SYSFW_IMAGE:am65xx-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-evm-k3r5-sr2 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.=
itb"
+SYSFW_IMAGE:am65xx-hs-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.i=
tb"
+SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFI=
G}.itb"
+SYSFW_IMAGE:j721e-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-hs-evm-k3r5 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.it=
b"
+SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 =3D "sysfw-${SYSFW_SOC}-${SYSFW_CONF=
IG}.itb"
+
 CFLAGS[unexport] =3D "1"
 LDFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
--=20
2.25.1


