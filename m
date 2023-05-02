Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA373C77B7F
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 03:40:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.120436.1682998842034980608
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 20:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B9D9940C60
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQauSN_lGkOc for <meta-ti@lists.yoctoproject.org>;
	Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA5AC40C13
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7FF391638BC
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 May 2023 23:39:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 3/3] graphics: upgrade rogue graphics to 23.1.6404501
Date: Tue,  2 May 2023 03:40:38 +0000
Message-Id: <20230502034038.3527224-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502034038.3527224-1-denis@denix.org>
References: <20230502034038.3527224-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 03:40:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16466

From: Randolph Sapp <rs@ti.com>

Update the rogue graphics recipes to point at the new 23.1.6404501
release. This adds support for:
	- kernel 6.1
	- vulkan
	- opencl (more testing needed)
	- zink (more testing needed)

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...er_1.18.6276027.bb =3D> ti-img-rogue-driver_23.1.6404501.bb} | 4 ++--
 ...bs_1.18.6276027.bb =3D> ti-img-rogue-umlibs_23.1.6404501.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.18=
.6276027.bb =3D> ti-img-rogue-driver_23.1.6404501.bb} (92%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.18.62=
76027.bb =3D> ti-img-rogue-umlibs_23.1.6404501.bb} (93%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.18.6276027.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_23.1.6404501.bb
similarity index 92%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1=
.18.6276027.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.=
1.6404501.bb
index 96fb7484..f8489e80 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.62=
76027.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.64=
04501.bb
@@ -16,13 +16,13 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 DEPENDS =3D "virtual/kernel"
=20
-BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
+BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "d575e4f64c95a3534e10e85da15bd303febf133f"
+SRCREV =3D "b69b689252a1158bff205603288ad12b9482770b"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
8.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_2=
3.1.6404501.bb
similarity index 93%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18=
.6276027.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6=
404501.bb
index 94d14ded..3ad0cce6 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.62760=
27.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.64045=
01.bb
@@ -10,9 +10,9 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 PR =3D "r2"
=20
-BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
+BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "51e598919641d51156a631efa5447124a3c0f543"
+SRCREV =3D "49958a8e820a321d22ac3c635bd21d4a3118c006"
 S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
--=20
2.25.1


