Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09008E00814; Mon,  8 Sep 2014 07:37:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C447CE007A0
	for <meta-ti@yoctoproject.org>; Mon,  8 Sep 2014 07:37:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88Eb6OT005668;
	Mon, 8 Sep 2014 09:37:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88Eb667011974;
	Mon, 8 Sep 2014 09:37:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 8 Sep 2014 09:37:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: update with A&D merge, add
	new DTBs for AM437x-SK and J6Eco
Thread-Index: AQHPy2/PI6OD04hUlEGuCRl9pkT0bpv3TcZw
Date: Mon, 8 Sep 2014 14:37:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72BE49@DFLE08.ent.ti.com>
References: <1410185833-25245-1-git-send-email-denis@denix.org>
In-Reply-To: <1410185833-25245-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: update with A&D merge, add new DTBs for AM437x-SK and J6Eco
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
X-List-Received-Date: Mon, 08 Sep 2014 14:37:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 08, 2014 9:17 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] linux-ti-staging: update with A&D merge, add n=
ew
> DTBs for AM437x-SK and J6Eco
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.14.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> index 45dccef..92a5a6c 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -26,10 +26,10 @@ RDEPENDS_kernel-base_append_dra7xx =3D " vpe-
> vpdma-fw"
>  # Default is to package all dtb files for ti33x devices unless building =
 # for the
> specific beaglebone machine.
>  KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
> am335x-bone.dtb am335x-boneblack.dtb"
> -KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb"
> +KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb
> am437x-sk-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> -KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb am57xx-beagle-x15.dtb"
> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb dra72-evm.dtb am57xx-
> beagle-x15.dtb"
>  KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb"
>  KERNEL_DEVICETREE_omap3 =3D "omap3-beagle.dtb omap3-beagle-xm.dtb
> omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
>  KERNEL_DEVICETREE_am3517-evm =3D "am3517-evm.dtb"
> @@ -44,11 +44,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.14.y"
>=20
> -SRCREV =3D "1cfe07e737fa842f9f93d80cee4e3b7f198bc566"
> +SRCREV =3D "0261be2e3a30f496c2c8642b6709f4fc54e75391"
>  PV =3D "3.14.17"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "d+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "e+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  KERNEL_CONFIG_DIR =3D "${S}/ti_config_fragments"
> --
> 2.0.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

