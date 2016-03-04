Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5D4AE00B89; Fri,  4 Mar 2016 13:45:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AFCFE00B89
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 13:44:57 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24LivVS001787
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 15:44:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24LivtM021410
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 15:44:57 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 4 Mar 2016 15:44:56 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] multiprocmgr: Update to new verison 3.0.1.0
Thread-Index: AQHRdZ9V9IREvzctRkWC6ItEOMFQ1Z9J0nyg
Date: Fri, 4 Mar 2016 21:44:56 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814248BC0@DFLE09.ent.ti.com>
References: <1457045511-16254-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1457045511-16254-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] multiprocmgr: Update to new verison 3.0.1.0
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
X-List-Received-Date: Fri, 04 Mar 2016 21:45:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The SRCREV was removed by this patch!

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> Sent: Thursday, March 03, 2016 5:52 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] multiprocmgr: Update to new verison 3.0.1.0
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Note:
> The changes in this version needs corresponding
> change in kernel version and hence need to be
> coordinated
>=20
> ---
> ---
>  recipes-ti/multiprocmgr/multiprocmgr.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-
> ti/multiprocmgr/multiprocmgr.inc
> index 122ac0f..915ac7a 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr.inc
> +++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
> @@ -8,11 +8,11 @@ MULTIPROCMGR_GIT_URI =3D "git://git.ti.com/keystone-
> linux/multi-proc-manager.git"
>  MULTIPROCMGR_GIT_PROTOCOL =3D "git"
>  MULTIPROCMGR_GIT_BRANCH =3D "master"
>=20
> -# The following commits correspond to DEV.MPM-3.00.00.02
> -MULTIPROCMGR_SRCREV =3D "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
> +# The following commits correspond to DEV.MPM-3.00.01.00
> +MULTIPROCMGR_SRCREV =3D ""
^^^^^^^^^^^^


>=20
> -PV =3D "3.0.0.2"
> -INC_PR =3D "r2"
> +PV =3D "3.0.1.0"
> +INC_PR =3D "r0"
>=20
>  BRANCH =3D "${MULTIPROCMGR_GIT_BRANCH}"
>  SRC_URI =3D
> "${MULTIPROCMGR_GIT_URI};protocol=3D${MULTIPROCMGR_GIT_PROTOCOL};
> branch=3D${BRANCH}"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

