Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27325E00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:22:44 -0800 (PST)
Received: by eaal12 with SMTP id l12so4291274eaa.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:22:43 -0800 (PST)
Received: by 10.227.205.135 with SMTP id fq7mr30864618wbb.19.1322572963539;
	Tue, 29 Nov 2011 05:22:43 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm42730405wbb.11.2011.11.29.05.22.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 05:22:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
Date: Tue, 29 Nov 2011 14:22:37 +0100
Message-Id: <4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2011 13:22:45 -0000
X-Groupsio-MsgNum: 168
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CF07CB1B-97B2-4D9C-93D2-2F7F81D11524";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CF07CB1B-97B2-4D9C-93D2-2F7F81D11524
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 29 nov. 2011, om 13:53 heeft Otavio Salvador het volgende geschreven:

> On Tue, Nov 29, 2011 at 10:41, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
> ...=20
> +# Copyright (C) 2011 O.S. Systems Software LTDA.
> +#
> +# Create an image that can by written onto a SD card using dd.
> +#
> +# External variables needed:
> +#   ${ROOTFS} - the rootfs image to incorporate
>=20
> I added Joel in copyright noticed as he did the first version of it. =
You can look at =
https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398=
ea12d660b3=20

And I wrote the original and then rewrote Joels version. So lets leave =
out any copyright statement from the class.

regards,

Koen=

--Apple-Mail=_CF07CB1B-97B2-4D9C-93D2-2F7F81D11524
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7U3KAACgkQMkyGM64RGpF/0gCfXnQtgR/8Lt6N/oeUOvSZVGQw
UkIAn3qJtVrlsv0oSfYphViOmfVCh1ab
=kUmN
-----END PGP SIGNATURE-----

--Apple-Mail=_CF07CB1B-97B2-4D9C-93D2-2F7F81D11524--
