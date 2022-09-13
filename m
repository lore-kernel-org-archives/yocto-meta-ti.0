Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CFAC6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.886.1663041351830870557
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C28640D6E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iD1B-eWK0e_8 for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0FA7C40D7E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A3EB81749E2
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 22/65] ti-linux-fw: Bump to 08.04.00.001
 release
Date: Tue, 13 Sep 2022 03:54:58 +0000
Message-Id: <20220913035541.2364351-23-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15084

From: Ryan Eatmon <reatmon@ti.com>

Updated the ti-linux-fw version for 08.04.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 52766ac0..ffbb1bba 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,12 +20,12 @@ IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
 TIFS_LPM_STUB_FW_VERSION =3D "08.03.02"
=20
-TI_LINUX_FW_SRCREV ?=3D "5aa15e59927a5c4acc4dd61d213ab6cef7c0209f"
+TI_LINUX_FW_SRCREV ?=3D "224f82474e4029dd2e550600ba7e59f687ff7131"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "79492803a70ba1918116ac28e18c74670cdda2b9"
+K3_IMAGE_GEN_SRCREV ?=3D "c43068a114a86daad9241724ef8e3afda45be9be"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
--=20
2.25.1


