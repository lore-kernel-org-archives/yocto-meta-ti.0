Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8A97E0070D
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 17 Dec 2011 11:02:29 -0800 (PST)
Received: by wgbdr1 with SMTP id dr1so7409781wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 17 Dec 2011 11:02:28 -0800 (PST)
Received: by 10.216.139.23 with SMTP id b23mr2224779wej.59.1324148548339;
	Sat, 17 Dec 2011 11:02:28 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff1sm19275490wbb.5.2011.12.17.11.02.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Dec 2011 11:02:27 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sat, 17 Dec 2011 20:02:21 +0100
In-Reply-To: <1324137836-6696-2-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
References: <1324137836-6696-1-git-send-email-koen@dominion.thruhere.net>
	<1324137836-6696-2-git-send-email-koen@dominion.thruhere.net>
Message-Id: <CC6CE606-2810-48FD-86FF-B9145B75E772@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/2] linux 3.0: update to 3.0.13
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
X-List-Received-Date: Sat, 17 Dec 2011 19:02:30 -0000
X-Groupsio-MsgNum: 249
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8D03E102-96D4-40CD-872A-657F56463BC7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8D03E102-96D4-40CD-872A-657F56463BC7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Ignore this one, it's still work in progress

Op 17 dec. 2011, om 17:03 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> conf/machine/include/omap3.inc                     |    2 +-
> ...-Fix-twl4030-dependencies-for-audio-codec.patch |   26 =
--------------------
> recipes-kernel/linux/linux_3.0.bb                  |    9 +++----
> 3 files changed, 5 insertions(+), 32 deletions(-)
> delete mode 100644 =
recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-dependen=
cies-for-audio-codec.patch
>=20
> diff --git a/conf/machine/include/omap3.inc =
b/conf/machine/include/omap3.inc
> index 4530ae1..fc252ba 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY =3D "omap3"
> require conf/machine/include/tune-cortexa8.inc
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
> # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR =3D "r113"
> +MACHINE_KERNEL_PR =3D "r114"
>=20
> KERNEL_IMAGETYPE =3D "uImage"
>=20
> diff --git =
a/recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-depend=
encies-for-audio-codec.patch =
b/recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-depend=
encies-for-audio-codec.patch
> deleted file mode 100644
> index 527b0f5..0000000
> --- =
a/recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-depend=
encies-for-audio-codec.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -=46rom 6d7bf5251219d2aa604ada2c955812b16ad5cff4 Mon Sep 17 00:00:00 =
2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Wed, 30 Nov 2011 09:50:56 +0100
> -Subject: [PATCH] Revert "mfd: Fix twl4030 dependencies for audio =
codec"
> -
> -This reverts commit 11b8fc6ae54bf18a48c94e181c37ca135b858b42.
> ----
> - drivers/mfd/twl-core.c |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> -index f0dfca3..e659d4e 100644
> ---- a/drivers/mfd/twl-core.c
> -+++ b/drivers/mfd/twl-core.c
> -@@ -116,7 +116,7 @@
> - #define twl_has_watchdog()        false
> - #endif
> -=20
> --#if defined(CONFIG_MFD_TWL4030_AUDIO) || =
defined(CONFIG_MFD_TWL4030_AUDIO_MODULE) ||\
> -+#if defined(CONFIG_TWL4030_CODEC) || =
defined(CONFIG_TWL4030_CODEC_MODULE) ||\
> - 	defined(CONFIG_SND_SOC_TWL6040) || =
defined(CONFIG_SND_SOC_TWL6040_MODULE)
> - #define twl_has_codec()	true
> - #else
> ---=20
> -1.7.2.5
> -
> diff --git a/recipes-kernel/linux/linux_3.0.bb =
b/recipes-kernel/linux/linux_3.0.bb
> index 38b90e9..f335506 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -5,12 +5,12 @@ KERNEL_IMAGETYPE =3D "uImage"
>=20
> COMPATIBLE_MACHINE =3D "(beagleboard)"
>=20
> -PV =3D "3.0.12"
> -# v3.0.12 tag
> -SRCREV_pn-${PN} =3D "ac6766564c0305ca020fe747dfd7dbdf0881369d"
> +PV =3D "3.0.13"
> +# v3.0.13 tag
> +SRCREV_pn-${PN} =3D "d986a8dbfd7358bfbda116650c4caf8a3b90d865"
>=20
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see =
conf/machine/include/omap3.inc
> -MACHINE_KERNEL_PR_append =3D "b"
> +MACHINE_KERNEL_PR_append =3D "a"
>=20
> FILESPATH =3D. =
"${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
>=20
> @@ -194,7 +194,6 @@ SRC_URI +=3D =
"git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
>             =
file://beagle/0008-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch =
\
>             =
file://beagle/0009-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.pa=
tch \
>             =
file://beagle/0010-ARM-OMAP2-beagleboard-fix-mmc-write-protect-pin-when.pa=
tch \
> -            =
file://beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.pat=
ch \
>             =
file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
>             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
>             \
> --=20
> 1.7.2.5
>=20


--Apple-Mail=_8D03E102-96D4-40CD-872A-657F56463BC7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7s50EACgkQMkyGM64RGpE7EACgqFEZdluLpDC+Z5SyD2/kU4cp
pD8AoK22uIZLKpilGTY7b3APMTuys9R6
=+tca
-----END PGP SIGNATURE-----

--Apple-Mail=_8D03E102-96D4-40CD-872A-657F56463BC7--
