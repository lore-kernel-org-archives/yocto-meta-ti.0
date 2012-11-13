Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30FB9E01371
	for <meta-ti@yoctoproject.org>; Mon, 12 Nov 2012 17:52:17 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAD1qFns016044;
	Mon, 12 Nov 2012 19:52:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAD1qFct016160;
	Mon, 12 Nov 2012 19:52:15 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 12 Nov 2012 19:52:15 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11 distros
Thread-Index: AQHNpprBMnAcRuk7rEy1Dj6KIfbZz5ezA36A//+xc3+ANOQzAP//nE5Q
Date: Tue, 13 Nov 2012 01:52:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31EBF4@DFLE09.ent.ti.com>
References: <1349842994-17942-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101592554B2@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C300D04@DFLE09.ent.ti.com>
	<20121113014748.GD8900@denix.org>
In-Reply-To: <20121113014748.GD8900@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 13 Nov 2012 01:52:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That is what this version of the patch addressed.

I need to send a v3 that addressed some of the comments from this thread.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, November 12, 2012 7:48 PM
To: Cooper Jr., Franklin
Cc: Maupin, Chase; Franklin S. Cooper Jr; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11 distros

Franklin,

Have you submitted the version that does X11+FB when x11 is enabled and FB =
only when not?

Denys


