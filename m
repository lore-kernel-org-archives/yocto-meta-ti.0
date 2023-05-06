Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA140C77B7C
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 02:37:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15233.1683340666370550803
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 19:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B621040A3D
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DAC7xFqgFSz for <meta-ti@lists.yoctoproject.org>;
	Sat,  6 May 2023 02:37:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C2A540CA2
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 477791638D0
	for <meta-ti@lists.yoctoproject.org>; Fri,  5 May 2023 22:37:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 4/4] ti-img-rogue-umlibs: package firmware separately
Date: Sat,  6 May 2023 02:37:43 +0000
Message-Id: <20230506023743.1259692-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506023743.1259692-1-denis@denix.org>
References: <20230506023743.1259692-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 02:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16495

From: Randolph Sapp <rs@ti.com>

Split the firmware into it's own package so we can make the insane
checks a little more paranoid again.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libgles/ti-img-rogue-umlibs_23.1.6404501.bb           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.=
1.6404501.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_2=
3.1.6404501.bb
index 9068d341..c33f8ae0 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.64045=
01.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.64045=
01.bb
@@ -32,7 +32,7 @@ do_install:append() {
     rm -rf "${D}/etc/init.d"
 }
=20
-PACKAGES =3D "${PN}-vulkan ${PN}-tools ${PN}"
+PACKAGES =3D "${PN}-vulkan ${PN}-tools ${PN}-firmware ${PN}"
=20
 FILES:${PN}-vulkan =3D " \
     ${datadir}/vulkan \
@@ -53,6 +53,10 @@ INSANE_SKIP:${PN}-vulkan +=3D " \
 FILES:${PN}-tools =3D "${bindir}/"
 RDEPENDS:${PN}-tools =3D "python3-core"
=20
+FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
+INSANE_SKIP:${PN}-firmware +=3D "arch"
+
 RRECOMMENDS:${PN} +=3D "${PN}-vulkan ${PN}-tools"
+RDEPENDS:${PN} +=3D " ${PN}-firmware"
=20
-INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped dev-so"
+INSANE_SKIP:${PN} +=3D "already-stripped dev-so"
--=20
2.25.1


