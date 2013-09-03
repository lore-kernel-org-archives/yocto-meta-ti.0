Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BC2BE013DA
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 08:20:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83FKogE019943;
	Tue, 3 Sep 2013 10:20:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83FKog2029583;
	Tue, 3 Sep 2013 10:20:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 10:20:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 4/5] libgles-omap3: introduce INC_PR
Thread-Index: AQHOpsFKAgU3qMXoq0KsOqgHyrgzw5m0JK5Q
Date: Tue, 3 Sep 2013 15:20:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597012D4@DLEE11.ent.ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-4-git-send-email-denis@denix.org>
In-Reply-To: <1378005180-30928-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] libgles-omap3: introduce INC_PR
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
X-List-Received-Date: Tue, 03 Sep 2013 15:20:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

General question is that I thought INC_PR was frowned on.

Aside from that=20

Acked-by: Chase Maupin <chase.maupin@ti.com>



>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Saturday, August 31, 2013 10:13 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 4/5] libgles-omap3: introduce INC_PR
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-graphics/libgles/libgles-omap3-no-x.inc          | 2 +-
> recipes-graphics/libgles/libgles-omap3-x11.inc           | 2 +-
> recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb | 2 ++
> recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb     | 2 ++
> 4 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc
>b/recipes-graphics/libgles/libgles-omap3-no-x.inc
>index 727c422..83873d7 100644
>--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
>+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
>@@ -3,7 +3,7 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D
>"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>
>-PR =3D "r36"
>+INC_PR =3D "r37"
>
> EXCLUDE_FROM_WORLD =3D "1"
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc
>b/recipes-graphics/libgles/libgles-omap3-x11.inc
>index abe6e6f..106a9bc 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
>+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
>@@ -3,7 +3,7 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D
>"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>
>-PR =3D "r36"
>+INC_PR =3D "r37"
>
> EXCLUDE_FROM_WORLD =3D "1"
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb
>index b7e6ce0..6b9c561 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>@@ -2,6 +2,8 @@ require libgles-omap3-x11.inc
>
> LICENSE =3D "TSPA"
>
>+PR =3D "${INC_PR}.0"
>+
> DEFAULT_PREFERENCE =3D "-1"
>
> BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>index b68b4c3..a4da2f9 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>@@ -2,6 +2,8 @@ require libgles-omap3-no-x.inc
>
> LICENSE =3D "TSPA"
>
>+PR =3D "${INC_PR}.0"
>+
> DEFAULT_PREFERENCE =3D "-1"
>
> BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

