Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FF9AE0123C
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 10:00:44 -0800 (PST)
Received: by werm12 with SMTP id m12so4345714wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 10:00:43 -0800 (PST)
Received: by 10.216.131.153 with SMTP id m25mr6488173wei.9.1324576843430;
	Thu, 22 Dec 2011 10:00:43 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dd4sm24478795wib.1.2011.12.22.10.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 10:00:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111222174917.GC17606@denix.org>
Date: Thu, 22 Dec 2011 19:00:38 +0100
Message-Id: <F11FF9DD-AC0B-4DD0-ADA6-9D71DAE52E20@dominion.thruhere.net>
References: <1324542026-29756-1-git-send-email-koen@dominion.thruhere.net>
	<20111222174917.GC17606@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux 3.0: update to 3.0.14
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
X-List-Received-Date: Thu, 22 Dec 2011 18:00:45 -0000
X-Groupsio-MsgNum: 289
Content-Type: multipart/signed;
	boundary="Apple-Mail=_540A675F-6923-4893-A67E-F744C3562C9E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_540A675F-6923-4893-A67E-F744C3562C9E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 dec. 2011, om 18:49 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Thu, Dec 22, 2011 at 09:20:26AM +0100, Koen Kooi wrote:
>> Also make oprofile a module to workaround an oprofile bug highlighted =
in 3.0.13
>=20
> Can you point me to more details about the oprofile bug? Thanks.

It generates a section mismatch when you build it in, I'll try to fix it =
properly when I get some time, but syslink and the new bone release are =
eating up my time currently :(


>=20
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>=20
>=20
>> ---
>> conf/machine/include/omap3.inc                     |    2 +-
>> .../linux/linux-3.0/beagleboard/defconfig          |    4 ++--
>> recipes-kernel/linux/linux_3.0.bb                  |    9 ++++-----
>> 3 files changed, 7 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/conf/machine/include/omap3.inc =
b/conf/machine/include/omap3.inc
>> index 4530ae1..fc252ba 100644
>> --- a/conf/machine/include/omap3.inc
>> +++ b/conf/machine/include/omap3.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY =3D "omap3"
>> require conf/machine/include/tune-cortexa8.inc
>> PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
>> # Increase this everytime you change something in the kernel
>> -MACHINE_KERNEL_PR =3D "r113"
>> +MACHINE_KERNEL_PR =3D "r114"
>>=20
>> KERNEL_IMAGETYPE =3D "uImage"
>>=20
>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig =
b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>> index 0b150c5..5f2a7eb 100644
>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>> @@ -1,6 +1,6 @@
>> #
>> # Automatically generated make config: don't edit
>> -# Linux/arm 3.0.7 Kernel Configuration
>> +# Linux/arm 3.0.14 Kernel Configuration
>> #
>> CONFIG_ARM=3Dy
>> CONFIG_HAVE_PWM=3Dy
>> @@ -149,7 +149,7 @@ CONFIG_SLAB=3Dy
>> # CONFIG_SLUB is not set
>> # CONFIG_SLOB is not set
>> CONFIG_PROFILING=3Dy
>> -CONFIG_OPROFILE=3Dy
>> +CONFIG_OPROFILE=3Dm
>> CONFIG_HAVE_OPROFILE=3Dy
>> # CONFIG_KPROBES is not set
>> CONFIG_HAVE_KPROBES=3Dy
>> diff --git a/recipes-kernel/linux/linux_3.0.bb =
b/recipes-kernel/linux/linux_3.0.bb
>> index 38b90e9..d72826b 100644
>> --- a/recipes-kernel/linux/linux_3.0.bb
>> +++ b/recipes-kernel/linux/linux_3.0.bb
>> @@ -5,12 +5,12 @@ KERNEL_IMAGETYPE =3D "uImage"
>>=20
>> COMPATIBLE_MACHINE =3D "(beagleboard)"
>>=20
>> -PV =3D "3.0.12"
>> -# v3.0.12 tag
>> -SRCREV_pn-${PN} =3D "ac6766564c0305ca020fe747dfd7dbdf0881369d"
>> +PV =3D "3.0.14"
>> +# v3.0.14 tag
>> +SRCREV_pn-${PN} =3D "6636552f1dd0d2e2be2f87605ea2cd3aa4d2e5b6"
>>=20
>> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see =
conf/machine/include/omap3.inc
>> -MACHINE_KERNEL_PR_append =3D "b"
>> +MACHINE_KERNEL_PR_append =3D "a"
>>=20
>> FILESPATH =3D. =
"${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
>>=20
>> @@ -194,7 +194,6 @@ SRC_URI +=3D =
"git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
>>             =
file://beagle/0008-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch =
\
>>             =
file://beagle/0009-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.pa=
tch \
>>             =
file://beagle/0010-ARM-OMAP2-beagleboard-fix-mmc-write-protect-pin-when.pa=
tch \
>> -            =
file://beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.pat=
ch \
>>             =
file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
>>             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
>>             \
>> --=20
>> 1.7.2.5
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>=20


--Apple-Mail=_540A675F-6923-4893-A67E-F744C3562C9E
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7zcEgACgkQMkyGM64RGpFMiACfWmotEchamU3qxjmzDcs72+hF
YH0An2UypVCbg9BhvSG7LEGHp92XVCDt
=9XsT
-----END PGP SIGNATURE-----

--Apple-Mail=_540A675F-6923-4893-A67E-F744C3562C9E--
