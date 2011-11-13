Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55F65E00502
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 09:09:33 -0800 (PST)
Received: by wyg10 with SMTP id 10so247007wyg.35
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 09:09:32 -0800 (PST)
Received: by 10.180.104.35 with SMTP id gb3mr3367461wib.11.1321204172759;
	Sun, 13 Nov 2011 09:09:32 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id db1sm10709802wib.19.2011.11.13.09.09.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Nov 2011 09:09:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321197079-16422-1-git-send-email-joelagnel@ti.com>
Date: Sun, 13 Nov 2011 18:09:28 +0100
Message-Id: <96D8B429-D458-46D7-8558-3F33C9EB29BC@dominion.thruhere.net>
References: <1321197079-16422-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org, chase.maupin@ti.com
Subject: Re: [PATCH v2] linux-ti33x-psp: Check if scheduling is required after DMA
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
X-List-Received-Date: Sun, 13 Nov 2011 17:09:35 -0000
X-Groupsio-MsgNum: 113
Content-Type: multipart/signed;
	boundary="Apple-Mail=_47E5FF63-1210-40BF-B380-A4A6A68BC8D6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_47E5FF63-1210-40BF-B380-A4A6A68BC8D6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 13 nov. 2011, om 16:11 heeft Joel A Fernandes het volgende =
geschreven:

> After processing one DMA completion, checking if rescheduling is
> required instead of scheduling another completion request if the
> FIFO is non empty.
>=20
> This fixes high CPU load issue seen with g_mass_storage on a =
beaglebone
> and could potentially fix similar issues seen with other gadget =
drivers
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>


I stil get the 100% cpu load after ejecting the drive even after =
applying this patch.

regards,

Koen=

--Apple-Mail=_47E5FF63-1210-40BF-B380-A4A6A68BC8D6
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6/+ckACgkQMkyGM64RGpExOACeMaKmmwJwQbD96rcdgyI9OsIp
n04AoJ/dDKg8IPlSPplfmHi/2U2XOILx
=5psb
-----END PGP SIGNATURE-----

--Apple-Mail=_47E5FF63-1210-40BF-B380-A4A6A68BC8D6--
