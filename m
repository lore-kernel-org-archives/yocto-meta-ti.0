Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f41.google.com (mail-ww0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88830E006B5
	for <meta-ti@lists.yoctoproject.org>;
	Fri,  9 Dec 2011 02:59:41 -0800 (PST)
Received: by wgbdt12 with SMTP id dt12so2844600wgb.2
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 09 Dec 2011 02:59:40 -0800 (PST)
Received: by 10.180.105.232 with SMTP id gp8mr10139916wib.65.1323428380436;
	Fri, 09 Dec 2011 02:59:40 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bi9sm12772529wib.11.2011.12.09.02.59.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:59:39 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+M6bXk+OSfgfdffryw_MdZbP2MAX3vnJw4XtEZsRQF8peu68g@mail.gmail.com>
Date: Fri, 9 Dec 2011 11:59:35 +0100
Message-Id: <EF96B215-E858-41E9-9F0C-D0C8F5F5253C@dominion.thruhere.net>
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXkeKBdeEjdQ8K6pEv0SNp_QdT+gemvBkujY7TRbFCFAvQ@mail.gmail.com>
	<999FD5FD-6566-4A36-A1B3-37E98EB8D735@dominion.thruhere.net>
	<CA+M6bXk+OSfgfdffryw_MdZbP2MAX3vnJw4XtEZsRQF8peu68g@mail.gmail.com>
To: Tom Rini <tom.rini@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot 2011.09: add pandaboard support
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
X-List-Received-Date: Fri, 09 Dec 2011 10:59:43 -0000
X-Groupsio-MsgNum: 212
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5C922EEB-9489-4329-94F5-F25A69DF2231";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5C922EEB-9489-4329-94F5-F25A69DF2231
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 8 dec. 2011, om 17:34 heeft Tom Rini het volgende geschreven:

> On Thu, Dec 8, 2011 at 8:55 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20

[..]

>> So mainline works, I'll wait for 2011.12 final and move beagle, =
panda, crane, hawk to that. What's the state of TI EVMs in mainline?
>=20
> AM3517EVM and OMAP3EVM are also good and SPL'd.  Mainline isn't yet
> appropriate for am335x evm nor beaglebone.


I've moved this to a separate branch: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/log/?h=3Dpandaboard-rework

It's going to be rebased from time to time, so be careful depending on =
it.

regards,

Koen=

--Apple-Mail=_5C922EEB-9489-4329-94F5-F25A69DF2231
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7h6hoACgkQMkyGM64RGpGHAACdGpAErIUzO+Dj3MxV3VJVU5zE
+qsAoLt+zaDTfXZd2qtDwUqQxXG8W57m
=6cZn
-----END PGP SIGNATURE-----

--Apple-Mail=_5C922EEB-9489-4329-94F5-F25A69DF2231--
