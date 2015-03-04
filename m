Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64C53E00718; Wed,  4 Mar 2015 06:57:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22C99E006E9
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2015 06:57:46 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24Evjs5004869
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 08:57:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24EvilR032277
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 08:57:44 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 4 Mar 2015 08:57:44 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] sitara-linux-ti-staging: Update commit to
	fix touchscreen issues on AM335x SK
Thread-Index: AQHQVnIa8yVHHL4nYUeByiUT1ZazU50MzU8A//+cGxA=
Date: Wed, 4 Mar 2015 14:57:44 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410409D@DFLE09.ent.ti.com>
References: <1425470120-18627-1-git-send-email-j-stiffler@ti.com>
	<20150304145218.GF6052@edge>
In-Reply-To: <20150304145218.GF6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] sitara-linux-ti-staging: Update commit to fix touchscreen issues on AM335x SK
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
X-List-Received-Date: Wed, 04 Mar 2015 14:57:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Not all of these fixes are in main linux-ti-staging. We plan on releasing P=
rocessor SDK 1.0 for am335x and am437x soon and it has been decided to use =
the same kernel as was released with AMSDK 8.0.=20

BTW, this update is present in meta-ti-amsdk, but has not yet been upstream=
ed to meta-ti.


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, March 04, 2015 9:52 AM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] sitara-linux-ti-staging: Update commit to fi=
x touchscreen issues on AM335x SK

BTW, is this fix in main linux-ti-staging?


On Wed, Mar 04, 2015 at 06:55:20AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../linux/sitara-linux-ti-staging_3.14.bb          |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb=20
> b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> index 8cd2c3f..31c1223 100644
> --- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> @@ -35,11 +35,11 @@ S =3D "${WORKDIR}/git"
> =20
>  BRANCH =3D "sitara-ti-linux-3.14.y"
> =20
> -SRCREV =3D "99b50bfb0f3fb0e43de31a6735989d31660b0835"
> +SRCREV =3D "2489c022b2932432606f897741a71b712e6dbe77"
>  PV =3D "3.14.26"
> =20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a=20
> rebuild -MACHINE_KERNEL_PR_append =3D "g+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "h+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
> =20
>  MULTI_CONFIG_BASE_SUFFIX =3D ""
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

