Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E09E003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 08:49:40 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1AGndqH007189;
	Fri, 10 Feb 2012 10:49:39 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1AGndPs006873;
	Fri, 10 Feb 2012 10:49:39 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 10 Feb 2012 10:49:38 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] Merging in linux-stable updates, git send-email
Thread-Index: AQHM5/1qFTS2IEiSbky2nJz4S1BXypY2OkTQgABn/wD//6jSUIAAZ8sA//+brbCAAGfkAP//oV3w
Date: Fri, 10 Feb 2012 16:49:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012766B029@DLEE12.ent.ti.com>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
	<35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766AE0A@DLEE12.ent.ti.com>
	<3ED328D4-BA57-41C2-8044-2C09617E5C32@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766AEE6@DLEE12.ent.ti.com>
	<20120210162746.GA2525@denix.org>
In-Reply-To: <20120210162746.GA2525@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Merging in linux-stable updates, git send-email
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
X-List-Received-Date: Fri, 10 Feb 2012 16:49:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Friday, February 10, 2012 10:28 AM
> To: Maupin, Chase
> Cc: Koen Kooi; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Merging in linux-stable updates, git send-
> email
>=20
> On Fri, Feb 10, 2012 at 04:18:28PM +0000, Maupin, Chase wrote:
> >
> > > -----Original Message-----
> > > From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > > Sent: Friday, February 10, 2012 10:15 AM
> > > To: Maupin, Chase
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] Merging in linux-stable updates, git
> send-
> > > email
> > >
> > >
> > > Op 10 feb. 2012, om 17:05 heeft Maupin, Chase het volgende
> > > geschreven:
> > >
> > > > So you changed the recipe name to use 3.2.5 for the PV.  But
> when
> > > I set the DISTRO_FEATURES to include tipspkernel I don't get
> all
> > > the patches you added to update to 3.2.5.  So can you maybe do
> a
> > > logic similar to how the patches are handled to set the PV
> based on
> > > whether tipspkernel is set in DISTRO_FEATURES?
> > >
> > > I have updated the patch locally to keep PV at 3.2. I can live
> with
> > > PV being "wrong" for the patched kernel till we figure out the
> > > python magic. Using gitpkgv would get us around all this, but
> > > that's a story for another day :)
> >
> > So for this recipe would the following line of code not work?
> >
> > PV =3D "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${PV}",
> "3.2.5", d)}"
>=20
> You'll have a circular resolution in there, basically doing PV =3D
> ${PV}
>=20
> You'd want to use :=3D instead. But anyway, it seems heavy handed for
> the
> purpose...

Well, as long as we use the PSP version as the base I'm OK, which is what I=
 think Koen is saying.

>=20
> --
> Denys
>=20
>=20
> > Then leave the recipe as linux-ti33x-psp_3.2.bb but your PV
> should be
> > correct for your kernel right?

