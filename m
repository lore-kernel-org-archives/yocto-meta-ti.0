Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02718C7618E
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6729.1679285567908048105
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 42A9E40C5D
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0ei35kfD4Ht for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A55F340C60
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 91BB11637C4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 09/54] ipc: ti-rpmsg-char: Update library to 0.5.2
Date: Mon, 20 Mar 2023 04:11:56 +0000
Message-Id: <20230320041241.1293077-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16159

From: Devarsh Thakkar <devarsht@ti.com>

Update library to 0.5.2 as it adds support for AM62A
SoC.

Co-Authored-By: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Acked-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/r=
ecipes-ti/ipc/ti-rpmsg-char.inc
index d21dcbf3..dff13640 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL =3D "https"
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D${P=
ROTOCOL};branch=3D${BRANCH};"
=20
-# Initial 0.5.1 release
-SRCREV =3D "adb964ee72f99545e2ad55c50cfd14015a7d837e"
+# Initial 0.5.2 release
+SRCREV =3D "1da3e1bd0412c148ab57690940fea5d129220896"
=20
-PV =3D "0.5.1+git${SRCPV}"
+PV =3D "0.5.2+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1


