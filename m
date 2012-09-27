Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11810E00717
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 21:33:36 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8R4XVgm003518
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 23:33:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8R4XVie031523
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 23:33:31 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 26 Sep 2012 23:33:31 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] layer.conf: lower layer priority from 10 to 6
Thread-Index: AQHNkkAi3osUeCpbNUWcosWVTTWg3JePngWAgA4PRoA=
Date: Thu, 27 Sep 2012 04:33:30 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2EE972@DFLE09.ent.ti.com>
References: <1347603217-10160-1-git-send-email-denys@ti.com>
	<20120918004843.GE1708@edge>
In-Reply-To: <20120918004843.GE1708@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] layer.conf: lower layer priority from 10 to 6
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
X-List-Received-Date: Thu, 27 Sep 2012 04:33:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please apply this patch to the denzil branch also.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Monday, September 17, 2012 7:49 PM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] layer.conf: lower layer priority from 10 to =
6

Any objections here?


On Fri, Sep 14, 2012 at 02:13:37AM -0400, Denys Dmytriyenko wrote:
> Lowering layer priority from 10 to 6 aligns meta-ti with other BSP=20
> layers and also allows distributions to override our recipes.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/layer.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/layer.conf b/conf/layer.conf index 4afb4f3..faa4ac0=20
> 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -6,4 +6,4 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
> =20
>  BBFILE_COLLECTIONS +=3D "meta-ti"
>  BBFILE_PATTERN_meta-ti :=3D "^${LAYERDIR}/"
> -BBFILE_PRIORITY_meta-ti =3D "10"
> +BBFILE_PRIORITY_meta-ti =3D "6"
> --
> 1.7.8.6
>=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

