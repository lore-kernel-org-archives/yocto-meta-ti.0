Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA053C2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 00:56:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.62871.1718931394382907121
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 17:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 972E340CB7;
	Fri, 21 Jun 2024 00:56:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyYpXYSa1sxf; Fri, 21 Jun 2024 00:56:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BC9340BA8;
	Fri, 21 Jun 2024 00:56:32 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 2F6E2163FC1;
	Thu, 20 Jun 2024 20:56:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] ti-rtos-metadata: remove
Date: Thu, 20 Jun 2024 20:56:26 -0400
Message-Id: <20240621005626.6252-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 00:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17787

From: Denys Dmytriyenko <denys@konsulko.com>

The use of external metadata file to control RTOS binary firmware
integration has been deprecated some time ago. Remove it now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/ti-rtos-bin/files/empty        |  1 -
 .../ti-rtos-bin/ti-rtos-metadata.bb           | 47 -------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rtos-bin/files/empty
 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.b=
b

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/files/empty b/meta-ti-bsp=
/recipes-ti/ti-rtos-bin/files/empty
deleted file mode 100644
index c6cac692..00000000
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/files/empty
+++ /dev/null
@@ -1 +0,0 @@
-empty
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
deleted file mode 100644
index feee1cf9..00000000
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D55=
0794465ba0ec5312d6919e203a55f9"
-
-COMPATIBLE_MACHINE =3D "j721e|j7200|am65xx|am64xx"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-inherit nopackages deploy
-
-PLAT_SFX =3D ""
-PLAT_SFX:j721e =3D "/j721e"
-PLAT_SFX:j7200 =3D "/j7200"
-PLAT_SFX:am65xx =3D "/am65xx"
-PLAT_SFX:am64xx =3D "/am64x"
-
-# Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
-TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/git/processor-sdk/coresdk_rt=
os_releases.git"
-TI_RTOS_METADATA_PROTOCOL ?=3D "https"
-TI_RTOS_METADATA_SRCREV ?=3D "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
-TI_RTOS_METADATA_BRANCH ?=3D "master"
-TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
-TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-TI_RTOS_METADATA_FILE:am64xx ?=3D "${S}${TI_RTOS_METADATA_DIR}/mcusdk_me=
tadata.inc"
-
-PV =3D "1.0.0+git"
-
-S =3D "${WORKDIR}/git"
-
-SRC_URI =3D "${TI_RTOS_METADATA_URI};branch=3D${TI_RTOS_METADATA_BRANCH}=
;protocol=3D${TI_RTOS_METADATA_PROTOCOL}"
-SRCREV =3D "${TI_RTOS_METADATA_SRCREV}"
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-do_install[noexec] =3D "1"
-
-do_deploy () {
-	:
-}
-
-do_deploy:k3 () {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${TI_RTOS_METADATA_FILE} ${DEPLOYDIR}/
-}
-
-addtask deploy before do_build after do_compile
--=20
2.35.3


