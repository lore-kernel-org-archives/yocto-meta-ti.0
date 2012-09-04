Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 417E5E00344
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2012 06:53:44 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q84DrgeX025665;
	Tue, 4 Sep 2012 08:53:42 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q84DrgDg006015;
	Tue, 4 Sep 2012 08:53:42 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 4 Sep 2012 08:53:42 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Fix image recipes in meta-ti
Thread-Index: Ac2Ig7pGwFxbqvJjRsORVyoWs1t29wALPzCAAAOMOgAAJFZ/AAAH6Uxw//+ntWWAAGtFgP/9qo7g
Date: Tue, 4 Sep 2012 13:53:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591C76F0@DLEE12.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
	<20120901225617.GF22219@edge>
	<B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>,
	<8F29D6B095ED194EA1980491A5E029710C2B34AD@DFLE09.ent.ti.com>
	<26A1186D-E714-4AD6-BB0E-1743FB6DFA2A@ti.com>
	<2A0DAC13-04B3-4E44-B278-B6A22233C86D@dominion.thruhere.net>
In-Reply-To: <2A0DAC13-04B3-4E44-B278-B6A22233C86D@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Fix image recipes in meta-ti
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
X-List-Received-Date: Tue, 04 Sep 2012 13:53:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Sunday, September 02, 2012 4:11 PM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Fix image recipes in meta-ti
>=20
>=20
> Op 2 sep. 2012, om 21:47 heeft "Maupin, Chase"
> <chase.maupin@ti.com> het volgende geschreven:
>=20
> > I agree with Denys and Franklin here.  Meta-ti should be a
> straight BSP layer so we should remove distro dependencies.  This
> is the same as moving netbase changes to meta-arago.
>=20
> I'm not sure if what you mean by this example. The current
> netbase patch is the second try to get it into meta-ti, will
> there be a 3rd try?

This will be moved to meta-arago based on your feedback.  I think there wer=
e some questions about what you meant but it is understood now.

>=20
> >  There may be things in meta-ti that don't belong there and
> they should be moved to the appropriate location
>=20
> And I completely agree.
>=20
> > I understand that you have been using meta-ti and leading the
> way here, but that does not mean that we can't work together in
> this layer going forward.  You may have noticed that most of the
> TI SDK stuff has been going into meta-arago since that is where
> it belongs.  We are trying hard not to put things in meta-ti that
> will force others to use the arago distribution, I wouldask that
> we make sure the same applies for Angstrom as well, or any other
> distribution for that matter.
>=20
> So show me where it is being forced. Really. There are no
> requires, only includes. So if you mean by 'forcing' that a few
> warnings may scroll by than, yes, it's being 'forced'. If you
> mean that the only way to use meta-ti is by using angstrom, than
> no, it's not being 'forced'. So instead of spreading more FUD,
> can you please use more precise language for the problem at hand?
> As I said above, I agree that those images don't belong in meta-
> ti. But funnily enough, that was not my decision. I was told to
> keep them there. By TI.

Who told you to keep these here?  Now that we have a better understanding o=
f the layers and their purpose I'll close the loop within TI to make sure w=
e give a single answer.

>=20
> > I'm confused where the objection is to moving these recipes
> that rely on the Angstrom layer into the actual Angstrom layer?
>=20
> For one, it was TI that objected to it. I don't care if some part
> of TI is now changing course on that. I care if some other part
> of TI is going to change course again in a few weeks. Just make a
> clear decision and stick with it instead of not doing a thing and
> rekindling the same old discussion every other month.
> For two: They don't belong in the angstrom layer either, they are
> way too machine/SoC specific for that.
>=20
> >  Let's discuss that topic and how we can structure this layer
> to meet everyone's needs.  That would likely be more productive
> and save us all frustration.
>=20
> Like I said, I have no problem at all removing all beagle, bone
> and panda related things from meta-ti. In a previous incarnation
> of this discussion I offered to do that and was told by TI to
> keep everything in, both by SDO and AMBU people. So I'll offer it
> again now. So if you don't like that proposal, make a counter
> proposal.
> Being an external contributor for the past 6 months has given me
> a good sense of what works and what doesn't work and what the
> level of (non)support the community can expect from TI. To be
> clear: Denys is doing an awesome job managing meta-ti, someone
> send him some cookies.

Let's consider a meta-beagle layer.  I'm thinking we should work to have me=
ta-ti be a baseline of components we can agree on and move the rest to the =
appropriate layer.

>=20
> You work for TI, you get to dictate what happens in meta-ti, so
> make a proposal. I'm only a small part of the community, I have
> no illusions of being able to influence the direction of meta-ti.
> I can however look at your proposal and give my opinion on it.
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

