Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F1C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:08:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43748.1702490893522621424
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 10:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D727E40C3A;
	Wed, 13 Dec 2023 18:08:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6AyzWXNVF3K; Wed, 13 Dec 2023 18:08:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C061D40C2E;
	Wed, 13 Dec 2023 18:08:11 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 76A7C163DB9;
	Wed, 13 Dec 2023 13:08:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] mesa-pvr: adjust PR to be RPM-safe
Date: Wed, 13 Dec 2023 18:08:10 +0000
Message-Id: <20231213180811.1927069-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Dec 2023 18:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17349

From: Denys Dmytriyenko <denys@konsulko.com>

RPM does not accept '-' as a character in the PR/version and fails with:

| error: line 4: Illegal char '-' (0x2d) in: Release: sgxrgx-54fd9d7dea09=
8b6f11c2a244b0c6763dc8c5690c.1

The correct approach is to reference SRCPV and not SRCREV and also add it
to PV and not PR. But PV is used in the branch to fetch the sources and
cannot be modified, so use SRCPV in PR w/o any illegal characters.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-=
ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 55dad414..554fadd3 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG:append =3D " \
 # Idea is these two should be the same, but currently a segfault is happ=
ening
 # on certain platforms if the sgx commit is used.
 SRCREV =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx', '7c9522a4147836=
064f582278e4f7115735c16868', '54fd9d7dea098b6f11c2a244b0c6763dc8c5690c', =
d)}"
-PR =3D "sgxrgx-${SRCREV}"
+PR =3D "sgxrgx${SRCPV}"
=20
 PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
 PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER_A=
LIAS},"
--=20
2.25.1


