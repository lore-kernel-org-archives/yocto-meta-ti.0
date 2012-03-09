Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E311EE013A8
	for <meta-ti@yoctoproject.org>; Fri,  9 Mar 2012 11:19:45 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so1791068wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 09 Mar 2012 11:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=x2zbexdAKf62gvbwwDKCV2JHScpKr53wru56IVNSDvM=;
	b=RuHIMKQlknGlI1n+HiJL/ChTGIQIriAgd0XVpIBDdUajrYcICIfren4qBlMkAKK8RP
	lB8/pMQnZa0hVlkaUnxImHfPnPFjI4eeRfzCFOKxYbTsAQM8+vroe6I21JRPiG6j3gA/
	/SDLC6RqEnblCElQ9qT3CXIiG0o6mLl8+ojBJOTsxWxv2qcaPtX1z7cVvmAQl3Ioqtxw
	1NcwRPXX5D96o8QqrnMifOtBC7iYFV6QEWcR0i+TVNYb5IPVE5NrCn7RPBFIQaj7liUb
	+mHAr9xb3OzJ/LIhdwnAPrwA4DOeAvd1WnYH4ZLtolENOdVGbHzHlocYyoD3fhhXbivW
	2VPQ==
Received: by 10.180.99.65 with SMTP id eo1mr7533329wib.13.1331320784534;
	Fri, 09 Mar 2012 11:19:44 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bg3sm7383491wib.10.2012.03.09.11.19.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 11:19:43 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120309191716.GB27573@denix.org>
Date: Fri, 9 Mar 2012 20:19:48 +0100
Message-Id: <CCE23D31-0F9B-44CD-A88C-B25D8E50BA39@dominion.thruhere.net>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<20120308210125.GE10587@denix.org>
	<EEF3E563-5B95-4864-ACB7-85101641A086@dominion.thruhere.net>
	<20120309150156.GA27573@denix.org>
	<733E8AC8-86F5-4673-AA9E-49D02AC2F400@dominion.thruhere.net>
	<20120309191716.GB27573@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnJVVlvK1ts1iRX07yqFDnhWdjLpmR84fcTNvXOiK2+LPx9JzdDffWeAkcoZkisPhkdduRt
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/4] IMAGE_FSTYPES fixes / improvements
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
X-List-Received-Date: Fri, 09 Mar 2012 19:19:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mrt. 2012, om 20:17 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Fri, Mar 09, 2012 at 07:43:40PM +0100, Koen Kooi wrote:
>>=20
>> Op 9 mrt. 2012, om 16:01 heeft Denys Dmytriyenko het volgende =
geschreven:
>>=20
>>> On Fri, Mar 09, 2012 at 07:20:30AM +0100, Koen Kooi wrote:
>>>>=20
>>>> Op 8 mrt. 2012, om 22:01 heeft Denys Dmytriyenko het volgende =
geschreven:
>>>>=20
>>>>> On Thu, Mar 08, 2012 at 12:34:00PM -0700, Tom Rini wrote:
>>>>>> Hey all,
>>>>>>=20
>>>>>> This short series does two things.  For 3 machines we fix a bug =
of using
>>>>>> '?=3D' rather than '+=3D' for setting IMAGE_FSTYPES (these are =
all of the
>>>>>> machines that have this issue today except for...) and on the =
4th,
>>>>>> am335x-evm we add UBI support as well.  On the first three, these =
are
>>>>>> correct by inspection and on the fourth, I've written to and =
mounted
>>>>>> systemd-image from NAND on my EVM (it didn't work as I was using =
a custom
>>>>>> uImage that's not systemd-sane, and fixing that and confirming =
the config
>>>>>> used here works is on my list).
>>>>>=20
>>>>> All,
>>>>>=20
>>>>> Tom and I started talking on IRC and then decided to move the =
discussion back=20
>>>>> to the mailing list for others to participate.
>>>>>=20
>>>>> So, basically, the proposal is to do this in our machine.conf =
files:
>>>>>=20
>>>>> -IMAGE_FSTYPES ?=3D "jffs2 tar.bz2"
>>>>> +IMAGE_FSTYPES +=3D "jffs2 tar.bz2"
>>>>>=20
>>>>> My response was that we shouldn't do that.
>>>>=20
>>>> +=3D is the OE classic way of doing things and is IMNSHO the right =
thing.
>>>=20
>>> Not convinced:
>>>=20
>>> $ grep IMAGE_FSTYPES openembedded/conf/machine/*|awk '{print =
$2}'|sort|uniq -c
>>>    30 =3D
>>>     1 -
>>>    44 ?=3D
>>>    31 +=3D
>>>=20
>>> BTW, dash in there is a fluke coming from here:
>>> cm-x270.conf:#     - IMAGE_FSTYPES =3D "jffs2 tar cpio.gz"
>>>=20
>>>>> The conf files that may set, append=20
>>>>> or overwrite IMAGE_FSTYPES are parsed in the order of local.conf, =
machine.conf=20
>>>>> and distro.conf. And if none of those set IMAGE_FSTYPES, =
bitbake.conf defaults=20
>>>>> to a sane tar.gz. =46rom end-user perspective, they expect the =
setting in their=20
>>>>> local.conf to be obeyed. If they don't care and don't set =
IMAGE_FSTYPES, then=20
>>>>> machine.conf will set it to supported values, i.e. jffs2 and =
tar.bz2 in our=20
>>>>> case. Of course, distro has the last word and potentially can =
alter it, but in=20
>>>>> most cases it shouldn't. That's how it works now and I believe =
it's the=20
>>>>> correct behaviour. Changing it to append additional values to what =
user wants=20
>>>>> is slightly heavy-handed, in my opinion. In other words, those are =
suggested=20
>>>>> image types, not enforced ones.
>>>>>=20
>>>>> As Tom poined out, this is the same behaviour as currently used in =
OE-Core,=20
>>>>> where qemu machines all have IMAGE_FSTYPES ?=3D "tar.bz2 ext3".
>>>>>=20
>>>>> The original issue in question may be coming from the way some =
setup scripts=20
>>>>> pre-configure user settings in local.conf, defaulting =
IMAGE_FSTYPES to=20
>>>>> something, that is not very suitable for the machines being used. =
This needs=20
>>>>> to be left unset and for the end-user to decide and set =
specifically, IMHO.
>>>>>=20
>>>>> Comments, opinions?
>>>>=20
>>>> See the discussion on OE-core a while back. There was a lot of =
handwaving=20
>>>> done and suggested that IMAGE_FSTYPES_append_$machine =3D " foo" in =
local.conf=20
>>>> is the right way to do this. I think it's not intuitive because you =
have to=20
>>>> remember that +=3D and _append are expanded in different points =
during=20
>>>> parsing, which requires either deep bitbake knowledge or minor =
braindamage.
>>>=20
>>> Link or it never happened :)
>>=20
>> No link, but:
>>=20
>> 19:41 < Tartarus> But, where's the oe-core thread?
>> 19:41 < koen> somewhere on OE-core
>> 19:42 < koen> [OE-core] [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES =
instead of weakly assigning them
>> 19:42 < koen> july 2011
>=20
> Ok, here's the link:
> =
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=3D=
2061
>=20
> It was discussed, there was no resolution, there were no changes.
>=20
> Claiming that's how it's done in Classic OE (aka .dev) is not correct =
- as I=20
> showed above, 44 machines use ?=3D, 31 use +=3D and 31 use =3D

And how many of those machines are broken/unmaintained/etc

>=20
> OE-Core still uses ?=3D
>=20
> Please give me the use case that this is meant to enable, which is not=20=

> possible now.

Setting a global, additional type in local.conf without needing deep =
knowledge of bitbake. People just don't understand why they need to do =
IMAGE_FSTYPES_append =3D foo instead of IMAGE_FSTYPES +=3D or =
IMAGE_FSTYPE =3D "foo"=

