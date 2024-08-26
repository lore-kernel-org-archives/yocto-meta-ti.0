Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6F8C5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:12:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60263.1724699552790829110
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E01F40C67;
	Mon, 26 Aug 2024 19:12:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAlY5UZlF-ab; Mon, 26 Aug 2024 19:12:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC9B440A03;
	Mon, 26 Aug 2024 19:12:30 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AA0DC164060;
	Mon, 26 Aug 2024 15:12:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] openmp-rtos: deprecate
Date: Mon, 26 Aug 2024 15:12:29 -0400
Message-Id: <20240826191229.8055-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:12:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17949

From: Denys Dmytriyenko <denys@konsulko.com>

Remove openmp-rtos component as deprecated and not maintained.

This used to provide OpenMP DSP runtime components for legacy devices.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/openmp-rtos/openmp-rtos_git.bb | 62 -------------------
 1 file changed, 62 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git=
.bb

diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/m=
eta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
deleted file mode 100644
index aa4bc6cd..00000000
--- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-DESCRIPTION =3D "TI OpenMP RTOS"
-HOMEPAGE =3D "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
-LICENSE =3D "BSD-3-Clause"
-
-require recipes-ti/includes/ti-paths.inc
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "openmp"
-
-PV =3D "2_06_03_00"
-PR =3D "r0"
-
-OPENMP_RTOS_GIT_URI =3D "git://git.ti.com/git/openmp/ti-openmp-dsp-runti=
me.git"
-OPENMP_RTOS_GIT_PROTOCOL =3D "https"
-OPENMP_RTOS_GIT_BRANCH =3D "master"
-
-BRANCH =3D "${OPENMP_RTOS_GIT_BRANCH}"
-SRC_URI =3D "${OPENMP_RTOS_GIT_URI};protocol=3D${OPENMP_RTOS_GIT_PROTOCO=
L};branch=3D${BRANCH}"
-
-SRCREV =3D "c090eb664d9815a36ead0e14f31e102590680fb8"
-
-LIC_FILES_CHKSUM =3D "file://docs/license/omp_manifest_template.html;md5=
=3D61a6972303c0447b7c056195d7ebafee"
-
-DEPENDS =3D "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native=
 ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
-
-COMPATIBLE_MACHINE =3D "omap-a15"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-export IPC_DIR =3D "${IPC_INSTALL_DIR}"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
-export ULM_DIR =3D"${STAGING_DIR_TARGET}/usr/share/ti/ulm"
-export C6636_PDK_DIR =3D"${PDK_INSTALL_DIR}"
-export AM572_PDK_DIR =3D"${PDK_INSTALL_DIR}"
-export XDCCGROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-
-export BUILD_AM572 =3D "0"
-
-BUILD_AM572:omap-a15 =3D "1"
-
-RELEASE_TARGET =3D ""
-RELEASE_TARGET:omap-a15 =3D "am57xx"
-
-do_compile() {
-    make -f utils/product/Makefile .zipfile
-}
-
-do_install() {
-    install -d ${D}${OMP_INSTALL_DIR_RECIPE}
-    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_IN=
STALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} =3D "1"
-
-FILES:${PN}-dev +=3D " \
-    ${OMP_INSTALL_DIR_RECIPE}/ \
-"
-
-INSANE_SKIP:${PN}-dev =3D "arch"
--=20
2.25.1


