Return-Path: <koen@dominion.thruhere.net>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3846E00307
	for <meta-ti@yoctoproject.org>; Thu, 24 Nov 2011 08:49:08 -0800 (PST)
Received: by faan2 with SMTP id n2so1293512faa.35
	for <meta-ti@yoctoproject.org>; Thu, 24 Nov 2011 08:49:07 -0800 (PST)
Received: by 10.204.131.88 with SMTP id w24mr29947548bks.113.1322153347124;
	Thu, 24 Nov 2011 08:49:07 -0800 (PST)
Received: from [10.0.2.4] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	l18sm25816831fab.9.2011.11.24.08.49.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 08:49:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4ECE2C84.5090202@ts.fujitsu.com>
Date: Thu, 24 Nov 2011 17:48:59 +0100
Message-Id: <5AD955E5-8008-4016-B69F-6B6E5446DBE8@dominion.thruhere.net>
References: <4ECDFB92.10203@ts.fujitsu.com> <4ECE25CD.9090105@mlbassoc.com>
	<4ECE2C84.5090202@ts.fujitsu.com>
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: SRC_URI points to local domain:
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
X-List-Received-Date: Thu, 24 Nov 2011 16:49:09 -0000
X-Groupsio-MsgNum: 148
Content-Type: multipart/signed;
	boundary="Apple-Mail=_42E39EAA-B1CE-4093-B7AE-56EA3D86A3C9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_42E39EAA-B1CE-4093-B7AE-56EA3D86A3C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 24 nov. 2011, om 12:37 heeft Rainer Koenig het volgende geschreven:

> Am 24.11.2011 12:09, schrieb Gary Thomas:
>=20
>>> $ find -type f | xargs grep SRC_URI | grep "local/"
>>> ./recipes-ti/hdvpss/ti-hdvpss.inc:SRC_URI =3D
>>> "http://install.source.dir.local/REL.HDVPSS.${PV}.zip"
>>> ./recipes-ti/devtools/ti-cgt6x.inc:SRC_URI =3D
>>> =
"http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x8=
6.bin;name=3Dcgt6xbin"
>>> ./recipes-ti/devtools/ti-cgt470.inc:SRC_URI =3D
>>> =
"http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x=
86.bin;name=3Dcgt470bin"
>=20
>> Fetch the files yourself and place in your [local] downloads =
directory (DL_DIR)
>> No need to change the recipe as OE will look there first.
>=20
> Well, the 2 cgt files I was able to find at TI, but I have no download
> URL for the REL.HDVPSS.${PV}.zip file. :-(

This is a know problem, please complain loudly to your TI rep about =
this!



--Apple-Mail=_42E39EAA-B1CE-4093-B7AE-56EA3D86A3C9
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7OdX0ACgkQMkyGM64RGpGMjwCdHnte3EF4cvfRvW/5rq//DgFr
OdYAoITGrrokc+GjB9q7+hukc8nRe+EH
=0/9q
-----END PGP SIGNATURE-----

--Apple-Mail=_42E39EAA-B1CE-4093-B7AE-56EA3D86A3C9--
