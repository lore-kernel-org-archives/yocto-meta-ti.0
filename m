Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31FABE01353
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:11:25 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1FFBMZv006039;
	Wed, 15 Feb 2012 09:11:22 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1FFBM6Q004341;
	Wed, 15 Feb 2012 09:11:22 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Wed, 15 Feb 2012 16:11:22 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: "Peter A. Bigot" <bigotp@acm.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/4] various: fix installation directories
	for	corrected ti-eula-unpack
Thread-Index: AQHM4BWl6ZcXj5fooEeQP+ZTy0azzZY+Jugg
Date: Wed, 15 Feb 2012 15:11:21 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B5E7FCA@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<1328013657-2069-3-git-send-email-bigotp@acm.org>
In-Reply-To: <1328013657-2069-3-git-send-email-bigotp@acm.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.88.84]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] various: fix installation directories for	corrected ti-eula-unpack
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 15:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 12:40:55, Peter A. Bigot wrote:
> Subject: [meta-ti] [PATCH 2/4] various: fix installation directories
> for corrected ti-eula-unpack
>
> From: "Peter A. Bigot" <bigotp@acm.org>
>
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>

Acked-by: Roger Monk <r-monk@ti.com>

> ---
>  recipes-ti/bios/ti-dspbios.inc      |    3 ++-
>  recipes-ti/devtools/ti-xdctools.inc |    3 ++-
>  recipes-ti/edma3lld/ti-edma3lld.inc |    3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-
> dspbios.inc index 8519039..0e3fa62 100644
> --- a/recipes-ti/bios/ti-dspbios.inc
> +++ b/recipes-ti/bios/ti-dspbios.inc
> @@ -10,7 +10,8 @@ require ../includes/ti-paths.inc  require
> ../includes/ti-staging.inc  require ../includes/ti-eula-unpack.inc
>
> -S =3D "${WORKDIR}/bios_${PV}"
> +TI_BIN_UNPK_WDEXT=3D"/bios_${PV}"
> +S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
>
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/
> e xports/bios_setuplinux_${PV}.bin;name=3Dbiosbin"
>
> diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-
> ti/devtools/ti-xdctools.inc index c76ad80..547a555 100644
> --- a/recipes-ti/devtools/ti-xdctools.inc
> +++ b/recipes-ti/devtools/ti-xdctools.inc
> @@ -12,7 +12,8 @@ S =3D "${WORKDIR}/xdctools_${PV}"
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/
> x dctools_setuplinux_${PV}.bin;name=3Dxdcbin"
>
>  BINFILE=3D"xdctools_setuplinux_${PV}.bin"
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS=3D"Y:workdir:Y"
> +TI_BIN_UNPK_WDEXT=3D"/ti"
>
>  do_install() {
>      install -d ${D}${XDC_INSTALL_DIR_RECIPE} diff --git a/recipes-
> ti/edma3lld/ti-edma3lld.inc b/recipes-ti/edma3lld/ti-edma3lld.inc
> index d4e8557..fb131b6 100644
> --- a/recipes-ti/edma3lld/ti-edma3lld.inc
> +++ b/recipes-ti/edma3lld/ti-edma3lld.inc
> @@ -8,7 +8,8 @@ require ../includes/ti-paths.inc  require
> ../includes/ti-staging.inc  require ../includes/ti-eula-unpack.inc
>
> -S =3D "${WORKDIR}/edma3_lld_${PV}"
> +TI_BIN_UNPK_WDEXT=3D"/edma3_lld_${PV}"
> +S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
>
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3lldsite}/edma3_lld/edma3-
> lld-
> bios5/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=3Dedma3lldbin"
>
> --
> 1.7.6.4
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti




