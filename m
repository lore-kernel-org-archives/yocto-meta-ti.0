Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76428C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:02:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20257.1681848133773425473
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 13:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA73240C85;
	Tue, 18 Apr 2023 20:02:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgOH9-yNkYzS; Tue, 18 Apr 2023 20:02:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 951F440BA8;
	Tue, 18 Apr 2023 20:02:10 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D09A71637F9;
	Tue, 18 Apr 2023 16:01:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Andrew Davis <afd@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH v3 5/6] meta-ti-bsp: Remove SGX driver from SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Tue, 18 Apr 2023 20:01:59 +0000
Message-Id: <20230418200159.300972-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 20:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16409

From: Andrew Davis <afd@ti.com>

Neither of recipes nor their ABI is all that stable. OpenGL might be
slightly more stable, but that is not what these provide anymore.
The variable helps with re-use of generic packages down the dependency
tree, when they depend on a machine-specific package. SGX UM used to
provide different standard OpenGL ABIs (EGL, GLES, GBM) and hence was
listed here. Now those ABIs are provided by Mesa, so SGX is removed.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v3 - expand commit message about SIGGEN_EXCLUDERECIPES_ABISAFE use

 meta-ti-bsp/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 39e7f9eb..948db4f9 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -19,8 +19,6 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
-    ti-sgx-ddk-km \
-    ti-sgx-ddk-um \
 "
=20
 HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
--=20
2.25.1


