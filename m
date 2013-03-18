Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECD12E01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 13:10:32 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IKAVdm018883;
	Mon, 18 Mar 2013 15:10:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IKAVgN022972;
	Mon, 18 Mar 2013 15:10:31 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 18 Mar 2013 15:10:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv2 1/3] linux-ti-staging: update to the latest
	merge of 3.8.3
Thread-Index: AQHOJAuUqWHSBBAc5kSue9j2Q/ej4pir4SHg
Date: Mon, 18 Mar 2013 20:10:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159482337@DLEE11.ent.ti.com>
References: <1363633471-23367-1-git-send-email-denis@denix.org>
In-Reply-To: <1363633471-23367-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/3] linux-ti-staging: update to the latest	merge of 3.8.3
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
X-List-Received-Date: Mon, 18 Mar 2013 20:10:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

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
> Sent: Monday, March 18, 2013 2:05 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCHv2 1/3] linux-ti-staging: update to the
> latest merge of 3.8.3
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Switch to using the official git.ti.com URL instead of temp
> gitorious.ti.com
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - switch from gitorious.ti.com to git.ti.com
>=20
>  recipes-kernel/linux/linux-ti-staging_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> b/recipes-kernel/linux/linux-ti-staging_git.bb
> index dfef76d..cfd4da0 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -39,13 +39,13 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.8.y"
>=20
> -SRCREV =3D "e69f39916783a559c499e264359edea315ef44fd"
> -PV =3D "3.8.2"
> +SRCREV =3D "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
> +PV =3D "3.8.3"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> cause a rebuild
> -MACHINE_KERNEL_PR_append =3D "d+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>=20
> -SRC_URI =3D "git://gitorious.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
> +SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
>            "
>=20
> --
> 1.8.1.5
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

