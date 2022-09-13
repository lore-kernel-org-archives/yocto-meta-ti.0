Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1C6C6FD35
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.873.1663041344553897718
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FF2640D1C
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoYkRbeB2VOi for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F00340D22
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CC9061749C8
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 01/65] ti-graphics: update for 4K/64K page
 size GPU drivers
Date: Tue, 13 Sep 2022 03:54:37 +0000
Message-Id: <20220913035541.2364351-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15027

From: Darren Etheridge <detheridge@ti.com>

Pull in the GPU KM/UMLIBS that enable the unified 4K/64K page
firmware support in the IMG Rogue drivers.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb     | 6 +++---
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb             | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.15.6133109.bb
index 2f4a7354..109a13d0 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
@@ -7,7 +7,7 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-MACHINE_KERNEL_PR:append =3D "a"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -17,7 +17,7 @@ DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
+BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
=20
 SRC_URI =3D " \
     git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D${BRANCH}=
 \
@@ -27,7 +27,7 @@ SRC_URI =3D " \
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
+SRCREV =3D "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
5.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.15.6133109.bb
index 115344b1..1fb04dab 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
@@ -10,12 +10,12 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j721e|j721s2|am62xx"
=20
-PR =3D "r1"
+PR =3D "r2"
=20
-BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
+BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
-SRCREV =3D "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
+SRCREV =3D "fba0c770b712640ab3761dbe8369d43f89f616ed"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
--=20
2.25.1


