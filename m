Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8ABC4707E
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.11577.1651503086373777557
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE40B40C87
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5IbPDA9vdvB for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4FD340C98
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DE6CA17492F
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 26/26] ti-linux-fw: Bump to 08.03.00.002 release
Date: Mon,  2 May 2022 14:51:20 +0000
Message-Id: <20220502145120.726632-27-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14657

From: Ryan Eatmon <reatmon@ti.com>

Updated the ti-linux-fw version for 08.03.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index a00df108..3ebdae30 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -19,12 +19,12 @@ CADENCE_MHDP_FW_VERSION =3D "1.2.17"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
=20
-TI_LINUX_FW_SRCREV ?=3D "e13611ff1da6448d80279cc8c43b81cb2275cb0d"
+TI_LINUX_FW_SRCREV ?=3D "917625c2721eef8677df9e47d919005b0d4f93aa"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "b0386fe221fc9124fda0cd2efb03d62710b1d90f"
+K3_IMAGE_GEN_SRCREV ?=3D "62872c7e285fa9b9af76a258a24d603f851769c3"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
--=20
2.25.1


