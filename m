Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 871FEE01757
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:42:53 -0800 (PST)
Received: by mail-pb0-f45.google.com with SMTP id ma3so923261pbc.32
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 09:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=3UX7Wq788Vxh+ZcSnCLIiZjZAtAKnLJcmo85/aWfrKc=;
	b=Zki7+2vI4jSL4MepY5p60p3rI64UxDncUO8cnAZiagoRtf/h+s8PySsKjxMT7xaj+4
	ksAI/N5StCeDPBhOj6Heyl4Y6BYV52fmcBQ166JDyXWg8J4jJH8wI8BznAJSN1Pe1zWz
	x+48NcW4+XUZdXizgRBiWOYAyzCQc6s5tFaHWglUP7V1/ZD7BKPZyEQ/qaAuBUQIstj1
	g56VhWbM+0j8eV9wVLuA+gb4YhTuXx0J2Kkvpi5yfiUtJdqBbWec3ZO1aMFxo+fpFFq4
	T8E5obGIoCi6awANFyFYGOlPdV/ijedEtzinHltJP37zDJqaYzbPcZLmpF9lpnDA0F+A
	bWqA==
X-Received: by 10.67.4.227 with SMTP id ch3mr11192749pad.74.1383846172978;
	Thu, 07 Nov 2013 09:42:52 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	ry4sm7920609pab.4.2013.11.07.09.42.51 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 09:42:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131107173726.GO4510@edge>
Date: Thu, 7 Nov 2013 09:42:50 -0800
Message-Id: <516AB7DB-4F1D-4040-A6D7-65413466DBF5@gmail.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
	<CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
	<20131107165950.GH4510@edge>
	<C8830048-B8B8-4303-90D6-3EB1EBE10E4C@gmail.com>
	<20131107173726.GO4510@edge>
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
X-List-Received-Date: Thu, 07 Nov 2013 17:42:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 9:37 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Thu, Nov 07, 2013 at 09:15:40AM -0800, Khem Raj wrote:
>>=20
>> On Nov 7, 2013, at 8:59 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>>=20
>>> On Wed, Nov 06, 2013 at 08:55:55PM -0800, Khem Raj wrote:
>>>> On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase <chase.maupin@ti.com> =
wrote:
>>>>> This seems like a reversal of =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3Ddabd83e96fe99d0c3d=
1a88be4d1637831526d217
>>>>>=20
>>>>> Looks like there may be a need to cover the different use cases =
and=20
>>>>> understand what each person is trying to do :)
>>>>>=20
>>>>=20
>>>> ah I see what caused this all pain. So now meta-ti is odd ball out.
>>>> this patch should have never gone in.
>>>=20
>>> Khem,
>>>=20
>>> If you remember, we discussed this with Richard and he suggested =
this as a=20
>>> solution to the ordering problem. Otherwise people tend to append =
any extra=20
>>> layers _after_ oe-core, which should be the other way around in =
order to=20
>>> override anything in there=85
>>=20
>> I think the problem is when you have many other layers then the whole=20=

>> paradigm changes to it and you end up with same issue upside down. I =
think=20
>> how you order bblayer.conf can control the override of oe-core, I =
wish if=20
>> distro=92s could control the layer.conf for each bsp layer then it =
wouldnt=20
>> matter as much
>=20
> I agree this is a bigger issue. I looked at some layers and found few =
that=20
> prepend themselves, while most of others just append.
>=20
> The order inside bblayers.conf is much more important than people let =
to=20
> believe. For example, if multiple layers define the machine config, =
the first=20
> one listed in bblayers.conf wins - this is a real problem for =
beagleboard.conf=20
> that is currently being defined in meta-ti as well as meta-yocto-bsp =
(as a=20
> reference platform) and meta-beagleboard too. Very soon the same =
problem will=20
> happen to beaglebone.conf, when meta-yocto-bsp picks it up as a =
reference...
>=20
> Anyway, the biggest issue I'm trying to work around with this change =
is the=20
> "shadowing" of the new-style DTBs that I ported from Dora to Dylan. If =
meta-ti=20
> is not in front of oe-core, the old-style DTBs come into play and DTBs =
are not=20
> built at all. So, this is not really an issue for Dora or master, and =
those=20
> don't need to be prepended after all=85


Now its even more intriguing since you changed meta-ti/master and I =
would have expected this change to
show up in meta-ti/dylan or are you claiming all sort of oe-core =
branches to work with meta-ti/master
thats a perilous path.

>=20
>=20
>>>>>> -----Original Message-----
>>>>>> From: meta-ti-bounces@yoctoproject.org[mailto:meta-ti-
>>>>>> bounces@yoctoproject.org] On Behalf Of Khem Raj
>>>>>> Sent: Thursday, November 07, 2013 7:55 AM
>>>>>> To: meta-ti@yoctoproject.org
>>>>>> Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of
>>>>>> layer world
>>>>>>=20
>>>>>> Currently, meta-ti appears as first path in BBPATH
>>>>>> rest of layers append so lets do the same
>>>>>>=20
>>>>>> helps distros with multiple BSP layers to include meta-ti
>>>>>>=20
>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>> ---
>>>>>> conf/layer.conf | 2 +-
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>>>>> index e39bd85..faa4ac0 100644
>>>>>> --- a/conf/layer.conf
>>>>>> +++ b/conf/layer.conf
>>>>>> @@ -1,5 +1,5 @@
>>>>>> # We have a conf and classes directory, append to BBPATH
>>>>>> -BBPATH =3D. "${LAYERDIR}:"
>>>>>> +BBPATH .=3D ":${LAYERDIR}"
>>>>>>=20
>>>>>> # We have a recipes directory, add to BBFILES
>>>>>> BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
>>>>>> ${LAYERDIR}/recipes*/*/*.bbappend"
>>>>>> --
>>>>>> 1.8.3.2
>>>>>>=20
>>>>>> _______________________________________________
>>>>>> meta-ti mailing list
>>>>>> meta-ti@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti


