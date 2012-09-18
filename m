Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D37A0E002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:51:14 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8I0pDCQ027074
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:51:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8I0pDQX007929
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:51:13 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 17 Sep 2012 19:51:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] omap3-sgx-modules: Upgrade to latest version
	4.06.00.02
Thread-Index: AQHNlTcnCgFB3WyxOUCbdI3wVpeDx5ePRBOg
Date: Tue, 18 Sep 2012 00:51:13 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D63DF@DFLE09.ent.ti.com>
References: <1346701925-7793-1-git-send-email-fcooper27jr@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C2D62B7@DFLE09.ent.ti.com>
	<20120918004717.GD1708@edge>
In-Reply-To: <20120918004717.GD1708@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap3-sgx-modules: Upgrade to latest version 4.06.00.02
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
X-List-Received-Date: Tue, 18 Sep 2012 00:51:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I just noticed I left out some DRI specific things from this patch. I am go=
ing to send a version two of this patch in 1 second.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, September 17, 2012 7:47 PM
To: Cooper Jr., Franklin
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] omap3-sgx-modules: Upgrade to latest version=
 4.06.00.02

On Mon, Sep 17, 2012 at 11:38:32PM +0000, Cooper Jr., Franklin wrote:
> ping

Let's wait for Roger to enlighten us about the state of X11/DRI in the new =
Graphics SDK for libgles, to be matched with sgx-modules recipe...

On the other hand, setting it with D_P=3D-1 should let the previous proven =
version take precedence. Any objections from anyone?

--
Denys


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproje=
ct.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Monday, September 03, 2012 2:52 PM
> To: meta-ti@yoctoproject.org
> Cc: Franklin S. Cooper Jr
> Subject: [meta-ti] [PATCH] omap3-sgx-modules: Upgrade to latest version 4=
.06.00.02
>=20
> * Add the latest version of omap3-sgx-modules.
> * Set DEFAULT_PREFERENCE to -1 to match libgles-omap3_4.06.00.02
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
>  .../omap3-sgx-modules_4.06.00.02.bb                |   50 ++++++++++++++=
++++++
>  1 files changed, 50 insertions(+), 0 deletions(-)  create mode 100644 re=
cipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
>=20
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb =
b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
> new file mode 100644
> index 0000000..c31e9f1
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
> @@ -0,0 +1,50 @@
> +DESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset found in the=
 omap3 SoCs"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea5743acf520dd81ca172e69f818a=
3d4"
> +
> +TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +require ../../recipes-ti/includes/ti-eula-unpack.inc
> +
> +SGXPV =3D "4_06_00_02"
> +IMGPV =3D "1.7.867897"
> +BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append =3D "a"
> +PR =3D "${MACHINE_KERNEL_PR}"
> +
> +# Not making this the default version to match a similar setting # in=20
> +the matching libgles-omap3_4.06.00.02 recipe.
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/${SGXPV}/exports/${BINFILE}"
> +SRC_URI[md5sum] =3D "62f0c378e38f8d14e9f184c3836aea21"
> +SRC_URI[sha256sum] =3D "71c8e154484304b3ce32d565557720a96c7ba762e72d7f1e=
93deeef9f3274402"
> +TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
> +S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> +
> +PVRBUILD =3D "release"
> +export KERNELDIR =3D "${STAGING_KERNEL_DIR}"
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +
> +TI_PLATFORM_omap3 =3D "omap3630"
> +TI_PLATFORM_ti814x =3D "ti81xx"
> +TI_PLATFORM_ti816x =3D "ti81xx"
> +TI_PLATFORM_ti33x =3D "ti335x"
> +
> +MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
> +MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
> +MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
> +MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> +
> +MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}"
> +
> +do_install() {
> +    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    cp  ${S}/pvrsrvkm.ko \
> +        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> +        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> +        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +}
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

