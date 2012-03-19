Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7018E013A5
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 13:58:58 -0700 (PDT)
Received: by yhfq46 with SMTP id q46so7390737yhf.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=expLly2RlRXnbYXKApP9uxCM5MeYwvO0spoE/75H8jg=;
	b=mgqQx0VZF7ni73/hTvxSj3ucnctVJpx67ZNQ4rAY4lZDumxZUZlQWjkp9g/ao6Ai79
	wR14HQMawXLB9JNKeYFEcyPwU7DKo1IeosDYJRqF3j2hWpft7SnhHPHRfDLKftsinLXm
	LYT5l0+Dg7J2dRglNJgyebnMnn5uMvTKJ3bxPgKxdMwAiofrrA3DdcWxgLwt3juIrWoN
	qJ2DJAnkwU0gJjvwwbdZOMyoeSoUUNCOxDwxF7SuT+/jfbf5ivouGT2NKd34V68nnKwo
	L9enzclbk0zArr443qmR38GapwxFtHWEG5hsHLkkw1UgyrMJuwVFWyWX43TtF0/KsCDi
	iUwA==
Received: by 10.60.9.102 with SMTP id y6mr15962671oea.46.1332190738407;
	Mon, 19 Mar 2012 13:58:58 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id h7sm10898870oeh.9.2012.03.19.13.58.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 13:58:57 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Mon, 19 Mar 2012 13:58:54 -0700
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120319205854.GE19810@bill-the-cat>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: release branch for meta-ti?
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
X-List-Received-Date: Mon, 19 Mar 2012 20:58:59 -0000
X-Groupsio-MsgNum: 814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
> Hi,
>=20
> Any volunteers for maintaining a releasebranch that matches the upcoming =
oe-core release in ~4 weeks?

If Denys or Chase don't step-up, I'll do it.  As qualification, I do
such a thing for oe-classic currently :)  But if either of them would
rather, I'll defer to them.

--=20
Tom

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPZ54OAAoJENk4IS6UOR1WN4IP/Ar3pQrwTl6P0neWT4F2PIuS
vzP1I8N9zrS6hmBJrrm8DcyrqoeRTnceHKsUVFBnnVrg0cNoUgswp+GVeKwk/4h8
qgQ+UNsDgPvnegy0+0lqmJ71qEkH30Gz/CuVyPvqSCSJYJn3CBlyDD8YmwPRRKTf
OSOu16caeN00b19Zf7bFL65t2XBxWk2MjYXdv2lbnl1/zXfCdNza4CCKDcgeeVP5
R74OvggdzsXoBJeLaLmBF7eTS6Z3ukCJp/c0Qgvp3hyaIzF9Zu6Yhs3m0y47tJaT
18Dq7pIUet5bovZmUo5dgLwZiKhyyiGfxjEMZI7LOtHbsjDSoMYaezVLU+cNwQg2
+KG4KEp0kWpj8F6FCoWF/MmYSj/9+JEZ8unK3o4h9QJkgPLsLVv/SjJGpiNbxNae
sIL6pTGC79pVcRaRvVni+69fc1/RQcF/ojKXU5UE2XnwCN89jjD0PBqTp2pF1DEf
uLfJhExgYYUM9e/sawceTXroDnHSeNH02ZYlkAmen070iGkrALbztEIVU7xsRcqF
8ygAMTMCwlJi3rckmhh2Kaj8vfXcmY8PiBH98CORhjhd/6beWcw8se+PxrJmpARe
UqhjXUefGnaw9fEDKCRCUTFRgzmWVqJCwmkyucdezkofXArRGWe8MljzpG/MXtbE
ZFL3uhIWGNXiNGMqurDU
=X1Ac
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
