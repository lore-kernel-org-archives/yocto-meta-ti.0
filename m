Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F47BE00596
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 17:07:18 -0700 (PDT)
Received: by obbuo19 with SMTP id uo19so9005491obb.35
	for <meta-ti@yoctoproject.org>; Mon, 09 Apr 2012 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=xbSgqAyxvLWhOPFWzTijeBmxGNKvzPnygK5NNvi7Atk=;
	b=jfqdYOKKmdEnmM/oBAxVE5A1bEPeEiMuv+/VmRnEFBjeanfZk4CigFhiCPGmITmCP0
	40dlZeorX7wwTybxlPxH82dL9mZZYlnXthc6gLA+1xzS8xsMMEUlusNr/Co248uc8NrD
	jOYMqoAXhPCMZFNkRcmAoufDy6LaRTy+TPhucxcqY0SCrLTX//g4p75FcovvbkyoMq2u
	Q7UyV8zDAipwQTs1Hxc5H7XP/5KqmxND0vQEX+789OCJt2C3xslR1oSBGLfxGT2sb5wE
	PcRe1s2WQm7L4MjyzxrpmKEt+HhlHZ/GIargeqV4RBMhOmO5nMZ5+sjYQzVPmRM2QNrv
	hYZQ==
Received: by 10.182.51.73 with SMTP id i9mr13454028obo.17.1334016437994;
	Mon, 09 Apr 2012 17:07:17 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id in4sm18009924obb.2.2012.04.09.17.07.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 17:07:16 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Mon, 9 Apr 2012 17:07:18 -0700
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120410000718.GA2333@bill-the-cat>
References: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
	<1333987604-1614-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1333987604-1614-2-git-send-email-koen@dominion.thruhere.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 2/5] u-boot 2011.10rc: fix loading from /boot by adding ext4 support
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
X-List-Received-Date: Tue, 10 Apr 2012 00:07:18 -0000
X-Groupsio-MsgNum: 930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 09, 2012 at 06:06:41PM +0200, Koen Kooi wrote:

> This patchset was pulled from u-boot patchwork and aren't final, but test=
ing on beaglebone shows it to work.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Tom Rini <trini@ti.com>

--=20
Tom

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPg3m2AAoJENk4IS6UOR1W5zUP/jAw/197PTh6AyX6seRt+U7k
jmdGwc6ATK8v4UTpqjKukIUSEIM70Xy4FIzBTk59D0VFuKXji+e/irOMc9cJhfnA
JGomTc0Ye7IuDnR5+AOzYfRU+w90swHwdphAr1LVMIKOEjes7DGEo9VV+z0QuF6k
F+evmvDTiXBJkUp/yR1Uak/Kgb/ilw2Bp8HSkC5eCJrDFxZS20Br7Gqc0xulx+Ao
AZ+vTgoMGm8SkWA3pUaKHrJqdavweP4f7Hb8Dra7SWu8JQycI5nrlz8Khl55k/tH
AYGiDi992ybxNQ7hVAQwxNBfVuFjujif15EUXVfkK7InuVvngOU2hVhRG6X/XS56
h4t4PLEkrk0z8UTUaxCu2tPeWedcYw8IYSeKpNYToDGuG6J0xMaszY/tNF+bdtLr
4XSAMKNeG9PSOXfTQW5wqtZvIFZ/RetgRff38kZlGhVCf+bU7EXNGMuoTVccYRWS
XMEinjZOaVaDrW4aC1pA71ElA+ZLceLvJuNoiosfpmav3gxjCXNpnrdn0VP2xKsJ
tMk5mhn+44vhYuvaJjBMtzxSgmEnbrhimy0N4eaBcTs9zuwvF5nGF6D8jsYqB4rR
YnYlY2vQJyZ+bkc8ONORBRHdkgx4an4E7ySS8/ioFyBLF93qxxnWKM7NpbKn7Y9i
aYEWJzSRVmEJIUJG9+Hj
=NIcB
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
