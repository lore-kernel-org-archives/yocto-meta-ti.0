Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E43C07E9D
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.835.1667602020477946850
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE7A340D86
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ukalhuNTsJW for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B329340DA1
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 518FB1636B8
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 46/50] ti-k3-secdev: include ti-paths.inc
Date: Fri,  4 Nov 2022 22:46:48 +0000
Message-Id: <20221104224653.1223044-47-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15314

From: Denys Dmytriyenko <denys@konsulko.com>

Include ti-paths.inc so TI_K3_SECDEV_INSTALL_DIR_RECIPE gets defined and
artifacts are installed in the correct location.

Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-=
ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
index 7a5dd573..3763c339 100644
--- a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -4,6 +4,8 @@ SECTION =3D "devel"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://manifest/k3-secdev-0.2-manifest.html;md5=3D=
f632a78870cc64550078d7b3cbac0892"
=20
+require recipes-ti/includes/ti-paths.inc
+
 # Native host tool only
 COMPATIBLE_MACHINE =3D "null"
 COMPATIBLE_MACHINE:class-native =3D "(.*)"
--=20
2.25.1


