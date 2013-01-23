Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DA1DE0147E
	for <meta-ti@yoctoproject.org>; Wed, 23 Jan 2013 04:55:42 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0NCtfvU026113
	for <meta-ti@yoctoproject.org>; Wed, 23 Jan 2013 06:55:41 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0NCtfX7027411
	for <meta-ti@yoctoproject.org>; Wed, 23 Jan 2013 06:55:41 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 23 Jan 2013 06:55:41 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] multi-kernel.inc: repeat do_configure after
	do_compileconfigs
Thread-Index: AQHN+E3IxSb0Qg5CL0KmjQA2bRPNyphW4FIA
Date: Wed, 23 Jan 2013 12:55:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3771AD@DFLE09.ent.ti.com>
References: <1358821172-559-1-git-send-email-denys@ti.com>
In-Reply-To: <1358821172-559-1-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] multi-kernel.inc: repeat do_configure after	do_compileconfigs
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
X-List-Received-Date: Wed, 23 Jan 2013 12:55:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys. I'm off doing training so I haven't tried booting up the boar=
d with the uImage but from a build I ran I looked at the git repo after com=
pileconfigs task and I see the correct defconfig is now being used. I did f=
ind another issue but I have a patch for that I will submit shortly that de=
pends on your patch.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, January 21, 2013 8:20 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] multi-kernel.inc: repeat do_configure after
> do_compileconfigs
>=20
> Populate default defconfig into .config and process with oldconfig target
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/multi-kernel.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux=
/multi-
> kernel.inc
> index 04bc987..e5ebe56 100644
> --- a/recipes-kernel/linux/multi-kernel.inc
> +++ b/recipes-kernel/linux/multi-kernel.inc
> @@ -95,6 +95,8 @@ do_compileconfigs () {
>=20
>        # Restore the regular 'defconfig'
>        cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
> +      cd ${S}
> +      do_configure
>      fi
>  }
>=20
> --
> 1.8.1.1
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

