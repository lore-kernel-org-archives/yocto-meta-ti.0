Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86CEDE007A0; Mon, 30 Mar 2015 11:25:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B749E00754
	for <meta-ti@yoctoproject.org>; Mon, 30 Mar 2015 11:25:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2UIPYSU024173
	for <meta-ti@yoctoproject.org>; Mon, 30 Mar 2015 13:25:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2UIPXiu025343
	for <meta-ti@yoctoproject.org>; Mon, 30 Mar 2015 13:25:33 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 30 Mar 2015 13:25:33 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] omap3-sgx-modules: Install via the kernel's
	"modules_install" target.
Thread-Index: AQHQat6JP7WwQIwLnkqb6twwNijg6J01ZEmA///xpuA=
Date: Mon, 30 Mar 2015 18:25:33 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411BE82@DFLE09.ent.ti.com>
References: <1427715709-4258-1-git-send-email-j-stiffler@ti.com>
	<20150330140914.GH21023@edge>
In-Reply-To: <20150330140914.GH21023@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap3-sgx-modules: Install via the kernel's "modules_install" target.
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
X-List-Received-Date: Mon, 30 Mar 2015 18:25:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> If you want the standard module installation, then move any additional va=
riables to EXTRA_OEMAKE and drop do_install completely.

I want the standard installation, but the sources do not seem to provide th=
e standard method for this. The issue with these sources is that they provi=
de the standard target to build the modules, but there is no target to inst=
all them. Because of this, I am overriding the install stage.


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, March 30, 2015 10:09 AM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] omap3-sgx-modules: Install via the kernel's =
"modules_install" target.

On Mon, Mar 30, 2015 at 07:41:49AM -0400, Jacob Stiffler wrote:
> * This allows the modules to have a consistent installation structure
>   when directly building from source.
> * Previously, these modules would be manualy installed to appears as
>   in-tree modules.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../omap3-sgx-modules_4.05.00.03.bb                |   13 ++-----------
>  .../omap3-sgx-modules_4.09.00.01.bb                |   13 ++-----------
>  .../omap3-sgx-modules_5.01.01.01.bb                |   14 ++------------
>  .../omap3-sgx-modules_5.01.01.02.bb                |   14 ++------------
>  4 files changed, 8 insertions(+), 46 deletions(-)
>=20
> diff --git=20
> a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb=20
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> index bd476f0..a54a643 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> @@ -10,7 +10,7 @@ BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> =20
>  inherit module
> =20
> -MACHINE_KERNEL_PR_append =3D "b"
> +MACHINE_KERNEL_PR_append =3D "c"
>  PR =3D "${MACHINE_KERNEL_PR}"
> =20
>  DEFAULT_PREFERENCE_omap3 =3D "99"
> @@ -32,17 +32,8 @@ TI_PLATFORM_ti814x =3D "ti81xx"
>  TI_PLATFORM_ti816x =3D "ti81xx"
>  TI_PLATFORM_ti33x =3D "ti335x"
> =20
> -MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> -
>  MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}"
> =20
>  do_install() {
> -	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -	cp ${S}/pvrsrvkm.ko \
> -	   ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B} INSTALL_MOD_PATH=3D${D}=
=20
> + PREFIX=3D${STAGING_DIR_HOST} modules_install

If you want the standard module installation, then move any additional vari=
ables to EXTRA_OEMAKE and drop do_install completely.


>  }
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb =
b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> index 4b97bbc..cd6dbe4 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> @@ -10,7 +10,7 @@ IMGPV =3D "1.9.2188537"
> =20
>  inherit module
> =20
> -MACHINE_KERNEL_PR_append =3D "c"
> +MACHINE_KERNEL_PR_append =3D "d"
>  PR =3D "${MACHINE_KERNEL_PR}"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> @@ -44,19 +44,10 @@ TI_PLATFORM_ti814x =3D "ti81xx"
>  TI_PLATFORM_ti816x =3D "ti81xx"
>  TI_PLATFORM_ti33x =3D "ti335x"
> =20
> -MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> -
>  MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM} SUPP=
ORT_XORG=3D0"
> =20
>  MAKE_TARGETS_append_ti33x =3D " PM_RUNTIME=3D1"
> =20
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -    cp  ${S}/pvrsrvkm.ko \
> -        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B} INSTALL_MOD_PATH=3D${D}=
 PREFIX=3D${STAGING_DIR_HOST} modules_install
>  }
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb =
b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> index a1d95bf..1ac60da 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> @@ -10,7 +10,7 @@ IMGPV =3D "1.10.2359475"
> =20
>  inherit module
> =20
> -MACHINE_KERNEL_PR_append =3D "c"
> +MACHINE_KERNEL_PR_append =3D "d"
>  PR =3D "${MACHINE_KERNEL_PR}"
> =20
>  BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> @@ -55,18 +55,8 @@ TI_PLATFORM_ti816x =3D "ti81xx"
>  TI_PLATFORM_ti33x =3D "ti335x"
>  TI_PLATFORM_ti43x =3D "ti43xx"
> =20
> -MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> -MODULESLOCATION_ti43x =3D "dc_ti43xx_linux"
> -
>  MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM} SUPP=
ORT_XORG=3D${SUPPORT_XORG}"
> =20
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -    cp  ${S}/pvrsrvkm.ko \
> -        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B} INSTALL_MOD_PATH=3D${D}=
 PREFIX=3D${STAGING_DIR_HOST} modules_install
>  }
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb =
b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> index 6a07d4f..cf042fc 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> @@ -10,7 +10,7 @@ IMGPV =3D "1.10.2359475"
> =20
>  inherit module
> =20
> -MACHINE_KERNEL_PR_append =3D "a"
> +MACHINE_KERNEL_PR_append =3D "b"
>  PR =3D "${MACHINE_KERNEL_PR}"
> =20
>  BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> @@ -51,18 +51,8 @@ TI_PLATFORM_ti816x =3D "ti81xx"
>  TI_PLATFORM_ti33x =3D "ti335x"
>  TI_PLATFORM_ti43x =3D "ti43xx"
> =20
> -MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
> -MODULESLOCATION_ti43x =3D "dc_ti43xx_linux"
> -
>  MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM} SUPP=
ORT_XORG=3D${SUPPORT_XORG}"
> =20
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -    cp  ${S}/pvrsrvkm.ko \
> -        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B} INSTALL_MOD_PATH=3D${D}=
 PREFIX=3D${STAGING_DIR_HOST} modules_install
>  }
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

