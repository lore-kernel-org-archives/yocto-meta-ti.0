Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E1ECE0072A
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 09:48:54 -0800 (PST)
Received: by eaal12 with SMTP id l12so4744924eaa.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 09:48:53 -0800 (PST)
Received: by 10.213.19.9 with SMTP id y9mr1362725eba.54.1322588933004;
	Tue, 29 Nov 2011 09:48:53 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a60sm1631966eeb.4.2011.11.29.09.48.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 09:48:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
Date: Tue, 29 Nov 2011 18:48:48 +0100
Message-Id: <4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 29 Nov 2011 17:48:56 -0000
X-Groupsio-MsgNum: 177
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D81B7425-15B1-42DC-AD16-DDAD52114CF1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D81B7425-15B1-42DC-AD16-DDAD52114CF1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 29 nov. 2011, om 18:12 heeft Koen Kooi het volgende geschreven:

>=20
> Op 29 nov. 2011, om 14:38 heeft Otavio Salvador het volgende =
geschreven:
>=20
>> On Tue, Nov 29, 2011 at 11:32, William Mills <wmills@ti.com> wrote:
>> On 11/29/2011 08:22 AM, Koen Kooi wrote:
>> Op 29 nov. 2011, om 13:53 heeft Otavio Salvador het volgende =
geschreven:
>> On Tue, Nov 29, 2011 at 10:41, Otavio =
Salvador<otavio@ossystems.com.br>  wrote:
>> ...
>> +# Copyright (C) 2011 O.S. Systems Software LTDA.
>> +#
>> +# Create an image that can by written onto a SD card using dd.
>> +#
>> +# External variables needed:
>> +#   ${ROOTFS} - the rootfs image to incorporate
>>=20
>> I added Joel in copyright noticed as he did the first version of it. =
You can look at =
https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398=
ea12d660b3
>>=20
>> And I wrote the original and then rewrote Joels version. So lets =
leave out any copyright statement from the class.
>>=20
>>=20
>> A copyright notice in a file without an explicit statement of license =
(in the same file) should always be rejected as it will cause major =
problems with all license review processes (including TI's).
>>=20
>> I agree with Koen that it is best to just drop the (c) notice.
>>=20
>> No problem; I will wait for more comments and do that for a v3 =
version.
>=20
> I'm testing the latest version from your github, I should have more =
feedback tomorrow.


mkfs.vfat keeps segfaulting at different points, I'll try to find out =
why.

regards,

Koen=

--Apple-Mail=_D81B7425-15B1-42DC-AD16-DDAD52114CF1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7VGwIACgkQMkyGM64RGpEILgCdHTiRnD+Q1mnfZSIC1EUiZcMm
K/QAoIqYXSs5mzU1zwuXJCb1kIpdKKlu
=rm5p
-----END PGP SIGNATURE-----

--Apple-Mail=_D81B7425-15B1-42DC-AD16-DDAD52114CF1--
