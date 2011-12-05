Return-Path: <koen@dominion.thruhere.net>
Received: from mail-qw0-f41.google.com (mail-qw0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 155C1E005B2
	for <meta-ti@yoctoproject.org>; Mon,  5 Dec 2011 03:30:21 -0800 (PST)
Received: by qadc12 with SMTP id c12so479061qad.14
	for <meta-ti@yoctoproject.org>; Mon, 05 Dec 2011 03:30:20 -0800 (PST)
Received: by 10.224.117.74 with SMTP id p10mr7590557qaq.28.1323084620811;
	Mon, 05 Dec 2011 03:30:20 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j7sm25100385qaq.11.2011.12.05.03.30.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 03:30:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
Date: Mon, 5 Dec 2011 12:30:13 +0100
Message-Id: <CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
	<4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
	<CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Dec 2011 11:30:22 -0000
X-Groupsio-MsgNum: 191
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0B0BCEF6-C644-43EC-AF41-4571F7F7B616";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0B0BCEF6-C644-43EC-AF41-4571F7F7B616
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 29 nov. 2011, om 18:51 heeft Otavio Salvador het volgende geschreven:

> On Tue, Nov 29, 2011 at 15:48, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> mkfs.vfat keeps segfaulting at different points, I'll try to find out =
why.
>=20
> It works fine here.
>=20
> Maybe a change in your layer?

I did some more tests (MACHINE=3Dbeaglebone bitbake cloud9-image) and =
with your patches mkfs.vfat segfaults, without the patches it works. I =
don't know why that is.
I do want to get rid of the loopdevices, so if other people on this list =
can test these patches as well...

regards,

Koen=

--Apple-Mail=_0B0BCEF6-C644-43EC-AF41-4571F7F7B616
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7cq0cACgkQMkyGM64RGpFQ5gCggMzMNi1TF+OIlU6El3KmPFdl
EOIAnipM8FyiRCU4H7u/KLScIk3DbuAt
=Ks2T
-----END PGP SIGNATURE-----

--Apple-Mail=_0B0BCEF6-C644-43EC-AF41-4571F7F7B616--
