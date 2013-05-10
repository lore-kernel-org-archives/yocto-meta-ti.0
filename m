Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E830E01466
	for <meta-ti@yoctoproject.org>; Fri, 10 May 2013 02:16:43 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4A9Gf9X021996
	for <meta-ti@yoctoproject.org>; Fri, 10 May 2013 04:16:41 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4A9GckM007248
	for <meta-ti@yoctoproject.org>; Fri, 10 May 2013 04:16:39 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Fri, 10 May 2013 17:16:38 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 01/10] libgles-omap3: Remove X11 related
	build and	packaging
Thread-Index: AQHOS+6EVML6Y4PytEOk+K/uMdSOn5j+G60A
Date: Fri, 10 May 2013 09:16:37 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB10BED@DBDE04.ent.ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<7D46E86EC0A8354091174257B2FED10159546F17@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159546F17@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] libgles-omap3: Remove X11 related build and	packaging
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
X-List-Received-Date: Fri, 10 May 2013 09:16:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Chase, thanks for the review,

1) Ok, I will add it. By "later recipe", you mean the separated x11 recipe,=
 right ?

2) Good point - I am ok to leave the old .inc and create a new one with the=
 changes starting from 4.09 then. Is this ok ?

regards,
Prabu


-----Original Message-----
From: Maupin, Chase=20
Sent: Wednesday, May 08, 2013 6:48 PM
To: Sundareson, Prabindh; meta-ti@yoctoproject.org
Subject: RE: [meta-ti] [PATCH 01/10] libgles-omap3: Remove X11 related buil=
d and packaging

Prabu,

Overall nice job.  A couple of things I noticed.

1. You removed the sample.desktop file but did not put it back in a later r=
ecipe.
2. You modified the common .inc file and then added the X11 pieces back for=
 4.09.00.01.  This would break people using the older recipes though.  So w=
ould it perhaps be a good idea to leave the .inc alone and then create a ne=
w include file for newer recipe that do this split going forward?  Or would=
 it be simpler to provide the X11 package for the older versions as well?  =
This is just a thought and I'm hoping others will chime in here.

