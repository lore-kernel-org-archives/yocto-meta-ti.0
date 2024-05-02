Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE363C10F1A
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 00:26:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2200.1714609583595104628
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 17:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB46840C86
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSajjZQz5J_3 for <meta-ti@lists.yoctoproject.org>;
	Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E086A40AB7
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D93E9163F56
	for <meta-ti@lists.yoctoproject.org>; Wed,  1 May 2024 20:26:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add recipe for 23.2.1
Date: Wed,  1 May 2024 20:26:21 -0400
Message-Id: <20240502002621.3456112-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502002621.3456112-1-denis@denix.org>
References: <20240502002621.3456112-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 00:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17624

From: Randolph Sapp <rs@ti.com>

Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
This branch does not currently contain SGX patches so it is also being
masked by the ltsprep branding to prevent regressing those devices
currently.

Please note that because this recipe is currently in
SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
switching away from the ltsprep tag. Please issue a clean to mesa and
ti-img-rogue-umlibs if you get warnings from either package's
do_create_runtime_spdx step.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../mesa/{mesa-pvr_22.3.5.bb =3D> mesa-pvr_23.2.1.bb}  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_22.3.5.bb =3D> mesa-pvr=
_23.2.1.bb} (83%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-=
ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
similarity index 83%
copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
index 5abd0793..c83ba87d 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -2,23 +2,23 @@
 # upstream yet. This allows us to build the shims we need without comple=
tely
 # clobbering mesa.
=20
+DEFAULT_PREFERENCE =3D "-1"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}_${PV}:"
+
 require recipes-graphics/mesa/mesa.inc
=20
 SUMMARY +=3D " (with PowerVR support for TI platforms)"
=20
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
=20
-BRANCH =3D "powervr/kirkstone/${PV}"
+BRANCH =3D "powervr/${PV}"
=20
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;=
branch=3D${BRANCH} \
     file://0001-meson.build-check-for-all-linux-host_os-combinations.pat=
ch \
     file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-    file://0001-util-format-Check-for-NEON-before-using-it.patch \
-    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
-    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.pat=
ch \
     file://0001-gallium-Fix-build-with-llvm-17.patch \
-    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.pat=
ch \
+    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
 "
=20
 S =3D "${WORKDIR}/git"
@@ -28,7 +28,7 @@ PACKAGECONFIG:append =3D " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx=
-ddk-km', 'sgx', '', d)} \
 "
=20
-SRCREV =3D "1be98ba80452ebe38546a7fca26b5a70f2629083"
+SRCREV =3D "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
=20
 PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
 PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER_A=
LIAS},"
--=20
2.25.1


