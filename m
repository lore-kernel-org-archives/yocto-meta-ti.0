Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE95CE0027E
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 09:18:44 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AGIh5W016209;
	Wed, 10 Oct 2012 11:18:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AGIhva022160;
	Wed, 10 Oct 2012 11:18:43 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 11:18:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11 distros
Thread-Index: AQHNpprBMnAcRuk7rEy1Dj6KIfbZz5ezA36A//+xc38=
Date: Wed, 10 Oct 2012 16:18:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C300D04@DFLE09.ent.ti.com>
References: <1349842994-17942-1-git-send-email-fcooper@ti.com>,
	<7D46E86EC0A8354091174257B2FED101592554B2@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101592554B2@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libgles-omap3: Adjust for non X11 distros
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
X-List-Received-Date: Wed, 10 Oct 2012 16:18:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

See inline.=0A=
=0A=
Chase,=0A=
=0A=
Several of your comments aren't related to my actually changes. I would say=
 almost all of my tweaks is simply moving things around and placing X11 sta=
tements within if statements. Everything else is replacing hard coded value=
s with variables. Your points are still valid but this patch isn't the plac=
e to address it.=0A=
________________________________________=0A=
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Maupin, Chase=0A=
Sent: Wednesday, October 10, 2012 10:46 AM=0A=
To: Franklin S. Cooper Jr; meta-ti@yoctoproject.org=0A=
Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11 distros=
=0A=
=0A=
> -----Original Message-----=0A=
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=0A=
> bounces@yoctoproject.org] On Behalf Of Franklin S. Cooper Jr=0A=
> Sent: Tuesday, October 09, 2012 11:23 PM=0A=
> To: meta-ti@yoctoproject.org=0A=
> Subject: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11=0A=
> distros=0A=
>=0A=
> * Non X11 base distros are unable to build this Graphics SDK.=0A=
> * This patch tweaks the libgles-omap3 include file to always=0A=
> build the=0A=
>   Graphics SDK in Raw mode and also build in X11 mode only if X11=0A=
> is=0A=
>   apart of the DISTRO_FEATURE.=0A=
=0A=
Apart =3D> a part=0A=
=0A=
> * Create a new variable PVR_INIT that is by default set to=0A=
> pvrsrvinit. This is=0A=
>   needed for newer version of the Graphics SDK that replaced this=0A=
> file.=0A=
>=0A=
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>=0A=
> ---=0A=
> Version 2 changes:=0A=
> Added PVR_INIT variable.=0A=
> Made changes to only build and package X11 components if a X11=0A=
> based distro is=0A=
> used. Raw mode components are always built and packaged even for=0A=
> X11 based=0A=
> distros.=0A=
>=0A=
>  recipes-graphics/libgles/libgles-omap3.inc    |  208=0A=
> +++++++++++++++----------=0A=
>  recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +=0A=
>  2 files changed, 135 insertions(+), 80 deletions(-)=0A=
>=0A=
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc=0A=
> b/recipes-graphics/libgles/libgles-omap3.inc=0A=
> index 4525285..523aa52 100644=0A=
> --- a/recipes-graphics/libgles/libgles-omap3.inc=0A=
> +++ b/recipes-graphics/libgles/libgles-omap3.inc=0A=
> @@ -3,11 +3,15 @@ LICENSE =3D "proprietary-binary"=0A=
>  # 'TSPA.txt' might not be the best file to md5sum=0A=
>  LIC_FILES_CHKSUM =3D=0A=
> "file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"=0A=
>=0A=
> -PR =3D "r32"=0A=
> +PR =3D "r33"=0A=
>=0A=
>  COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"=0A=
>=0A=
> -DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"=0A=
> +X11DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"=0A=
> +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11',=0A=
> '${X11DEPENDS}', '', d)}"=0A=
> +=0A=
> +export SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',=0A=
> 'x11', '1', '0', d)}"=0A=
> +PVR_INIT ?=3D "pvrsrvinit"=0A=
>=0A=
>  PROVIDES +=3D "virtual/egl"=0A=
>=0A=
> @@ -31,11 +35,13 @@ export ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"=0A=
>  export ES6LOCATION ?=3D "${S}/gfx_rel_es6.x"=0A=
>  export ES8LOCATION ?=3D "${S}/gfx_rel_es8.x"=0A=
>=0A=
> +LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_FRONTWSEGL.so.1"=0A=
> +=0A=
=0A=
Why not set this like your line from your other patches=0A=
=0A=
LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES', 'x11',"libpvr=
PVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"=0A=
=0A=
Franklin: Because this will change the default behavior for the current lib=
gles-omap3 recipes which might break things for X11 users. This recipe was =
simple meant to tweak the settings of this inc to prepare for my newer Grap=
hics SDK patches but it shouldn't modify anything for users using the older=
 Graphics SDK.=0A=
