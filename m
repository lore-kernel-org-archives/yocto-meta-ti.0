Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3972E006B0
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 09:12:58 -0800 (PST)
Received: by eaal12 with SMTP id l12so4681657eaa.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 09:12:57 -0800 (PST)
Received: by 10.213.19.13 with SMTP id y13mr153927eba.6.1322586777029;
	Tue, 29 Nov 2011 09:12:57 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v3sm107163194eej.7.2011.11.29.09.12.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 09:12:56 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
Date: Tue, 29 Nov 2011 18:12:55 +0100
Message-Id: <F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Tue, 29 Nov 2011 17:12:59 -0000
X-Groupsio-MsgNum: 176
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3C9D52C7-2DCD-4619-896C-90B40E890BB4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3C9D52C7-2DCD-4619-896C-90B40E890BB4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 29 nov. 2011, om 14:38 heeft Otavio Salvador het volgende geschreven:

> On Tue, Nov 29, 2011 at 11:32, William Mills <wmills@ti.com> wrote:
> On 11/29/2011 08:22 AM, Koen Kooi wrote:
> Op 29 nov. 2011, om 13:53 heeft Otavio Salvador het volgende =
geschreven:
> On Tue, Nov 29, 2011 at 10:41, Otavio =
Salvador<otavio@ossystems.com.br>  wrote:
> ...
> +# Copyright (C) 2011 O.S. Systems Software LTDA.
> +#
> +# Create an image that can by written onto a SD card using dd.
> +#
> +# External variables needed:
> +#   ${ROOTFS} - the rootfs image to incorporate
>=20
> I added Joel in copyright noticed as he did the first version of it. =
You can look at =
https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398=
ea12d660b3
>=20
> And I wrote the original and then rewrote Joels version. So lets leave =
out any copyright statement from the class.
>=20
>=20
> A copyright notice in a file without an explicit statement of license =
(in the same file) should always be rejected as it will cause major =
problems with all license review processes (including TI's).
>=20
> I agree with Koen that it is best to just drop the (c) notice.
>=20
> No problem; I will wait for more comments and do that for a v3 =
version.

I'm testing the latest version from your github, I should have more =
feedback tomorrow.

regars,

Koen=

--Apple-Mail=_3C9D52C7-2DCD-4619-896C-90B40E890BB4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7VEpcACgkQMkyGM64RGpH5XwCffEcjYyO9KuUJg3tmIEw+QHTh
vxUAoJhnkmMHWcWSZZv3p5NPipZDYWVa
=vX8j
-----END PGP SIGNATURE-----

--Apple-Mail=_3C9D52C7-2DCD-4619-896C-90B40E890BB4--
