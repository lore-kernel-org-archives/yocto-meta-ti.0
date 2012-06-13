Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDAAFE0044A
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2012 13:12:06 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so1685247obb.35
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2012 13:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=4brflzYnRfTiCfdG4PFoRoElCXHw4OtDjExIoMqDVVI=;
	b=aNq7bXLNVHuEoMqC9BvkIMLMoXXjVIxRQkYJMsmbfi9L1R+k2om7LgDk84hx8/MIdM
	RyJ43Tery4yx7BPTIl7sGzGPuQYtXnJgud7rqLWoZDca5/DidJV6pi4qvV5fa7NXEyv+
	y0+yJ9Ru4ObiiizEn7C56uWkDZmYqALJfslWgVyuR4TxK26nQnWczO8zgxAZ3L3jGGtg
	K4yIWa8CKfH7BKEyX1/4Jd0UIgOpL/czGI1mFHLziQluRVCT9RGqAGwlYic19fGRGP4Y
	/4VnD3u+XryFqHsnu+15LklaWfFX1W9Z8+boeECm74f/8LTcyR/f0IhwGj/YmUoI2aQK
	7EiA==
Received: by 10.182.77.170 with SMTP id t10mr26133501obw.70.1339618326016;
	Wed, 13 Jun 2012 13:12:06 -0700 (PDT)
Received: from [10.0.1.103] (adsl-68-88-77-36.dsl.rcsntx.swbell.net.
	[68.88.77.36])
	by mx.google.com with ESMTPS id b8sm2697322obw.1.2012.06.13.13.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jun 2012 13:12:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FD750AB.9040700@ti.com>
Date: Wed, 13 Jun 2012 15:12:14 -0500
Message-Id: <A1C3EA3A-DD6B-4363-9E87-ACDF193E91F7@dominion.thruhere.net>
References: <20120612011706.GD30300@denix.org>
	<DD1A526D-B7EE-45D1-9DED-C2FB40897FBA@dominion.thruhere.net>
	<4FD750AB.9040700@ti.com>
To: William Mills <wmills@ti.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmrf1mxXrzxLQ+7kegrumvAoxZp6dZmfchukLJoLvVeucX7qke63o45hzAXu1mOzDQ02KRD
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Wed, 13 Jun 2012 20:12:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 jun. 2012, om 09:22 heeft William Mills het volgende geschreven:

> On 06/12/2012 09:44 AM, Koen Kooi wrote:
>>=20
>> Op 11 jun. 2012, om 20:17 heeft Denys Dmytriyenko het volgende =
geschreven:
>>=20
>>> Koen, et al,
>>>=20
>>> This is a RFC for creating an additional "extras" layer inside =
meta-ti to
>>> contain pieces and components that are either slightly outdated =
(i.e. old
>>> Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, =
anything
>>> DSP-related, etc.) or require non-standard dependencies besides =
OE-Core
>>> (systemd?) with the possibility of moving them back to "main" =
meta-ti in the
>>> future, once they become "first-class citizens", i.e. gain current =
and
>>> continuing support.
>>=20
>=20
>> If it's going to be split this way I'd like to move all =
beagleboard.org related things out of meta-ti and into it's own seperate =
repo.
>=20
> We should do whatever makes the most sense and serves all the user's =
use-cases.  Angstrom beagleboard is an important use case but so is =
oe-core only on beagleboard and AM335x etc.  We also need people to =
understand what things are being built and tested every night vs =
something that was pretty much working when it was tried 6 months ago.
>=20
>> If the beagle recipes are demoted to 2nd class citizens we have no =
incentive anymore to be in meta-ti.
>=20
> I thought it was just the older beagleboard stuff that was moving?  Or =
are you complaining that not every feature of your current builds are =
available using just oe-core?

I don't have *any* builds that do what they need to do with only oe-core =
+ meta-ti. Till that changes I lack any form of incentive to actively =
work on oe-core only efforts. I'm not saying that to be mean, just to =
make my position really clear.=20

> It is true that we are trying to do two things here:
> 1) separate things that require layers beyond oe-core
> 2) separate things that are not tested and supported to the same level
>=20
> It was your assertion that we did not want too many layers. =
Unfortunately that means things that require layers beyond oe-core need =
to be in the second layer.  Sorry if you see that as being a second =
class citizen.
>=20
> There are large parts of beagleboard and beaglebone that do work with =
only oe-core and are built and tested regularly.  Finding the right =
place for these pieces should, I think, be the focus of the discussion.
>=20
> As I have said before, If you want a seperate layer/repo to support =
the specifics of Angstrom beagleboard/beaglebone _I_ think that would be =
fine.

No, in such a scenario I would want all the beagleboard.org stuff =
removed from meta-ti and have only *one* repo/layer with beagle stuff in =
it. Doing a split like you say will involve too much extra work to be =
worth the time and effort. Especially if the 'extras' layer will include =
all the bitrotted stuff as well.

=46rom a beagleboard.org perspective an oe-core only build is useless at =
this moment[1], the non-core bits are the ones that make the experience =
great. I do see that meta-ti needs to support an oe-core only option for =
their officially supported machines. Since the beagleboard.org boards =
are not supported by TI it makes sense to move them out and have the =
beagle layer depend on meta-ti for things like dsp and 3d support.

regards,

Koen

[1] Which of course can change in the future when oe-core gets reworked =
e.g. move systemd there.=