Thanks for the patches, it is really good to see this work being done :)

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
> bounces@yoctoproject.org] On Behalf Of Sundareson, Prabindh
> Sent: Thursday, May 02, 2013 8:39 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 01/10] libgles-omap3: Remove X11 related=20
> build and packaging
>=20
> The SGX530 driver for X11 is only buildable and testable standalone=20
> with the pre-built X11 package provided with the Graphics SDK.
> This patch removes X11 build from the default recipe, to enable moving=20
> X11 build to a separate recipe.
>=20
> This is part of a clean up of the Graphics recipe starting from
> 4.09.00.01 version of the Graphics SDK.
>=20
> Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> ---
>  recipes-graphics/libgles/libgles-omap3.inc         |  168 ++++--
> --------------
>  .../libgles/libgles-omap3_4.09.00.01.bb            |   43 +-----
>  2 files changed, 30 insertions(+), 181 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc
> b/recipes-graphics/libgles/libgles-omap3.inc
> index 9a90c56..130dc49 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -7,10 +7,6 @@ PR =3D "r35"
>=20
>  COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
>=20
> -X11DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"
> -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11',=20
> '${X11DEPENDS}', '', d)}"
> -
> -export SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',
> 'x11', '1', '0', d)}"
>  PVR_INIT ?=3D "pvrsrvinit"
>=20
>  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
> @@ -22,7 +18,6 @@ RREPLACES_${PN}-dbg =3D "libegl-dbg"
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV
> }/exports/${BINFILE} \
>  		   file://cputype \
>  		   file://rc.pvr \
> -		   file://sample.desktop \
>  		   file://99-bufferclass.rules  \
>  "
>=20
> @@ -79,87 +74,53 @@ do_compile() {
>  	export PLAT_CPP=3D"${CXX}"
>  	export PLAR_AR=3D"${AR}"
>=20
> -	if [ ${SUPPORT_XORG} -eq 1 ] ; then
> -		export X11ROOT=3D"${STAGING_DIR_HOST}/usr"
> -		mkdir -p ${S}/demos/x11
> -		mkdir -p ${S}/trainingcourses/x11
> -	fi
> -
>  	mkdir -p ${S}/demos/raw
>  	mkdir -p ${S}/trainingcourses/raw
>=20
>  	# Rebuild demos
> -	for X11BUILD in 0 1 ; do
> -		# Don't rebuild demos with X11 support for a non X11
> distro
> -		if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ] ;
> then
> -			continue
> -		fi
> +	for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ;
> do
> +		cd $demo/OGLES/Build/LinuxGeneric
> +		oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0
> +		rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> +
> +		install -m 0755
> $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
> +	done
> +
> +	for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ;
> do
> +		cd $demo/OGLES2/Build/LinuxGeneric
> +		oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0
> +		rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
>=20
> -		for demo in
> ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
> -			cd $demo/OGLES/Build/LinuxGeneric
> -			oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> X11BUILD=3D$X11BUILD
> -			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> -
> -			if [ $X11BUILD -eq 1 ] ; then
> -				install -m 0755
> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
> -				sed -e s:NAME:$(basename $demo): \
> -				    -e
> s:EXEC:${bindir}/SGX/demos/X11/$(basename
> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
> -				    ${WORKDIR}/sample.desktop >
> ${WORKDIR}/$(basename $demo).desktop
> -			else
> -				install -m 0755
> $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
> -			fi
> -		done
> -
> -		for demo in
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
> -			cd $demo/OGLES2/Build/LinuxGeneric
> -			oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> X11BUILD=3D$X11BUILD
> -			rm -f
> $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
> -
> -			if [ $X11BUILD -eq 1 ] ; then
> -				install -m 0755
> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
> -				sed -e s:NAME:$(basename $demo): \
> -				    -e
> s:EXEC:${bindir}/SGX/demos/X11/$(basename
> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
> -				    ${WORKDIR}/sample.desktop >
> ${WORKDIR}/$(basename $demo).desktop
> -			else
> -				install -m 0755
> $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
> -			fi
> -		done
> +		install -m 0755
> $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
>  	done
>=20
>  	find ${S} -name "*_org" -delete
>=20
>  	# Build OGLES2 Trainingcourses
> -	for X11BUILD in 0 1 ; do
> -		# Don't rebuild training courses with X11 support for
> a non X11 distro
> -		if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ] ;
> then
> -			continue
> +	for training in
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
> +		if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile
> ] ; then
> +			cd $training/OGLES2/Build/LinuxGeneric
>  		fi
>=20
> -		for training in
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
> -			if [ -e
> $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
> -				cd $training/OGLES2/Build/LinuxGeneric
> -			fi
> -
> -			if [ -e
> $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
> -				cd $training/OGLES2/Build/${PLATFORM}
> -			fi
> +		if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ]
> ; then
> +			cd $training/OGLES2/Build/${PLATFORM}
> +		fi
>=20
> -			oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> X11BUILD=3D$X11BUILD
> -			rm -f
> $training/OGLES2/Build/${PLATFORM}/Release*/*.o
> +		oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D0
> +		rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
>=20
> -			if [ $X11BUILD -eq 1 ] ; then
> -				install -m 0755
> $training/OGLES2/Build/${PLATFORM}/ReleaseX11/*
> ${S}/trainingcourses/x11 || true
> -			else
> -				install -m 0755
> $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*
> ${S}/trainingcourses/raw || true
> -			fi
> -		done
> +		install -m 0755
> $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*
> ${S}/trainingcourses/raw || true
>  	done
>=20
> +
>  }
>=20
>  do_install () {
>  	install -d ${D}${libdir}
>  	cp -pPR ${BINLOCATION}/*.so* ${D}${libdir}
> + 	rm ${D}${libdir}/libpvrPVR2D_DRIWSEGL.so*
> + 	rm ${D}${libdir}/libsrv_um_dri.so*
> + 	rm ${D}${libdir}/pvr_drv.so*
>  	install -m 0644 ${BINLOCATION}/*.a ${D}${libdir}
>=20
>  	install -d ${D}${bindir}/
> @@ -169,12 +130,6 @@ do_install () {
>  	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
>  	install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir}/
>=20
> -	if [ ${SUPPORT_XORG} -eq 1 ] ; then
> -		install -m 0755 ${BINLOCATION}/xgles1test1
> ${D}${bindir}/
> -		install -m 0755
> ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx
> ${D}${bindir}/|| true
> -		cp -pPR
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/li
> b/*X11WS* ${D}${libdir} || true
> -	fi
> -
>  	install -d ${D}${includedir}
>  	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
>  	cp -pPR ${S}/GFX_Linux_KM/services4 ${D}${includedir}/ @@ -211,13=20
> +166,12 @@ do_install () {
>=20
>  	shared_prog=3D"eglinfo pvr2d_test ${PVR_INIT} services_test=20
> sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test=20
> sgx_render_flip_test"
>  	raw_prog=3D"gles1test1 gles2test1 ovg_unit_test"
> -	x11_prog=3D"eglinfo_x xgles1test1 xgles2test1 xmultiegltest
> xovg_unit_test"
>=20
>  	for esrev in 2 3 5 6 8 ; do
>  		ESLOCATION=3D$(eval echo $(echo
> \$\{ES${esrev}LOCATION\}))
>  		if [ -e ${ESLOCATION} ] ; then
>  			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so=20
> ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
> -			for esprog in $shared_prog $raw_prog
> ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ; do
> +			for esprog in $shared_prog $raw_prog ; do
>  				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/=20
> 2>/dev/null || true
>  			done
>  		fi
> @@ -225,17 +179,6 @@ do_install () {
>=20
>  	rm ${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm=20
> ${D}${bindir}/pdsasm -f || true
>=20
> -	install -d ${D}${prefix}/share/applications
> -	cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications
> -	rm ${D}${prefix}/share/applications/sample.desktop
> -
> -	if [ ${SUPPORT_XORG} -eq 1 ] ; then
> -		install -d ${D}${bindir}/SGX/demos/X11/
> -		install -m 0755 ${S}/demos/x11/*
> ${D}${bindir}/SGX/demos/X11/
> -		install -d ${D}${bindir}/SGX/trainingcourses/X11
> 2>/dev/null || true
> -		install -m 0755 ${S}/trainingcourses/x11/*
> ${D}${bindir}/SGX/trainingcourses/X11/ 2>/dev/null || true
> -	fi
> -
>  	install -d ${D}${bindir}/SGX/demos/Raw/
>  	install -m 0755 ${S}/demos/raw/*
> ${D}${bindir}/SGX/demos/Raw/
>  	install -d ${D}${bindir}/SGX/trainingcourses/Raw
> 2>/dev/null || true
> @@ -251,8 +194,7 @@ do_install () {
>=20
>  }
>=20
> -PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-=20
> x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx" ,"", d)} =20
> \
> -             ${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-
> tests"
> +PACKAGES =3D+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-
> tests"
>  # Package the base libraries per silicon revision  PACKAGES =3D+=20
> "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
>  RRECOMMENDS_${PN} +=3D "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6=20
> ${PN}-es8"
> @@ -271,18 +213,14 @@ PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so=20
> libIMGegl.so libsrv_um.so libOpenVG.so li
>=20
>=20
>  PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl=20
> ${PN}-linuxfbwsegl"
> -PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-=20
> x11wsegl ${PN}-driwsegl" ,"", d)}"
> +
>  FILES_${PN}-blitwsegl =3D "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
>  FILES_${PN}-flipwsegl =3D "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
>  FILES_${PN}-frontwsegl =3D "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
>  FILES_${PN}-linuxfbwsegl =3D
> "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
> -FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so*
> ${bindir}/x* ${bindir}/*x"
> -FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL.so*
> ${libdir}/libsrv_um_dri*"
>=20
>  PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-
> blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-
> flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-
> flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-
> frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-
> frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3
> ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl- es8"
>=20
> -X11_SEGL =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-
> x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-
> driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-
> driwsegl-es6 ${PN}-driwsegl-es8 "
> -PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES',
> 'x11',"${X11_SEGL}" ,"", d)}"
>  FILES_${PN}-blitwsegl-es2 =3D
> "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
>  FILES_${PN}-blitwsegl-es3 =3D
> "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
>  FILES_${PN}-blitwsegl-es5 =3D
> "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
> @@ -311,25 +249,10 @@ FILES_${PN}-linuxfbwsegl-es6 =3D=20
> "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>  FILES_${PN}-linuxfbwsegl-es8 =3D
> "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>  RRECOMMENDS_${PN}-linuxfbwsegl =3D " ${PN}-linuxfbwsegl-es2 ${PN}-
> linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6=20
> ${PN}-linuxfbwsegl-es8"
>=20
> -FILES_${PN}-x11wsegl-es2 =3D
> "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x*=20
> ${bindir}/ES2*/*x"
> -FILES_${PN}-x11wsegl-es3 =3D
> "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x*=20
> ${bindir}/ES3*/*x"
> -FILES_${PN}-x11wsegl-es5 =3D
> "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x*=20
> ${bindir}/ES5*/*x"
> -FILES_${PN}-x11wsegl-es6 =3D
> "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x*=20
> ${bindir}/ES6*/*x"
> -FILES_${PN}-x11wsegl-es8 =3D
> "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x*=20
> ${bindir}/ES8*/*x"
> -RRECOMMENDS_${PN}-x11wsegl =3D " ${PN}-x11wsegl-es2 ${PN}-
> x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-=20
> x11wsegl-es8"
> -
> -FILES_${PN}-driwsegl-es2 =3D
> "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*
> ${libdir}/ES2*/libsrv_um_dri*"
> -FILES_${PN}-driwsegl-es3 =3D
> "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.*
> ${libdir}/ES3*/libsrv_um_dri*"
> -FILES_${PN}-driwsegl-es5 =3D
> "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.*
> ${libdir}/ES5*/libsrv_um_dri*"
> -FILES_${PN}-driwsegl-es6 =3D
> "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*
> ${libdir}/ES6*/libsrv_um_dri*"
> -FILES_${PN}-driwsegl-es8 =3D
> "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.*
> ${libdir}/ES8*/libsrv_um_dri*"
> -RRECOMMENDS_${PN}-driwsegl =3D " ${PN}-driwsegl-es2 ${PN}-
> driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-=20
> driwsegl-es8"
> -
>  CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"
>=20
>  FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so* ${bindir}/${PVR_INIT}=20
> ${bindir}/cputype ${bindir}/*"
>=20
> -FILES_xserver-kdrive-powervrsgx =3D "${bindir}/Xsgx"
>  FILES_${PN}-tests =3D "${bindir}/*test*"
>  FILES_${PN}-dbg =3D "${libdir}/.debug/* ${bindir}/.debug/* \
>                     ${libdir}/ES*/.debug ${bindir}/*/.debug\ @@=20
> -338,12 +261,8 @@ FILES_${PN}-dbg =3D "${libdir}/.debug/*
> ${bindir}/.debug/* \
>  	"
>=20
>  FILES_${PN}-rawdemos =3D "${bindir}/SGX/demos/Raw/*"
> -FILES_${PN}-x11demos =3D "${bindir}/SGX/demos/X11/*=20
> ${prefix}/share/applications "
> -RRECOMMENDS_${PN}-x11demos =3D "${PN}-x11wsegl"
>=20
>  FILES_${PN}-rawtrainingcourses =3D
> "${bindir}/SGX/trainingcourses/Raw/*"
> -FILES_${PN}-x11trainingcourses =3D
> "${bindir}/SGX/trainingcourses/X11/*"
> -RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-x11wsegl"
>=20
>  # The libs need the kernel-modules
>  RRECOMMENDS_${PN} +=3D "omap3-sgx-modules"
> @@ -358,7 +277,6 @@ INSANE_SKIP_${PN}-es5 =3D "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-es6 =3D "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-es8 =3D "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-rawdemos =3D "ldflags dev-so useless-rpaths"
> -INSANE_SKIP_${PN}-x11demos =3D "ldflags dev-so useless-rpaths"
>  INSANE_SKIP_${PN}-blitwsegl =3D "ldflags"
>  INSANE_SKIP_${PN}-blitwsegl-es3 =3D "ldflags"
>  INSANE_SKIP_${PN}-blitwsegl-es5 =3D "ldflags"
> @@ -379,18 +297,7 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es3 =3D "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es5 =3D "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es6 =3D "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es8 =3D "ldflags"
> -INSANE_SKIP_${PN}-x11wsegl =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es3 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es5 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es6 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es8 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es3 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es5 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es6 =3D "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es8 =3D "ldflags dev-so"
>  INSANE_SKIP_${PN}-tests =3D "ldflags"
> -INSANE_SKIP_xserver-kdrive-powervrsgx =3D "ldflags"
>=20
>  # Quality control is really poor on these SDKs, so hack around the=20
> latest madness:
>  FILES_${PN} +=3D "${libdir}/*.so "
> @@ -404,12 +311,6 @@ INITSCRIPT_PARAMS =3D "start 30 5 2 . stop 40
> 0 1 6 ."
>  # Append to update-rc.d postinst
>  pkg_postinst_${PN}_append() {
>  rm -f $D${sysconfdir}/powervr-esrev
> -
> -if [ ${SUPPORT_XORG} -eq 1 ] ; then
> -	ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
> -	ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
> -fi
> -
>  }
>=20
>  pkg_postinst_${PN}-blitwsegl() {
> @@ -427,14 +328,3 @@ pkg_postinst_${PN}-linuxfbwsegl() {  rm -f=20
> $D${sysconfdir}/powervr-esrev  }
>=20
> -pkg_postinst_${PN}-x11wsegl() {
> -rm -f $D${sysconfdir}/powervr-esrev
> -
> -echo "[default]" > $D${sysconfdir}/powervr.ini -echo=20
> "WindowSystem=3DlibpvrPVR2D_X11WSEGL.so.1" >>=20
> $D${sysconfdir}/powervr.ini -}
> -
> -pkg_postinst_${PN}-driwsegl() {
> -rm -f $D${sysconfdir}/powervr-esrev
> -}
> -
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> index 7c6f231..165a406 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> @@ -23,8 +23,6 @@ TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV
> }/exports/${BINFILE} \
>             file://cputype \
>             file://rc.pvr \
> -           file://rc_dri.pvr \
> -           file://sample.desktop \
>             file://99-bufferclass.rules  \  "
>  SRC_URI[md5sum] =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
> @@ -32,44 +30,5 @@ SRC_URI[sha256sum] =3D
> "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249
>=20
>  S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
>=20
> -LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES',
> 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
> +LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_FRONTWSEGL.so.1"
>=20
> -do_configure_append() {
> -
> -    # Change PVR server's user mode library to point to DRI
> -    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
> -    if [ "$drifile" !=3D "" ]
> -    then
> -        dir=3D$(dirname ${drifile})
> -        if [ "$SUPPORT_XORG" =3D "1" ]
> -        then
> -            mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
> -        else
> -            rm -rf ${dir}/libsrv_um_dri.so
> -        fi
> -    fi
> -
> -    done
> -}
> -
> -do_install_append() {
> -
> -    # In this version of the graphics SDK the following
> directories do not exist:
> -    #
> /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h
> (doesn't exist)
> -    #
> /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltype
> s.h (doesn't exist)
> -    # Therefore, need to copy these files manually at the only
> location that they do exist
> -    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
> -    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
> -
> -    rm ${D}${sysconfdir}/init.d/pvr-init
> -
> -    if [ "$SUPPORT_XORG" =3D "1" ]; then
> -        cp -pP ${WORKDIR}/rc_dri.pvr
> ${D}${sysconfdir}/init.d/pvr-init
> -    else
> -        cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-
> init
> -    fi
> -
> -}
> -
> -RRECOMMENDS_${PN}-x11demos =3D "${PN}-driwsegl"
> -RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-driwsegl"
> --
> 1.7.1
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

