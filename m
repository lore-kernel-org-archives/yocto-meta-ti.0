Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B6AAE0137B
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 02:20:15 -0700 (PDT)
Received: by wyf19 with SMTP id 19so8492473wyf.35
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 02:20:14 -0700 (PDT)
Received: by 10.227.9.30 with SMTP id j30mr8316236wbj.13.1319448013901;
	Mon, 24 Oct 2011 02:20:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y10sm37805152wbm.14.2011.10.24.02.20.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:20:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EA52A6E.2090904@ts.fujitsu.com>
Date: Mon, 24 Oct 2011 11:20:06 +0200
Message-Id: <F0F70FBC-DC50-4148-99E6-9DB09561EC9A@dominion.thruhere.net>
References: <4EA1364A.8000605@ts.fujitsu.com>
	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
	<4EA5266C.4080002@ts.fujitsu.com>
	<F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>
	<4EA52A6E.2090904@ts.fujitsu.com>
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Building for TI 8148 EVM
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
X-List-Received-Date: Mon, 24 Oct 2011 09:20:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 24 okt. 2011, om 11:05 heeft Rainer Koenig het volgende geschreven:

> Koen,
> Am 24.10.2011 10:58, schrieb Koen Kooi:
>>=20
>> Op 24 okt. 2011, om 10:48 heeft Rainer Koenig het volgende =
geschreven:
>>>> Please follow the instructions detailed in the meta-ti README: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/tree/README
>=20
>>> Tried this over the weekend on my home PC. Yes, works. But I was =
just
>>> able to build a console image. The build of systemd-gnome-image =
fails
>>> with the error that nothing provides "DRI". MACHINE=3Ddm8148-evm.
>>=20
>> I'm not seeing that with this set of metadata:
>=20
>> Could you please share your version of that so we can see if there =
are fixes missing?
>=20
> Difficult at the moment because now I'm back to work and the data is =
at
> home. :-) But I will setup this again on my work machine and see that =
I
> get the firewall-issues solved, so I should be able to reproduce my
> results.

The oebb.sh script has builtin firewall support, have a look at that. If =
something is missing, please let us know.


> I was really just following the linked instructions above, maybe I
> should have setup something in my local.conf...?

No, the setup scripts try really hard to avoid having you edit conf =
files :)

regards,

Koen=

