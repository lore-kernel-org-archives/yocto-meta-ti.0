Return-Path: <jkridner@beagleboard.org>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C067E01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 16:16:44 -0700 (PDT)
Received: by weyu3 with SMTP id u3so2481620wey.35
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 16:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=DFz+mqaxUFZTMrmgiu3g432P63B3tSJBnhdFnl2QBOM=;
	b=l5R6JnA5STJP1cIsLK6SJNvyd2A0NgHIZggnSvvgnnhA0QxAQOQV14Tgi4KedGCp+b
	R2PDvfAqTGRtL5rf0iAKCifNF419nbhg5uy3bpEKve61NY0hecwlQxmbSG/mdStH+N2Q
	OFeoHb2Kn9b8lECBJjHAH4TR7K21bFklr/A/3k1jGoBksLsHjDYUXkSDE+XphRa99qOh
	WTvGQFia5fQ/rNhBLpc+t7egCdkBBOXxyzMZilN506VL0YicJa3/SLzQyOysiCR5AJHN
	3IbSK/53i46uqV6D8bdl18zbKGsW3cxqXk0c0KDu7Fi7wMV6eQ/cz3t9Yt+GOAwC1Lpr
	qhKg==
Received: by 10.216.133.148 with SMTP id q20mr312434wei.201.1347578203800;
	Thu, 13 Sep 2012 16:16:43 -0700 (PDT)
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mx.google.com with ESMTPS id hv8sm10486wib.0.2012.09.13.16.16.42
	(version=SSLv3 cipher=OTHER); Thu, 13 Sep 2012 16:16:42 -0700 (PDT)
Received: by wgx1 with SMTP id 1so2105137wgx.11
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 16:16:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.242.204 with SMTP id i54mr351751wer.94.1347578201752; Thu,
	13 Sep 2012 16:16:41 -0700 (PDT)
Received: by 10.223.144.133 with HTTP; Thu, 13 Sep 2012 16:16:41 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED101591C76F0@DLEE12.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
	<20120901225617.GF22219@edge>
	<B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2B34AD@DFLE09.ent.ti.com>
	<26A1186D-E714-4AD6-BB0E-1743FB6DFA2A@ti.com>
	<2A0DAC13-04B3-4E44-B278-B6A22233C86D@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED101591C76F0@DLEE12.ent.ti.com>
Date: Thu, 13 Sep 2012 19:16:41 -0400
Message-ID: <CA+T6QPk82mRgF6u+k6mkBrsOaXB--3ODMcJwOV2fhyi8sMaQ5w@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Gm-Message-State: ALoCoQnsmJ1J0DoV/h/8VsjwOq0ZVt+8bFjKnTjPtH8K7dUgjkSyHi4eBFqxcuerumHLJCo5VoI+
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 13 Sep 2012 23:16:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 4, 2012 at 9:53 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
>> Sent: Sunday, September 02, 2012 4:11 PM
>> To: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] Fix image recipes in meta-ti
>>
>>
>> Op 2 sep. 2012, om 21:47 heeft "Maupin, Chase"
>> <chase.maupin@ti.com> het volgende geschreven:
>>
>> > I agree with Denys and Franklin here.  Meta-ti should be a
>> straight BSP layer so we should remove distro dependencies.  This
>> is the same as moving netbase changes to meta-arago.
>>
>> I'm not sure if what you mean by this example. The current
>> netbase patch is the second try to get it into meta-ti, will
>> there be a 3rd try?
>
> This will be moved to meta-arago based on your feedback.  I think there were some questions about what you meant but it is understood now.
>
>>
>> >  There may be things in meta-ti that don't belong there and
>> they should be moved to the appropriate location
>>
>> And I completely agree.
>>
>> > I understand that you have been using meta-ti and leading the
>> way here, but that does not mean that we can't work together in
>> this layer going forward.  You may have noticed that most of the
>> TI SDK stuff has been going into meta-arago since that is where
>> it belongs.  We are trying hard not to put things in meta-ti that
>> will force others to use the arago distribution, I wouldask that
>> we make sure the same applies for Angstrom as well, or any other
>> distribution for that matter.
>>
>> So show me where it is being forced. Really. There are no
>> requires, only includes. So if you mean by 'forcing' that a few
>> warnings may scroll by than, yes, it's being 'forced'. If you
>> mean that the only way to use meta-ti is by using angstrom, than
>> no, it's not being 'forced'. So instead of spreading more FUD,
>> can you please use more precise language for the problem at hand?
>> As I said above, I agree that those images don't belong in meta-
>> ti. But funnily enough, that was not my decision. I was told to
>> keep them there. By TI.
>
> Who told you to keep these here?  Now that we have a better understanding of the layers and their purpose I'll close the loop within TI to make sure we give a single answer.
>
>>
>> > I'm confused where the objection is to moving these recipes
>> that rely on the Angstrom layer into the actual Angstrom layer?
>>
>> For one, it was TI that objected to it. I don't care if some part
>> of TI is now changing course on that. I care if some other part
>> of TI is going to change course again in a few weeks. Just make a
>> clear decision and stick with it instead of not doing a thing and
>> rekindling the same old discussion every other month.
>> For two: They don't belong in the angstrom layer either, they are
>> way too machine/SoC specific for that.
>>
>> >  Let's discuss that topic and how we can structure this layer
>> to meet everyone's needs.  That would likely be more productive
>> and save us all frustration.
>>
>> Like I said, I have no problem at all removing all beagle, bone
>> and panda related things from meta-ti. In a previous incarnation
>> of this discussion I offered to do that and was told by TI to
>> keep everything in, both by SDO and AMBU people. So I'll offer it
>> again now. So if you don't like that proposal, make a counter
>> proposal.
>> Being an external contributor for the past 6 months has given me
>> a good sense of what works and what doesn't work and what the
>> level of (non)support the community can expect from TI. To be
>> clear: Denys is doing an awesome job managing meta-ti, someone
>> send him some cookies.
>
> Let's consider a meta-beagle layer.  I'm thinking we should work to have meta-ti be a baseline of components we can agree on and move the rest to the appropriate layer.

Chase, patches for meta-ti?

Koen, if I am the one who directed you to keep beagle stuff in meta-ti
(and I probably was and wasn't very specific in my language), it was
for the purpose of having the highest degree of collaboration. I
believe where we are landing is that the kernel mainline is the
primary point of collaboration and other attempts to collaborate on a
distro will mostly happen outside of meta-ti, such as in u-boot,
oe-core, meta-oe, etc.

I know Chase would like to keep meta-ti as a collaborative layer and
I'm not aware of any efforts to remove kernel recipes, etc. for any of
the platforms, but I'd like to free up any hard-and-fast directive
that BeagleBoard.org distros need to be made using BSPs from meta-ti.
While I certainly prefer if the TI SDK distro and BeagleBoard.org
distro used the same BSP to help customers migrate between them,
collaboration seems to be going well at a kernel and bootloader level
without having the same BSP thanks to a focus on upstream
contributions. I believe enabling everyone to work fast and
efficiently on their own distros, the mainline kernels and mainline
bootloaders is more critical than having a common BSP layer at this
point.

Let the flames begin, because I've probably said the wrong thing yet
again, but I'm hopeful something will happen, even though I don't have
a patch of my own here.

>
>>
>> You work for TI, you get to dictate what happens in meta-ti, so
>> make a proposal. I'm only a small part of the community, I have
>> no illusions of being able to influence the direction of meta-ti.
>> I can however look at your proposal and give my opinion on it.

Denys, Chase, patches and statements as to what is and isn't allowed in meta-ti?

>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

