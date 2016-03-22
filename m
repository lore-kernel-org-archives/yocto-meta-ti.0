Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31602E0086B; Tue, 22 Mar 2016 12:21:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 914E7E006CA
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 12:21:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2MJLk8X016601
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 14:21:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MJLklE022876
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 14:21:46 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 22 Mar 2016 14:21:46 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] gdbc6x: Bump SRCREV so that all machines use same branch
Thread-Index: AQHRhG/CGTsaUD1joU2dEVBpomuZkJ9l1yuA
Date: Tue, 22 Mar 2016 19:21:46 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814251683@DFLE09.ent.ti.com>
References: <1458674369-30105-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1458674369-30105-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH] gdbc6x: Bump SRCREV so that all machines use same branch
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
X-List-Received-Date: Tue, 22 Mar 2016 19:21:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I almost missed this one, but this is needed for the latest OpenCL.

- Jake

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, March 22, 2016 3:19 PM
> To: meta-ti@yoctoproject.org
> Cc: Stiffler, Jacob
> Subject: [PATCH] gdbc6x: Bump SRCREV so that all machines use same
> branch
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-devtools/gdbc6x/gdbc6x.inc | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-
> devtools/gdbc6x/gdbc6x.inc
> index 4513a91..4d77117 100644
> --- a/recipes-devtools/gdbc6x/gdbc6x.inc
> +++ b/recipes-devtools/gdbc6x/gdbc6x.inc
> @@ -1,13 +1,9 @@
>  # This corresponds to version 1.1.0
> -SRCREV =3D "1ab06f8bcfe7540754558bac331a0312c4b59142"
> -SRCREV_keystone =3D "913f18db6325e08f634be6dda91f57fb0ec8c838"
> +SRCREV =3D "653f7d0a345bede0542326090b622b885545c712"
>=20
>  PV =3D "1.1.0"
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>=20
>  SRC_URI =3D "git://git.ti.com/sdo-
> emu/gdbc6x.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
>  BRANCH =3D "master"
> -BRANCH_keystone =3D "k2h"
> -
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --
> 1.9.1


