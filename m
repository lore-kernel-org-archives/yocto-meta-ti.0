Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86DB6E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:39:23 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKdM3S012024;
	Fri, 27 Jan 2012 14:39:22 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKdM8N014599;
	Fri, 27 Jan 2012 14:39:22 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 27 Jan 2012 14:39:22 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from arago overlay
Thread-Index: AQHM3TO/GjDr/rvaXE2FdDXpUeIY/A==
Date: Fri, 27 Jan 2012 20:39:21 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9D9FE@DLEE12.ent.ti.com>
References: <4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
	<20120127203433.GG8707@denix.org>
In-Reply-To: <20120127203433.GG8707@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:39:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Friday, January 27, 2012 2:35 PM
> To: Maupin, Chase
> Cc: Mills, William; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> arago overlay
>=20
> On Fri, Jan 27, 2012 at 08:29:42PM +0000, Maupin, Chase wrote:
> > > > I don't think that was Bill's message. It was simplicity. BSP
> > > only layer, no
> > > > supplemental apps, if not absolutely required.
> > > >
> > > > Your example with lmbench is not correct - BSP layer should
> be
> > > simple enough
> > > > to be used with OE-Core alone to produce a console rootfs
> image
> > > with nothing
> > > > but busybox.
> > > >
> > > > How about splitting meta-ti into:
> > > > * BSP only
> > > > * SGX graphics
> > > > * DSP tools
> > > > * WiFi etc.
> > > >
> > > > And then splitting meta-arago into:
> > > > * Arago distro for TI SDKs
> > > > * Supplemental apps
> > > >
> > >
> > > Need to get my "YES!" in here before everyone barfs all over
> the
> > > proposal :)
> >
> > I'm good with this.  I was also planning in meta-arago to at
> least put all
> > bbappends in a recipes-appends directory so it was easy to track
> the things
> > we are "tweaking" vs. the recipes.  Arago today is too much of a
> mix between
> > amends and recipes in my opinion.  I would even say that Tom's
> proposal
> > (from IRC) of splitting the arago distro and supplemental apps
> into two
> > layers would be a good idea so that other distros can pull our
> supplemental
> > apps if they want pretty easily.  And that way we don?t keep
> adding more
> > repos to manage.
>=20
> Actually that was my proposal (and Bill's offline), but never mind
> :)
>=20
> As of today's state of Arago - if you don't count recipes/ti, which
> was
> "untouchable" for some special reasons, everything else is quite
> clean with
> using amends everywhere possible! And our of all the people you
> should know
> this better.

There are plenty of recipes in arago outside of the ti directory that are n=
ot just amends.  What I am saying is that I would like to split the bbappen=
ds into their own directory so that we can more easily track what we are ap=
pending and ideally find ways to drive those changes into lower common laye=
rs (not that we always can)

>=20
> --
> Denys

