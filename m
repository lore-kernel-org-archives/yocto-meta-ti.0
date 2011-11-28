Return-Path: <koen@dominion.thruhere.net>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 206E4E00303
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 13:27:37 -0800 (PST)
Received: by faao14 with SMTP id o14so787390faa.35
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 13:27:36 -0800 (PST)
Received: by 10.205.123.3 with SMTP id gi3mr48568580bkc.112.1322515656497;
	Mon, 28 Nov 2011 13:27:36 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hy13sm32426310bkc.0.2011.11.28.13.27.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 13:27:35 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 28 Nov 2011 22:27:30 +0100
Message-Id: <4773D6A4-F0BF-40C4-9D4B-9144770CF413@dominion.thruhere.net>
References: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Mon, 28 Nov 2011 21:27:38 -0000
X-Groupsio-MsgNum: 159
Content-Type: multipart/signed;
	boundary="Apple-Mail=_11209429-FF3F-4765-8D2D-68852CF725FD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_11209429-FF3F-4765-8D2D-68852CF725FD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

I need to sit down and run some tests before commenting on it futher, =
but:

Op 28 nov. 2011, om 21:56 heeft Otavio Salvador het volgende geschreven:
>=20
> # Default to 4GiB images
> -SDIMG_SIZE ?=3D "444"=20
> +SDIMG_SIZE ?=3D "4000"

'444' is =B13400 MB, we need to account for the smallest of SD cards, =
the one in the factory is =B13700MB, we subtract 10% to be safe. Have a =
look at the size of e.g. =
http://dominion.thruhere.net/koen/angstrom/beaglebone/Angstrom-Cloud9-IDE-=
eglibc-ipk-v2011.11-core-beaglebone-2011.11.16.img.gz

regards,

Koen=

--Apple-Mail=_11209429-FF3F-4765-8D2D-68852CF725FD
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7T/MUACgkQMkyGM64RGpEHywCfXXQMpC+LRHLyGp/1frL5BJ8z
wvYAn1+wYidgEuTi9yK64Pzyf1VXMiEH
=3rsD
-----END PGP SIGNATURE-----

--Apple-Mail=_11209429-FF3F-4765-8D2D-68852CF725FD--
