Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 802C3E006B8
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 07:07:56 -0800 (PST)
Received: by wwi36 with SMTP id 36so6092084wwi.11
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 07:07:55 -0800 (PST)
Received: by 10.180.4.167 with SMTP id l7mr22151062wil.51.1321283275186;
	Mon, 14 Nov 2011 07:07:55 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	bl10sm12443067wib.15.2011.11.14.07.07.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 07:07:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPOJ94OE+ALWZkov_w73bh4v2C85X-0MHg+RZDxFhOURqDsAYQ@mail.gmail.com>
Date: Mon, 14 Nov 2011 16:07:47 +0100
Message-Id: <DE33B98D-0A5F-4042-B821-DD8496B9AE59@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94OE+ALWZkov_w73bh4v2C85X-0MHg+RZDxFhOURqDsAYQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Nov 2011 15:07:57 -0000
X-Groupsio-MsgNum: 133
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6F6476CC-5F95-4876-AA49-1F7092B32B3D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6F6476CC-5F95-4876-AA49-1F7092B32B3D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 14 nov. 2011, om 15:57 heeft Peter Bigot het volgende geschreven:

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
> So I can prepare more appropriate patches now and in the future, =
please explain:
>=20
> * Why do you want to hard-code the MLO symlink paths in the install
> and deploy directories instead of using the bitbake variables that
> x-load.inc uses for those paths?

Due to variable scoping those are only available inside those recipes, =
not the image class.

> * Why do you want IMAGE_FSTYPE to be extended with .tar.bz2 when this
> class has nothing to do with tar.bz2 images?

It used the tar.bz2 rootfs to populate the extX partition in the past, =
but it looks like it can go away now.

> * Why do you want IMAGE_FSTYPE to be set in the class when every other
> image recipe in openembedded puts IMAGE_FSTYPE modifications in the
> recipe that incorporates the image?

That was a hack to make inheriting the class "just work". I'm not sure =
how to proceed on this one, do we merge this into image_types.bbclass in =
OE-core or not? If there's enough support for requiring to both inherit =
the class and to set IMAGE_FSTYPES to sdcard we can move it.

regards,

Koen=

--Apple-Mail=_6F6476CC-5F95-4876-AA49-1F7092B32B3D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7BLsYACgkQMkyGM64RGpHYhQCfbQcmAJJCZvCyLeoHU4JlTl6e
YOEAn298tyHdEDA+IAk/Zi979pn1nv/g
=CvBb
-----END PGP SIGNATURE-----

--Apple-Mail=_6F6476CC-5F95-4876-AA49-1F7092B32B3D--
