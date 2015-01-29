Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA369E00824; Thu, 29 Jan 2015 06:56:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4A4DE006EF
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 06:56:31 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TEuUKI032629
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 08:56:30 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TEuTTd026323
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 08:56:29 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Thu, 29 Jan 2015 08:56:29 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] sitara-linux-ti-staging_3.14.bb: Update
	commit to pull in suspend/standby fix
Thread-Index: AQHQO1pmHryJ1/eHTUO95pzjF7qAOpzWqPSAgACGtMA=
Date: Thu, 29 Jan 2015 14:56:28 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F04B4@DFLE08.ent.ti.com>
References: <1422491258-4786-1-git-send-email-fcooper@ti.com>
	<20150129005013.GB21328@edge>
In-Reply-To: <20150129005013.GB21328@edge>
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
X-List-Received-Date: Thu, 29 Jan 2015 14:56:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, January 28, 2015 6:50 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] sitara-linux-ti-staging_3.14.bb: Update
> commit to pull in suspend/standby fix
>=20
> On Wed, Jan 28, 2015 at 06:27:38PM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../linux/sitara-linux-ti-staging_3.14.bb          |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/rec=
ipes-
> kernel/linux/sitara-linux-ti-staging_3.14.bb
> > index f9c4641..991f694 100644
> > --- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> > @@ -35,7 +35,7 @@ S =3D "${WORKDIR}/git"
> >
> >  BRANCH =3D "sitara-ti-linux-3.14.y"
> >
> > -SRCREV =3D "2d7148a3a95a2811604611f6c66a8826a61b8b12"
> > +SRCREV =3D "99b50bfb0f3fb0e43de31a6735989d31660b0835"
> >  PV =3D "3.14.26"
>=20
> No PV or PR bump? Are you sure?
[Franklin] I still get confused by the "smarter" bitbake determining when i=
t needs to rebuild a recipe. Is the problem that all other kernel driver re=
cipes still won't be rebuilt even though bitbake may know to rebuild the ke=
rnel recipe?
>=20
> --
> Denys

