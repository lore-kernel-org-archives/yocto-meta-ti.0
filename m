Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0DC8E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:55:45 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKtijq014847;
	Fri, 27 Jan 2012 14:55:44 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKtijQ006734;
	Fri, 27 Jan 2012 14:55:44 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 27 Jan 2012 14:55:44 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from	arago overlay
Thread-Index: AQHM3TXACXIhJB3wmUyhLZp3xboUsJYgsWFw
Date: Fri, 27 Jan 2012 20:55:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9DB56@DLEE12.ent.ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org>
	<02FC2B87-16E6-419F-9889-E070516AA122@dominion.thruhere.net>
In-Reply-To: <02FC2B87-16E6-419F-9889-E070516AA122@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 27 Jan 2012 20:55:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Friday, January 27, 2012 2:54 PM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> arago overlay
>=20
>=20
> Op 27 jan. 2012, om 21:21 heeft Denys Dmytriyenko het volgende
> geschreven:
>=20
> > On Fri, Jan 27, 2012 at 08:17:42PM +0000, Maupin, Chase wrote:
> >>> -----Original Message-----
> >>> From: Mills, William
> >>> Sent: Friday, January 27, 2012 2:11 PM
> >>> To: Maupin, Chase
> >>> Cc: Koen Kooi; meta-ti@yoctoproject.org
> >>> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port
> from
> >>> arago overlay
> >>>
> >>>
> >>> On 01/27/2012 02:46 PM, Maupin, Chase wrote:
> >>>> I guess we have a difference of opinion on how we see meta-
> arago.
> >>> I
> >>>> don?t separate that layer into distro and non-distro. I was
> >>> really
> >>>> planning on meta-arago being all the stuff related to the
> >>> arago/SDK
> >>>> distribution. Meta-ti is for TI packages that can be used by
> >>> other
> >>>> distros. That being said I'm OK with meta-ti being split into
> a
> >>> BSP
> >>>> layer and everthing else, but I don't know exactly what that
> buys
> >>> us.
> >>>> Does it particularly hurt someone that pulls in meta-ti to
> have
> >>> access
> >>>> to matrix if they don't use it? I pull in things from meta-oe
> or
> >>>> oe-core that I don?t "need" but they are there anyway.
> >>>
> >>> Do you know that everything you are putting in meta-ti today
> only
> >>> depends on oe-core?  I don't think you do as we are not testing
> >>> that
> >>> today.  Yes, in the old days a recipie collection had tons of
> stuff
> >>> that
> >>> would be present but just fail if you actually tried to use it.
> >>> The
> >>> point of layers was to clean that up.
> >>
> >> Not sure what your comment about only needing oe-core is.  For
> example I use
> >> lmbench but I don?t see that in oe-core.  I get that from meta-
> oe.  I can
> >> agree to spliting meta-ti into two layers, a HW layer for our
> devices and a
> >> layer containing all of the TI recipes.
> >>
> >> But if we wanted to match the meta-intel layer way would you
> also propose
> >> making a layer per device?  I personally find that more
> confusing.
> >
> > I don't think that was Bill's message. It was simplicity. BSP
> only layer, no
> > supplemental apps, if not absolutely required.
> >
> > Your example with lmbench is not correct - BSP layer should be
> simple enough
> > to be used with OE-Core alone to produce a console rootfs image
> with nothing
> > but busybox.
> >
> > How about splitting meta-ti into:
> > * BSP only
> > * SGX graphics
> > * DSP tools
>=20
> Since sgx and dsp are built into the SoC, why isn't it considered
> BSP? I must really start warming about getting overzealous with
> layers and breeding a silo mentality. I'm not saying we only need
> one layer, but not a gazillion like the base proposal.

I did not read the above as making a bunch of layers in meta-ti.  At the ri=
sk of getting this all started again, I really hope meta-ti is one layer wi=
th BSP, SGX, DSP, WiFi support for our devices. =20

>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

