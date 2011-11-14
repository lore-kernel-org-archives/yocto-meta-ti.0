Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E61E0E00303
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 05:13:07 -0800 (PST)
Received: by wyg10 with SMTP id 10so1056315wyg.35
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 05:13:06 -0800 (PST)
Received: by 10.180.75.204 with SMTP id e12mr25084797wiw.61.1321276386536;
	Mon, 14 Nov 2011 05:13:06 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id db1sm12248567wib.19.2011.11.14.05.13.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 05:13:05 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
Date: Mon, 14 Nov 2011 14:13:02 +0100
Message-Id: <3E9028C1-21DA-4F52-85E5-F20219484970@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
To: Peter Bigot <bigotp@acm.org>
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
X-List-Received-Date: Mon, 14 Nov 2011 13:13:08 -0000
X-Groupsio-MsgNum: 126
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6F8FCA45-A787-431E-B1F5-19C4D4F9D371";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6F8FCA45-A787-431E-B1F5-19C4D4F9D371
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 13 nov. 2011, om 19:57 heeft Peter Bigot het volgende geschreven:

> On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende =
geschreven:
>>=20
>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>=20
>>> Generalize the search for MLO to install to have correct path for =
copies
>>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SPL =
builds
>>> where there is no MLO.
>>>=20
>>> Allow user to override the loop mount point as well as the loop =
device, for
>>> folks who don't want long paths to temporary directories in their =
fstabs.
>>>=20
>>> Add noauto to example fstab entries so systems will boot without =
attempting
>>> to mount an unconfigured loopback device.
>>>=20
>>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>>=20
>> I like the fstab changes, but not the others, could you please split =
this patch?
>=20
> Sure, next time I have to sync with meta-ti.  Without the MLO fixes
> I'd end up with something that doesn't work, and I don't want to blow
> another half hour testing a script I can't use.

The MLO issue has been fixed in the proper places now:

=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/commit/?id=3D2de08fa6d4208a016b447832601f83fd51cb8f93
=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/commit/?id=3D955b40d36a5d2b6eb9ca50bed7103d7b6daa7feb

regards,

Koen=

--Apple-Mail=_6F8FCA45-A787-431E-B1F5-19C4D4F9D371
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7BE98ACgkQMkyGM64RGpGyIwCaAqijXuXUgiiwcZ4r9zCyrjUF
XeMAoKTJFEShy8HsSDc5DYhFx0T+ybZa
=tUOP
-----END PGP SIGNATURE-----

--Apple-Mail=_6F8FCA45-A787-431E-B1F5-19C4D4F9D371--
