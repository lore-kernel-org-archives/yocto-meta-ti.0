Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB800C63703
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.221.1667598060740674032
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 71FA940D8F
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5hhJnZX_b-k for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 68F2140D91
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DD8D71636A9
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 35/47] ti-img-rogue-*: Bump the graphics recipes
Date: Fri,  4 Nov 2022 21:40:43 +0000
Message-Id: <20221104214055.1221197-36-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15247

From: Randolph Sapp <rs@ti.com>

Bump the graphics recipes source revision and remove the old BVNC
switch. The BVNC is now baked into the platform Makefile that is
selected with PVR_BUILD_DIR / TARGET_PRODUCT.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb   | 8 ++------
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb           | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.15.6133109.bb
index 00bc719a..fd595dea 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
@@ -27,20 +27,16 @@ SRC_URI =3D " \
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "ea2ac3fda4ac442b639bc3a0b73e9c4feac2081a"
+SRCREV =3D "a353b9524399d927af8e824f92902065947b2fbe"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
 TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
 TARGET_PRODUCT:am62xx =3D "am62_linux"
-TARGET_BVNC:j721e =3D "22.104.208.318"
-TARGET_BVNC:j721s2 =3D "36.53.104.796"
-TARGET_BVNC:j784s4 =3D "36.53.104.796"
-TARGET_BVNC:am62xx =3D "33.15.11.3"
 PVR_BUILD =3D "release"
 PVR_WS =3D "wayland"
=20
-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" RGX_BVNC=3D${TARG=
ET_BVNC} BUILD=3D${PVR_BUILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SY=
STEM=3D${PVR_WS}'
+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUI=
LD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
=20
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PV=
R_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_pr=
efix} PREFIX=3D${STAGING_DIR_HOST} modules_install
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
5.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.15.6133109.bb
index 2abec024..a665c614 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
@@ -15,7 +15,7 @@ PR =3D "r2"
 BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "4207c0ea429ec751b1ff5f831a84ceeb76ad578d"
+SRCREV =3D "5977e82b96028f783d39c7219f016c1faf8dc5f5"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
--=20
2.25.1


