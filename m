Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6C6DE0151A
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 13:51:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3QKpTum010859;
	Fri, 26 Apr 2013 15:51:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3QKpTS8003873;
	Fri, 26 Apr 2013 15:51:29 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 26 Apr 2013 15:51:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 26 Apr 2013 15:51:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] u-boot-ti-staging: update to
	ti2013.04.00	release
Thread-Index: AQHOQrnixkWPs8NK/Eq4RiRsF0QO4Jjo+i6A
Date: Fri, 26 Apr 2013 20:51:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101595189EE@DLEE11.ent.ti.com>
References: <1367006879-12633-1-git-send-email-denis@denix.org>
	<1367006879-12633-2-git-send-email-denis@denix.org>
In-Reply-To: <1367006879-12633-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] u-boot-ti-staging: update to ti2013.04.00	release
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
X-List-Received-Date: Fri, 26 Apr 2013 20:51:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ack

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, April 26, 2013 3:08 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 2/2] u-boot-ti-staging: update to
> ti2013.04.00 release
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> index 685dcd0..5fbd0c9 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> @@ -8,6 +8,7 @@ SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
> boot.git;protocol=3Dgit;branch=3D${BRANCH
>=20
>  BRANCH ?=3D "ti-u-boot-2013.01.01"
>=20
> +# This commit corresponds to ti2013.04.00 release tag
>  SRCREV =3D "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
>=20
>  SPL_BINARY =3D "MLO"
> --
> 1.8.2.1
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

