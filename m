Return-Path: <tom.rini@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16C4BE004D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:38:01 -0700 (PDT)
Received: by yenq4 with SMTP id q4so3809451yen.35
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=51n15uYpTYClf5YzLORNsF+lZFPjFC1dTyUJhq4LoPA=;
	b=FfHkGNARkpjsWeY80QffveAZ9654aLqVT9+FhzYDys5UBmnQmWpCRiyXwvcFRUffdB
	vocim63rAui6aGd0VAGo+ihsfzGHJ0OIHjJyuH2mtwYbFQJWZ/QRbtIjXE3NCLFdwzgm
	IYmmWLxHBkEBX38+WBwB+c/oqXKaDeAlH+ws2sVfvTBV1xdISesjqDe/Xtr4ae1Byp1P
	IQkO7hQR7ErwVwWJCoEcGqCRk9ib1mQF4C7QirWBMcmOt1uSOnkl/HFaQcGFknHGGlHn
	Y3VRtmF0BCluExICHaE9Zr3037m8lsZrkfuoAHkY9ggQfpHU8EgYRJXnigSgJD4dr18n
	4WZg==
Received: by 10.60.0.201 with SMTP id 9mr15203878oeg.59.1332524280564;
	Fri, 23 Mar 2012 10:38:00 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id q9sm8316732obz.14.2012.03.23.10.37.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:37:59 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Fri, 23 Mar 2012 10:38:02 -0700
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Message-ID: <20120323173802.GH9551@bill-the-cat>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<1332524217-27534-3-git-send-email-trini@ti.com>
MIME-Version: 1.0
In-Reply-To: <1332524217-27534-3-git-send-email-trini@ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2 3/4] omap3evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 17:38:01 -0000
X-Groupsio-MsgNum: 851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7J16OGEJ/mt06A90"
Content-Disposition: inline

--7J16OGEJ/mt06A90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 10:36:56AM -0700, Tom Rini wrote:

> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>  conf/machine/omap3evm.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Code is correct, commit message wasn't updated.  v3 or can someone just
fix before pushing?  Thanks!

--=20
Tom

--7J16OGEJ/mt06A90
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPbLT5AAoJENk4IS6UOR1WsZMP/RUQs1Dzk1dzdxdNnmrjObmv
3/b1PuTN8pAahJN+GBn23e6zqcvsmrx5Ev4DXz6KDaNiWUU5zlVGtvsDObpChFXR
MDXa9FveZ/JxNTGVyox4IRt1HHGWIwRYfLjPYGqyw0T4gBmY79skudWvL/p6Ro1o
JTFcaUUIJRfGB/oQWOP5uR6DWSr9GEMQE4gysv4A1qr5UL81xzcHI0ut8pT0cxRG
CLmjuNjLlp6xKunZruTTqqaw6HXXPhm89BJn6vgvvcc2hXvvFINUG9L9VxiGRbsn
jDv9rJsfw9o5VYKRAMaKs1k1G+RcUbLocZmAhmLx8hpwoxiLNMg+lj8ZwDsdeK9z
E+5smjOwBLSuwhh2jEmiPI4Q4IS385b1GQ3BzxQJG4TpiJfGjEJk/AfswkLDcJCh
/ncOOBc1o6oaSuBMcJ5MqJuVYxDXY3EhIipLYFLLbxOy/8lkLwwk0ViH/Lni0VeF
7nsC370YCsBCa1ZY1FgcEkF1bl5zD7KBSQe3Bg6fuBJ994shcDqqeuS8kf1cvocp
2u7NqBvrdoY/a6Pk8enPVYhdWynPK6AYQIgbViLaeKsR3R1Bpg2kdoY2fF1u9EET
BCfMcK0zwe4Qe1tz84BAtq8LPcekb0YbRl07lypN8OQRKGYyc9iWve6q5+q73z1v
1w5Q3/n252l5XvCBpMyM
=ubE1
-----END PGP SIGNATURE-----

--7J16OGEJ/mt06A90--
