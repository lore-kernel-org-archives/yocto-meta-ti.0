Return-Path: <koen@dominion.thruhere.net>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE984E0030D
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 01:19:59 -0800 (PST)
Received: by fanq24 with SMTP id q24so2764627fan.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 01:19:58 -0800 (PST)
Received: by 10.180.84.71 with SMTP id w7mr3258071wiy.37.1323940798040;
	Thu, 15 Dec 2011 01:19:58 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ea8sm7378845wib.17.2011.12.15.01.19.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 01:19:56 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpzGkocCG9UX34BCnBkQPCCRYd3Kho49RATA3PQawMT7A@mail.gmail.com>
Date: Thu, 15 Dec 2011 10:19:58 +0100
Message-Id: <6F7036D3-C9F8-4CBA-B7C1-654E2113E9EC@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
	<4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
	<CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
	<CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
	<CAP9ODKqvBccdQJuk0mf+ZmzMivsVSLi86cYh72DyRb1-SAWO3w@mail.gmail.com>
	<7A48A7A4-9B78-4C36-91CB-A02CFB138110@dominion.thruhere.net>
	<CAP9ODKqEnA5622xebKPjDAHKckSR+WwWDPqMzxcLs8uj+b3f1w@mail.gmail.com>
	<CAP9ODKpzGkocCG9UX34BCnBkQPCCRYd3Kho49RATA3PQawMT7A@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Dec 2011 09:20:00 -0000
X-Groupsio-MsgNum: 232
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8169059E-19AA-40E2-9BB5-819003E20541";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8169059E-19AA-40E2-9BB5-819003E20541
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 6 dec. 2011, om 15:10 heeft Otavio Salvador het volgende geschreven:

> On Tue, Dec 6, 2011 at 11:43, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
> On Mon, Dec 5, 2011 at 09:59, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> ...
> my suspicion is that it segfaults on the cloud9-image because we copy =
over a lot of files into the vfat partition.
>=20
> This is dependent on how many files are copied onto the fat =
filesystem. This is also dependent on use of -d option that copies a =
directory onto the fs instead of just creating a filesystem.
>=20
> This is a know issue, as shown at =
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1783

There's a fix pending for that in OE-core: =
http://patches.openembedded.org/patch/16951/

Could you rebase and resend your patches after that goes in?

regards,

Koen=

--Apple-Mail=_8169059E-19AA-40E2-9BB5-819003E20541
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7pu8MACgkQMkyGM64RGpE9wACgtcW+pWWvePZnG/NNwBI+HQSe
QtsAoJ9SJfSTk3LEzrbosGetSrcfjo4g
=cLKI
-----END PGP SIGNATURE-----

--Apple-Mail=_8169059E-19AA-40E2-9BB5-819003E20541--
