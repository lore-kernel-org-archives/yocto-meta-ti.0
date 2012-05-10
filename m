Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90C49E013FE
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 07:20:35 -0700 (PDT)
Received: by wibhn14 with SMTP id hn14so490201wib.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 07:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vDw3wfoi5UXKvwDqw+XaPPFQdPrx8MPWzhhqDkDgHXg=;
	b=aqjY4vMtSkJIOqXviG/oUiDqWf9QbEV8Nc6Ow2onVFzkswh/kUDC3X3h620djoA6Fs
	dWdm3sxO7+VxpbG6zSUVABmTJU34hkW54roY8g4SMiajj5n6n8q+doD96hO4WrWMQPUj
	LVEHrYk11hmVVywiY05Q8JJ5xAvhQpRpGy4IfFw1W87NxXceoG5RnAMcK5zFKC4Hos6m
	4Ve3HIVqaJBNiyouNT1mp+yQ1+X5qSJ3LI8BLzcXddeYxyAKGN8QEoDi7DmhT0M/zD0b
	dx1CFAk+7OVhRMEWwPPRSseMvM0QodZoEPCsMqIJ1ya/FBZV7r+HvqLp1u9k+9g6dQeP
	Uraw==
Received: by 10.180.105.194 with SMTP id go2mr9711428wib.22.1336659634519;
	Thu, 10 May 2012 07:20:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm3323781wib.6.2012.05.10.07.20.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 07:20:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B75582C@DNCE05.ent.ti.com>
Date: Thu, 10 May 2012 16:20:31 +0200
Message-Id: <8452F6A8-6078-4C3A-80A9-96528007111B@dominion.thruhere.net>
References: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
	<F6B9E80B-34AA-44B6-99BA-C875C3589CC1@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B75582C@DNCE05.ent.ti.com>
To: "Monk, Roger" <r-monk@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlV/vLyScM38IrKq+7t779uQmFJSWeAtdhbXtUM/0OELsALOuWcZBuW7BrOkjjQgd6yCQde
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH] omapfbplay: import from OE classic
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
X-List-Received-Date: Thu, 10 May 2012 14:20:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2012, om 16:13 heeft Monk, Roger het volgende geschreven:

> On Thu, May 10, 2012 at 15:09:36, Koen Kooi wrote:
>> Subject: Re: [meta-ti] [PATCH] omapfbplay: import from OE classic
>>=20
>>=20
>> Op 10 mei 2012, om 15:42 heeft Monk, Roger het volgende geschreven:
>>=20
>>> Hi Koen,
>>>=20
>>> Think we've still got some API incompatibility here.  I needed to
>> roll
>>> back to an earlier omapfbplay commit
>>> (34293052c5a2ae328eac6903512e6b4ce19b5639) and patch CODEC_TYPE :-
>>>=20
>>> -        if (afc->streams[i]->codec->codec_type =3D=3D =
CODEC_TYPE_VIDEO
>> && !st)
>>> +        if (afc->streams[i]->codec->codec_type =3D=3D
>>> + AVMEDIA_TYPE_VIDEO && !st)
>>>=20
>>> to get this working on beagleboard-xm, so I suspect there may have
>> been an API change after Aug11, or
>> d03f042ecac0a231bedeadc7a6c67f0102d5505a was rebased against 0.8
>> branch?  I guess we should ask Mans...
>>=20
>> We still use libav 0.7.4 in meta-oe, I suspect Mans updated to 0.8.x
>> or even newer. I only build tested it, so I'm open for fixes that =
make
>> it run :) Upgrading libav might be an option as well, but I'm not =
sure
>> of that will get accepted for the meta-oe release branch.
>>=20
>=20
> See attached for now - probably ok as reasonable known working =
baseline before we upgrade other bits?

The patch looks good to me. Once the beaglebone a6 release it out I'll =
have time to look at libav. I'll need it for a customer project in that =
timeframe as well. Thanks for updating the patch!

regards,

Koen=

