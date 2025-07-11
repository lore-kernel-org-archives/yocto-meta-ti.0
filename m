Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB34C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:25:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16661.1752247510575047899
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 08:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D40040CC0;
	Fri, 11 Jul 2025 15:25:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKJtxxEvwTWP; Fri, 11 Jul 2025 15:25:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8185F40C81;
	Fri, 11 Jul 2025 15:25:08 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 946D516B8E7;
	Fri, 11 Jul 2025 11:25:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] ti-librpmsg-dma: mark it as compatible with K3 platforms
Date: Fri, 11 Jul 2025 11:25:06 -0400
Message-Id: <20250711152506.2836-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Jul 2025 15:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18777

From: Denys Dmytriyenko <denys@konsulko.com>

As ti-librpmsg-dma depends on ti-rpmsg-char, which is only compatible
with K3 platforms, ti-librpmsg-dma should also have the same limitations.

This resolves yocto-check-layer failure:

ERROR: Nothing PROVIDES 'ti-rpmsg-char' (but .../ti-librpmsg-dma_1.0.bb D=
EPENDS on or otherwise requires it)
ti-rpmsg-char was skipped: incompatible with machine qemux86-64 (not in C=
OMPATIBLE_MACHINE)

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-=
bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index 8a78d9ac..165ce8fb 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -10,3 +10,5 @@ inherit cmake
 DEPENDS =3D "ti-rpmsg-char"
=20
 EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
+
+COMPATIBLE_MACHINE =3D "^(k3)$"
--=20
2.25.1


