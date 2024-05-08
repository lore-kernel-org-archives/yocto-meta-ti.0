Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AA7C25B4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 20:42:59 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8091.1715200974201244773
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 May 2024 13:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gt1v94ys;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448KgpZo019446;
	Wed, 8 May 2024 15:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715200971;
	bh=IZg2+5jEXyvTMS7WBjNmnqGkQ5oPS8UVRBpXs/PKGzU=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=Gt1v94ys9/D0CSUrEwjUh4wtk1IOu8RxhUjxOaYoX/f8RyjU5enkQYYT6gsbHWPwT
	 ECrzovtvaKMYdtt19tykhHDnS36ShcAZR/IUeiriA2BmBciA15C4/MsB7C0FZe4xIX
	 Ew16chEm9acqRUieL2BChDPE5n6RvUn38prZqhfQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448KgpNh052192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 15:42:51 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 15:42:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 15:42:50 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448KgoPg020741;
	Wed, 8 May 2024 15:42:50 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 8 May 2024 15:42:50 -0500
Message-ID: <D14K004H3SGW.3V2EISQLSIWJ1@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCHv2 1/3] ti-img-rogue-*: add
 ddk 24.1 recipes for ltsprep
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.17.0
References: <20240502191843.2380555-1-rs@ti.com>
 <20240502191843.2380555-2-rs@ti.com> <20240502194518.GW28791@denix.org>
In-Reply-To: <20240502194518.GW28791@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 May 2024 20:42:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17647

On Thu May 2, 2024 at 2:45 PM CDT, Denys Dmytriyenko wrote:
> Can you make it a diff please? As shown previously, that helps with revie=
w and=20
> allows spotting issues much easier.
>
[snip]

Yeah, sorry about the delay on this. Just got back to Dallas. Appending the=
 diff
here if people need it. I can submit a v3 for this if necessary. Just let m=
e
know.

---

From 9666459f524333440c61eeae7c0ad430c58d740e Mon Sep 17 00:00:00 2001
From: Randolph Sapp <rs@ti.com>
Date: Tue, 30 Apr 2024 14:56:57 -0500
Subject: [PATCH] ti-img-rogue-*: add ddk 24.1 recipes for ltsprep

Recipes for DDK 24.1, but lock them behind ltsprep tags because they
require device tree changes that do not work on the current default
kernel for this layer.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...6512818.bb =3D> ti-img-rogue-driver_24.1.6554834.bb} |  4 +++-
 ...6512818.bb =3D> ti-img-rogue-umlibs_24.1.6554834.bb} | 11 +++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)
 copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.3.651=
2818.bb =3D> ti-img-rogue-driver_24.1.6554834.bb} (94%)
 copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.3=
.6512818.bb =3D> ti-img-rogue-umlibs_24.1.6554834.bb} (94%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23=
.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_24.1.6554834.bb
similarity index 94%
copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.=
6512818.bb
copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.65=
54834.bb
index 02ec9fe9..a1b76d27 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512=
818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554=
834.bb
@@ -3,6 +3,8 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-drive=
r"
 LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D0403=
c7dea01a2b8232261e805325fac2"
=20
+DEFAULT_PREFERENCE =3D "-1"
+
 inherit module
=20
 PROVIDES =3D "virtual/gpudriver"
@@ -22,7 +24,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-d=
river.git;protocol=3Dhttps;
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
+SRCREV =3D "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_24.1.6554834.bb
similarity index 94%
copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
3.3.6512818.bb
copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.=
1.6554834.bb
index a0a9a295..d43d1635 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.=
6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.=
6554834.bb
@@ -3,6 +3,8 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlib=
s"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f99e=
3baa03de5207e76f"
=20
+DEFAULT_PREFERENCE =3D "-1"
+
 inherit bin_package
=20
 INHIBIT_DEFAULT_DEPS =3D ""
@@ -14,7 +16,7 @@ PR =3D "r3"
=20
 BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
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
         d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umli=
bs" + suffix)
 }
=20
@@ -132,7 +134,8 @@ DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
=20
 # optional tools and tests
 FILES:${PN}-tools =3D "${bindir}/"
-RDEPENDS:${PN}-tools =3D "python3-core ${PN}"
+RDEPENDS:${PN}-tools =3D "python3-core libdrm ${PN}"
+INSANE_SKIP:${PN}-tools =3D "ldflags"
=20
 # required firmware
 FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
@@ -142,4 +145,4 @@ RRECOMMENDS:${PN} +=3D " \
     ${PN}-tools \
 "
=20
-INSANE_SKIP:${PN} +=3D "already-stripped dev-so"
+INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
--=20
2.45.0


