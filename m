Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF5B5E00304
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2011 00:45:06 -0700 (PDT)
Received: by wwf10 with SMTP id 10so2765184wwf.11
	for <meta-ti@yoctoproject.org>; Fri, 04 Nov 2011 00:45:05 -0700 (PDT)
Received: by 10.216.132.215 with SMTP id o65mr4031100wei.17.1320392705084;
	Fri, 04 Nov 2011 00:45:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eu16sm14525651wbb.7.2011.11.04.00.45.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 00:45:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320377869-29758-1-git-send-email-joelagnel@ti.com>
Date: Fri, 4 Nov 2011 08:44:56 +0100
Message-Id: <CC88246E-01E5-4BA1-A555-68F557393200@dominion.thruhere.net>
References: <1320377869-29758-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.10rc: Fix pmic shut down over USB power
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
X-List-Received-Date: Fri, 04 Nov 2011 07:45:07 -0000
X-Groupsio-MsgNum: 78
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ED1AAC05-9920-4591-95C0-4B522EC65421";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ED1AAC05-9920-4591-95C0-4B522EC65421
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 4 nov. 2011, om 04:37 heeft Joel A Fernandes het volgende geschreven:

> These are some fixes suggested by Jason Kridner to fix the PMIC
> instabilities we've been seeing over USB power.
> 
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> Cc: Jason Kridner <jdk@ti.com>

Applied, thanks!

--Apple-Mail=_ED1AAC05-9920-4591-95C0-4B522EC65421
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6zl/kACgkQMkyGM64RGpEZLwCfVjdVFoiqWdsZMV1d5V9Pp7fB
WjgAniEfSF4gPLuhpi0yXo/U4bGsvbuq
=c6IB
-----END PGP SIGNATURE-----

--Apple-Mail=_ED1AAC05-9920-4591-95C0-4B522EC65421--
