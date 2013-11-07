Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76CA5E01826
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 10:41:45 -0800 (PST)
Received: by mail-pb0-f52.google.com with SMTP id rr4so984067pbb.25
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 10:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=nZBmTYDCBR9CXtx6awUXjGJtK8ZyUuBpsUKjxmV3GJE=;
	b=nZDSvoQuJq/esJZC6uDgviDF/MfIyDLFgP9TCePAoRK/l2I9UKJsY5A7at7/V6/et3
	OKptC8v/2axwP8TpxqEt+6NypS/qazidbVsHYuf+N7U41MGRg01UTlOMqQMqHIj3fBk8
	6unh+KGCydQl4/ll4lgpYYfAspVpY+VmPseM8b+qQIg/6ls4ftkVFNqbHy8jXDFX0Guj
	rzxqy1NCexBEhjhbetaUK2n66wOSAjOPMJ86TaGZjs/Q7RSCveu3ZOXtmjfVBAMKgn4Q
	ZfLncJEJR0Uqr9g0DsBSWifPI6Nel6h/qUxGFe+t2W8Y4z0gkNNMwQ9++spTcEQM3kbZ
	ohpA==
X-Received: by 10.66.142.193 with SMTP id ry1mr11362485pab.150.1383849704747; 
	Thu, 07 Nov 2013 10:41:44 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	yg3sm8162619pab.16.2013.11.07.10.41.43 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 10:41:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131107182026.GS4510@edge>
Date: Thu, 7 Nov 2013 10:41:41 -0800
Message-Id: <D7020067-9982-4A59-8CE7-FE484943D982@gmail.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
	<CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
	<20131107165950.GH4510@edge>
	<C8830048-B8B8-4303-90D6-3EB1EBE10E4C@gmail.com>
	<20131107173726.GO4510@edge>
	<516AB7DB-4F1D-4040-A6D7-65413466DBF5@gmail.com>
	<20131107174751.GR4510@edge>
	<D342A8E2-C07C-44E6-B0A6-D035B8E543BB@gmail.com>
	<20131107182026.GS4510@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1816)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] adjust BBPATH to be a good citizen of layer world
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
X-List-Received-Date: Thu, 07 Nov 2013 18:41:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 10:20 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Thu, Nov 07, 2013 at 09:57:09AM -0800, Khem Raj wrote:
>>=20
>> On Nov 7, 2013, at 9:47 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>>=20
>>> On Thu, Nov 07, 2013 at 09:42:50AM -0800, Khem Raj wrote:
>>>>=20
>>>> On Nov 7, 2013, at 9:37 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>>>>=20
>>>>> On Thu, Nov 07, 2013 at 09:15:40AM -0800, Khem Raj wrote:
>>>>>>=20
>>>>>> On Nov 7, 2013, at 8:59 AM, Denys Dmytriyenko <denys@ti.com> =
wrote:
>>>>>>=20
>>>>>>> On Wed, Nov 06, 2013 at 08:55:55PM -0800, Khem Raj wrote:
>>>>>>>> On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase =
<chase.maupin@ti.com> wrote:
>>>>>>>>> This seems like a reversal of =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3Ddabd83e96fe99d0c3d=
1a88be4d1637831526d217
>>>>>>>>>=20
>>>>>>>>> Looks like there may be a need to cover the different use =
cases and=20
>>>>>>>>> understand what each person is trying to do :)
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> ah I see what caused this all pain. So now meta-ti is odd ball =
out.
>>>>>>>> this patch should have never gone in.
>>>>>>>=20
>>>>>>> Khem,
>>>>>>>=20
>>>>>>> If you remember, we discussed this with Richard and he suggested =
this as a=20
>>>>>>> solution to the ordering problem. Otherwise people tend to =
append any extra=20
>>>>>>> layers _after_ oe-core, which should be the other way around in =
order to=20
>>>>>>> override anything in there=85
>>>>>>=20
>>>>>> I think the problem is when you have many other layers then the =
whole=20
>>>>>> paradigm changes to it and you end up with same issue upside =
down. I think=20
>>>>>> how you order bblayer.conf can control the override of oe-core, I =
wish if=20
>>>>>> distro=92s could control the layer.conf for each bsp layer then =
it wouldnt=20
>>>>>> matter as much
>>>>>=20
>>>>> I agree this is a bigger issue. I looked at some layers and found =
few that=20
>>>>> prepend themselves, while most of others just append.
>>>>>=20
>>>>> The order inside bblayers.conf is much more important than people =
let to=20
>>>>> believe. For example, if multiple layers define the machine =
config, the first=20
>>>>> one listed in bblayers.conf wins - this is a real problem for =
beagleboard.conf=20
>>>>> that is currently being defined in meta-ti as well as =
meta-yocto-bsp (as a=20
>>>>> reference platform) and meta-beagleboard too. Very soon the same =
problem will=20
>>>>> happen to beaglebone.conf, when meta-yocto-bsp picks it up as a =
reference...
>>>>>=20
>>>>> Anyway, the biggest issue I'm trying to work around with this =
change is the=20
>>>>> "shadowing" of the new-style DTBs that I ported from Dora to =
Dylan. If meta-ti=20
>>>>> is not in front of oe-core, the old-style DTBs come into play and =
DTBs are not=20
>>>>> built at all. So, this is not really an issue for Dora or master, =
and those=20
>>>>> don't need to be prepended after all=85
>>>>=20
>>>>=20
>>>> Now its even more intriguing since you changed meta-ti/master and I =
would=20
>>>> have expected this change to show up in meta-ti/dylan or are you =
claiming=20
>>>> all sort of oe-core branches to work with meta-ti/master thats a =
perilous=20
>>>> path.
>>>=20
>>> It's in meta-ti/dylan AND meta-ti/master,
>>=20
>> yes. So can we change the master please ?
>=20
> I'll think about it ;)
>=20
>=20
>> oe-core is also appending itself in BBPATH in oe-core/master
>=20
> Yes, I know.
>=20
>=20
>> and so are meta-yocto-bsp and meta-beagleboard=20
>=20
> Also quite aware of that.
>=20
> But since you mention meta-yocto-bsp, which is part of Poky, do you =
know that=20
> meta-yocto prepends itself in front? And I believe there were one or =
two more=20
> obscure layers doing that as well=85

