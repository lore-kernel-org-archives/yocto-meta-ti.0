Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBE87E00715
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 08:18:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83FIuhQ009485;
	Tue, 3 Sep 2013 10:18:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83FIu2J026554;
	Tue, 3 Sep 2013 10:18:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 10:18:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/5] libgles-omap3: fix some conflicts
	between X11 and Raw versions
Thread-Index: AQHOpsE/jpR4Czy2iEuJwqzHhXNfe5m0JERQ
Date: Tue, 3 Sep 2013 15:18:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159701248@DLEE11.ent.ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
In-Reply-To: <1378005180-30928-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] libgles-omap3: fix some conflicts between X11 and Raw versions
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 15:18:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Saturday, August 31, 2013 10:13 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/5] libgles-omap3: fix some conflicts
>between X11 and Raw versions
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* Properly define all PROVIDES, RPROVIDES, RCONFLICTS and
>RREPLACES variables.
>* Skip X11 recipe altogether in non-X11 distros to avoid broken
>dependencies
>  for missing X libraries.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-graphics/libgles/libgles-omap3-no-x.inc | 14
>++++++++++++--
> recipes-graphics/libgles/libgles-omap3-x11.inc  | 17
>++++++++++++-----
> 2 files changed, 24 insertions(+), 7 deletions(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc
>b/recipes-graphics/libgles/libgles-omap3-no-x.inc
>index d4cb46b..727c422 100644
>--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
>+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
>@@ -3,7 +3,9 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D
>"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>
>-PR =3D "r35"
>+PR =3D "r36"
>+
>+EXCLUDE_FROM_WORLD =3D "1"
>
> COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
>
>@@ -13,7 +15,15 @@ PROVIDES +=3D "virtual/egl virtual/libgles1
>virtual/libgles2"
>
> RREPLACES_${PN} =3D "libegl libgles1 libgles2"
> RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>-RREPLACES_${PN}-dbg =3D "libegl-dbg"
>+RREPLACES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
>+
>+RPROVIDES_${PN} =3D "libegl libgles1 libgles2"
>+RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>+RPROVIDES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
>+
>+RCONFLICTS_${PN} =3D "libegl libgles1 libgles2"
>+RCONFLICTS_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>+RCONFLICTS_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
>
> SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
>/exports/${BINFILE} \
> 		   file://cputype \
>diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc
>b/recipes-graphics/libgles/libgles-omap3-x11.inc
>index 6621396..abe6e6f 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
>+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
>@@ -3,7 +3,9 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D
>"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>
>-PR =3D "r35"
>+PR =3D "r36"
>+
>+EXCLUDE_FROM_WORLD =3D "1"
>
> COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
>
>@@ -12,19 +14,19 @@ DEPENDS =3D "virtual/libx11 libxau libxdmcp
>libdrm"
> export SUPPORT_XORG ?=3D "1"
> PVR_INIT ?=3D "pvrsrvinit"
>
>-PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
>+PROVIDES +=3D "libgles-omap3 virtual/egl virtual/libgles1
>virtual/libgles2"
>
> RREPLACES_${PN} =3D "libegl libgles1 libgles2"
> RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>-RREPLACES_${PN}-dbg =3D "libegl-dbg"
>+RREPLACES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
>
> RPROVIDES_${PN} =3D "libegl libgles1 libgles2"
> RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>-RPROVIDES_${PN}-dbg =3D "libegl-dbg"
>+RPROVIDES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
>
> RCONFLICTS_${PN} =3D "libegl libgles1 libgles2"
> RCONFLICTS_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>-RCONFLICTS_${PN}-dbg =3D "libegl-dbg"
>+RCONFLICTS_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
>
> SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
>/exports/${BINFILE} \
> 		   file://cputype \
>@@ -47,6 +49,11 @@ export ES8LOCATION ?=3D "${S}/gfx_rel_es8.x"
>
> LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_DRIWSEGL.so"
>
>+python __anonymous() {
>+    if "x11" not in d.getVar("DISTRO_FEATURES", True).split():
>+        raise bb.parse.SkipPackage("Recipe is x11-specific,
>skipping")
>+}
>+
> do_configure() {
> 	# Attempt to fix up the worst offenders for file permissions
> 	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c")
>$(find ${S} -name "Make*") ; do
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

