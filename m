Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DA3AE00BB1; Fri, 30 Jun 2017 12:40:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00A5EE00BAD
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 12:40:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5UJe32C027281
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 14:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498851604;
	bh=ITW0fRxrsLo9mVjc5Lu+mKj4PlVk4wRcHZ5bMz9W4ds=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=dSYbEGcD+S1Ep4epQR6irTF8a0uFA8Qzmlk1Ah2fzBC/QG7UGSTE9siQKOpNVTdpZ
	4O+6H270L/9egEe+uNz408SyXD9Tf/kFjsmx7s+U4qfyyX4X5dXo6j6mSXCLoylHVb
	tv6vFADc+bo8Kx8dGfwhSPp1AhHzcxrB/GjZ9U24=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5UJe3cA006046
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 14:40:03 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 30 Jun 2017 14:40:03 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] common-csl-ip: Update for CSL version
	3.3.0.7 and support for ti33x, ti43x & omap
Thread-Index: AQHS8deGqL1XX1fMBk2dp5FvH0ppq6I9y49Q
Date: Fri, 30 Jun 2017 19:40:03 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A74379818A@DFLE12.ent.ti.com>
References: <1498850969-38948-1-git-send-email-m-radhakrishnan2@ti.com>
	<20170630193150.GU14665@edge>
In-Reply-To: <20170630193150.GU14665@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] common-csl-ip: Update for CSL version 3.3.0.7 and support for ti33x, ti43x & omap
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
X-List-Received-Date: Fri, 30 Jun 2017 19:40:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
 Yes. I meant omapl1. Shall I re-submit the patch with these corrections?

Regards
Mahesh

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, June 30, 2017 3:32 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] common-csl-ip: Update for CSL version 3.3.0.=
7 and support for ti33x, ti43x & omap

On Fri, Jun 30, 2017 at 03:29:29PM -0400, Mahesh Radhakrishnan wrote:
> Update for CSL version 3.3.0.7 and support for ti33x,ti43x & omap

Thanks. Did you mean omapl1 in the description?
Also, you don't have to duplicate the same text in subject and body of the =
patch - both will be in the commit log, which is redundant.


> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/co=
mmon-csl-ip/common-csl-ip.inc
> index cac0b93..71ef9e9 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "Chip support library low level interface=
"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5857833e20836213677fac33f=
9aded21"
> =20
> -COMPATIBLE_MACHINE =3D "keystone|dra7xx"
> +COMPATIBLE_MACHINE =3D "keystone|dra7xx|ti33x|ti43x|omapl1"
> =20
> -PV =3D "03.03.00.06C"
> +PV =3D "03.03.00.07B"
>  INC_PR =3D "r0"
> =20
>  CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL =3D"git"
>  CSL_GIT_BRANCH =3D "master"
>  CSL_GIT_DESTSUFFIX =3D "git"
> =20
> -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.06C"
> -CSL_SRCREV =3D "ce2bbf96b08fa69eda7bfc92aa7760b7ca70dddf"
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.07B"
> +CSL_SRCREV =3D "28dbc2f4b0b06b29ac4e962a9494987d242b48b5"
> =20
>  BRANCH=3D"${CSL_GIT_BRANCH}"
>  SRC_URI =3D "${CSL_GIT_URI};protocol=3D${CSL_GIT_PROTOCOL};branch=3D${BR=
ANCH};destsuffix=3D${CSL_GIT_DESTSUFFIX}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

