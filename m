Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D853E0030F
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 11:58:18 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QJwHND004247;
	Thu, 26 Jan 2012 13:58:17 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QJwHES007452;
	Thu, 26 Jan 2012 13:58:17 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Thu, 26 Jan 2012 13:58:17 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] [PATCH] arm-benchmarks: port of am-benchmarks from
	arago
Thread-Index: AQHM3F4UYQBPuobe3UCO4FAVAxlFepYfCFGggABoDAD//5134A==
Date: Thu, 26 Jan 2012 19:58:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9A323@DLEE12.ent.ti.com>
References: <1327604455-4778-1-git-send-email-Chase.Maupin@ti.com>
	<20120126190949.GA18244@denix.org>
	<7D46E86EC0A8354091174257B2FED1010BF9A18A@DLEE12.ent.ti.com>
	<20120126193946.GB18244@denix.org>
In-Reply-To: <20120126193946.GB18244@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] arm-benchmarks: port of am-benchmarks from arago
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 19:58:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

So the matrix-gui-armbenchmarks-demos package just contains the descriptors=
 (the .desktop, etc) for the arm-benchmarks for matrix.  This information u=
sed to be in the arm-benchmarks recipe as a tarball, but we broke this up i=
nstead into a shared git repository and a recipe to package the arm-benchma=
rks part of that git repository.  So the idea here is that arm-benchmarks i=
nstall their description data when they are installed.  If matrix or someon=
e else happens to be looking at the .desktop files then they will discover =
that arm-benchmarks is available.  In this way the application brings his d=
escription data along with him.

The original intention was that for apps we controlled the application brou=
ght everything along.  However, some things that we don't control like the =
Qt demos have matrix-gui-xxxx recipes that do the dependency the way you ar=
e suggesting.  So to avoid confusion I will switch this around.  I'll updat=
e the patches and re-order everything so that this all makes sense.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Thursday, January 26, 2012 1:40 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] arm-benchmarks: port of am-
> benchmarks from arago
>=20
> On Thu, Jan 26, 2012 at 07:28:01PM +0000, Maupin, Chase wrote:
> > > > +do_install() {
> > > > +	export ARCH=3D${TUNE_PKGARCH}
> > > > +	make DESTDIR=3D${D} install
> > > > +}
> > > > +
> > > > +RDEPENDS +=3D matrix-gui-armbenchmarks-demos
> > >
> > > Do we really need to RDEPENDS on matrix?
> >
> > It just pulls in the matrix information, but this by itself does
> not pull in
> > full matrix.
>=20
> Isn't it a bit reverse? Can arm-benchmarks be used on its own?
>=20
> --
> Denys

