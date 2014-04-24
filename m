Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7C8EE006EC
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 05:44:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OCidaa011049;
	Thu, 24 Apr 2014 07:44:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OCidg7020256;
	Thu, 24 Apr 2014 07:44:39 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 07:44:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/3] recipes: use proper TI-TSPA license name
	instead of TSPA
Thread-Index: AQHPXz6/HAnCYRtNZEmqkuXU/1n2mZsgt1sw
Date: Thu, 24 Apr 2014 12:44:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB2159@DLEE11.ent.ti.com>
References: <1398290092-20034-1-git-send-email-denis@denix.org>
	<1398290092-20034-3-git-send-email-denis@denix.org>
In-Reply-To: <1398290092-20034-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] recipes: use proper TI-TSPA license name	instead of TSPA
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
X-List-Received-Date: Thu, 24 Apr 2014 12:44:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Same question about PR bumps for recipes.

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, April 23, 2014 4:55 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 3/3] recipes: use proper TI-TSPA license
>name instead of TSPA
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb    | 4
>++--
> recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb        | 2
>+-
> recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb        | 2
>+-
> recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb        | 4
>++--
> recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb        | 4
>++--
> recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb        | 4
>++--
> recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb        | 4
>++--
> recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb | 4
>++--
> recipes-ti/c6accel/ti-c6accel.inc                           | 2
>+-
> 9 files changed, 15 insertions(+), 15 deletions(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb
>index f7b9d66..15aa8a6 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>@@ -1,8 +1,8 @@
> require libgles-omap3-x11.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
>-PR =3D "${INC_PR}.2"
>+PR =3D "${INC_PR}.3"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
>index 990b425..e466aab 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
>@@ -1,6 +1,6 @@
> require libgles-omap3.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
> BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>index 59ef358..f4cd9ae 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>@@ -1,6 +1,6 @@
> require libgles-omap3.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
> BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>index fec84fd..373dd9d 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>@@ -1,8 +1,8 @@
> require libgles-omap3-no-x.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
>-PR =3D "${INC_PR}.2"
>+PR =3D "${INC_PR}.3"
>
> BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>index e48ec63..22e510b 100644
>--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>@@ -1,8 +1,8 @@
> require libgles-omap3-no-x.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
>-PR =3D "${INC_PR}.1"
>+PR =3D "${INC_PR}.2"
>
> BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
>index a3b34fe..607b44a 100644
>--- a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
>@@ -1,8 +1,8 @@
> require libgles-omap3-no-x.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
>-PR =3D "${INC_PR}.1"
>+PR =3D "${INC_PR}.2"
>
> BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
>b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
>index 2d11317..0b1b8ca 100644
>--- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
>@@ -1,8 +1,8 @@
> require libgles-omap3-no-x.inc
>
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
>
>-PR =3D "${INC_PR}.0"
>+PR =3D "${INC_PR}.1"
>
> BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>index 8a03cd2..37ca7d8 100644
>--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
>+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Userspace libraries for omap5 sgx"
> HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
>-LICENSE =3D "TSPA"
>+LICENSE =3D "TI-TSPA"
> LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
>Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8"
>
> COMPATIBLE_MACHINE =3D "omap-a15"
>@@ -9,7 +9,7 @@ INHIBIT_PACKAGE_STRIP =3D "1"
>
> SRC_URI =3D
>"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
>gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=3Dhttp"
>
>-PR =3D "r0"
>+PR =3D "r1"
>
> SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
> SRC_URI[sha256sum] =3D
>"20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
>diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-
>ti/c6accel/ti-c6accel.inc
>index 638c9be..65990a8 100644
>--- a/recipes-ti/c6accel/ti-c6accel.inc
>+++ b/recipes-ti/c6accel/ti-c6accel.inc
>@@ -2,7 +2,7 @@ DESCRIPTION =3D "TI C6Accel - DSP Software Libraries
>on ARM"
> HOMEPAGE =3D
>"https://gforge01.dal.design.ti.com/gf/project/dsplib4arm/"
>
> SECTION =3D "devel"
>-LICENSE =3D "TI TSPA"
>+LICENSE =3D "TI-TSPA"
>
> require recipes-ti/includes/ti-paths.inc
> require recipes-ti/includes/ti-staging.inc
>--
>1.9.2
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