=0A=
>  do_configure() {=0A=
>       # Attempt to fix up the worst offenders for file=0A=
> permissions=0A=
>       for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c")=0A=
> $(find ${S} -name "Make*") ; do=0A=
>               chmod 0644 $i=0A=
> -     done=0A=
> +     done=0A=
=0A=
What is the diff here?  Whitespace?=0A=
=0A=
Franklin: Most likely.=0A=
=0A=
>=0A=
>       # Attempt to create proper library softlinks=0A=
>       for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S}=0A=
> -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S}=0A=
> -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do=0A=
> @@ -64,62 +70,92 @@ PARALLEL_MAKE =3D ""=0A=
>  PLATFORM ?=3D "LinuxOMAP3"=0A=
>=0A=
>  do_compile() {=0A=
> -     export X11ROOT=3D"${STAGING_DIR_HOST}/usr"=0A=
>       export TOOLCHAIN=3D"${TOOLCHAIN_PATH}"=0A=
> -=0A=
>       export PLAT_CC=3D"${CC}"=0A=
>       export PLAT_CPP=3D"${CXX}"=0A=
>       export PLAR_AR=3D"${AR}"=0A=
>=0A=
> -     mkdir -p ${S}/demos/raw=0A=
> -     mkdir -p ${S}/demos/x11=0A=
> -=0A=
> -     # Rebuild demos for both Raw and X11=0A=
> -     for X11BUILD in 0 1 ; do=0A=
> -             for demo in=0A=
> ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do=0A=
> -                     cd $demo/OGLES/Build/LinuxGeneric=0A=
> -                     oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}=0A=
> X11BUILD=3D$X11BUILD=0A=
> -                     rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o=0A=
> -                     install -m 0755=0A=
> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true=0A=
> -                     sed -e s:NAME:$(basename $demo): \=0A=
> -                         -e=0A=
> s:EXEC:${bindir}/SGX/demos/X11/$(basename=0A=
> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \=0A=
> -                          ${WORKDIR}/sample.desktop >=0A=
> ${WORKDIR}/$(basename $demo).desktop=0A=
> -                     install -m 0755=0A=
> $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true=0A=
> -             done=0A=
> -             for demo in=0A=
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do=0A=
> -                     cd $demo/OGLES2/Build/LinuxGeneric=0A=
> -                     oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}=0A=
> X11BUILD=3D$X11BUILD=0A=
> -                     rm -f=0A=
> $demo/OGLES2/Build/${PLATFORM}/Release*/*.o=0A=
> -                     install -m 0755=0A=
> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 ||=0A=
> true=0A=
> -                     sed -e s:NAME:$(basename $demo): \=0A=
> -                         -e=0A=
> s:EXEC:${bindir}/SGX/demos/X11/$(basename=0A=
> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \=0A=
> -                          ${WORKDIR}/sample.desktop >=0A=
> ${WORKDIR}/$(basename $demo).desktop=0A=
> -                     install -m 0755=0A=
> $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||=0A=
> true=0A=
> -             done=0A=
> -     done=0A=
> -=0A=
> -     mkdir -p ${S}/trainingcourses/raw=0A=
> -     mkdir -p ${S}/trainingcourses/x11=0A=
> +    if [ ${SUPPORT_XORG} -eq 1 ]=0A=
> +    then=0A=
> +        export X11ROOT=3D"${STAGING_DIR_HOST}/usr"=0A=
> +        mkdir -p ${S}/demos/x11=0A=
> +        mkdir -p ${S}/trainingcourses/x11=0A=
> +    fi=0A=
> +=0A=
> +    mkdir -p ${S}/demos/raw=0A=
> +    mkdir -p ${S}/trainingcourses/raw=0A=
> +=0A=
> +     # Rebuild demos=0A=
> +    for X11BUILD in 0 1 ; do=0A=
> +        # Don't rebuild demos with X11 support for a non X11=0A=
> distro=0A=
> +        if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ]=0A=
> +        then=0A=
> +            continue=0A=
> +        fi=0A=
> +=0A=
> +         for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/*=0A=
> ; do=0A=
> +                 cd $demo/OGLES/Build/LinuxGeneric=0A=
> +                 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}=0A=
> X11BUILD=3D$X11BUILD=0A=
> +                 rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o=0A=
> +=0A=
> +            if [ $X11BUILD -eq 1 ]=0A=
> +            then=0A=
> +                install -m 0755=0A=
> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true=0A=
=0A=
In the case that you are now only building X11 if it is a supported feature=
 then shouldn't you care about the return value of this copy?  Should we ex=
pect the build to fail if the demos are not built?=0A=
=0A=
Franklin: I think some of this "|| true" lines are due to differences betwe=
en 4.03.00.02.bb vs 4.05.00.03.bb. Files typically get moved between Graphi=
cs SDK releases so lines like that are needed since this inc supports multi=
ple Graphics SDK versions.=0A=
=0A=
> +                sed -e s:NAME:$(basename $demo): \=0A=
> +                    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename=0A=
> $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \=0A=
> +                    ${WORKDIR}/sample.desktop >=0A=
> ${WORKDIR}/$(basename $demo).desktop=0A=
> +            else=0A=
> +                install -m 0755=0A=
> $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true=0A=
=0A=
Same comment as above=0A=
=0A=
> +            fi=0A=
> +         done=0A=
> +=0A=
> +         for demo in=0A=
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do=0A=
> +                 cd $demo/OGLES2/Build/LinuxGeneric=0A=
> +                 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}=0A=
> X11BUILD=3D$X11BUILD=0A=
> +                 rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o=0A=
=0A=
Why rm -f here but not in the similar line in the previous loop?=0A=
=0A=
> +=0A=
> +            if [ $X11BUILD -eq 1 ]=0A=
> +            then=0A=
> +                     install -m 0755=0A=
> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 ||=0A=
> true=0A=
=0A=
Same comment as above=0A=
=0A=
> +                sed -e s:NAME:$(basename $demo): \=0A=
> +                    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename=0A=
> $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \=0A=
> +                    ${WORKDIR}/sample.desktop >=0A=
> ${WORKDIR}/$(basename $demo).desktop=0A=
> +            else=0A=
> +                install -m 0755=0A=
> $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||=0A=
> true=0A=
=0A=
Same comment as above=0A=
=0A=
Also, just a thought and this could likely be put into a future enhancement=
 but these loops are similar enough that you should be able to abstract thi=
s to a function that can take the OGLES version (OGLES or OGLES2) and set t=
he directories based on X11BUILD to remove duplicate code.=0A=
=0A=
> +            fi=0A=
> +         done=0A=
> +    done=0A=
>=0A=
>       find ${S} -name "*_org" -delete=0A=
>=0A=
> -     # Build OGLES2 Trainingcourses for both Raw and X11=0A=
> -     for X11BUILD in 0 1 ; do=0A=
> -             for training in=0A=
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do=0A=
> -                     if [ -e=0A=
> $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then=0A=
> -                             cd $training/OGLES2/Build/LinuxGeneric=0A=
> -                     fi=0A=
> -=0A=
> -                     if [ -e=0A=
> $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then=0A=
> -                             cd $training/OGLES2/Build/${PLATFORM}=0A=
> -                     fi=0A=
> -=0A=
> -                     oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}=0A=
> X11BUILD=3D$X11BUILD=0A=
> -                     rm -f=0A=
> $training/OGLES2/Build/${PLATFORM}/Release*/*.o=0A=
> -                     install -m 0755=0A=
> $training/OGLES2/Build/${PLATFORM}/ReleaseX11/*=0A=
> ${S}/trainingcourses/x11 || true=0A=
> -                     install -m 0755=0A=
> $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*=0A=
> ${S}/trainingcourses/raw || true=0A=
> -             done=0A=
> -     done=0A=
> +     # Build OGLES2 Trainingcourses=0A=
> +    for X11BUILD in 0 1 ; do=0A=
> +        # Don't rebuild training courses with X11 support for a=0A=
> non X11 distro=0A=
> +        if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ]=0A=
> +        then=0A=
> +            continue=0A=
> +        fi=0A=
> +=0A=
> +         for training in=0A=
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do=0A=
> +                 if [ -e=0A=
> $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then=0A=
> +                         cd $training/OGLES2/Build/LinuxGeneric=0A=
> +                 fi=0A=
> +=0A=
> +                 if [ -e=0A=
> $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then=0A=
> +                         cd $training/OGLES2/Build/${PLATFORM}=0A=
> +                 fi=0A=
> +=0A=
> +                 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}=0A=
> X11BUILD=3D$X11BUILD=0A=
> +                 rm -f=0A=
> $training/OGLES2/Build/${PLATFORM}/Release*/*.o=0A=
> +=0A=
> +            if [ $X11BUILD -eq 1 ]=0A=
> +            then=0A=
> +                     install -m 0755=0A=
> $training/OGLES2/Build/${PLATFORM}/ReleaseX11/*=0A=
> ${S}/trainingcourses/x11 || true=0A=
> +            else=0A=
> +                     install -m 0755=0A=
> $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*=0A=
> ${S}/trainingcourses/raw || true=0A=
> +            fi=0A=
=0A=
Same comments about the || true statements as above.=0A=
=0A=
> +         done=0A=
> +    done=0A=
>=0A=
>  }=0A=
>=0A=
> @@ -133,12 +169,14 @@ do_install () {=0A=
>=0A=
>       install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/=0A=
>       install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/=0A=
> -     install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/=0A=
> -=0A=
> -     install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/=0A=
> +     install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir}/=0A=
>=0A=
> -     install -m 0755=0A=
> ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx=0A=
> ${D}${bindir}/|| true=0A=
> -     cp -pPR=0A=
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/li=0A=
> b/*X11WS* ${D}${libdir} || true=0A=
> +    if [ ${SUPPORT_XORG} -eq 1 ]=0A=
> +    then=0A=
> +         install -m 0755 ${BINLOCATION}/xgles1test1=0A=
> ${D}${bindir}/=0A=
> +         install -m 0755=0A=
> ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx=0A=
> ${D}${bindir}/|| true=0A=
> +         cp -pPR=0A=
> ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/li=0A=
> b/*X11WS* ${D}${libdir} || true=0A=
> +    fi=0A=
>=0A=
>       install -d ${D}${includedir}=0A=
>       cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/=0A=
> @@ -158,7 +196,7 @@ do_install () {=0A=
>=0A=
>       install -d ${D}${sysconfdir}=0A=
>       echo "[default]" > ${D}${sysconfdir}/powervr.ini=0A=
> -     echo "WindowSystem=3DlibpvrPVR2D_FRONTWSEGL.so.1" >>=0A=
> ${D}${sysconfdir}/powervr.ini=0A=
> +     echo "WindowSystem=3D${LIBGLESWINDOWSYSTEM}" >>=0A=
> ${D}${sysconfdir}/powervr.ini=0A=
>=0A=
>       # The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SGX=0A=
> hardware, so we need to install multiple sets of userspace=0A=
>=0A=
> @@ -174,11 +212,15 @@ do_install () {=0A=
>       install -d ${D}${bindir}/ES3.0=0A=
>       install -d ${D}${bindir}/ES2.0=0A=
>=0A=
> +    shared_prog=3D"eglinfo pvr2d_test ${PVR_INIT} services_test=0A=
> sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test=0A=
> sgx_render_flip_test"=0A=
> +    raw_prog=3D"gles1test1 gles2test1 ovg_unit_test"=0A=
> +    x11_prog=3D"eglinfo_x xgles1test1 xgles2test1 xmultiegltest=0A=
> xovg_unit_test"=0A=
> +=0A=
>       for esrev in 2 3 5 6 8 ; do=0A=
>               ESLOCATION=3D$(eval echo $(echo=0A=
> \$\{ES${esrev}LOCATION\}))=0A=
>               if [ -e ${ESLOCATION} ] ; then=0A=
>                       cp -pPR ${ESLOCATION}/lib*${IMGPV}=0A=
> ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a=0A=
> ${D}${libdir}/ES${esrev}.0/=0A=
> -                     for esprog in eglinfo eglinfo_x gles1test1=0A=
> gles2test1 ovg_unit_test pvr2d_test pvrsrvinit services_test=0A=
> sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test=0A=
> sgx_render_flip_test xgles1test1 xgles2test1 xmultiegltest=0A=
> xovg_unit_test ; do=0A=
> +                     for esprog in $shared_prog $raw_prog=0A=
> ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ; do=0A=
>                               install -m 0755 ${ESLOCATION}/$esprog=0A=
> ${D}${bindir}/ES${esrev}.0/ || true=0A=
>                       done=0A=
>               fi=0A=
> @@ -190,15 +232,19 @@ do_install () {=0A=
>       cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications=0A=
>       rm ${D}${prefix}/share/applications/sample.desktop=0A=
>=0A=
> -     install -d ${D}${bindir}/SGX/demos/X11/=0A=
> -     install -d ${D}${bindir}/SGX/demos/Raw/=0A=
> -     install -m 0755 ${S}/demos/x11/*=0A=
> ${D}${bindir}/SGX/demos/X11/=0A=
> -     install -m 0755 ${S}/demos/raw/*=0A=
> ${D}${bindir}/SGX/demos/Raw/=0A=
> +    if [ ${SUPPORT_XORG} -eq 1 ]=0A=
> +    then=0A=
> +         install -d ${D}${bindir}/SGX/demos/X11/=0A=
> +         install -m 0755 ${S}/demos/x11/*=0A=
> ${D}${bindir}/SGX/demos/X11/=0A=
> +         install -d ${D}${bindir}/SGX/trainingcourses/X11=0A=
> +        install -m 0755 ${S}/trainingcourses/x11/*=0A=
> ${D}${bindir}/SGX/trainingcourses/X11/=0A=
> +    fi=0A=
> +=0A=
> +    install -d ${D}${bindir}/SGX/demos/Raw/=0A=
> +    install -m 0755 ${S}/demos/raw/*=0A=
> ${D}${bindir}/SGX/demos/Raw/=0A=
> +    install -d ${D}${bindir}/SGX/trainingcourses/Raw=0A=
> +    install -m 0755 ${S}/trainingcourses/raw/*=0A=
> ${D}${bindir}/SGX/trainingcourses/Raw/=0A=
>=0A=
> -     install -d ${D}${bindir}/SGX/trainingcourses/Raw=0A=
> -     install -d ${D}${bindir}/SGX/trainingcourses/X11=0A=
> -     install -m 0755 ${S}/trainingcourses/x11/*=0A=
> ${D}${bindir}/SGX/trainingcourses/X11/=0A=
> -     install -m 0755 ${S}/trainingcourses/raw/*=0A=
> ${D}${bindir}/SGX/trainingcourses/Raw/=0A=
>=0A=
>       # Delete objects and linker scripts hidden between the=0A=
> headers=0A=
>       find ${D} -name "*.o" -delete=0A=
> @@ -209,15 +255,8 @@ do_install () {=0A=
>=0A=
>  }=0A=
>=0A=
> -PACKAGES =3D+ "${PN}-rawdemos \=0A=
> -             ${PN}-x11demos \=0A=
> -             ${PN}-rawtrainingcourses \=0A=
> -             ${PN}-x11trainingcourses \=0A=
> -"=0A=
> -=0A=
> -PACKAGES +=3D "xserver-kdrive-powervrsgx \=0A=
> -             ${PN}-tests "=0A=
> -=0A=
> +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-=0A=
> x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx" ,"",=0A=
> d)}  \=0A=
> +            ${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"=0A=
>  # Package the base libraries per silicon revision=0A=
>  PACKAGES =3D+ "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"=0A=
>  RRECOMMENDS_${PN} +=3D "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6=0A=
> ${PN}-es8"=0A=
> @@ -234,7 +273,9 @@ PRIVATE_LIBS_${PN}-es5 =3D "libGLESv2.so=0A=
> libIMGegl.so libsrv_um.so libOpenVG.so li=0A=
>  PRIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.so libsrv_um.so=0A=
> libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so=0A=
> libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"=0A=
>  PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so libIMGegl.so libsrv_um.so=0A=
> libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so=0A=
> libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"=0A=
>=0A=
> -PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl=0A=
> ${PN}-linuxfbwsegl ${PN}-x11wsegl ${PN}-driwsegl"=0A=
> +=0A=
> +PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl=0A=
> ${PN}-linuxfbwsegl"=0A=
> +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-=0A=
> x11wsegl ${PN}-driwsegl" ,"", d)}"=0A=
>  FILES_${PN}-blitwsegl =3D "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"=0A=
>  FILES_${PN}-flipwsegl =3D "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"=0A=
>  FILES_${PN}-frontwsegl =3D "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"=0A=
> @@ -242,7 +283,10 @@ FILES_${PN}-linuxfbwsegl =3D=0A=
> "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"=0A=
>  FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so*=0A=
> ${bindir}/x* ${bindir}/*x"=0A=
>  FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL.so*=0A=
> ${libdir}/libsrv_um_dri*"=0A=
>=0A=
> -PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-=0A=
> blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-=0A=
> flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-=0A=
> flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-=0A=
> frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-=0A=
> frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3=0A=
> ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-=0A=
> es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5=0A=
> ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-=0A=
> driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-=0A=
> driwsegl-es8"=0A=
> +PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-=0A=
> blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-=0A=
> flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-=0A=
> flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-=0A=
> frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-=0A=
> frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3=0A=
> ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-=0A=
> es8"=0A=
> +=0A=
> +X11_SEGL =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-=0A=
> x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-=0A=
> driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-=0A=
> driwsegl-es6 ${PN}-driwsegl-es8 "=0A=
> +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES',=0A=
> 'x11',"${X11_SEGL}" ,"", d)}"=0A=
>  FILES_${PN}-blitwsegl-es2 =3D=0A=
> "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"=0A=
>  FILES_${PN}-blitwsegl-es3 =3D=0A=
> "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"=0A=
>  FILES_${PN}-blitwsegl-es5 =3D=0A=
> "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"=0A=
> @@ -287,7 +331,7 @@ RRECOMMENDS_${PN}-driwsegl =3D " ${PN}-=0A=
> driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driws=0A=
>=0A=
>  CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"=0A=
>=0A=
> -FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so*=0A=
> ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*"=0A=
> +FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so*=0A=
> ${bindir}/${PVR_INIT} ${bindir}/cputype ${bindir}/*"=0A=
>=0A=
>  FILES_xserver-kdrive-powervrsgx =3D "${bindir}/Xsgx"=0A=
>  FILES_${PN}-tests =3D "${bindir}/*test*"=0A=
> @@ -335,8 +379,12 @@ INITSCRIPT_PARAMS =3D "start 30 5 2 . stop 40=0A=
> 0 1 6 ."=0A=
>  pkg_postinst_${PN}_append() {=0A=
>  rm -f $D${sysconfdir}/powervr-esrev=0A=
>=0A=
> -ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0=0A=
> -ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0=0A=
> +if [ ${SUPPORT_XORG} -eq 1 ]=0A=
> +then=0A=
> +    ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0=0A=
> +    ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0=0A=
> +fi=0A=
> +=0A=
>  }=0A=
>=0A=
>  pkg_postinst_${PN}-blitwsegl() {=0A=
> diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr=0A=
> b/recipes-graphics/libgles/libgles-omap3/rc.pvr=0A=
> index 00cd994..e5a4cd1 100755=0A=
> --- a/recipes-graphics/libgles/libgles-omap3/rc.pvr=0A=
> +++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr=0A=
> @@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)=0A=
>  sgxprepare () {=0A=
>       echo Starting PVR=0A=
>       insmod $(busybox find /lib/modules/$(uname -r) -name=0A=
> "pvrsrvkm.ko")=0A=
> +=0A=
> +    if [ "$?" !=3D "0" ]=0A=
> +    then=0A=
> +        echo "Could not find pvrsrvkm driver"=0A=
> +        exit 1=0A=
> +    fi=0A=
> +=0A=
=0A=
Why is this fix here?  Doesn't seem related and could be it's own patch.=0A=
=0A=
>       modprobe omaplfb=0A=
>       modprobe bufferclass_ti=0A=
>=0A=
> --=0A=
> 1.7.0.4=0A=
>=0A=
> _______________________________________________=0A=
> meta-ti mailing list=0A=
> meta-ti@yoctoproject.org=0A=
> https://lists.yoctoproject.org/listinfo/meta-ti=0A=
_______________________________________________=0A=
meta-ti mailing list=0A=
meta-ti@yoctoproject.org=0A=
https://lists.yoctoproject.org/listinfo/meta-ti=0A=

