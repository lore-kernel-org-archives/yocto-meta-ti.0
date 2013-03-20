Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B23DE01410
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 19:18:42 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K2IfZ7011430
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 21:18:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K2IfZZ002844
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 21:18:41 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 19 Mar 2013 21:18:41 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] libgles-omap3.inc: Add tweaks needed for newer version
	of the Graphics SDK
Thread-Index: AQHOJREhS8ubhNnUfkmWjRXMU7ShIpit2DIw
Date: Wed, 20 Mar 2013 02:18:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3EB27B@DFLE09.ent.ti.com>
References: <1363745867-10571-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745867-10571-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] libgles-omap3.inc: Add tweaks needed for newer version of the Graphics SDK
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
X-List-Received-Date: Wed, 20 Mar 2013 02:18:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry this patch is required before the two other Graphics SDK patches I ju=
st sent in.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:18 PM
> To: meta-ti@yoctoproject.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] libgles-omap3.inc: Add tweaks needed for newer version o=
f
> the Graphics SDK
>=20
> ---
>=20
>=20
>  recipes-graphics/libgles/libgles-omap3.inc |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-
> graphics/libgles/libgles-omap3.inc
> index 66ebcd5..9a90c56 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -181,10 +181,10 @@ do_install () {
>=20
>  	cp -pPR
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/*
> ${D}${includedir}/
>  	cp -pPR
> ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/*
> ${D}${includedir}/
> -	cp -pPR
> ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Inclu
> de/GLES/* ${D}${includedir}/GLES/ || true
> -	cp -pPr
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Inc
> lude/GLES/* ${D}${includedir}/GLES2/ || true
> -	cp -pPr
> ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v*
> ${D}${includedir}/ || true
> -	cp -pPr
> ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V*
> ${D}${includedir}/ || true
> +	cp -pPR
> ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Inclu
> de/GLES/* ${D}${includedir}/GLES/ 2>/dev/null || true
> +	cp -pPr
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Inc
> lude/GLES/* ${D}${includedir}/GLES2/ 2>/dev/null || true
> +	cp -pPr
> ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v*
> ${D}${includedir}/ 2>/dev/null || true
> +	cp -pPr
> ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V*
> ${D}${includedir}/ 2>/dev/null || true
>  	cp -pPr ${S}/include/*.h ${D}${includedir} || true
>  	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
>=20
> @@ -218,7 +218,7 @@ do_install () {
>  		if [ -e ${ESLOCATION} ] ; then
>  			cp -pPR ${ESLOCATION}/lib*${IMGPV}
> ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
>  			for esprog in $shared_prog $raw_prog
> ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ; do
> -				install -m 0755 ${ESLOCATION}/$esprog
> ${D}${bindir}/ES${esrev}.0/ || true
> +				install -m 0755 ${ESLOCATION}/$esprog
> ${D}${bindir}/ES${esrev}.0/ 2>/dev/null || true
>  			done
>  		fi
>  	done
> @@ -232,14 +232,14 @@ do_install () {
>  	if [ ${SUPPORT_XORG} -eq 1 ] ; then
>  		install -d ${D}${bindir}/SGX/demos/X11/
>  		install -m 0755 ${S}/demos/x11/*
> ${D}${bindir}/SGX/demos/X11/
> -		install -d ${D}${bindir}/SGX/trainingcourses/X11
> -		install -m 0755 ${S}/trainingcourses/x11/*
> ${D}${bindir}/SGX/trainingcourses/X11/
> +		install -d ${D}${bindir}/SGX/trainingcourses/X11  2>/dev/null
> || true
> +		install -m 0755 ${S}/trainingcourses/x11/*
> ${D}${bindir}/SGX/trainingcourses/X11/ 2>/dev/null || true
>  	fi
>=20
>  	install -d ${D}${bindir}/SGX/demos/Raw/
>  	install -m 0755 ${S}/demos/raw/* ${D}${bindir}/SGX/demos/Raw/
> -	install -d ${D}${bindir}/SGX/trainingcourses/Raw
> -	install -m 0755 ${S}/trainingcourses/raw/*
> ${D}${bindir}/SGX/trainingcourses/Raw/
> +	install -d ${D}${bindir}/SGX/trainingcourses/Raw 2>/dev/null || true
> +	install -m 0755 ${S}/trainingcourses/raw/*
> ${D}${bindir}/SGX/trainingcourses/Raw/ 2>/dev/null || true
>=20
>=20
>  	# Delete objects and linker scripts hidden between the headers
> --
> 1.7.0.4


