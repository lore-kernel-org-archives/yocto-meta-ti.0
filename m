Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4D3C7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 03:40:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.119997.1682998842140941257
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 20:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CAAFC40C98
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZflxk2ac0Jb for <meta-ti@lists.yoctoproject.org>;
	Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BE5DC40C16
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7399C163896
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 May 2023 23:39:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 2/3] mesa: update pvr-mesa for the 22.3.5 version of mesa
Date: Tue,  2 May 2023 03:40:37 +0000
Message-Id: <20230502034038.3527224-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502034038.3527224-1-denis@denix.org>
References: <20230502034038.3527224-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 03:40:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16468

From: Randolph Sapp <rs@ti.com>

Update the pvr-mesa include to use the 22.3.5 patches from
oe-core/master and the branch for DDK version 23.1 on freedesktop.

Also remove the PACKAGECONFIG options elf-tls and xvmc as those
functions were dropped by the oe-core/master version of this package and
mesa package respectively.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp=
/recipes-graphics/mesa/pvr-mesa.inc
index 96c484a7..d938f41c 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -4,23 +4,22 @@
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D9a383ee9f65a4e939d66=
30e9b067ff58"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
=20
-BRANCH =3D "powervr/kirkstone/22.0"
+BRANCH =3D "powervr/kirkstone/22.3.5"
=20
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;=
branch=3D${BRANCH} \
     file://0001-meson.build-check-for-all-linux-host_os-combinations.pat=
ch \
-    file://0002-meson.build-make-TLS-ELF-optional.patch \
     file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-    file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
     file://0001-util-format-Check-for-NEON-before-using-it.patch \
-    file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.pat=
ch \
+    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
+    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.pat=
ch \
 "
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
+SRCREV =3D "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
=20
 PACKAGECONFIG:append =3D " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img=
-rogue-driver', 'pvr', '', d)} \
@@ -33,6 +32,10 @@ PACKAGECONFIG[sgx] =3D "-Dgallium-sgx-alias=3D${PVR_DI=
SPLAY_CONTROLLER_ALIAS},"
=20
 PACKAGECONFIG:remove =3D "video-codecs"
 PACKAGECONFIG[video-codecs] =3D ""
+PACKAGECONFIG:remove =3D "elf-tls"
+PACKAGECONFIG[elf-tls] =3D ""
+PACKAGECONFIG:remove =3D "xvmc"
+PACKAGECONFIG[xvmc] =3D ""
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PV =3D "22.0.3+pvr"
--=20
2.25.1


