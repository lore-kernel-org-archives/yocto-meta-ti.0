Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B6ECE01217
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 03:06:42 -0800 (PST)
Received: by werm10 with SMTP id m10so2834816wer.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 03:06:42 -0800 (PST)
Received: by 10.216.138.38 with SMTP id z38mr6588421wei.14.1324379201859;
	Tue, 20 Dec 2011 03:06:41 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dj9sm3526080wib.6.2011.12.20.03.06.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 03:06:41 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201112201155.39426.schnitzeltony@gmx.de>
Date: Tue, 20 Dec 2011 12:06:39 +0100
Message-Id: <D926CBED-9400-4BD4-918D-D6A62C687658@dominion.thruhere.net>
References: <201112201115.39033.schnitzeltony@gmx.de>
	<FEF0BC67-DB90-448F-B36A-F847037D4CBE@dominion.thruhere.net>
	<201112201155.39426.schnitzeltony@gmx.de>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <Schnitzeltony@gmx.de>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: commit b72cb13fcf83b9d342808ea30379bfb6a1321b54 breaks parse
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
X-List-Received-Date: Tue, 20 Dec 2011 11:06:44 -0000
X-Groupsio-MsgNum: 266
Content-Type: multipart/signed;
	boundary="Apple-Mail=_839C6D10-0122-400F-9EFE-FC5D9CB4E04B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_839C6D10-0122-400F-9EFE-FC5D9CB4E04B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 20 dec. 2011, om 11:55 heeft Andreas M=FCller het volgende =
geschreven:

> On Tuesday, December 20, 2011 11:31:47 AM Koen Kooi wrote:
>> Op 20 dec. 2011, om 11:15 heeft Andreas M=FCller het volgende =
geschreven:
>>> On all my build machines  I get
>>>=20
>>> Loading cache: 100% |
>>> =
#########################################################################
>>> =
#####################################################################|
>>> ETA:  00:00:00
>>> Loaded 1880 entries from dependency cache.
>>> ERROR: Unable to parse
>>> /home/andreas/data/oe-core/sources/meta-ti/recipes-
>>> kernel/linux/linux_3.1.bb
>>> ...
>>> IOError: [Errno 2] No such file or directory:
>>> '/home/andreas/data/Downloads/packets/dl/defconfig'
>>=20
>> I'm not seeing any of that, but I'm keeping an eye on it.
> Hm.. can you try to set DL_DIR outside of OE_BASE?

My setup is:

/OE/tentacle/oebb.sh -> DL_DIR /OE/downloads (debian)
~/Angstrom/oebb.sh -> DL_DIR ~/Angstrom/sources/downloads (fedora)

Both don't seem to suffer from the defconfig problem yet.

regards,

Koen



>=20
> Andreas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_839C6D10-0122-400F-9EFE-FC5D9CB4E04B
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7wbD8ACgkQMkyGM64RGpHjJQCeIz8ZtsaO5fo8o34USQ5K43dH
WWsAnRf09FO2hI9gHsBlSNUFRMfcFjCX
=VweB
-----END PGP SIGNATURE-----

--Apple-Mail=_839C6D10-0122-400F-9EFE-FC5D9CB4E04B--
