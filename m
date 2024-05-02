Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA25C25B5F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 00:26:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2201.1714609583632684157
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 17:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F3E6240AB7
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XY6BdQTlyrZK for <meta-ti@lists.yoctoproject.org>;
	Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E432E40C82
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C2612163F53
	for <meta-ti@lists.yoctoproject.org>; Wed,  1 May 2024 20:26:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/scarthgap][PATCH 1/3] ti-img-rogue-*: add ddk 24.1 recipes for ltsprep
Date: Wed,  1 May 2024 20:26:19 -0400
Message-Id: <20240502002621.3456112-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 00:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17626

From: Randolph Sapp <rs@ti.com>

Add these recipes but lock them behind ltsprep tags because they require
device tree changes that does not work on the current default kernel for
this layer.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ....6512818.bb =3D> ti-img-rogue-driver_24.1.6554834.bb} |  4 +++-
 ....6512818.bb =3D> ti-img-rogue-umlibs_24.1.6554834.bb} | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)
 copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.3.6=
512818.bb =3D> ti-img-rogue-driver_24.1.6554834.bb} (94%)
 copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23=
.3.6512818.bb =3D> ti-img-rogue-umlibs_24.1.6554834.bb} (94%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_24.1.6554834.bb
similarity index 94%
copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.=
3.6512818.bb
copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.=
6554834.bb
index 02ec9fe9..a1b76d27 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.65=
54834.bb
@@ -3,6 +3,8 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-dri=
ver"
 LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
=20
+DEFAULT_PREFERENCE =3D "-1"
+
 inherit module
=20
 PROVIDES =3D "virtual/gpudriver"
@@ -22,7 +24,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue=
-driver.git;protocol=3Dhttps;
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
+SRCREV =3D "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_24.1.6554834.bb
similarity index 94%
copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_23.3.6512818.bb
copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.1.6554834.bb
index a0a9a295..df426d1a 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.=
3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.=
1.6554834.bb
@@ -3,6 +3,8 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-uml=
ibs"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f9=
9e3baa03de5207e76f"
=20
+DEFAULT_PREFERENCE =3D "-1"
+
 inherit bin_package
=20
 INHIBIT_DEFAULT_DEPS =3D ""
@@ -14,7 +16,7 @@ PR =3D "r3"
=20
 BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
+SRCREV =3D "e473234158c736248cf71a60080b7faf76fca561"
 S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
@@ -109,7 +111,7 @@ python __anonymous() {
         mlprefix =3D d.getVar("MLPREFIX")
         pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
+        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
         d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-um=
libs" + suffix)
 }
=20
@@ -133,6 +135,8 @@ DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
 # optional tools and tests
 FILES:${PN}-tools =3D "${bindir}/"
 RDEPENDS:${PN}-tools =3D "python3-core ${PN}"
+INSANE_SKIP:${PN}-tools =3D "ldflags"
+RDEPENDS:${PN}-tools =3D "libdrm"
=20
 # required firmware
 FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
@@ -142,4 +146,4 @@ RRECOMMENDS:${PN} +=3D " \
     ${PN}-tools \
 "
=20
-INSANE_SKIP:${PN} +=3D "already-stripped dev-so"
+INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
--=20
2.25.1


