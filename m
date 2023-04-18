Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4505BC6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:02:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.19998.1681848140548157367
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 13:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E20CE40C85;
	Tue, 18 Apr 2023 20:02:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UH_ybyCKhy35; Tue, 18 Apr 2023 20:02:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA77840BA8;
	Tue, 18 Apr 2023 20:02:18 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1CC1B1637F9;
	Tue, 18 Apr 2023 16:01:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] meta-ti-bsp: add mesa to SIGGEN_EXCLUDERECIPES_ABISAFE list
Date: Tue, 18 Apr 2023 20:02:17 +0000
Message-Id: <20230418200217.301038-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 20:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16410

From: Denys Dmytriyenko <denys@konsulko.com>

For TI platforms with SGX and Rogue graphics we patch upstream Mesa with
PVR support and conditionally enable features based on virtual/gpudriver
preference. This makes Mesa package platform-specific and it contains the
corresponding PACKAGE_ARCH =3D "${MACHINE_ARCH}" line.

In order to get greater re-use from generic non-machine-speciofic package=
s
down the dependency chain, such as Wayland, Weston, Qt5 modules, etc. we
need to mark mesa recipe as still providing stable OpenGL ABIs, such as
EGL, GLES, GBM, etc. - add it to SIGGEN_EXCLUDERECIPES_ABISAFE list.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 948db4f9..e9b7f92c 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -19,6 +19,7 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
+    mesa \
 "
=20
 HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
--=20
2.25.1


