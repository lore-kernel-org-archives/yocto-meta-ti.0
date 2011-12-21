Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1ED8E0072A
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2011 04:41:09 -0800 (PST)
Received: by wgbdt13 with SMTP id dt13so12957601wgb.11
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2011 04:41:08 -0800 (PST)
Received: by 10.227.207.67 with SMTP id fx3mr6166530wbb.0.1324471266847;
	Wed, 21 Dec 2011 04:41:06 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fo18sm5704940wbb.12.2011.12.21.04.41.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 04:41:06 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrk1kcVHT0X24Fx+mYpZvJzvnGE7cO7F2Cc3H+PjLTP_A@mail.gmail.com>
Date: Wed, 21 Dec 2011 13:41:02 +0100
Message-Id: <17500F41-C8A7-4126-B996-29E21CA6B981@dominion.thruhere.net>
References: <1324425250-25536-1-git-send-email-raj.khem@gmail.com>
	<06A34B52-33FF-45A3-A212-33B8619DCE11@dominion.thruhere.net>
	<CAP9ODKrk1kcVHT0X24Fx+mYpZvJzvnGE7cO7F2Cc3H+PjLTP_A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot_2011.09: Always use gnu ld for LD
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
X-List-Received-Date: Wed, 21 Dec 2011 12:41:10 -0000
X-Groupsio-MsgNum: 274
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EAACD544-F72E-40A8-B42A-58E54B2A8675";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EAACD544-F72E-40A8-B42A-58E54B2A8675
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 21 dec. 2011, om 12:42 heeft Otavio Salvador het volgende geschreven:

> On Wed, Dec 21, 2011 at 06:38, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> Could you make the patch itself git am-able please? This like From: =
and Subject are missing.
>=20
> Why?

So it can be used to contruct a git tree later on and so that things =
like http://patches.openembedded.org/patch/15863/ work.

For meta-ti I'd like to have every patch git-am-able with SOBs and =
Upstream status included as well. We're not there yet, but new patches =
should aim for that.

regards,

Koen=

--Apple-Mail=_EAACD544-F72E-40A8-B42A-58E54B2A8675
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7x0+AACgkQMkyGM64RGpH4nQCgkeFVpEKBp7/S8AQvN5aaXmfi
+/sAnA1aI/yip3zxFqsPCn1i/TQ+Ejj6
=rj0B
-----END PGP SIGNATURE-----

--Apple-Mail=_EAACD544-F72E-40A8-B42A-58E54B2A8675--
