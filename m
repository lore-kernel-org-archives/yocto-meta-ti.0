Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48E3DE0027E
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 09:22:46 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AGMjgS015850;
	Wed, 10 Oct 2012 11:22:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AGMjif025799;
	Wed, 10 Oct 2012 11:22:45 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 11:22:45 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-modules:	Add
	v4.08.00.01 of the SGX modules
Thread-Index: AQHNpv+rI0PFfg6yRUapZoiE0dQVUpeyt/Ks
Date: Wed, 10 Oct 2012 16:22:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C300D21@DFLE09.ent.ti.com>
References: <1349843304-18507-1-git-send-email-fcooper@ti.com>
	<1349843304-18507-2-git-send-email-fcooper@ti.com>,
	<7D46E86EC0A8354091174257B2FED101592555C0@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101592555C0@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Wed, 10 Oct 2012 16:22:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
________________________________________=0A=
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Maupin, Chase=0A=
Sent: Wednesday, October 10, 2012 10:55 AM=0A=
To: Franklin S. Cooper Jr; meta-ti@yoctoproject.org=0A=
Subject: Re: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-modules:     Add=
     v4.08.00.01 of the SGX modules=0A=
=0A=
> -----Original Message-----=0A=
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-=0A=
> bounces@yoctoproject.org] On Behalf Of Franklin S. Cooper Jr=0A=
> Sent: Tuesday, October 09, 2012 11:28 PM=0A=
> To: meta-ti@yoctoproject.org=0A=
> Subject: [meta-ti] [PATCH 2/2][for-comments] omap3-sgx-modules:=0A=
> Add v4.08.00.01 of the SGX modules=0A=
>=0A=
> * Add version 4.08.00.01 of the SGX modules.=0A=
>=0A=
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>=0A=
> ---=0A=
>  .../omap3-sgx-modules_4.08.00.01.bb                |   55=0A=
> ++++++++++++++++++++=0A=
>  1 files changed, 55 insertions(+), 0 deletions(-)=0A=
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-=0A=
> modules_4.08.00.01.bb=0A=
>=0A=
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-=0A=
> modules_4.08.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-=0A=
> modules_4.08.00.01.bb=0A=
> new file mode 100644=0A=
> index 0000000..f45934f=0A=
> --- /dev/null=0A=
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb=0A=
> @@ -0,0 +1,55 @@=0A=
> +DESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset found=0A=
> in the omap3 SoCs"=0A=
> +LICENSE =3D "GPLv2"=0A=
> +LIC_FILES_CHKSUM =3D=0A=
> "file://COPYING;md5=3Dea5743acf520dd81ca172e69f818a3d4"=0A=
> +=0A=
> +TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"=0A=
> +require ../../recipes-ti/includes/ti-eula-unpack.inc=0A=
> +=0A=
> +SGXPV =3D "4_08_00_01"=0A=
> +IMGPV =3D "1.7.867897"=0A=
> +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}.bin"=0A=
> +=0A=
> +inherit module=0A=
> +=0A=
> +MACHINE_KERNEL_PR_append =3D "a"=0A=
=0A=
As we learned the other day MACHINE_KERNEL_PR adds a dependency on the kern=
el.bbclass in meta-openembedded.  Should this check if MACHINE_KERNEL_PR is=
 defined before doing the append?=0A=
=0A=
Franklin: MACHINE_KERNEL_PR is used by 25+ include files,patches and machin=
e files within meta-ti as of today. With that being said your change does m=
ake sense. I can add that to v2=0A=
=0A=
> +PR =3D "${MACHINE_KERNEL_PR}"=0A=
> +=0A=
> +DEFAULT_PREFERENCE =3D "-1"=0A=
> +=0A=
> +SRC_URI =3D "<ti-internal-=0A=
> url>/Graphics_SDK_setuplinux_4_08_00_01.bin"=0A=
> +SRC_URI[md5sum] =3D "95b8f02923d6ea52ea104fa3d93ce1f0"=0A=
> +SRC_URI[sha256sum] =3D=0A=
> "1db2d46ec3c6a97db146357841e02a95a15be658c2297dc571e6e61b32238561=0A=
> "=0A=
> +=0A=
> +TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"=0A=
> +S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"=0A=
> +=0A=
> +PVRBUILD =3D "release"=0A=
> +export KERNELDIR =3D "${STAGING_KERNEL_DIR}"=0A=
> +=0A=
> +INHIBIT_PACKAGE_STRIP =3D "1"=0A=
> +=0A=
> +TI_PLATFORM_omap3 =3D "omap3630"=0A=
> +TI_PLATFORM_ti814x =3D "ti81xx"=0A=
> +TI_PLATFORM_ti816x =3D "ti81xx"=0A=
> +TI_PLATFORM_ti33x =3D "ti335x"=0A=
> +=0A=
> +MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"=0A=
> +MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"=0A=
> +MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"=0A=
> +MODULESLOCATION_ti33x =3D "dc_ti335x_linux"=0A=
> +=0A=
> +export SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',=0A=
> 'x11', '1', '0', d)}"=0A=
> +=0A=
> +MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}=0A=
> SUPPORT_XORG=3D${SUPPORT_XORG}"=0A=
=0A=
What is this used for?=0A=
=0A=
> +=0A=
> +do_install() {=0A=
> +    mkdir -p=0A=
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr=0A=
> +    cp  ${S}/pvrsrvkm.ko \=0A=
> +        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \=0A=
> +        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko=0A=
> \=0A=
> +=0A=
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr=0A=
> +=0A=
> +     if [ "${SUPPORT_XORG}" =3D "1" ]; then=0A=
> +         cp ${S}/services4/3rdparty/linux_drm/drm.ko=0A=
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr=0A=
> +     fi=0A=
> +}=0A=
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

