Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C078E0049D
	for <meta-ti@yoctoproject.org>; Sun,  2 Sep 2012 14:11:20 -0700 (PDT)
Received: by eabd1 with SMTP id d1so1521511eab.35
	for <meta-ti@yoctoproject.org>; Sun, 02 Sep 2012 14:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=miJGYTto0uuTYebT1/NHQjzBPseLKbI6EfijnJse84c=;
	b=YAD+gmPLKRLUKBKUT38IukKdiIMR8Yaj59082X8edWEL2L6KSxVJdl92QKX3Y3H0ro
	fAhUnXjXrQoLVX1pxc0/VXUVeTGl3QPDUk1X6xtLEIlUVatN7r69zIPkp3qSTbS0KCWB
	DtdL1iGznUGRehWN/XKh5Iyi88U2t62whBo+lh6ELH2H/V57dwivy4c6N8XqKgg5qAu8
	DcauPjC9E2fZLhCB1Pv1Sfpzq4c7/Dh6DrHbjwsgAFkVurjCmHND8WQptuPjaP0G8puV
	yILsZwcdNNC7/yOeYCDFRBoivO5tYXt2yehs5PCtMDrbcuY9XVlpU2ZSGOnW3CiElhtI
	I+Pg==
Received: by 10.14.215.193 with SMTP id e41mr18793449eep.44.1346620276682;
	Sun, 02 Sep 2012 14:11:16 -0700 (PDT)
Received: from ?IPv6:2001:610:612::91cb:5d29:e17:5fb?
	([2001:610:612:0:91cb:5d29:e17:5fb])
	by mx.google.com with ESMTPS id 45sm30905905eeb.8.2012.09.02.14.11.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 14:11:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <26A1186D-E714-4AD6-BB0E-1743FB6DFA2A@ti.com>
Date: Sun, 2 Sep 2012 23:11:13 +0200
Message-Id: <2A0DAC13-04B3-4E44-B278-B6A22233C86D@dominion.thruhere.net>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
	<20120901225617.GF22219@edge>
	<B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>,
	<8F29D6B095ED194EA1980491A5E029710C2B34AD@DFLE09.ent.ti.com>
	<26A1186D-E714-4AD6-BB0E-1743FB6DFA2A@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQm6Cm+Q/Eat05m1P16w5KRSvggvo4yf1ple36O9YYaSrK5zwICJXnGylBqw0A/KISyajYLs
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
X-List-Received-Date: Sun, 02 Sep 2012 21:11:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 sep. 2012, om 21:47 heeft "Maupin, Chase" <chase.maupin@ti.com> het =
volgende geschreven:

> I agree with Denys and Franklin here.  Meta-ti should be a straight =
BSP layer so we should remove distro dependencies.  This is the same as =
moving netbase changes to meta-arago.

I'm not sure if what you mean by this example. The current netbase patch =
is the second try to get it into meta-ti, will there be a 3rd try?=20

>  There may be things in meta-ti that don't belong there and they =
should be moved to the appropriate location

And I completely agree.

> I understand that you have been using meta-ti and leading the way =
here, but that does not mean that we can't work together in this layer =
going forward.  You may have noticed that most of the TI SDK stuff has =
been going into meta-arago since that is where it belongs.  We are =
trying hard not to put things in meta-ti that will force others to use =
the arago distribution, I wouldask that we make sure the same applies =
for Angstrom as well, or any other distribution for that matter.

So show me where it is being forced. Really. There are no requires, only =
includes. So if you mean by 'forcing' that a few warnings may scroll by =
than, yes, it's being 'forced'. If you mean that the only way to use =
meta-ti is by using angstrom, than no, it's not being 'forced'. So =
instead of spreading more FUD, can you please use more precise language =
for the problem at hand? As I said above, I agree that those images =
don't belong in meta-ti. But funnily enough, that was not my decision. I =
was told to keep them there. By TI.

> I'm confused where the objection is to moving these recipes that rely =
on the Angstrom layer into the actual Angstrom layer?

For one, it was TI that objected to it. I don't care if some part of TI =
is now changing course on that. I care if some other part of TI is going =
to change course again in a few weeks. Just make a clear decision and =
stick with it instead of not doing a thing and rekindling the same old =
discussion every other month.
For two: They don't belong in the angstrom layer either, they are way =
too machine/SoC specific for that.

>  Let's discuss that topic and how we can structure this layer to meet =
everyone's needs.  That would likely be more productive and save us all =
frustration.

Like I said, I have no problem at all removing all beagle, bone and =
panda related things from meta-ti. In a previous incarnation of this =
discussion I offered to do that and was told by TI to keep everything =
in, both by SDO and AMBU people. So I'll offer it again now. So if you =
don't like that proposal, make a counter proposal.
Being an external contributor for the past 6 months has given me a good =
sense of what works and what doesn't work and what the level of =
(non)support the community can expect from TI. To be clear: Denys is =
doing an awesome job managing meta-ti, someone send him some cookies.

You work for TI, you get to dictate what happens in meta-ti, so make a =
proposal. I'm only a small part of the community, I have no illusions of =
being able to influence the direction of meta-ti. I can however look at =
your proposal and give my opinion on it.=

