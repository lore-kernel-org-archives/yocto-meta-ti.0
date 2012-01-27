Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3A90E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 11:46:59 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RJkwQ8006456;
	Fri, 27 Jan 2012 13:46:58 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RJkwRq003715;
	Fri, 27 Jan 2012 13:46:58 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 27 Jan 2012 13:46:58 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Mills, William" <wmills@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from	arago overlay
Thread-Index: AQHM3SxtCXIhJB3wmUyhLZp3xboUsA==
Date: Fri, 27 Jan 2012 19:46:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
In-Reply-To: <4F22E41B.8070708@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from	arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 19:47:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mills, William
> Sent: Friday, January 27, 2012 11:51 AM
> To: Maupin, Chase
> Cc: Koen Kooi; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> arago overlay
>=20
> On 01/27/2012 08:50 AM, Maupin, Chase wrote:
>=20
>  > but I definitely don=92t think matrix belongs in meta-arago
>=20
> Why, justify.  Yes matrix needs to be different than the distro
> definition on arago but As you point out below the only people
> using
> Matrix are Arago and Koen in Angstrom.  I think this comes down to
> not
> wanting the word "arago" occurring in the Angstrom layer stack.
>=20
> meta-ti should be about using TI chips.  Matrix and other demo
> programs
> we put together for our demo distro are not essential to using TI
> chips.

I guess we have a difference of opinion on how we see meta-arago.  I don=92=
t separate that layer into distro and non-distro.  I was really planning on=
 meta-arago being all the stuff related to the arago/SDK distribution.  Met=
a-ti is for TI packages that can be used by other distros.  That being said=
 I'm OK with meta-ti being split into a BSP layer and everthing else, but I=
 don't know exactly what that buys us.  Does it particularly hurt someone t=
hat pulls in meta-ti to have access to matrix if they don't use it?  I pull=
 in things from meta-oe or oe-core that I don=92t "need" but they are there=
 anyway.

>=20
> >
> > 1. As of now matrix is only maintained by TI and used by TI (and
> Koen to some extent) on our products.  So I would put this in a
> layer that we maintain because it would seem strange to me to have
> to go through another set of maintainers to update the SRCREV of
> the package we are developing.  Particularly if no one is using it.
> > 2. If people wanted matrix they could still include our layer to
> get it.  If we see that happening a lot a there is a request from a
> group of people to have this then we could push it lower, but if we
> are the only ones using it and who care about it then I don't see
> the reason to move this lower in the layer stack.
> >

