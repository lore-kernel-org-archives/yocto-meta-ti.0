Return-Path: <koen@dominion.thruhere.net>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1003E00748
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 01:38:04 -0800 (PST)
Received: by laam7 with SMTP id m7so6532112laa.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 01:38:03 -0800 (PST)
Received: by 10.152.146.99 with SMTP id tb3mr15002199lab.7.1325065082994;
	Wed, 28 Dec 2011 01:38:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id oy18sm130173lab.3.2011.12.28.01.38.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 01:38:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1325033520-6907-6-git-send-email-bigotp@acm.org>
Date: Wed, 28 Dec 2011 10:37:57 +0100
Message-Id: <9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
To: Peter A. Bigot <bigotp@acm.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/5] linux 3.0: put back support for graphics on ULCD7
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
X-List-Received-Date: Wed, 28 Dec 2011 09:38:05 -0000
X-Groupsio-MsgNum: 303
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7F67AC82-4930-497D-BC81-A43BB6B16122";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7F67AC82-4930-497D-BC81-A43BB6B16122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende geschreven:

> From: "Peter A. Bigot" <bigotp@acm.org>
>=20
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
> ---
> .../linux/linux-3.0/beagleboard/defconfig          |    2 +-
> recipes-kernel/linux/linux_3.0.bb                  |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig =
b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> index 5f2a7eb..7938236 100644
> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
> CONFIG_FB_OMAP2=3Dy
> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
> -CONFIG_FB_OMAP2_NUM_FBS=3D2
> +CONFIG_FB_OMAP2_NUM_FBS=3D3

NAK, we need one to be available for v4l=

--Apple-Mail=_7F67AC82-4930-497D-BC81-A43BB6B16122
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7643gACgkQMkyGM64RGpFadgCfbguU9xKL1yXJOCYeGo0eAG/l
8jsAnRs/faIBfmXiGfgGvfFGfZ6KI+nq
=2+yZ
-----END PGP SIGNATURE-----

--Apple-Mail=_7F67AC82-4930-497D-BC81-A43BB6B16122--
