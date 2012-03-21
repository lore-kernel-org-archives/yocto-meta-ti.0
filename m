Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC40AE0044D
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 13:48:53 -0700 (PDT)
Received: by werc1 with SMTP id c1so1811178wer.35
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 13:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=31gWVplEDX3hwtvs7PhnOmpiPquF3sY54pkmMX+i64o=;
	b=IjuXx/LG5Yvx3cJISiBRUG7D8fapSkYO4z/ObEDljiZowN8tD3x6Fw4g6E9y/Lq5Wu
	Bs0QS0q0HEaQcWKuZ9r5un7/YTmLbpDfeNuiwnB8rLe/gKmRhNGjV/YanzZN8zOfInQd
	Us0+OEAhWbM6xCpeBvAxcFGppQHSjgpIBtQSlaGK82ffvykj0yQqoy4rMks7eJHCLMlD
	K7u6De33Kol75f6vHjIFUe+RiMcHrmA3HyHFL2jr8EE4DpyhcDPFSTO5RX69FxGg5d+d
	8oyt1JzspzjICa28Z2hIyfvbz/LbOiyXCTx0RLJEtJ/lRavNNNWmW/QiUBWOGC8Jr/Vc
	F7qw==
Received: by 10.180.101.136 with SMTP id fg8mr41415413wib.4.1332362932670;
	Wed, 21 Mar 2012 13:48:52 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n15sm7335237wiw.6.2012.03.21.13.48.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 13:48:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <86ehsln0t7.fsf@coulee.tdb.com>
Date: Wed, 21 Mar 2012 21:48:52 +0100
Message-Id: <ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
To: Russell Senior <russell@personaltelco.net>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlsBGr965Lng5G0OMoslmr5ZfSS6ro+wXfMAKzY6sGRN1f7X8vSgi/QFOlUWHLYkfSY0vbn
Cc: Marco Monguzzi <marco.monguzzi@gmail.com>, meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Wed, 21 Mar 2012 20:48:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mrt. 2012, om 21:42 heeft Russell Senior het volgende geschreven:

>>>>>> "Koen" =3D=3D Koen Kooi <koen@dominion.thruhere.net> writes:
>=20
>>> I am dumping this mail to ask for some clarifications. I am looking
>>> closely to yocto as environment for building embedded linux distro
>>> for omap based boards.
>=20
> Koen> Yocto or poky? If you're after yocto, just follow the
> Koen> instructions in the README, that will get you that using the
> Koen> yocto framework. If you're after poky, that's something
> Koen> completely different.
>=20
> A yocto guy I was recently talking to implied that yocto more or less
> equal'd poky. =20

Yes, they tend to do that a lot, don't they?

> Frankly, I find these code words baffling.  Can you
> explain or point me at an explanation of the distinction between OE,
> yocto and poky?

Poky used to be a fork of OE that got picked up when the yocto project =
was founded. After yocto was announced we all agreed they would drop the =
'poky'  name and bits and continue together as 'oe-core'.=20
What is happening is that some yocto marketing folks are a bit too =
attached to the poky name and want to muddy the waters. The more =
confusion, the more business for yocto certified consultants.

regards,

Koen=

