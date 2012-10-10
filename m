Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 155B8E00292
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 12:29:29 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AJTP4u002752;
	Wed, 10 Oct 2012 14:29:25 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AJTPsu004610;
	Wed, 10 Oct 2012 14:29:25 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 14:29:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-modules:	Add
	v4.08.00.01 of the SGX modules
Thread-Index: AQHNpx2OKxF0fT9Cb0Sk5u5JQBafMA==
Date: Wed, 10 Oct 2012 19:29:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592561F6@DLEE12.ent.ti.com>
References: <1349843304-18507-1-git-send-email-fcooper@ti.com>
	<1349843304-18507-2-git-send-email-fcooper@ti.com>,
	<7D46E86EC0A8354091174257B2FED101592555C0@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C300D21@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C300D21@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2][for-comments] omap3-sgx-modules:	Add	v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 10 Oct 2012 19:29:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, October 10, 2012 11:23 AM
> To: Maupin, Chase; Franklin S. Cooper Jr; meta-
> ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-
> modules: Add v4.08.00.01 of the SGX modules
>=20
>=20
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-
> bounces@yoctoproject.org] on behalf of Maupin, Chase
> Sent: Wednesday, October 10, 2012 10:55 AM
> To: Franklin S. Cooper Jr; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-
> modules:     Add     v4.08.00.01 of the SGX modules
>=20
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Tuesday, October 09, 2012 11:28 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-modules:
> > Add v4.08.00.01 of the SGX modules
> >
> > * Add version 4.08.00.01 of the SGX modules.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../omap3-sgx-modules_4.08.00.01.bb                |   55
> > ++++++++++++++++++++
> >  1 files changed, 55 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-
> > modules_4.08.00.01.bb
> >
> > diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-
> > modules_4.08.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-
> > modules_4.08.00.01.bb
> > new file mode 100644
> > index 0000000..f45934f
> > --- /dev/null
> > +++ b/recipes-bsp/powervr-drivers/omap3-sgx-
> modules_4.08.00.01.bb
> > @@ -0,0 +1,55 @@
> > +DESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset
> found
> > in the omap3 SoCs"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dea5743acf520dd81ca172e69f818a3d4"
> > +
> > +TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> > +require ../../recipes-ti/includes/ti-eula-unpack.inc
> > +
> > +SGXPV =3D "4_08_00_01"
> > +IMGPV =3D "1.7.867897"
> > +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> > +
> > +inherit module
> > +
> > +MACHINE_KERNEL_PR_append =3D "a"
>=20
> As we learned the other day MACHINE_KERNEL_PR adds a dependency
> on the kernel.bbclass in meta-openembedded.  Should this check if
> MACHINE_KERNEL_PR is defined before doing the append?
>=20
> Franklin: MACHINE_KERNEL_PR is used by 25+ include files,patches
> and machine files within meta-ti as of today. With that being
> said your change does make sense. I can add that to v2

Denys,

As I asked before, what should we do about MACHINE_KERNEL_PR in general for=
 meta-ti?  I know we want to move away from meta-oe dependencies, so should=
 we be trying to add MACHINE_KERNEL_PR to oe-core?  I see a patch for this =
was submitted back in 2011 but not picked up (http://lists.linuxtogo.org/pi=
permail/openembedded-core/2011-September/010193.html).  There was a lot of =
discussion but still no conclusion.  There was talk about the autoPR making=
 this unneeded, but I think people skipped the issue of recipes that should=
 be re-built when the kernel changes.

So for now should we leave this alone but take the question back to oe-core=
 about why not to use this feature?

>=20
> > +PR =3D "${MACHINE_KERNEL_PR}"
> > +
> > +DEFAULT_PREFERENCE =3D "-1"
> > +
> > +SRC_URI =3D "<ti-internal-
> > url>/Graphics_SDK_setuplinux_4_08_00_01.bin"
> > +SRC_URI[md5sum] =3D "95b8f02923d6ea52ea104fa3d93ce1f0"
> > +SRC_URI[sha256sum] =3D
> >
> "1db2d46ec3c6a97db146357841e02a95a15be658c2297dc571e6e61b32238561
> > "
> > +
> > +TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> > +S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> > +
> > +PVRBUILD =3D "release"
> > +export KERNELDIR =3D "${STAGING_KERNEL_DIR}"
> > +
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > +
> > +TI_PLATFORM_omap3 =3D "omap3630"
> > +TI_PLATFORM_ti814x =3D "ti81xx"
> > +TI_PLATFORM_ti816x =3D "ti81xx"
> > +TI_PLATFORM_ti33x =3D "ti335x"
> > +
> > +MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
> > +MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
> > +MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
> > +MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> > +
> > +export SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',
> > 'x11', '1', '0', d)}"
> > +
> > +MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}
> > SUPPORT_XORG=3D${SUPPORT_XORG}"
>=20
> What is this used for?
>=20
> > +
> > +do_install() {
> > +    mkdir -p
> > ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> > +    cp  ${S}/pvrsrvkm.ko \
> > +        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko
> \
> > +
> ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko
> > \
> > +
> > ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> > +
> > +     if [ "${SUPPORT_XORG}" =3D "1" ]; then
> > +         cp ${S}/services4/3rdparty/linux_drm/drm.ko
> > ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> > +     fi
> > +}
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

