Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 491A9E00873; Fri, 30 Jan 2015 14:43:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF6A5E00546
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 14:43:42 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMhfWL011017
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 16:43:41 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMheOh017431
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 16:43:40 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Fri, 30 Jan 2015 16:43:40 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] sitara-linux-ti-staging_3.14.bb: Update
	commit to pull in suspend/standby fix
Thread-Index: AQHQO1pmHryJ1/eHTUO95pzjF7qAOpzWqPSAgACGtMCAAjargP//3z8w
Date: Fri, 30 Jan 2015 22:43:39 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F2B45@DFLE08.ent.ti.com>
References: <1422491258-4786-1-git-send-email-fcooper@ti.com>
	<20150129005013.GB21328@edge>
	<8F29D6B095ED194EA1980491A5E029710C7F04B4@DFLE08.ent.ti.com>
	<20150130184031.GG21328@edge>
In-Reply-To: <20150130184031.GG21328@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] sitara-linux-ti-staging_3.14.bb: Update commit to pull in suspend/standby fix
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
X-List-Received-Date: Fri, 30 Jan 2015 22:43:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, January 30, 2015 12:41 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] sitara-linux-ti-staging_3.14.bb: Update
> commit to pull in suspend/standby fix
>=20
> On Thu, Jan 29, 2015 at 09:56:28AM -0500, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, January 28, 2015 6:50 PM
> > > To: Cooper Jr., Franklin
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH] sitara-linux-ti-staging_3.14.bb:
> > > Update commit to pull in suspend/standby fix
> > >
> > > On Wed, Jan 28, 2015 at 06:27:38PM -0600, Franklin S. Cooper Jr wrote=
:
> > > > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> > > >
> > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > ---
> > > >  .../linux/sitara-linux-ti-staging_3.14.bb          |    2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > > > b/recipes-
> > > kernel/linux/sitara-linux-ti-staging_3.14.bb
> > > > index f9c4641..991f694 100644
> > > > --- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > > > +++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > > > @@ -35,7 +35,7 @@ S =3D "${WORKDIR}/git"
> > > >
> > > >  BRANCH =3D "sitara-ti-linux-3.14.y"
> > > >
> > > > -SRCREV =3D "2d7148a3a95a2811604611f6c66a8826a61b8b12"
> > > > +SRCREV =3D "99b50bfb0f3fb0e43de31a6735989d31660b0835"
> > > >  PV =3D "3.14.26"
> > >
> > > No PV or PR bump? Are you sure?
>=20
> > [Franklin] I still get confused by the "smarter" bitbake determining
> > when it needs to rebuild a recipe.
>=20
> Well, bitbake is smart and it will rebuild the recipe if it changes.
>=20
>=20
> > Is the problem that all other kernel driver recipes still won't be
> > rebuilt even though bitbake may know to rebuild the kernel recipe?
>=20
> The problem might be with out-of-tree kernel modules (graphics, cryptodev=
,
> etc.) and with the binary packages and the proper upgrade path (which you
> probably don't care for now), since package upgrade is handled by the
> package manager (opkg) and not bitbake. From opkg perspective, only the
> version and the revision matter and should be sorted properly, so if SRCR=
EV
> is in PR, it may go lower (not in this case though) and won't get updated=
.
[Franklin] Thanks I keep forgetting that SRCREV can fluctuate so it's not g=
ood enough to "bump" the PR.
>=20
> --
> Denys

