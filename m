Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF6EAE00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:29:44 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKTheU002142;
	Fri, 27 Jan 2012 14:29:43 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKTgJi000991;
	Fri, 27 Jan 2012 14:29:42 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 27 Jan 2012 14:29:42 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Mills, William" <wmills@ti.com>, Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from arago overlay
Thread-Index: AQHM3TJmuoxI7pCT30C57O/TG7KL8w==
Date: Fri, 27 Jan 2012 20:29:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
In-Reply-To: <4F230803.1070503@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:29:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mills, William
> Sent: Friday, January 27, 2012 2:25 PM
> To: Denys Dmytriyenko
> Cc: Maupin, Chase; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> arago overlay
>=20
>=20
>=20
> On 01/27/2012 03:21 PM, Denys Dmytriyenko wrote:
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
> > * WiFi etc.
> >
> > And then splitting meta-arago into:
> > * Arago distro for TI SDKs
> > * Supplemental apps
> >
>=20
> Need to get my "YES!" in here before everyone barfs all over the
> proposal :)

I'm good with this.  I was also planning in meta-arago to at least put all =
bbappends in a recipes-appends directory so it was easy to track the things=
 we are "tweaking" vs. the recipes.  Arago today is too much of a mix betwe=
en amends and recipes in my opinion.  I would even say that Tom's proposal =
(from IRC) of splitting the arago distro and supplemental apps into two lay=
ers would be a good idea so that other distros can pull our supplemental ap=
ps if they want pretty easily.  And that way we don=92t keep adding more re=
pos to manage.

>=20
> Chase: your right.  I do not want to follow intel's example of
> layer per
> BSP.


