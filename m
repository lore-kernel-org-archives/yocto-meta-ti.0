Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9318E014E0
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 20:18:43 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4U3If18010713
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 22:18:42 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4U3IcmD010012
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 22:18:40 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 30 May 2013 11:18:37 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary
	inclusion of folders into package
Thread-Index: AQHOXLHhbvJHXre9pE6tIgQM/8LozZkdDcpw
Date: Thu, 30 May 2013 03:18:36 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB26C20@DBDE04.ent.ti.com>
References: <prabu@ti.com> <1368809879-27201-7-git-send-email-prabu@ti.com>
	<20130529211706.GL4526@edge>
In-Reply-To: <20130529211706.GL4526@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 07/10] libgles-omap3: Remove unnecessary inclusion of folders into package
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
X-List-Received-Date: Thu, 30 May 2013 03:18:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Thanks for reviewing,

It is a simple correction. I had mistakenly removed it in the first one, an=
d reinstated in the next one after comparing with the original patch-set. I=
s there anything missing you observe ?

regards,
Prabu


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, May 30, 2013 2:47 AM
To: Sundareson, Prabindh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary incl=
usion of folders into package

On Fri, May 17, 2013 at 10:27:56PM +0530, Prabindh Sundareson wrote:
> Inclusion of all .so files is not necessary for the package build.
>=20
> Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> ---
>  recipes-graphics/libgles/libgles-omap3-no-x.inc |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc=20
> b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> index 8e5dad6..4521d59 100644
> --- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> +++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> @@ -285,10 +285,6 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es6 =3D "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es8 =3D "ldflags"
>  INSANE_SKIP_${PN}-tests =3D "ldflags"
> =20
> -# Quality control is really poor on these SDKs, so hack around the lates=
t madness:
> -FILES_${PN} +=3D "${libdir}/*.so "
> -FILES_${PN}-dev =3D "${includedir}"

I'm confused - you are removing these 2 lines in 7/10 and then immediately =
re-add them back in 8/10. Why?


>  inherit update-rc.d
> =20
>  INITSCRIPT_NAME =3D "pvr-init"
> --=20
> 1.7.1
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

