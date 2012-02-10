Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8905E003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 08:06:00 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1AG5wZQ024672;
	Fri, 10 Feb 2012 10:05:58 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1AG5wNE024879;
	Fri, 10 Feb 2012 10:05:58 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Fri, 10 Feb 2012 10:05:58 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] Merging in linux-stable updates, git send-email
Thread-Index: AQHM5/1qFTS2IEiSbky2nJz4S1BXypY2OkTQgABn/wD//6jSUA==
Date: Fri, 10 Feb 2012 16:05:58 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012766AE0A@DLEE12.ent.ti.com>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
	<35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
In-Reply-To: <35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 10 Feb 2012 16:06:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

So you changed the recipe name to use 3.2.5 for the PV.  But when I set the=
 DISTRO_FEATURES to include tipspkernel I don't get all the patches you add=
ed to update to 3.2.5.  So can you maybe do a logic similar to how the patc=
hes are handled to set the PV based on whether tipspkernel is set in DISTRO=
_FEATURES?

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
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Friday, February 10, 2012 9:16 AM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Merging in linux-stable updates, git send-
> email
>=20
>=20
> Op 10 feb. 2012, om 16:05 heeft Maupin, Chase het volgende
> geschreven:
>=20
> > Koen,
> >
> > Which recipe are you going to update here?  I assume this is not
> the linux-ti33x-psp_3.2.bb recipe but something else?
>=20
> Exactly that recipe: https://github.com/Angstrom-distribution/meta-
> ti/commit/a77ccb569019bba7cefc72e598504d26a72fa596
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
> >> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> >> Sent: Friday, February 10, 2012 8:08 AM
> >> To: meta-ti@yoctoproject.org
> >> Subject: [meta-ti] Merging in linux-stable updates, git send-
> email
> >>
> >> Hi,
> >>
> >> The update to 3.2.5 for the bone kernel is almost done, but it
> >> involves adding ~275 patches. Does it make sense to git-send-
> email
> >> that megapatch for review? The difficulty is rooted in the
> origin
> >> of the TI kernel: linux-omap instead of Linus' tree, so we can't
> >> (easily) rebase all the patches on top of 3.2.5, so it's
> actually
> >> 3.2.5 rebased onto TI v3.2-staging and then the extra beaglebone
> >> patches added.
> >>
> >> Git am -3 takes care of duplicate patches and automerging
> conflicts
> >> but I'd still like to find out what the best way to review this
> is.
> >>
> >> regards,
> >>
> >> Koen
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti


