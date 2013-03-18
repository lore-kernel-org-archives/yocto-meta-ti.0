Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAC32E01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:47:14 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IIlDYj015548;
	Mon, 18 Mar 2013 13:47:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IIlDdp027435;
	Mon, 18 Mar 2013 13:47:13 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.1.323.3;
	Mon, 18 Mar 2013 13:47:13 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 13:47:13 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/3] linux-ti-staging: update to the latest
	merge	of 3.8.3
Thread-Index: AQHOJAhAmGG0Ace0K0uy8os1koeiKZiryLwwgABU0QD//6xJwA==
Date: Mon, 18 Mar 2013 18:47:13 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159481D49@DLEE11.ent.ti.com>
References: <1363632040-22025-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED10159481C2B@DLEE11.ent.ti.com>
	<20130318184628.GK32759@edge>
In-Reply-To: <20130318184628.GK32759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] linux-ti-staging: update to the latest merge	of 3.8.3
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
X-List-Received-Date: Mon, 18 Mar 2013 18:47:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 18, 2013 1:46 PM
> To: Maupin, Chase
> Cc: Denys Dmytriyenko; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] linux-ti-staging: update to
> the latest merge of 3.8.3
>=20
> On Mon, Mar 18, 2013 at 06:43:52PM +0000, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > > Sent: Monday, March 18, 2013 1:41 PM
> > > To: meta-ti@yoctoproject.org
> > > Subject: [meta-ti] [PATCH 1/3] linux-ti-staging: update to
> the
> > > latest merge of 3.8.3
> >
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> >
> > Although, we may still need to do version specific (non _git)
> versions of
> > the recipes when there is an official release.
>=20
> When and if we have a long-term releases of the ti-staging kernel
> tree, we can
> revisit this. But for now it would be too much churn to rename
> the recipe
> every week with every next re-merge...

Agreed.  I think this works well for now until we get an official "release"

>=20
> --
> Denys
>=20
>=20
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> > > b/recipes-kernel/linux/linux-ti-staging_git.bb
> > > index dfef76d..605fbc1 100644
> > > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > > @@ -39,11 +39,11 @@ S =3D "${WORKDIR}/git"
> > >
> > >  BRANCH =3D "ti-linux-3.8.y"
> > >
> > > -SRCREV =3D "e69f39916783a559c499e264359edea315ef44fd"
> > > -PV =3D "3.8.2"
> > > +SRCREV =3D "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
> > > +PV =3D "3.8.3"
> > >
> > >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> > > cause a rebuild
> > > -MACHINE_KERNEL_PR_append =3D "d+gitr${SRCPV}"
> > > +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> > >
> > >  SRC_URI =3D "git://gitorious.ti.com/ti-linux-kernel/ti-linux-
> > > kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
> > >             file://defconfig \
> > > --
> > > 1.8.1.5
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

