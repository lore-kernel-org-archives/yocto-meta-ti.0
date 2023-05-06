Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC31C77B7D
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 02:37:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15224.1683340664392864909
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 19:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA8AB40C61
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UI-syuzTsa9s for <meta-ti@lists.yoctoproject.org>;
	Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 97A6F40C76
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 438A41638CB
	for <meta-ti@lists.yoctoproject.org>; Fri,  5 May 2023 22:37:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 2/4] pvr-mesa: add new vulkan configuration options and wsi
Date: Sat,  6 May 2023 02:37:41 +0000
Message-Id: <20230506023743.1259692-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506023743.1259692-1-denis@denix.org>
References: <20230506023743.1259692-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 02:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16492

From: Randolph Sapp <rs@ti.com>

Add the required vulkan configuration options and the new PVR WSI file to
the corresponding package.

Also bump the PV to match the version of Mesa actually being shipped.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp=
/recipes-graphics/mesa/pvr-mesa.inc
index d938f41c..caf94156 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -38,14 +38,18 @@ PACKAGECONFIG:remove =3D "xvmc"
 PACKAGECONFIG[xvmc] =3D ""
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-PV =3D "22.0.3+pvr"
+PV =3D "22.3.5+pvr"
=20
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr', =
',pvr', '', d)}"
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx', =
',sgx', '', d)}"
=20
+VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr', =
',pvr', '', d)}"
+
 do_install:append () {
     # remove pvr custom pkgconfig
     rm -rf ${D}${datadir}/pkgconfig
 }
=20
+FILES:mesa-vulkan-drivers +=3D " ${libdir}/libpvr_mesa_wsi.so"
+
 RRECOMMENDS:mesa-megadriver:append:class-target =3D " ${@d.getVar('PREFE=
RRED_PROVIDER_virtual/gpudriver')}"
--=20
2.25.1


