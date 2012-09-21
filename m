Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0CF2E013F7
	for <meta-ti@yoctoproject.org>; Thu, 20 Sep 2012 21:35:18 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8L4ZHW4000785;
	Thu, 20 Sep 2012 23:35:17 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8L4ZHSk007868;
	Thu, 20 Sep 2012 23:35:17 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 20 Sep 2012 23:35:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-ti] [PATCH] u-boot_2011.09-psp04.06.00.08: Add the SDK
	released version of u-boot
Thread-Index: AQHNl7Aigg1K9Aj6K0ygJUNwkfBL7JeUMaww
Date: Fri, 21 Sep 2012 04:35:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D9E36@DFLE09.ent.ti.com>
References: <1348201306-12756-1-git-send-email-fcooper@ti.com>
	<1348201306-12756-2-git-send-email-fcooper@ti.com>
	<20120921041803.GA18493@edge>
In-Reply-To: <20120921041803.GA18493@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] u-boot_2011.09-psp04.06.00.08: Add the SDK released version of u-boot
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
X-List-Received-Date: Fri, 21 Sep 2012 04:35:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Those are valid machines even though the git repo name is misleading:) Beag=
leboard and am37x-evm now uses u-boot mainline so most people will likely u=
se u-boot 2012.04.01+ instead of using this recipe. Am3517-evm  currently u=
ses this version of u-boot in the latest Sitara SDK.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, September 20, 2012 11:18 PM
To: Franklin S. Cooper Jr
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] u-boot_2011.09-psp04.06.00.08: Add the SDK r=
eleased version of u-boot

On Thu, Sep 20, 2012 at 11:21:46PM -0500, Franklin S. Cooper Jr wrote:
> * Add the official version of u-boot that is used by the Sitara SDK.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 ++++++++++++++=
++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)  create mode 100644=20
> recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb=20
> b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> new file mode 100644
> index 0000000..cbaff76
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> @@ -0,0 +1,29 @@
> +# Use the version of u-boot.inc in oe-core not the meta-ti version=20
> +require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +
> +DESCRIPTION =3D "u-boot bootloader for ARM MPU devices"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb"
> +
> +COMPATIBLE_MACHINE =3D "ti33x|am37x-evm|am3517-evm|beagleboard"

Are you sure this is the right set of machines for the URL below?


> +DEFAULT_PREFERENCE =3D "-1"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +PR =3D "r0+gitr${SRCPV}"
> +
> +SRC_URI =3D "git://arago-project.org/git/projects/u-boot-am33x.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> +
> +BRANCH =3D "AM335XPSP_04.06.00.08"
> +
> +# Lock to the commit corresponding to TAG:
> +# v2011.09_AM335xPSP_04.06.00.08
> +SRCREV =3D "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
> +
> +S =3D "${WORKDIR}/git"
> +
> +UBOOT_SUFFIX =3D "img"
> +
> +# Set the name of the SPL that will built so that it is also packaged wi=
th u-boot.
> +SPL_BINARY =3D "MLO"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

