Return-Path: <koen@dominion.thruhere.net>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73863E006DD
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2011 00:38:23 -0800 (PST)
Received: by qadc16 with SMTP id c16so5251980qad.14
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2011 00:38:22 -0800 (PST)
Received: by 10.224.173.146 with SMTP id p18mr7174641qaz.20.1324456702018;
	Wed, 21 Dec 2011 00:38:22 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ih18sm7155682qab.8.2011.12.21.00.38.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 00:38:21 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1324425250-25536-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 21 Dec 2011 09:38:14 +0100
Message-Id: <06A34B52-33FF-45A3-A212-33B8619DCE11@dominion.thruhere.net>
References: <1324425250-25536-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 21 Dec 2011 08:38:24 -0000
X-Groupsio-MsgNum: 273
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AA200C09-0441-42DC-9C9A-671F0C199487";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AA200C09-0441-42DC-9C9A-671F0C199487
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 21 dec. 2011, om 00:54 heeft Khem Raj het volgende geschreven:

> u-boot wants GNU ld and cant link with gold
> so when default linker is gold we make sure
> that it still uses good old GNU ld
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch |   29 =
+++++++++++++++++++++
> recipes-bsp/u-boot/u-boot_2011.09.bb              |    3 +-
> 2 files changed, 31 insertions(+), 1 deletions(-)
> create mode 100644 recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch

Could you make the patch itself git am-able please? This like From: and =
Subject are missing.

> diff --git a/recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch =
b/recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch
> new file mode 100644
> index 0000000..a527317
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch
> @@ -0,0 +1,29 @@
> +This patch makes sure that we always use the GNU ld. u-boot uses =
certain contruct
> +e.g. OVERLAY which are not implemented in gold therefore it always =
needs GNU ld
> +for linking. It works well if default linker in toolchain is GNU ld =
but in some cases
> +we can have gold to be the default linker and also ship GNU ld but =
not as default
> +in such cases its called $(PREFIX)ld.bfd, with this patch we make =
sure that if
> +$(PREFIX)ld.bfd exists than we use that for our ld. This way it does =
not matter
> +what the default ld is.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/config.mk
> ++++ b/config.mk


regards,

Koen=

--Apple-Mail=_AA200C09-0441-42DC-9C9A-671F0C199487
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7xmvsACgkQMkyGM64RGpElkACgqetrzNUECOxDLXc3BaH8gpuZ
a7gAoLYN2xeQIQ9FVzMItoGLmJzqGT8m
=QE17
-----END PGP SIGNATURE-----

--Apple-Mail=_AA200C09-0441-42DC-9C9A-671F0C199487--
