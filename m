Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4379E00D03; Mon,  2 May 2016 07:32:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95FF0E00CD3
	for <meta-ti@yoctoproject.org>; Mon,  2 May 2016 07:32:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u42EWRWT026386
	for <meta-ti@yoctoproject.org>; Mon, 2 May 2016 09:32:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42EWR2j026689
	for <meta-ti@yoctoproject.org>; Mon, 2 May 2016 09:32:27 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 2 May 2016 09:32:27 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Sam Nelson : cmem: Update to new eng version
	4.11.00.00_eng
Thread-Index: AQHRoYB3dblRQYSmnUqo5NUrJmjF/Z+lu4NQ
Date: Mon, 2 May 2016 14:32:26 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426AD99@DFLE09.ent.ti.com>
References: <20160428190038.C1285529EF@arago-project.org>
In-Reply-To: <20160428190038.C1285529EF@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: Sam Nelson : cmem: Update to new eng version	4.11.00.00_eng
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
X-List-Received-Date: Mon, 02 May 2016 14:32:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Now that the build issue with CMEM has been resolved, will you be reverting=
 the hacks to remove everything that depended on CMEM?

Thank you,
Jake

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Arago Project git
> Sent: Thursday, April 28, 2016 3:01 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Sam Nelson : cmem: Update to new eng version
> 4.11.00.00_eng
>=20
> Module: meta-ti
> Branch: master
> Commit: 257a370e7aec4a8954e79697deafec2cd7c2301d
> URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3D257a370e7aec4a8954e79697deafec2cd7c2301d
>=20
> Author: Sam Nelson <sam.nelson@ti.com>
> Date:   Thu Apr 28 00:19:45 2016 +0000
>=20
> cmem: Update to new eng version 4.11.00.00_eng
>=20
> Resolves issues with kernel version 4.4
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  recipes-bsp/cmem/cmem.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index 19d333c..413f925 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -4,10 +4,10 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3D9b745e2765a6ba=
8a6
> 36c91aed4b02ac1"
>=20
>  BRANCH ?=3D "lu-next"
> -# This corresponds to version 4.10.02.05_eng -SRCREV =3D
> "8df44102413c2d653341c5b7e6caee882e206d8c"
> +# This corresponds to version 4.11.00.00_eng SRCREV =3D
> +"852e97b5584cbdb6aa0fdef02a7c4e245409bcb6"
>=20
> -PV =3D "4.10.02.05+git${SRCPV}"
> +PV =3D "4.11.00.00+git${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BR=
ANCH}"
>=20
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

