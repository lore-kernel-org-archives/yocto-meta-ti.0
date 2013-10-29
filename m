Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C4C3E0174F
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2013 10:38:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9THcBCd011452;
	Tue, 29 Oct 2013 12:38:11 -0500
Received: from DFLE73.ent.ti.com ([128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9THcBQ0010825;
	Tue, 29 Oct 2013 12:38:11 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 29 Oct 2013 12:38:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [PATCH] am33x-cm3: update PM firmware for AM335x to 05.00.00.00
Thread-Index: AQHO1MN8gmjh+L/+HESc8c80GJnDg5oL8b8s
Date: Tue, 29 Oct 2013 17:38:10 +0000
Message-ID: <F23EC138-76C4-4E07-B875-1DBA58309C19@ti.com>
References: <1383063875-10561-1-git-send-email-denis@denix.org>
In-Reply-To: <1383063875-10561-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Gerlach,
	Dave" <d-gerlach@ti.com>, "Dill, Russ" <russ.dill@ti.com>
Subject: Re: [PATCH] am33x-cm3: update PM firmware for AM335x to 05.00.00.00
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
X-List-Received-Date: Tue, 29 Oct 2013 17:38:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack
> On Oct 29, 2013, at 9:25 AM, "Denys Dmytriyenko" <denis@denix.org> wrote=
:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Dave Gerlach <d-gerlach@ti.com>
> Cc: Chase Maupin <chase.maupin@ti.com>
> Cc: Carlos Hernandez <ceh@ti.com>
> Cc: Russ Dill <Russ.Dill@ti.com>
> ---
> recipes-bsp/ti/am33x-cm3_git.bb | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_=
git.bb
> index 9b36a9e..3be46b6 100644
> --- a/recipes-bsp/ti/am33x-cm3_git.bb
> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> @@ -3,12 +3,12 @@ DESCRIPTION =3D "Cortex-M3 binary blob for suspend-res=
ume"
> LICENSE =3D "TI-BSD"
> LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D858099c817e47ea63559fc6b6=
7ae8d91"
>=20
> -PV =3D "04.06.00.11"
> -PR =3D "r4"
> +PV =3D "05.00.00.00"
> +PR =3D "r0"
>=20
> -# SRCREV corresponds to tag "AM335xPSP_04.06.00.11"
> -SRCREV =3D "750362868d914702086187096ec2c67b68eac101"
> -BRANCH ?=3D "master"
> +# SRCREV corresponds to the tip of next3 branch
> +SRCREV =3D "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
> +BRANCH ?=3D "next3"
>=20
> INITSCRIPT_NAME =3D "am335x-pm-firmware-load"
> INITSCRIPT_PARAMS =3D "defaults 96"
> --=20
> 1.8.3.2
>=20