On Wed, Oct 10, 2012 at 04:18:42PM +0000, Cooper Jr., Franklin wrote:
> See inline.
>=20
> Chase,
>=20
> Several of your comments aren't related to my actually changes. I would s=
ay almost all of my tweaks is simply moving things around and placing X11 s=
tatements within if statements. Everything else is replacing hard coded val=
ues with variables. Your points are still valid but this patch isn't the pl=
ace to address it.
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org=20
> [meta-ti-bounces@yoctoproject.org] on behalf of Maupin, Chase
> Sent: Wednesday, October 10, 2012 10:46 AM
> To: Franklin S. Cooper Jr; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11=20
> distros
>=20
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=20
> > bounces@yoctoproject.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Tuesday, October 09, 2012 11:23 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH v2] libgles-omap3: Adjust for non X11=20
> > distros
> >
> > * Non X11 base distros are unable to build this Graphics SDK.
> > * This patch tweaks the libgles-omap3 include file to always build=20
> > the
> >   Graphics SDK in Raw mode and also build in X11 mode only if X11 is
> >   apart of the DISTRO_FEATURE.
>=20
> Apart =3D> a part
>=20
> > * Create a new variable PVR_INIT that is by default set to=20
> > pvrsrvinit. This is
> >   needed for newer version of the Graphics SDK that replaced this=20
> > file.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > Version 2 changes:
> > Added PVR_INIT variable.
> > Made changes to only build and package X11 components if a X11 based=20
> > distro is used. Raw mode components are always built and packaged=20
> > even for
> > X11 based
> > distros.
> >
> >  recipes-graphics/libgles/libgles-omap3.inc    |  208
> > +++++++++++++++----------
> >  recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +
> >  2 files changed, 135 insertions(+), 80 deletions(-)
> >
> > diff --git a/recipes-graphics/libgles/libgles-omap3.inc
> > b/recipes-graphics/libgles/libgles-omap3.inc
> > index 4525285..523aa52 100644
> > --- a/recipes-graphics/libgles/libgles-omap3.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3.inc
> > @@ -3,11 +3,15 @@ LICENSE =3D "proprietary-binary"
> >  # 'TSPA.txt' might not be the best file to md5sum  LIC_FILES_CHKSUM=20
> > =3D "file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
> >
> > -PR =3D "r32"
> > +PR =3D "r33"
> >
> >  COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
> >
> > -DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"
> > +X11DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"
> > +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11',
> > '${X11DEPENDS}', '', d)}"
> > +
> > +export SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',
> > 'x11', '1', '0', d)}"
> > +PVR_INIT ?=3D "pvrsrvinit"
> >
> >  PROVIDES +=3D "virtual/egl"
> >
> > @@ -31,11 +35,13 @@ export ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"
> >  export ES6LOCATION ?=3D "${S}/gfx_rel_es6.x"
> >  export ES8LOCATION ?=3D "${S}/gfx_rel_es8.x"
> >
> > +LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_FRONTWSEGL.so.1"
> > +
>=20
> Why not set this like your line from your other patches
>=20
> LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES', 'x11',"libp=
vrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
>=20
> Franklin: Because this will change the default behavior for the current l=
ibgles-omap3 recipes which might break things for X11 users. This recipe wa=
s simple meant to tweak the settings of this inc to prepare for my newer Gr=
aphics SDK patches but it shouldn't modify anything for users using the old=
er Graphics SDK.
>=20
> >  do_configure() {
> >       # Attempt to fix up the worst offenders for file permissions
> >       for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c")=20
> > $(find ${S} -name "Make*") ; do
> >               chmod 0644 $i
> > -     done
> > +     done
>=20
> What is the diff here?  Whitespace?
>=20
> Franklin: Most likely.
>=20
> >
> >       # Attempt to create proper library softlinks
> >       for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S}
> > -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S}
> > -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do
> > @@ -64,62 +70,92 @@ PARALLEL_MAKE =3D ""
> >  PLATFORM ?=3D "LinuxOMAP3"
> >
> >  do_compile() {
> > -     export X11ROOT=3D"${STAGING_DIR_HOST}/usr"
> >       export TOOLCHAIN=3D"${TOOLCHAIN_PATH}"
> > -
> >       export PLAT_CC=3D"${CC}"
> >       export PLAT_CPP=3D"${CXX}"
> >       export PLAR_AR=3D"${AR}"
> >
> > -     mkdir -p ${S}/demos/raw
> > -     mkdir -p ${S}/demos/x11
> > -
> > -     # Rebuild demos for both Raw and X11
> > -     for X11BUILD in 0 1 ; do
> > -             for demo in
> > ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
> > -                     cd $demo/OGLES/Build/LinuxGeneric
> > -                     oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> > X11BUILD=3D$X11BUILD
> > -                     rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> > -                     install -m 0755
> > $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
> > -                     sed -e s:NAME:$(basename $demo): \
> > -                         -e
> > s:EXEC:${bindir}/SGX/demos/X11/$(basename
> > $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
> > -                          ${WORKDIR}/sample.desktop >
> > ${WORKDIR}/$(basename $demo).desktop
> > -                     install -m 0755
> > $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
> > -             done
> > -             for demo in
> > ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
> > -                     cd $demo/OGLES2/Build/LinuxGeneric
> > -                     oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> > X11BUILD=3D$X11BUILD
> > -                     rm -f
> > $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
> > -                     install -m 0755
> > $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 ||
> > true
> > -                     sed -e s:NAME:$(basename $demo): \
> > -                         -e
> > s:EXEC:${bindir}/SGX/demos/X11/$(basename
> > $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
> > -                          ${WORKDIR}/sample.desktop >
> > ${WORKDIR}/$(basename $demo).desktop
> > -                     install -m 0755
> > $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||
> > true
> > -             done
> > -     done
> > -
> > -     mkdir -p ${S}/trainingcourses/raw
> > -     mkdir -p ${S}/trainingcourses/x11
> > +    if [ ${SUPPORT_XORG} -eq 1 ]
> > +    then
> > +        export X11ROOT=3D"${STAGING_DIR_HOST}/usr"
> > +        mkdir -p ${S}/demos/x11
> > +        mkdir -p ${S}/trainingcourses/x11
> > +    fi
> > +
> > +    mkdir -p ${S}/demos/raw
> > +    mkdir -p ${S}/trainingcourses/raw
> > +
> > +     # Rebuild demos
> > +    for X11BUILD in 0 1 ; do
> > +        # Don't rebuild demos with X11 support for a non X11
> > distro
> > +        if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ]
> > +        then
> > +            continue
> > +        fi
> > +
> > +         for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/*
> > ; do
> > +                 cd $demo/OGLES/Build/LinuxGeneric
> > +                 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> > X11BUILD=3D$X11BUILD
> > +                 rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> > +
> > +            if [ $X11BUILD -eq 1 ]
> > +            then
> > +                install -m 0755
> > $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
>=20
> In the case that you are now only building X11 if it is a supported featu=
re then shouldn't you care about the return value of this copy?  Should we =
expect the build to fail if the demos are not built?
>=20
> Franklin: I think some of this "|| true" lines are due to differences bet=
ween 4.03.00.02.bb vs 4.05.00.03.bb. Files typically get moved between Grap=
hics SDK releases so lines like that are needed since this inc supports mul=
tiple Graphics SDK versions.
>=20
> > +                sed -e s:NAME:$(basename $demo): \
> > +                    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename
> > $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
> > +                    ${WORKDIR}/sample.desktop >
> > ${WORKDIR}/$(basename $demo).desktop
> > +            else
> > +                install -m 0755
> > $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
>=20
> Same comment as above
>=20
> > +            fi
> > +         done
> > +
> > +         for demo in
> > ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
> > +                 cd $demo/OGLES2/Build/LinuxGeneric
> > +                 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> > X11BUILD=3D$X11BUILD
> > +                 rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
>=20
> Why rm -f here but not in the similar line in the previous loop?
>=20
> > +
> > +            if [ $X11BUILD -eq 1 ]
> > +            then
> > +                     install -m 0755
> > $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 ||
> > true
>=20
> Same comment as above
>=20
> > +                sed -e s:NAME:$(basename $demo): \
> > +                    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename
> > $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
> > +                    ${WORKDIR}/sample.desktop >
> > ${WORKDIR}/$(basename $demo).desktop
> > +            else
> > +                install -m 0755
> > $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw ||
> > true
>=20
> Same comment as above
>=20
> Also, just a thought and this could likely be put into a future enhanceme=
nt but these loops are similar enough that you should be able to abstract t=
his to a function that can take the OGLES version (OGLES or OGLES2) and set=
 the directories based on X11BUILD to remove duplicate code.
>=20
> > +            fi
> > +         done
> > +    done
> >
> >       find ${S} -name "*_org" -delete
> >
> > -     # Build OGLES2 Trainingcourses for both Raw and X11
> > -     for X11BUILD in 0 1 ; do
> > -             for training in
> > ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
> > -                     if [ -e
> > $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
> > -                             cd $training/OGLES2/Build/LinuxGeneric
> > -                     fi
> > -
> > -                     if [ -e
> > $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
> > -                             cd $training/OGLES2/Build/${PLATFORM}
> > -                     fi
> > -
> > -                     oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> > X11BUILD=3D$X11BUILD
> > -                     rm -f
> > $training/OGLES2/Build/${PLATFORM}/Release*/*.o
> > -                     install -m 0755
> > $training/OGLES2/Build/${PLATFORM}/ReleaseX11/*
> > ${S}/trainingcourses/x11 || true
> > -                     install -m 0755
> > $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*
> > ${S}/trainingcourses/raw || true
> > -             done
> > -     done
> > +     # Build OGLES2 Trainingcourses
> > +    for X11BUILD in 0 1 ; do
> > +        # Don't rebuild training courses with X11 support for a
> > non X11 distro
> > +        if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ]
> > +        then
> > +            continue
> > +        fi
> > +
> > +         for training in
> > ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
> > +                 if [ -e
> > $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
> > +                         cd $training/OGLES2/Build/LinuxGeneric
> > +                 fi
> > +
> > +                 if [ -e
> > $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
> > +                         cd $training/OGLES2/Build/${PLATFORM}
> > +                 fi
> > +
> > +                 oe_runmake Common=3D1 PLATFORM=3D${PLATFORM}
> > X11BUILD=3D$X11BUILD
> > +                 rm -f
> > $training/OGLES2/Build/${PLATFORM}/Release*/*.o
> > +
> > +            if [ $X11BUILD -eq 1 ]
> > +            then
> > +                     install -m 0755
> > $training/OGLES2/Build/${PLATFORM}/ReleaseX11/*
> > ${S}/trainingcourses/x11 || true
> > +            else
> > +                     install -m 0755
> > $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*
> > ${S}/trainingcourses/raw || true
> > +            fi
>=20
> Same comments about the || true statements as above.
>=20
> > +         done
> > +    done
> >
> >  }
> >
> > @@ -133,12 +169,14 @@ do_install () {
> >
> >       install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
> >       install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
> > -     install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
> > -
> > -     install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
> > +     install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir}/
> >
> > -     install -m 0755
> > ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx
> > ${D}${bindir}/|| true
> > -     cp -pPR
> > ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/li
> > b/*X11WS* ${D}${libdir} || true
> > +    if [ ${SUPPORT_XORG} -eq 1 ]
> > +    then
> > +         install -m 0755 ${BINLOCATION}/xgles1test1
> > ${D}${bindir}/
> > +         install -m 0755
> > ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx
> > ${D}${bindir}/|| true
> > +         cp -pPR
> > ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/li
> > b/*X11WS* ${D}${libdir} || true
> > +    fi
> >
> >       install -d ${D}${includedir}
> >       cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
> > @@ -158,7 +196,7 @@ do_install () {
> >
> >       install -d ${D}${sysconfdir}
> >       echo "[default]" > ${D}${sysconfdir}/powervr.ini
> > -     echo "WindowSystem=3DlibpvrPVR2D_FRONTWSEGL.so.1" >>
> > ${D}${sysconfdir}/powervr.ini
> > +     echo "WindowSystem=3D${LIBGLESWINDOWSYSTEM}" >>
> > ${D}${sysconfdir}/powervr.ini
> >
> >       # The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SGX
> > hardware, so we need to install multiple sets of userspace
> >
> > @@ -174,11 +212,15 @@ do_install () {
> >       install -d ${D}${bindir}/ES3.0
> >       install -d ${D}${bindir}/ES2.0
> >
> > +    shared_prog=3D"eglinfo pvr2d_test ${PVR_INIT} services_test
> > sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test
> > sgx_render_flip_test"
> > +    raw_prog=3D"gles1test1 gles2test1 ovg_unit_test"
> > +    x11_prog=3D"eglinfo_x xgles1test1 xgles2test1 xmultiegltest
> > xovg_unit_test"
> > +
> >       for esrev in 2 3 5 6 8 ; do
> >               ESLOCATION=3D$(eval echo $(echo
> > \$\{ES${esrev}LOCATION\}))
> >               if [ -e ${ESLOCATION} ] ; then
> >                       cp -pPR ${ESLOCATION}/lib*${IMGPV}
> > ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a
> > ${D}${libdir}/ES${esrev}.0/
> > -                     for esprog in eglinfo eglinfo_x gles1test1
> > gles2test1 ovg_unit_test pvr2d_test pvrsrvinit services_test
> > sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test
> > sgx_render_flip_test xgles1test1 xgles2test1 xmultiegltest
> > xovg_unit_test ; do
> > +                     for esprog in $shared_prog $raw_prog
> > ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ; do
> >                               install -m 0755 ${ESLOCATION}/$esprog
> > ${D}${bindir}/ES${esrev}.0/ || true
> >                       done
> >               fi
> > @@ -190,15 +232,19 @@ do_install () {
> >       cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications
> >       rm ${D}${prefix}/share/applications/sample.desktop
> >
> > -     install -d ${D}${bindir}/SGX/demos/X11/
> > -     install -d ${D}${bindir}/SGX/demos/Raw/
> > -     install -m 0755 ${S}/demos/x11/*
> > ${D}${bindir}/SGX/demos/X11/
> > -     install -m 0755 ${S}/demos/raw/*
> > ${D}${bindir}/SGX/demos/Raw/
> > +    if [ ${SUPPORT_XORG} -eq 1 ]
> > +    then
> > +         install -d ${D}${bindir}/SGX/demos/X11/
> > +         install -m 0755 ${S}/demos/x11/*
> > ${D}${bindir}/SGX/demos/X11/
> > +         install -d ${D}${bindir}/SGX/trainingcourses/X11
> > +        install -m 0755 ${S}/trainingcourses/x11/*
> > ${D}${bindir}/SGX/trainingcourses/X11/
> > +    fi
> > +
> > +    install -d ${D}${bindir}/SGX/demos/Raw/
> > +    install -m 0755 ${S}/demos/raw/*
> > ${D}${bindir}/SGX/demos/Raw/
> > +    install -d ${D}${bindir}/SGX/trainingcourses/Raw
> > +    install -m 0755 ${S}/trainingcourses/raw/*
> > ${D}${bindir}/SGX/trainingcourses/Raw/
> >
> > -     install -d ${D}${bindir}/SGX/trainingcourses/Raw
> > -     install -d ${D}${bindir}/SGX/trainingcourses/X11
> > -     install -m 0755 ${S}/trainingcourses/x11/*
> > ${D}${bindir}/SGX/trainingcourses/X11/
> > -     install -m 0755 ${S}/trainingcourses/raw/*
> > ${D}${bindir}/SGX/trainingcourses/Raw/
> >
> >       # Delete objects and linker scripts hidden between the
> > headers
> >       find ${D} -name "*.o" -delete
> > @@ -209,15 +255,8 @@ do_install () {
> >
> >  }
> >
> > -PACKAGES =3D+ "${PN}-rawdemos \
> > -             ${PN}-x11demos \
> > -             ${PN}-rawtrainingcourses \
> > -             ${PN}-x11trainingcourses \
> > -"
> > -
> > -PACKAGES +=3D "xserver-kdrive-powervrsgx \
> > -             ${PN}-tests "
> > -
> > +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-
> > x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx" ,"",
> > d)}  \
> > +            ${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
> >  # Package the base libraries per silicon revision
> >  PACKAGES =3D+ "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> >  RRECOMMENDS_${PN} +=3D "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6
> > ${PN}-es8"
> > @@ -234,7 +273,9 @@ PRIVATE_LIBS_${PN}-es5 =3D "libGLESv2.so
> > libIMGegl.so libsrv_um.so libOpenVG.so li
> >  PRIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
> > libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so
> > libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> >  PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
> > libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so
> > libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> >
> > -PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl
> > ${PN}-linuxfbwsegl ${PN}-x11wsegl ${PN}-driwsegl"
> > +
> > +PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl
> > ${PN}-linuxfbwsegl"
> > +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-
> > x11wsegl ${PN}-driwsegl" ,"", d)}"
> >  FILES_${PN}-blitwsegl =3D "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
> >  FILES_${PN}-flipwsegl =3D "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
> >  FILES_${PN}-frontwsegl =3D "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
> > @@ -242,7 +283,10 @@ FILES_${PN}-linuxfbwsegl =3D
> > "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
> >  FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so*
> > ${bindir}/x* ${bindir}/*x"
> >  FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL.so*
> > ${libdir}/libsrv_um_dri*"
> >
> > -PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-
> > blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-
> > flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-
> > flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-
> > frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-
> > frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3
> > ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-
> > es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5
> > ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-
> > driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-
> > driwsegl-es8"
> > +PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-
> > blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-
> > flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-
> > flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-
> > frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-
> > frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3
> > ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-
> > es8"
> > +
> > +X11_SEGL =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-
> > x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-
> > driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-
> > driwsegl-es6 ${PN}-driwsegl-es8 "
> > +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES',
> > 'x11',"${X11_SEGL}" ,"", d)}"
> >  FILES_${PN}-blitwsegl-es2 =3D
> > "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
> >  FILES_${PN}-blitwsegl-es3 =3D
> > "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
> >  FILES_${PN}-blitwsegl-es5 =3D
> > "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
> > @@ -287,7 +331,7 @@ RRECOMMENDS_${PN}-driwsegl =3D " ${PN}-
> > driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driws
> >
> >  CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"
> >
> > -FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so*
> > ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*"
> > +FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so*
> > ${bindir}/${PVR_INIT} ${bindir}/cputype ${bindir}/*"
> >
> >  FILES_xserver-kdrive-powervrsgx =3D "${bindir}/Xsgx"
> >  FILES_${PN}-tests =3D "${bindir}/*test*"
> > @@ -335,8 +379,12 @@ INITSCRIPT_PARAMS =3D "start 30 5 2 . stop 40
> > 0 1 6 ."
> >  pkg_postinst_${PN}_append() {
> >  rm -f $D${sysconfdir}/powervr-esrev
> >
> > -ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
> > -ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
> > +if [ ${SUPPORT_XORG} -eq 1 ]
> > +then
> > +    ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
> > +    ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
> > +fi
> > +
> >  }
> >
> >  pkg_postinst_${PN}-blitwsegl() {
> > diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > b/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > index 00cd994..e5a4cd1 100755
> > --- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > +++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > @@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)
> >  sgxprepare () {
> >       echo Starting PVR
> >       insmod $(busybox find /lib/modules/$(uname -r) -name
> > "pvrsrvkm.ko")
> > +
> > +    if [ "$?" !=3D "0" ]
> > +    then
> > +        echo "Could not find pvrsrvkm driver"
> > +        exit 1
> > +    fi
> > +
>=20
> Why is this fix here?  Doesn't seem related and could be it's own patch.
>=20
> >       modprobe omaplfb
> >       modprobe bufferclass_ti
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20

