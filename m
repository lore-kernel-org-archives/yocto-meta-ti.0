Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767A4D7878B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:28:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2594.1732206499313510151
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 08:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1DC4240C79;
	Thu, 21 Nov 2024 16:28:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNHkneLBHjEn; Thu, 21 Nov 2024 16:28:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 01F5A40023;
	Thu, 21 Nov 2024 16:28:16 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 187BA1640DF;
	Thu, 21 Nov 2024 11:28:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] ti-ipc: mark as incompatible with non-Linux builds
Date: Thu, 21 Nov 2024 11:28:15 -0500
Message-Id: <20241121162815.36087-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Nov 2024 16:28:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18075

From: Denys Dmytriyenko <denys@konsulko.com>

This package provides Linux-side components for TI IPC and depends on
virtual/kernel Linux kernel for the build, so it is not compatible with
non-Linux builds, such as k3r5 baremetal multiconfig. Hence adjust
COMPATIBLE_HOST accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc b/meta-ti-bsp/r=
ecipes-ti/ipc/ti-ipc-common.inc
index ec1e71be..da7e4733 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
@@ -3,7 +3,7 @@ INC_PR =3D "r0"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_HOST ?=3D "null"
-COMPATIBLE_HOST:ti-soc =3D "(.*)"
+COMPATIBLE_HOST:ti-soc =3D ".*-linux"
=20
 PLATFORM =3D "UNKNOWN"
 PLATFORM:dra7xx =3D "DRA7XX"
--=20
2.35.3


