Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B60FBE00502
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:42:19 -0800 (PST)
Received: by bkar19 with SMTP id r19so8873486bka.35
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:42:18 -0800 (PST)
Received: by 10.204.151.193 with SMTP id d1mr5679430bkw.26.1321209738429;
	Sun, 13 Nov 2011 10:42:18 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fu17sm26818410bkc.9.2011.11.13.10.42.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Nov 2011 10:42:17 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321208716-9749-1-git-send-email-bigotp@acm.org>
Date: Sun, 13 Nov 2011 19:42:07 +0100
Message-Id: <489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
To: Peter A. Bigot <bigotp@acm.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] sdcard_image bbclass: fix MLO copy, loop device mounts, fstypes
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
X-List-Received-Date: Sun, 13 Nov 2011 18:42:21 -0000
X-Groupsio-MsgNum: 118
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F3FCEEB6-7AAD-4ADF-B250-DE2B937F05CE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F3FCEEB6-7AAD-4ADF-B250-DE2B937F05CE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende geschreven:

> From: "Peter A. Bigot" <bigotp@acm.org>
>=20
> Generalize the search for MLO to install to have correct path for =
copies
> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SPL =
builds
> where there is no MLO.
>=20
> Allow user to override the loop mount point as well as the loop =
device, for
> folks who don't want long paths to temporary directories in their =
fstabs.
>=20
> Add noauto to example fstab entries so systems will boot without =
attempting
> to mount an unconfigured loopback device.
>=20
> Remove IMAGE_FSTYPE_append which does not belong in this class.

I like the fstab changes, but not the others, could you please split =
this patch?

regards,

Koen=

--Apple-Mail=_F3FCEEB6-7AAD-4ADF-B250-DE2B937F05CE
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7AD4IACgkQMkyGM64RGpGW8gCgrK/QEYtpHxYDuOHPuONYeJlv
TZgAmQGlt/0ZCZoRvbNbqUpCr6QpT0P3
=Az4V
-----END PGP SIGNATURE-----

--Apple-Mail=_F3FCEEB6-7AAD-4ADF-B250-DE2B937F05CE--
