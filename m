Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB8F5E01407
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 06:02:50 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q21E2nBf005920;
	Thu, 1 Mar 2012 08:02:49 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q21E2npT005174;
	Thu, 1 Mar 2012 08:02:49 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Thu, 1 Mar 2012 08:02:49 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH 0/3] beagleboard.org board updates
Thread-Index: AQHM94gigEtgpw6FnEyBcBSU+/weaZZVYq8AgABpjID//6MQ8IAAZv4A//+cX1CAAGidgP//nXmw
Date: Thu, 1 Mar 2012 14:02:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012F047344@DLEE12.ent.ti.com>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F046F8B@DLEE12.ent.ti.com>
	<6D001A61-BBF4-4826-BA21-0C4F639CC31B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F047178@DLEE12.ent.ti.com>
	<2EA89E7A-F40C-4A9C-B386-5619BF0989E0@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F0471F8@DLEE12.ent.ti.com>
	<91B3D88B-3378-475D-A993-918B1793441E@dominion.thruhere.net>
In-Reply-To: <91B3D88B-3378-475D-A993-918B1793441E@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH 0/3] beagleboard.org board updates
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
X-List-Received-Date: Thu, 01 Mar 2012 14:02:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Thursday, March 01, 2012 7:55 AM
> To: Maupin, Chase
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 0/3] beagleboard.org board updates
>=20
>=20
> Op 1 mrt. 2012, om 14:41 heeft Maupin, Chase het volgende
> geschreven:
>=20
> >
> >> -----Original Message-----
> >> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> >> Sent: Thursday, March 01, 2012 7:37 AM
> >> To: Maupin, Chase
> >> Cc: meta-ti@lists.yoctoproject.org
> >> Subject: Re: [meta-ti] [PATCH 0/3] beagleboard.org board updates
> >>
> >>
> >> Op 1 mrt. 2012, om 14:29 heeft Maupin, Chase het volgende
> >> geschreven:
> >>
> >>>
> >>>> -----Original Message-----
> >>>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> >>>> Sent: Thursday, March 01, 2012 7:01 AM
> >>>> To: Maupin, Chase
> >>>> Cc: meta-ti@lists.yoctoproject.org
> >>>> Subject: Re: [meta-ti] [PATCH 0/3] beagleboard.org board
> updates
> >>>>
> >>>>
> >>>> Op 1 mrt. 2012, om 13:44 heeft Maupin, Chase het volgende
> >>>> geschreven:
> >>>>
> >>>>> Koen,
> >>>>>
> >>>>> Why "add" the two patches from the PSP tree for linux-ti33x-
> psp
> >>>> recipe?  Shouldn't those be picked up by changing the base
> that
> >> you
> >>>> are pulling from.  i.e. bumping the SRCREV of the base PSP
> tree?
> >>>>
> >>>> I can't, the hwmod fixes for the ADC drivers break our sysfs
> >>>> interface hack.
> >>>
> >>> Is there a plan to fix this going forward?
> >>
> >> Devicetree...
> >>
> >>> I doubt we can avoid updating the base kernel forever.
> >>
> >> I know, I'm hoping we can fix it before an update is needed. The
> >> current SRCREV corresponds with a psp release, so we should be
> >> reasonably safe.
> >
> > True, but there is a release coming at the end of the month.
> Just FYI.
>=20
> In the extreme case I can add 4 reverts for the TSC stuff, but I
> really don't want to go there. The new code is a big step forward.
>=20
> >
> >>>
> >>> Plus, when we switch our SDKs to using oe-core we will be
> >> updating the base kernel.
> >>
> >> I hope that is a few weeks out :)
> >
> > Until I get time to work on it then yes, it is several weeks out
> :).  But you may want some of the changes in the next PSP release
> for PM.
>=20
> Do I get access to that super-secret M3 firmware needed for proper
> PM as well? And will I be able to rebuild that with the cgt/arm
> toolchain? Right now enabling CONFIG_SUSPEND will block the boot
> for 60 seconds timing out on the m3 firmware.

Unknown.  I don't think CONFIG_SUSPEND is supported right now though.

>=20
> regards,
>=20
> Koen

