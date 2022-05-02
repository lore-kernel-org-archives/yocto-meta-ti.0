Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29BEC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11685.1651503084185449727
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA5DD40C83
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHhwyeEV4iJr for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA69B40C2A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DE803174917
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 02/26] ti-sgx-ddk-um: avoid unnecessary dependency on
 -dev package
Date: Mon,  2 May 2022 14:50:56 +0000
Message-Id: <20220502145120.726632-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14644

From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

ti-sgx-ddk-um's do_install creates a symlink libGLESv2.so.1 to
libGLESv2.so. As this symlink will be installed to ti-sgx-ddk-um, but
its target libGLESv2.so is in ti-sgx-ddk-um-dev, the automated
dependency analysis will add ti-sgx-ddk-um-dev to ti-sgx-ddk-um's
RDEPENDS. This will pull in a large number of other -dev packages
through RDEPENDS and RRECOMMENDS in turn.

Avoid this by having libGLESv2.so.1 point to libGLESv2.so.2 instead of
libGLESv2.so, so the symlink's target is in ti-sgx-ddk-um as well.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948=
957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.=
bb
index f4c71d25..d0edf1fe 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -54,7 +54,7 @@ S =3D "${WORKDIR}/git"
=20
 do_install () {
     oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}
-    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
+    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
=20
     chown -R root:root ${D}
 }
--=20
2.25.1


