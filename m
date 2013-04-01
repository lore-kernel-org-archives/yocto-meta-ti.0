Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D855E014D8
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2013 11:24:59 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31IOx93023560
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 13:24:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31IOxDM016939
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 13:24:59 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 13:24:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] omap3-sgx-modules: Add version
	4.08.00.02 of	the Graphics SDK kernel modules
Thread-Index: AQHOJRpxeDSaZtk9RE6GYqTT855FW5jBwi2w
Date: Mon, 1 Apr 2013 18:24:58 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B45AB@DLEE11.ent.ti.com>
References: <1363745431-10452-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745431-10452-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] omap3-sgx-modules: Add version 4.08.00.02 of	the Graphics SDK kernel modules
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
X-List-Received-Date: Mon, 01 Apr 2013 18:25:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ping on this patch


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:11 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/2] omap3-sgx-modules: Add version
> 4.08.00.02 of the Graphics SDK kernel modules
>=20
> ---
>  .../omap3-sgx-modules_4.08.00.02.bb                |   56
> ++++++++++++++++++++
>  1 files changed, 56 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-
> modules_4.08.00.02.bb
>=20
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-
> modules_4.08.00.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-
> modules_4.08.00.02.bb
> new file mode 100644
> index 0000000..793de14
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
> @@ -0,0 +1,56 @@
> +DESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset found
> in the omap3 SoCs"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dea5743acf520dd81ca172e69f818a3d4"
> +
> +TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +require ../../recipes-ti/includes/ti-eula-unpack.inc
> +
> +SGXPV =3D "4_08_00_02"
> +IMGPV =3D "1.9.2188537"
> +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append =3D "a"
> +PR =3D "${MACHINE_KERNEL_PR}"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV
> }/exports/${BINFILE}"
> +
> +SRC_URI[md5sum] =3D "0efa3a38266e6f41f8cc4fad0187f0d6"
> +SRC_URI[sha256sum] =3D
> "c732044b515a598e1fab661b7463aa9c53d4fa37f4980dfa85cd02b7468d0cd9
> "
> +
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
> +export SUPPORT_XORG ?=3D "${@base_contains('DISTRO_FEATURES',
> 'x11', '1', '0', d)}"
> +
> +MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}
> SUPPORT_XORG=3D${SUPPORT_XORG}"
> +
> +do_install() {
> +    mkdir -p
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    cp  ${S}/pvrsrvkm.ko \
> +        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> +        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko
> \
> +
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +
> +    if [ "${SUPPORT_XORG}" =3D "1" ]; then
> +        cp ${S}/services4/3rdparty/linux_drm/drm.ko
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    fi
> +}
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

