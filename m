Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 393E3E00723; Tue,  1 Jul 2014 08:35:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D23DCE006F3
	for <meta-ti@yoctoproject.org>; Tue,  1 Jul 2014 08:35:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FZoRo004803
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 10:35:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FZouu013608
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 10:35:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 10:35:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 4/4] Update dra7xx-evm settings to use dra7xx
	SOC_FAMILY
Thread-Index: AQHPlTGzyXEzFUaKO0SoXgV26mdp+5uLWdaw
Date: Tue, 1 Jul 2014 15:35:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D8028@DFLE08.ent.ti.com>
References: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
	<1404221769-7903-4-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404221769-7903-4-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] Update dra7xx-evm settings to use dra7xx	SOC_FAMILY
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
X-List-Received-Date: Tue, 01 Jul 2014 15:35:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 8:36 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 4/4] Update dra7xx-evm settings to use dra7xx
> SOC_FAMILY
>=20
> * Update to use the dra7xx SOC_FAMILY instead of the specific
>   dra7xx-evm machine type.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb   |   20 +++++++++++++++++--
> -
>  recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb        |    2 +-
>  recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
>  recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++--
>  recipes-ti/ipc/ti-ipc.inc                     |    4 ++--
>  5 files changed, 24 insertions(+), 10 deletions(-)
>=20
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-
> bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
> index c3017fe..7f67c39 100644
> --- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
> @@ -1,13 +1,27 @@
> +python __anonymous() {
> +    features =3D bb.data.getVar("MACHINE_FEATURES", d, 1)
> +    if not features:
> +        return
> +    if "mmip" not in features:
> +        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems
> +without the "mmip" flag in MACHINE_FEATURES') }
> +
>  DESCRIPTION =3D "Firmware for IPU "
>=20
>  LICENSE =3D "TI-TSPA"
> -LIC_FILES_CHKSUM_dra7xx-evm =3D "file://MMIP-${PV}-
> Manifest.doc;md5=3D64ca6f9d7e5243b8a4084eb918a543bc"
> +LIC_FILES_CHKSUM_dra7xx =3D "file://MMIP-${PV}-
> Manifest.doc;md5=3D64ca6f9d7e5243b8a4084eb918a543bc"
>  LIC_FILES_CHKSUM_omap5-evm =3D "file://MMIP-${PV}-
> Manifest.doc;md5=3D39a593dd8fc2a9654c74f679ed329c45"
>=20
>  COMPATIBLE_MACHINE =3D "omap-a15"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -SRC_URI =3D
> "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/ex
> ports/ipumm-${MACHINE}-
> 3.00.04.02.tar.gz;protocol=3Dhttp;name=3D${MACHINE}"
> +# Need to set the PLATFORM variable since now multiple MACHINEs are
> +sharing # a common named tarball PLATFORM =3D "UNKNOWN"
> +PLATFORM_dra7xx =3D "dra7xx-evm"
> +PLATFORM_omap5-evm =3D "omap5-evm"
> +
> +SRC_URI =3D
> "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/ex
> ports/ipumm-${PLATFORM}-
> 3.00.04.02.tar.gz;protocol=3Dhttp;name=3D${PLATFORM}"
>=20
>  # DRA7xx checksums
>  SRC_URI[dra7xx-evm.md5sum] =3D "da04c03b0fd57901e8283afa80f81379"
> @@ -19,7 +33,7 @@ SRC_URI[omap5-evm.sha256sum] =3D
> "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da
>=20
>  S =3D "${WORKDIR}/ipumm-${MACHINE}-${PV}"
>=20
> -TARGET_dra7xx-evm =3D "dra7-ipu2-fw.xem4"
> +TARGET_dra7xx =3D "dra7-ipu2-fw.xem4"
>  TARGET_omap5-evm =3D "ducati-m3-core0.xem3"
>=20
>  do_install() {
> diff --git a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb b/recipes-bsp/vpe-
> vpdma/vpe-vpdma_git.bb
> index fb3012a..14f059b 100644
> --- a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
> +++ b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
> @@ -5,7 +5,7 @@ DEPENDS +=3D "virtual/kernel"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D74d2f71d8898c54e3d1c9d0058c484aa"
>=20
> -COMPATIBLE_MACHINE =3D "dra7xx-evm"
> +COMPATIBLE_MACHINE =3D "dra7xx"
>=20
>  PV =3D "1b8"
>  PR =3D "r1"
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-
> kernel/linux/linux-ti-staging_3.12.bb
> index 90dab23..e288a6d 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> @@ -21,7 +21,7 @@ RDEPENDS_kernel-base_append_ti43x =3D " am33x-cm3"
>=20
>  # Add a run-time dependency for the VPE VPDMA firmware to be installed  =
#
> on the target file system.
> -RDEPENDS_kernel-base_append_dra7xx-evm =3D " vpe-vpdma-fw"
> +RDEPENDS_kernel-base_append_dra7xx =3D " vpe-vpdma-fw"
>=20
>  # Default is to package all dtb files for ti33x devices unless building =
 # for the
> specific beaglebone machine.
> @@ -29,7 +29,7 @@ KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-
> evmsk.dtb am335x-bone.dtb am335  KERNEL_DEVICETREE_ti43x =3D "am43x-
> epos-evm.dtb am437x-gp-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> -KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb"
>=20
>  KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> index 5c8022b..8c12bad 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -23,7 +23,7 @@ RDEPENDS_kernel-base_append_ti43x =3D " am33x-cm3"
>=20
>  # Add a run-time dependency for the VPE VPDMA firmware to be installed  =
#
> on the target file system.
> -RDEPENDS_kernel-base_append_dra7xx-evm =3D " vpe-vpdma-fw"
> +RDEPENDS_kernel-base_append_dra7xx =3D " vpe-vpdma-fw"
>=20
>  # Default is to package all dtb files for ti33x devices unless building =
 # for the
> specific beaglebone machine.
> @@ -31,7 +31,7 @@ KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-
> evmsk.dtb am335x-bone.dtb am335  KERNEL_DEVICETREE_ti43x =3D "am43x-
> epos-evm.dtb am437x-gp-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> -KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb"
>  KERNEL_DEVICETREE_omap3 =3D "omap3-beagle.dtb omap3-beagle-xm.dtb
> omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
>  KERNEL_DEVICETREE_am3517-evm =3D "am3517-evm.dtb"
>  KERNEL_DEVICETREE_am37x-evm =3D "omap3-evm-37xx.dtb"
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc index
> ee9feff..860f55f 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -12,12 +12,12 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  PLATFORM =3D "UNKNOWN"
>  PLATFORM_omap5-evm =3D "OMAP54XX"
> -PLATFORM_dra7xx-evm =3D "DRA7XX"
> +PLATFORM_dra7xx =3D "DRA7XX"
>  PLATFORM_keystone =3D "TCI6638"
>=20
>  DAEMON =3D "UNKNOWN"
>  DAEMON_omap5-evm =3D "lad_omap54xx_smp"
> -DAEMON_dra7xx-evm =3D "lad_dra7xx"
> +DAEMON_dra7xx =3D "lad_dra7xx"
>  DAEMON_keystone =3D "lad_tci6638"
>=20
>  inherit autotools pkgconfig update-rc.d
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