we can coerce them to change as well. if I have time I will go through
this on layers index. Its good in general to have this since its =
beneficial
and does larger good.

>=20
> BTW, I like the comment you made in meta-oe long time ago:
>=20
> # It really depends on order of the layers appearing in BBLAYERS
> # variable in toplevel bblayers.conf file, where bitbake will search
> # for .inc files and others where bitbake uses BBPATH since it will
> # search the directories from first to last as specified in BBPATH
> # Therefore if you want a given layer to be considered high priority
> # for the .inc and .conf etc. then consider it adding at the beginning
> # of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> # the recipe contention so the order of directories in BBFILES does=20
> # not matter.
>=20
> But the problem is that people don't read comments and don't bother =
with=20
> BBLAYERS order, hence I had to do what you suggested above with BBPATH =
order=20
> instead!


amen

>=20
>=20
>> so with mere ordering of these layers in your distro=92s bblayer.conf =
you=20
>> should be able to get desired behaviour.
>=20
> Well, it's not really a problem for Arago or Angstrom, as both provide =
setup=20
> tools to generate the correct bblayers.conf with the proper order of =
BBLAYERS.=20
> But the problem is really with Poky, as it expects people to manually =
add=20
> extra layers to bblayers.conf and people just tend to append =
everything AFTER=20
> oe-core and meta-yocto and meta-yocto-bsp. So, it's really Poky that =
is broken=20
> or rather unclear=85

yes and I think as long as all layers follow append model it will bring =
some santiy
to poky model as well.



