Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F47CE013DA
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 08:19:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83FJjOQ032318;
	Tue, 3 Sep 2013 10:19:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83FJjeC027748;
	Tue, 3 Sep 2013 10:19:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 10:19:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/5] libgles-omap3-x11: do not fail if
	pvr-init is not yet installed
Thread-Index: AQHOpsFJrqcZomwtxEOckVQxs+7hdpm0JIDQ
Date: Tue, 3 Sep 2013 15:19:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597012A9@DLEE11.ent.ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-3-git-send-email-denis@denix.org>
In-Reply-To: <1378005180-30928-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] libgles-omap3-x11: do not fail if pvr-init is not yet installed
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
X-List-Received-Date: Tue, 03 Sep 2013 15:19:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Saturday, August 31, 2013 10:13 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 3/5] libgles-omap3-x11: do not fail if
>pvr-init is not yet installed
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-
>x11_4.09.00.01.bb
>index 1c70cae..b7e6ce0 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
>@@ -61,7 +61,7 @@ do_install_append() {
>     cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
>     cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
>
>-    rm ${D}${sysconfdir}/init.d/pvr-init
>+    rm -f ${D}${sysconfdir}/init.d/pvr-init
>
>     if [ "$SUPPORT_XORG" =3D "1" ]; then
>         cp -pP ${WORKDIR}/rc_dri.pvr
>${D}${sysconfdir}/init.d/pvr-init
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

