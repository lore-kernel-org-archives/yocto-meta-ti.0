Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3669.1588991554704532226
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 May 2020 19:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ZK0d5taz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0492WWkA013451;
	Fri, 8 May 2020 21:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588991552;
	bh=MRIW9cxwrkoDA/C2layPODop+yVp0L8K4RF+g3Nld/U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZK0d5tazA2QbFufkJBjBONH2mWTGXaa2Sqg1tc2XxZz67eMu28iJ2ufKTkXzki3B6
	 6x0n9T9PTtUll6XNXeCc33I/24CKhX913fb6MDrCFI+y7WXAEBp/PKStRm8gLXniZl
	 HSj0rc6ATOaZZOxLJI6FZuZaV5oxvri2ViKZhSvk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0492WWkE078981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 May 2020 21:32:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 May
 2020 21:32:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 May 2020 21:32:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0492WUFc046535;
	Fri, 8 May 2020 21:32:31 -0500
Date: Fri, 8 May 2020 22:32:30 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Luca <magnabosco.luca@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] meta-ti setup suggestions for beaglebone (SoC AM335x)
Message-ID: <20200509023229.GC13922@beryl>
References: <2215.1588846668633401958@lists.yoctoproject.org>
 <28518.1588877955623972653@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <28518.1588877955623972653@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 0492WWkA013451
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, Luca,

To answer your questions:

* It is always recommended to use so-called stable branches, that corresp=
ond=20
to Yocto release names - dunfell, zeus, etc. It is expected that master c=
an=20
be broken at times due to active development. Also, we do extensive inter=
nal=20
testing on those stable branches and apply tags when such testing complet=
es=20
successfully - i.e. internal releases. You can see those tags in the repo=
 -=20
ti2020.01.00, ti2020.00.04, etc. Between those tags it is unlikely, but s=
till=20
possible something may get inadvertently broken. Which is what happened f=
or=20
you here, unfortunately - we were migrating from zeus to dunfell between=20
ti2020.00.04 and ti2020.01.00. If you are new and don't know where to sta=
rt,=20
I'd recommend picking the latest release tag in the series - the highest =
third=20
number or no number at all, like ti2020.00=3Dti2020.00.04. As you can see=
, we=20
just started with ti2020.01.xx series with the first .00 tag in dunfell. =
Other=20
than that, we follow the standard Yocto Project and Open Source practices.

* There is very little difference between am335x-evm and beaglebone machi=
nes=20
in meta-ti. You can think of it as beaglebone being a leaner variant of=20
am335x-evm. The actual differences can be seen in the config files:
http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dblob;f=3Dconf/machine/a=
m335x-evm.conf;hb=3DHEAD
http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dblob;f=3Dconf/machine/b=
eaglebone.conf;hb=3DHEAD
They both build on top of a common ti33x.inc file that specifies the enti=
re=20
SoC family. From there, beaglebone uses fewer DTBs, ttyS0 as console, no=20
built-in LCD/touchscreen and no UBI configuration. At some point it used =
own=20
U-boot defconfig, but that got deprecated. So, in other words, beaglebone=
 is=20
a subset of am335x-evm machine. It is exactly the same BSP (kernel, u-boo=
t,=20
FWs, etc.) for both of them, with just minor packaging differences.

--=20
Denys


On Thu, May 07, 2020 at 11:59:15AM -0700, Luca wrote:
> Thanks Charlie,
>=20
> now it is booting fine and from your explanation I can also try to=20
> understand the reason behind the error I was getting.
>=20
> Actually both the commits you pointed out had=A0already caught my atten=
tion=20
> because I was trying to get a first bootable setup before using a custo=
m a=20
> .wic.in file.
> Considering that, I think my doubts about which branch or tag is stable=
 are=20
> somehow still valid.
>=20
> May I ask you if you can at least partially solve the doubts that I=20
> expressed?
> * suggested/tested branch, tag or commit for beaglebone and amx335 SOC?=
=20
> Maybe it would be useful to know that for all the supported SOCs.
> * which are the differences between the machines am335-evm and beaglebo=
ne?=20
> Since beaglebone uses am335 SOC there should be only a "reduced amount =
of=20
> differences" right?
> Maybe I am wrong, but I think a short explanation in the main README, a=
t=20
> least for the first question,=A0would save a few hours for newbies like=
 me and=20
> possibly a few minutes even to experienced users. Maybe the explanation=
 is=20
> already in the right place and I simply don't know where I have to look=
 for=20
> it.
>=20
> Regards
> Luca
