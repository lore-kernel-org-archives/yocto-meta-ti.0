Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACEB6E00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:44:04 -0800 (PST)
Received: by wwi36 with SMTP id 36so641105wwi.11
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 08:44:03 -0800 (PST)
Received: by 10.216.131.42 with SMTP id l42mr5690451wei.16.1320857042406;
	Wed, 09 Nov 2011 08:44:02 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm6256229wbb.1.2011.11.09.08.44.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 08:44:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <083BC63EECB6FD41B8E81CF7FD87CC0F04451C@DLEE09.ent.ti.com>
Date: Wed, 9 Nov 2011 17:43:50 +0100
Message-Id: <333D792C-41CE-45E3-A358-46EC329BC830@dominion.thruhere.net>
References: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
	<E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
	<083BC63EECB6FD41B8E81CF7FD87CC0F0444FD@DLEE09.ent.ti.com>
	<CA+T6QPmhDgFFgOr3tAmkfV6DasPj8ec5vrDyiGL55R12Z4_4uA@mail.gmail.com>
	<083BC63EECB6FD41B8E81CF7FD87CC0F04451C@DLEE09.ent.ti.com>
To: "Fernandes, Joel A" <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] gadget-init: Add network-gadget services and other fixes
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
X-List-Received-Date: Wed, 09 Nov 2011 16:44:05 -0000
X-Groupsio-MsgNum: 98
Content-Type: multipart/signed;
	boundary="Apple-Mail=_75ACB8BB-F3C9-41F6-8003-BE844C27DC74";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_75ACB8BB-F3C9-41F6-8003-BE844C27DC74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 9 nov. 2011, om 17:32 heeft Fernandes, Joel A het volgende =
geschreven:
>>=20
>> This isn't a generic udhcp recipe.  It should probably just be
>> renamed.  It is specifically for the point of providing addresses to
>> the other end of the USB network gadget.
>=20
> Can we avoid making a new create for udhcpc then? I just feel it is =
overkill and this simple service/conf can go in this same recipe. I am =
ok with renaming the config and service files to gether-dhcp or the =
like. Let us know your opinion so we can collectively take a call on how =
to go about doing it.

Think of what happens when you want to install a package with another =
udhcpc config, do you want to wipe out the gstorage setting as well in =
that case? All this needs to be modularized so people can mix&match, =
having a single big blob is not going to give a nice user experience. =
And as you might have guessed, I'm not too sold on including both the =
g_ether and gstorage in on package (they can share the same recipe, =
though).

In the end it's Jasons call how nice things need to be before we apply =
the patch. I must warn that anytime we said "we'll fix it after the =
deadline" for beagle stuff we never managed to fix it, the most recent =
example being uLCD support.

regards,

Koen=

--Apple-Mail=_75ACB8BB-F3C9-41F6-8003-BE844C27DC74
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66rcsACgkQMkyGM64RGpF2NQCfRVbFeUrFPGaJmaVVC/W/GQvh
9w0An0JpZmO4e0dQjOjeCJqvK5Q5deAh
=aYbJ
-----END PGP SIGNATURE-----

--Apple-Mail=_75ACB8BB-F3C9-41F6-8003-BE844C27DC74--
