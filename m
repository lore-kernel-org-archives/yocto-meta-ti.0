Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D76DC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.647.1652119192578454857
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9851C40C86
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7YEiUHSNEak for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79C1A40C88
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4572217492B
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 10/10] dsptop: fix host contamination warning
Date: Mon,  9 May 2022 17:59:47 +0000
Message-Id: <20220509175947.1994132-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14724

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes this warning:

| WARNING: dsptop-1.4.0-r2.2 do_package_qa: QA Issue: dsptop: /usr/bin/ds=
ptop is owned by uid 1000,
| which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-ex=
tras/recipes-bsp/dsptop/dsptop_git.bb
index e8853ff8..90ce8943 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -15,6 +15,7 @@ EXTRA_OEMAKE =3D "release DEVICE=3D${DEVICE} CROSS_COMP=
ILE=3D${TARGET_PREFIX} CC=3D"${CC
=20
 do_install() {
     oe_runmake install DESTDIR=3D${D}
+    chown -R root:root ${D}
 }
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
--=20
2.25.1


