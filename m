Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 598A9E01304
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 12:22:35 -0700 (PDT)
Received: by wgx1 with SMTP id 1so827738wgx.11
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 12:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MEOl/v8ee/4DxKf4Mgh6OQnphZCtiuCK9FwfcGCbF7s=;
	b=om4LAmE8oD28FgIXxCG3NwwAd8EBMy2Y/dvLb1SyxWHxaKb+KlsuAC41H9ZdZ6AvVJ
	MqyF4nJgLabAkc94rhv7puqMFhfHECEYDs/DDz68g49X3eoLpNXSR4dasqj3Y2UKiNDE
	mPRmLRumVuOXHiAkPYtmSPjOqxmBCcpF6IrsUWXvgXXWWsOuHBpDcMgG+GWJWVkzeLhQ
	bEpO2UWc5ZnV47V3H1L2fRmCyf3egvRnw3XFVn7D5SwhS5DP2clAMAtJ62/gHd4fYTk3
	dBUWm8oMQdtlkjGz9GWJBS70g1XVH5F9Wzcb8D2hBVbhaNVXRW4n+Rrb/RxGr9YQDeKA
	qapQ==
Received: by 10.180.103.136 with SMTP id fw8mr7098207wib.20.1343244153897;
	Wed, 25 Jul 2012 12:22:33 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j6sm6224236wiy.4.2012.07.25.12.22.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 12:22:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343243776.71726.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Date: Wed, 25 Jul 2012 21:22:29 +0200
Message-Id: <78C2D25A-7597-4F7A-A716-C9A6709DE805@dominion.thruhere.net>
References: <1343187414.7556.YahooMailNeo@web121605.mail.ne1.yahoo.com>
	<20120725051154.GC28778@edge>
	<1343243776.71726.YahooMailNeo@web121603.mail.ne1.yahoo.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkn3wtVd6TKlCI5i5ldr6w9o2yIh1KmbquapifCB6VS23qqu99nrCYFgnVMtpihff1ucxgt
Subject: Re: omapfbplay depends on libav
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
X-List-Received-Date: Wed, 25 Jul 2012 19:22:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2012, om 21:16 heeft maniacbug het volgende geschreven:

> Thanks for writing back.
>=20
>=20
>  > =
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multim=
edia/libav
>=20
>=20
> Oh yes, there is is.  Ok, this is surprising.  I THOUGHT that OE and =
Yocto shared the core layer, but clearly not.

They do, it's called openembedded-core. And I think you mean poky, not =
yocto.

>  recipes-multimedia is significantly different between the two.

It's exactly the same. Do not confuse oe-core with meta-oe, however

> Also, this libav recipe has the following horrible line :)  This leads =
me to believe no one is running omapfbplay on A9, like Pandaboard.

>=20
> EXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"

Ah, your intimate knowledge of libav reveals itself! Libav has no =
specific A9 optimizations, only NEON ones, so your insinuation is not =
based on actual facts.

>  > gstreamer?=20
>=20
> Does gstreamer come with a simple tool in /usr/bin?  =46rom the =
recipes I'm looking at, it seems gstreamer provides only libs.  On =
desktop linux, I'd use gst123, but that pulls in gtk+-2.0 which is more =
overhead than I want.
>=20
> Using Yocto,

I think you mean poky, not yocto.=

