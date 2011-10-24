Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6D50E012F3
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 04:23:00 -0700 (PDT)
Received: by wwe5 with SMTP id 5so7861714wwe.11
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 04:22:59 -0700 (PDT)
Received: by 10.216.12.82 with SMTP id 60mr2971447wey.97.1319455377854;
	Mon, 24 Oct 2011 04:22:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fy13sm38385942wbb.18.2011.10.24.04.22.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 04:22:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EA52A6E.2090904@ts.fujitsu.com>
Date: Mon, 24 Oct 2011 13:22:54 +0200
Message-Id: <A9FC6A94-E05C-4396-807B-A71CC08B9B40@dominion.thruhere.net>
References: <4EA1364A.8000605@ts.fujitsu.com>
	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
	<4EA5266C.4080002@ts.fujitsu.com>
	<F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>
	<4EA52A6E.2090904@ts.fujitsu.com>
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Mon, 24 Oct 2011 11:23:01 -0000
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

Roger provided a log with a related looking bug, which should get solved =
Real Soon(TM) when the following gets applied:

http://patchwork.openembedded.org/patch/13783/

In the mean time you should be able to get around it by doing 'bitbake =
mesa-dri' manually.

regards,

Koen


