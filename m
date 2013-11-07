Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC8FAE017F8
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:57:11 -0800 (PST)
Received: by mail-pa0-f41.google.com with SMTP id rd3so973103pab.14
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 09:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+5H0MMdmJsJiuSdllkbbwnqlz/+xyZCfnUoZnG8bfAo=;
	b=DYUsUkX3IZ2EYolL9FBDeTNoPI+DRL7Mi6/bQ5TPV3zlRZAEPSdlYCPedFDqmG4Wuk
	fAWSJ48zO/8KAmYByuA80mHyupCM96vQnaRRB6K2h91lnIq97+lHLPmTU9Hgid5yUrwY
	54aEOEGqpoGrWmggQEA17DIXHG3Z7FLro6O6ycsf9BKrreFo+QkLLA2wjaqF7P1EF9JH
	IsOzbmL1Te/CJb8OzfQiGWGzWwhV7YGoOokxABWK49KfNAB8WGiWv/UDlcz2MBU6lYVT
	2WuBUvkzFp9DgJvf8sOBM8WBateCUwP1ZyWIppkv9x8W9amJrOMd+jkvdkGHVc9vmdl6
	Ikew==
X-Received: by 10.68.217.33 with SMTP id ov1mr10217522pbc.6.1383847031288;
	Thu, 07 Nov 2013 09:57:11 -0800 (PST)
Received: from [192.168.0.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPSA id iu7sm6481202pbc.45.2013.11.07.09.57.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 09:57:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131107174751.GR4510@edge>
Date: Thu, 7 Nov 2013 09:57:09 -0800
Message-Id: <D342A8E2-C07C-44E6-B0A6-D035B8E543BB@gmail.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
	<CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
	<20131107165950.GH4510@edge>
	<C8830048-B8B8-4303-90D6-3EB1EBE10E4C@gmail.com>
	<20131107173726.GO4510@edge>
	<516AB7DB-4F1D-4040-A6D7-65413466DBF5@gmail.com>
	<20131107174751.GR4510@edge>
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
X-List-Received-Date: Thu, 07 Nov 2013 17:57:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 9:47 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Thu, Nov 07, 2013 at 09:42:50AM -0800, Khem Raj wrote:
>>=20
>> On Nov 7, 2013, at 9:37 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>>=20
>>> On Thu, Nov 07, 2013 at 09:15:40AM -0800, Khem Raj wrote:
>>>>=20
>>>> On Nov 7, 2013, at 8:59 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>>>>=20
>>>>> On Wed, Nov 06, 2013 at 08:55:55PM -0800, Khem Raj wrote:
>>>>>> On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase =
<chase.maupin@ti.com> wrote:
>>>>>>> This seems like a reversal of =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3Ddabd83e96fe99d0c3d=
1a88be4d1637831526d217
>>>>>>>=20
>>>>>>> Looks like there may be a need to cover the different use cases =
and=20
>>>>>>> understand what each person is trying to do :)
>>>>>>>=20
>>>>>>=20
>>>>>> ah I see what caused this all pain. So now meta-ti is odd ball =
out.
>>>>>> this patch should have never gone in.
>>>>>=20
>>>>> Khem,
>>>>>=20
>>>>> If you remember, we discussed this with Richard and he suggested =
this as a=20
>>>>> solution to the ordering problem. Otherwise people tend to append =
any extra=20
>>>>> layers _after_ oe-core, which should be the other way around in =
order to=20
>>>>> override anything in there=85
>>>>=20
>>>> I think the problem is when you have many other layers then the =
whole=20
>>>> paradigm changes to it and you end up with same issue upside down. =
I think=20
>>>> how you order bblayer.conf can control the override of oe-core, I =
wish if=20
>>>> distro=92s could control the layer.conf for each bsp layer then it =
wouldnt=20
>>>> matter as much
>>>=20
>>> I agree this is a bigger issue. I looked at some layers and found =
few that=20
>>> prepend themselves, while most of others just append.
>>>=20
>>> The order inside bblayers.conf is much more important than people =
let to=20
>>> believe. For example, if multiple layers define the machine config, =
the first=20
>>> one listed in bblayers.conf wins - this is a real problem for =
beagleboard.conf=20
>>> that is currently being defined in meta-ti as well as meta-yocto-bsp =
(as a=20
>>> reference platform) and meta-beagleboard too. Very soon the same =
problem will=20
>>> happen to beaglebone.conf, when meta-yocto-bsp picks it up as a =
reference...
>>>=20
>>> Anyway, the biggest issue I'm trying to work around with this change =
is the=20
>>> "shadowing" of the new-style DTBs that I ported from Dora to Dylan. =
If meta-ti=20
>>> is not in front of oe-core, the old-style DTBs come into play and =
DTBs are not=20
>>> built at all. So, this is not really an issue for Dora or master, =
and those=20
>>> don't need to be prepended after all=85
>>=20
>>=20
>> Now its even more intriguing since you changed meta-ti/master and I =
would=20
>> have expected this change to show up in meta-ti/dylan or are you =
claiming=20
>> all sort of oe-core branches to work with meta-ti/master thats a =
perilous=20
>> path.
>=20
> It's in meta-ti/dylan AND meta-ti/master,

