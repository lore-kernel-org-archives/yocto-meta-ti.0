Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BD2FE01376
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 01:58:40 -0700 (PDT)
Received: by wwe5 with SMTP id 5so7712056wwe.11
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 01:58:39 -0700 (PDT)
Received: by 10.216.221.157 with SMTP id r29mr3019655wep.66.1319446719689;
	Mon, 24 Oct 2011 01:58:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x40sm31477631wbn.19.2011.10.24.01.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 01:58:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EA5266C.4080002@ts.fujitsu.com>
Date: Mon, 24 Oct 2011 10:58:32 +0200
Message-Id: <F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>
References: <4EA1364A.8000605@ts.fujitsu.com>
	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
	<4EA5266C.4080002@ts.fujitsu.com>
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
X-List-Received-Date: Mon, 24 Oct 2011 08:58:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 24 okt. 2011, om 10:48 heeft Rainer Koenig het volgende geschreven:

> Koen,
>=20
> Am 21.10.2011 11:14, schrieb Koen Kooi:
>=20
>>> I'm currently trying to build an image for the TI 8148 EVM board. =
For
>>> that I added the meta-ti layer to the standard Yocto/Edison =
environment.
>>=20
>> Please follow the instructions detailed in the meta-ti README: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/tree/README
>>=20
>> Yocto/Poky lacks support for various meta-ti (and OE-classic) =
constructs needed for a successfull build. Following the instructions =
above you will get a proper setup.
>=20
> Tried this over the weekend on my home PC. Yes, works. But I was just
> able to build a console image. The build of systemd-gnome-image fails
> with the error that nothing provides "DRI". MACHINE=3Ddm8148-evm.

I'm not seeing that with this set of metadata:

OE Build Configuration:
BB_VERSION        =3D "1.13.3"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "dm814x-evm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.10-core"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-angstrom     =3D "master:14f73c63403525f85a15f61f88895ba377364338"
meta-oe          =20
meta-efl         =20
meta-gpe         =20
meta-gnome       =20
meta-xfce         =3D "master:5da48e6e4a4ab0488943c5e93f005211bd7a22f7"
meta-ti           =3D "master:2ea9f93740259be7eee59edeb88e632c5441fb58"
meta-ettus        =3D "master:617506b5cfd2b8325d85f0dcba0232c3f796d044"
meta-efikamx      =3D "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        =3D "master:17853811179f2760791c6b138f96e9dd15493517"
meta-htc         =20
meta-nokia       =20
meta-openmoko    =20
meta-palm         =3D "oe-core:794b32d234dbf7e6626c8a0efc915fc04804b9d0"
meta-sugarbay    =20
meta-crownbay    =20
meta-emenlow     =20
meta-fishriver   =20
meta-jasperforest=20
meta-n450         =3D "master:0ea04b02119c44865e5e1c2529c74950928c3347"
meta              =3D "master:99da9a4e65f9dffb04efc3ad60125194c476d6b3"

Could you please share your version of that so we can see if there are =
fixes missing?

regards,

Koen=

