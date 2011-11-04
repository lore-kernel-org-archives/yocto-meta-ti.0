Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0333E00309
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2011 00:45:15 -0700 (PDT)
Received: by mail-ww0-f54.google.com with SMTP id 10so2765184wwf.11
	for <meta-ti@yoctoproject.org>; Fri, 04 Nov 2011 00:45:15 -0700 (PDT)
Received: by 10.227.202.149 with SMTP id fe21mr16408190wbb.15.1320392715371;
	Fri, 04 Nov 2011 00:45:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eu16sm14525651wbb.7.2011.11.04.00.45.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 00:45:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320356084-4206-1-git-send-email-jdk@ti.com>
Date: Fri, 4 Nov 2011 08:45:11 +0100
Message-Id: <BBFD5A86-6DA8-4342-BD2E-509875E9583E@dominion.thruhere.net>
References: <1320356084-4206-1-git-send-email-jdk@ti.com>
To: Jason Kridner <jdk@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdimage_class: eliminate 2GB exception for BeagleBone
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
X-List-Received-Date: Fri, 04 Nov 2011 07:45:16 -0000
X-Groupsio-MsgNum: 79
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E008DC39-56CB-4C2B-B270-D4A13B962DE4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E008DC39-56CB-4C2B-B270-D4A13B962DE4
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 22:34 heeft Jason Kridner het volgende geschreven:

> Gerald has said his supply of 2GB SD cards for BeagleBone has
> gone away, so we are back to 4GB cards.  No more need for this
> exeption:
> 
> Signed-off-by: Jason Kridner <jdk@ti.com>

Applied, thanks!

--Apple-Mail=_E008DC39-56CB-4C2B-B270-D4A13B962DE4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6zmAcACgkQMkyGM64RGpGmjQCeNwVsiBIHvTO0QibRieq73MGH
ucwAnRhYF49rOTJlnMCFALTAmLitiKvV
=mAXI
-----END PGP SIGNATURE-----

--Apple-Mail=_E008DC39-56CB-4C2B-B270-D4A13B962DE4--