yes. So can we change the master please ?
oe-core is also appending itself in BBPATH in oe-core/master and so are =
meta-yocto-bsp
and meta-beagleboard so with mere ordering of these layers in your =
distro=92s bblayer.conf
you should be able to get desired behaviour.

> as I thought the change was=20
> rather safe. But what I'm saying now is that it's not really needed in=20=

> meta-ti/master, only dylan.
>=20
> As of meta-ti/master, it should work with oe-core/master and maybe =
dora, but=20
> probably it's time to branch of meta-ti/dora, since there were some =
changes in=20
> oe-core/master no longer compatible with dora=85

sure yes but have that commit before you branch out.

>=20
>=20
>>>>>>>> -----Original Message-----
>>>>>>>> From: meta-ti-bounces@yoctoproject.org[mailto:meta-ti-
>>>>>>>> bounces@yoctoproject.org] On Behalf Of Khem Raj
>>>>>>>> Sent: Thursday, November 07, 2013 7:55 AM
>>>>>>>> To: meta-ti@yoctoproject.org
>>>>>>>> Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen =
of
>>>>>>>> layer world
>>>>>>>>=20
>>>>>>>> Currently, meta-ti appears as first path in BBPATH
>>>>>>>> rest of layers append so lets do the same
>>>>>>>>=20
>>>>>>>> helps distros with multiple BSP layers to include meta-ti
>>>>>>>>=20
>>>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>>>> ---
>>>>>>>> conf/layer.conf | 2 +-
>>>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>=20
>>>>>>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>>>>>>> index e39bd85..faa4ac0 100644
>>>>>>>> --- a/conf/layer.conf
>>>>>>>> +++ b/conf/layer.conf
>>>>>>>> @@ -1,5 +1,5 @@
>>>>>>>> # We have a conf and classes directory, append to BBPATH
>>>>>>>> -BBPATH =3D. "${LAYERDIR}:"
>>>>>>>> +BBPATH .=3D ":${LAYERDIR}"
>>>>>>>>=20
>>>>>>>> # We have a recipes directory, add to BBFILES
>>>>>>>> BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
>>>>>>>> ${LAYERDIR}/recipes*/*/*.bbappend"
>>>>>>>> --
>>>>>>>> 1.8.3.2
>>>>>>>>=20
>>>>>>>> _______________________________________________
>>>>>>>> meta-ti mailing list
>>>>>>>> meta-ti@yoctoproject.org
>>>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>>>> _______________________________________________
>>>>>> meta-ti mailing list
>>>>>> meta-ti@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti


