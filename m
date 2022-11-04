Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3D2C3A59F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.829.1667602020283232420
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B84940DA0
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1ixH_NMaX5a for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EE1740DA5
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2FADA1636B4
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 42/50] cnm-wave-fw: update firmware name to wave521c_k3_codec_fw.bin
Date: Fri,  4 Nov 2022 22:46:44 +0000
Message-Id: <20221104224653.1223044-43-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15310

From: Ryan Eatmon <reatmon@ti.com>

update firmware name to wave521c_k3_codec_fw.bin to align with
linux-firmware main branch. the following patch is part of
ti-linux-firmware thru mainline sync.

commit 48407ffd ("cnm: update chips&media wave521c firmware.")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 72dcca00..0e8ed897 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -20,9 +20,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 S =3D "${WORKDIR}/git"
 TARGET_WAVE521C =3D "wave521c_codec_fw.bin"
=20
-SOURCE_WAVE521C =3D "wave521c_codec_fw.bin"
-SOURCE_WAVE521C:j721s2 =3D "wave521c_j721s2_codec_fw.bin"
-SOURCE_WAVE521C:j784s4 =3D "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C =3D "wave521c_k3_codec_fw.bin"
=20
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}/fi=
rmware/cnm/${TARGET_WAVE521C}"
--=20
2.25.1


