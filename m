Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 630BEE0027F
	for <meta-ti@yoctoproject.org>; Tue, 11 Sep 2012 08:21:54 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8BFLqx3016479;
	Tue, 11 Sep 2012 10:21:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8BFLqJs021635;
	Tue, 11 Sep 2012 10:21:52 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Tue, 11 Sep 2012 10:21:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>, Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] am33x-cm3: Don't compile binary
Thread-Index: AQHNj+WbsJstwJvmzEqg0A4SW587apeFGaPngAAB7ACAACapoA==
Date: Tue, 11 Sep 2012 15:21:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591E6360@DLEE12.ent.ti.com>
References: <1347330377-10755-1-git-send-email-fcooper@ti.com>,
	<D88D285C-1A83-49A1-A61E-4FA672CBF97A@dominion.thruhere.net>
	<7F24675E-04BD-4965-B3B0-8DE4D384F250@ti.com>
	<7D46E86EC0A8354091174257B2FED101591E59A6@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101591E59A6@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] am33x-cm3: Don't compile binary
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
X-List-Received-Date: Tue, 11 Sep 2012 15:21:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, September 11, 2012 8:03 AM
> To: Cooper Jr., Franklin; Koen Kooi
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] am33x-cm3: Don't compile binary
>=20
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
> > Sent: Tuesday, September 11, 2012 7:55 AM
> > To: Koen Kooi
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] am33x-cm3: Don't compile binary
> >
> > What should be used is what has been validated to work which is
> > the prebuilt binary provided by the PSP team.
> >
> > If it hasn't been validated it shouldn't be used.
>=20
> Just FYI, I'm checking with the PSP team on their
> recommendations.  If they say sources are OK we can go that
> route.  If they do not recommend the use of the sources let's go
> with their decision since they will be supporting this firmware.
>=20

Response from PSP team is that it should be fine as long as the toolchain v=
ersion is the same.  They did recommend it might be a good idea to do an md=
5sum check against the pre-built binaries.  If we were going to do that the=
n I would say just take the pre-built binaries.  But for now let's leave th=
is recipe alone.

> >
> > On Sep 11, 2012, at 1:20 AM, "Koen Kooi"
> > <koen@dominion.thruhere.net> wrote:
> >
> > >
> > > Op 11 sep. 2012, om 04:26 heeft Franklin S. Cooper Jr
> > <fcooperjr27@gmail.com> het volgende geschreven:
> > >
> > >> * Building from source needs to be tested. For now use
> > prebuilt binary
> > >> which has been validated.
> > >
> > >
> > > NAK, if there are problems they need to get reported and
> fixed.
> > Handwaving about that there *might* be bugs is unproductive and
> > wrong.
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

