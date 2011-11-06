Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EF69E00310
	for <meta-ti@yoctoproject.org>; Sun,  6 Nov 2011 01:27:08 -0800 (PST)
Received: by eyh5 with SMTP id 5so4004290eyh.35
	for <meta-ti@yoctoproject.org>; Sun, 06 Nov 2011 01:27:07 -0800 (PST)
Received: by 10.14.10.82 with SMTP id 58mr1948274eeu.92.1320571627400;
	Sun, 06 Nov 2011 01:27:07 -0800 (PST)
Received: from [10.0.3.16] ([194.171.92.100])
	by mx.google.com with ESMTPS id z58sm40623768eea.3.2011.11.06.01.27.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Nov 2011 01:27:05 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320565846-518-1-git-send-email-joelagnel@ti.com>
Date: Sun, 6 Nov 2011 10:26:59 +0100
Message-Id: <5FB1C247-7FA0-479A-84EA-5F947DC4026D@dominion.thruhere.net>
References: <1320565846-518-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-tester: Update to latest with fixes
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
X-List-Received-Date: Sun, 06 Nov 2011 09:27:09 -0000
X-Groupsio-MsgNum: 86
Content-Type: multipart/signed;
	boundary="Apple-Mail=_425AE082-84B3-4F3B-8B1D-26EB1A44361A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_425AE082-84B3-4F3B-8B1D-26EB1A44361A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 6 nov. 2011, om 08:50 heeft Joel A Fernandes het volgende geschreven:

>  Hopefully the last round of minor fixes:
>    * only leds 3 and 4 are touched, 1 and 2 are for system use
>    * halt after test fail so that the user doesn't accidentaly corrupt =
the card
>    * remove all usb gadget modules before test start
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>

Applied, thanks!



--Apple-Mail=_425AE082-84B3-4F3B-8B1D-26EB1A44361A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk62UugACgkQMkyGM64RGpFhfwCfX87TVYWSnc//EpyozBloksFe
drAAoImTZDyvSNIZuE+gC6/oDO7x7uLb
=3ggX
-----END PGP SIGNATURE-----

--Apple-Mail=_425AE082-84B3-4F3B-8B1D-26EB1A44361A--
