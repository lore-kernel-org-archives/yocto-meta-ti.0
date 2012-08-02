Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2078E00289
	for <meta-ti@yoctoproject.org>; Thu,  2 Aug 2012 07:53:10 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q72Er9Vo009328;
	Thu, 2 Aug 2012 09:53:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q72Er9JW012038;
	Thu, 2 Aug 2012 09:53:09 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 2 Aug 2012 09:53:09 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-ti] [branch: master][PATCHES] Porting netbase interfaces
	file from oe-classic
Thread-Index: AQHNcGM2MDN1+yKZUEmnJQM0YWA9x5dGm++A
Date: Thu, 2 Aug 2012 14:53:08 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159175366@DLEE12.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
	<102FAACD-FA2C-45CD-B8E8-E1BF93554183@dominion.thruhere.net>
In-Reply-To: <102FAACD-FA2C-45CD-B8E8-E1BF93554183@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [branch: master][PATCHES] Porting netbase interfaces	file from oe-classic
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
X-List-Received-Date: Thu, 02 Aug 2012 14:53:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Wednesday, August 01, 2012 10:59 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [branch: master][PATCHES] Porting netbase
> interfaces file from oe-classic
>=20
> Please send patches inline to make review easier.
>=20
> Patch 1:
>=20
> > * Add PR_append
>=20
> Don't do that, that's what PRINC is for
>=20
> > * Pull in the base interface file from oe-core
>=20
> Completely unneeded

I actually prefer that the first commit move in the base file he
is modifying and then have the second commit make his changes.
It is much easier to understand what change he was making to the
base file and why he needing to overlay it.

>=20
> > * Update to use the new syntax for extending the file search
> path
>=20
> Patch 2:
>=20
> > Update interface file based on changes made to the interface
> file
>   in arago
>=20
> THe interfaces file is supposed to be machine specific, so a "one
> file to rule them all" is completely unacceptable in meta-ti. If
> you want to go such a route, do it in meta-arago. Even so, I
> strongly recommend against that.
>=20
> Op 1 aug. 2012, om 21:07 heeft "Cooper Jr., Franklin"
> <fcooper@ti.com> het volgende geschreven:
>=20
> > Attached patches are for porting the netbase interface file
> used in arago/oe-classic to meta-ti.
> >
> > The difference between my interfaces file and the one in
> beagleboard directory seems very minor. Would it be ok to combine
> the changes from both files into a single file? The auto usb0
> looks like it might be an issue if we combined the two files.
> Would it make sense to append that line to the interface file
> during do_install_append step only for the beagleboard platform
> and consolidate the rest of the differences?
> >
> > diff beagleboard/interfaces interfaces
> > 13a14,17
> > > iface tiwlan0 inet dhcp
> > >    wireless_mode managed
> > >    wireless_essid any
> > >
> > 18a23,24
> > >         pre-up /bin/grep -v -e "ip=3D[0-9]\+\.[0-9]\+\.[0-
> 9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> > >
> > 21,22c27,28
> > < # Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard
> xM
> > < auto usb0
> > ---
> > > # Ethernet/RNDIS gadget (g_ether)
> > > # ... or on host side, usbnet and random hwaddr
> >
> >
> > Regards,
> > Franklin Cooper Jr.
> > Texas Instruments
> > Application Engineer
> > fcooper@ti.com
> >
> > <0001-netbase-Add-base-interface-file.patch><0002-netbase-
> Update-interface-
> file.patch>_______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

