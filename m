Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2BC4E003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 08:18:31 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1AGIULv002762;
	Fri, 10 Feb 2012 10:18:30 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1AGIUHB015264;
	Fri, 10 Feb 2012 10:18:30 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 10 Feb 2012 10:18:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] Merging in linux-stable updates, git send-email
Thread-Index: AQHM5/1qFTS2IEiSbky2nJz4S1BXypY2OkTQgABn/wD//6jSUIAAZ8sA//+brbA=
Date: Fri, 10 Feb 2012 16:18:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012766AEE6@DLEE12.ent.ti.com>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
	<35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766AE0A@DLEE12.ent.ti.com>
	<3ED328D4-BA57-41C2-8044-2C09617E5C32@dominion.thruhere.net>
In-Reply-To: <3ED328D4-BA57-41C2-8044-2C09617E5C32@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 10 Feb 2012 16:18:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Friday, February 10, 2012 10:15 AM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Merging in linux-stable updates, git send-
> email
>=20
>=20
> Op 10 feb. 2012, om 17:05 heeft Maupin, Chase het volgende
> geschreven:
>=20
> > So you changed the recipe name to use 3.2.5 for the PV.  But when
> I set the DISTRO_FEATURES to include tipspkernel I don't get all
> the patches you added to update to 3.2.5.  So can you maybe do a
> logic similar to how the patches are handled to set the PV based on
> whether tipspkernel is set in DISTRO_FEATURES?
>=20
> I have updated the patch locally to keep PV at 3.2. I can live with
> PV being "wrong" for the patched kernel till we figure out the
> python magic. Using gitpkgv would get us around all this, but
> that's a story for another day :)

So for this recipe would the following line of code not work?

PV =3D "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${PV}", "3.2.5"=
, d)}"

Then leave the recipe as linux-ti33x-psp_3.2.bb but your PV should be corre=
ct for your kernel right?

>=20
> regards,
>=20
> Koen
>=20
> >
> > Sincerely,
> > Chase Maupin
> > Software Applications
> > ARM MPU
> > e-mail: chase.maupin@ti.com
> > phone: (214) 567-2950
> >
> > For support:
> > Forums - http://community.ti.com/forums/
> > Wiki - http://wiki.davincidsp.com/
> >
> >
> >> -----Original Message-----
> >> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> >> Sent: Friday, February 10, 2012 9:16 AM
> >> To: Maupin, Chase
> >> Cc: meta-ti@yoctoproject.org
> >> Subject: Re: [meta-ti] Merging in linux-stable updates, git
> send-
> >> email
> >>
> >>
> >> Op 10 feb. 2012, om 16:05 heeft Maupin, Chase het volgende
> >> geschreven:
> >>
> >>> Koen,
> >>>
> >>> Which recipe are you going to update here?  I assume this is
> not
> >> the linux-ti33x-psp_3.2.bb recipe but something else?
> >>
> >> Exactly that recipe: https://github.com/Angstrom-
> distribution/meta-
> >> ti/commit/a77ccb569019bba7cefc72e598504d26a72fa596
> >>
> >> regards,
> >>
> >> Koen
> >>
> >>>
> >>> Sincerely,
> >>> Chase Maupin
> >>> Software Applications
> >>> ARM MPU
> >>> e-mail: chase.maupin@ti.com
> >>> phone: (214) 567-2950
> >>>
> >>> For support:
> >>> Forums - http://community.ti.com/forums/
> >>> Wiki - http://wiki.davincidsp.com/
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >>>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> >>>> Sent: Friday, February 10, 2012 8:08 AM
> >>>> To: meta-ti@yoctoproject.org
> >>>> Subject: [meta-ti] Merging in linux-stable updates, git send-
> >> email
> >>>>
> >>>> Hi,
> >>>>
> >>>> The update to 3.2.5 for the bone kernel is almost done, but it
> >>>> involves adding ~275 patches. Does it make sense to git-send-
> >> email
> >>>> that megapatch for review? The difficulty is rooted in the
> >> origin
> >>>> of the TI kernel: linux-omap instead of Linus' tree, so we
> can't
> >>>> (easily) rebase all the patches on top of 3.2.5, so it's
> >> actually
> >>>> 3.2.5 rebased onto TI v3.2-staging and then the extra
> beaglebone
> >>>> patches added.
> >>>>
> >>>> Git am -3 takes care of duplicate patches and automerging
> >> conflicts
> >>>> but I'd still like to find out what the best way to review
> this
> >> is.
> >>>>
> >>>> regards,
> >>>>
> >>>> Koen
> >>>> _______________________________________________
> >>>> meta-ti mailing list
> >>>> meta-ti@yoctoproject.org
> >>>> https://lists.yoctoproject.org/listinfo/meta-ti
> >


