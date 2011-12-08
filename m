Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53534E005B9
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  8 Dec 2011 07:55:48 -0800 (PST)
Received: by eekb57 with SMTP id b57so1502611eek.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 08 Dec 2011 07:55:47 -0800 (PST)
Received: by 10.213.22.203 with SMTP id o11mr1181498ebb.65.1323359746555;
	Thu, 08 Dec 2011 07:55:46 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d6sm19179415eec.10.2011.12.08.07.55.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:55:45 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+M6bXkeKBdeEjdQ8K6pEv0SNp_QdT+gemvBkujY7TRbFCFAvQ@mail.gmail.com>
Date: Thu, 8 Dec 2011 16:55:39 +0100
Message-Id: <999FD5FD-6566-4A36-A1B3-37E98EB8D735@dominion.thruhere.net>
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXkeKBdeEjdQ8K6pEv0SNp_QdT+gemvBkujY7TRbFCFAvQ@mail.gmail.com>
To: Tom Rini <tom.rini@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot 2011.09: add pandaboard support
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
X-List-Received-Date: Thu, 08 Dec 2011 15:55:50 -0000
X-Groupsio-MsgNum: 210
Content-Type: multipart/signed;
	boundary="Apple-Mail=_93DDB445-7BB4-44F2-A9F6-C19445E0D19F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_93DDB445-7BB4-44F2-A9F6-C19445E0D19F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 7 dec. 2011, om 16:38 heeft Tom Rini het volgende geschreven:

> On Wed, Dec 7, 2011 at 7:42 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  recipes-bsp/u-boot/u-boot_2011.09.bb |    9 ++++++---
>>  1 files changed, 6 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb =
b/recipes-bsp/u-boot/u-boot_2011.09.bb
>> index 74c8518..955bd5e 100644
>> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
>> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
>> @@ -8,9 +8,9 @@ UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
>>  UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
>>=20
>>  # No patches for other machines yet
>> -COMPATIBLE_MACHINE =3D "(beagleboard)"
>> +COMPATIBLE_MACHINE =3D "(beagleboard|omap4430-panda)"
>>=20
>> -SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>> +SRC_URI_pn-${PN}_beagleboard =3D =
"git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>>            =
file://2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_config-more.patch \
>>            =
file://2011.09/0002-OMAP3-Update-SDRC-dram_init-to-always-call-make_cs1_.p=
atch \
>>            =
file://2011.09/0003-OMAP3-Add-a-helper-function-to-set-timings-in-SDRC.pat=
ch \
>> @@ -35,7 +35,10 @@ SRC_URI =3D =
"git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>>            file://fw_env.config \
>>           "
>>=20
>> -SRCREV =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
>> +SRCREV_pn-${PN}_beagleboard =3D =
"fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
>> +
>> +SRC_URI_pn-${PN}_omap4430-panda =3D =
"git://git.linaro.org/boot/u-boot-linaro-stable.git"
>> +SRCREV_pn-${PN}_omap4430-panda =3D =
"3d343a62b8240100d6ce76b9126ff1e97be1eb5f"
>>=20
>>  LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
>=20
> On the beagle rev, what doesn't work for pandaboard?  And/or, what
> doesn't work on pandaboard on u-boot git mainline?  2011.12 is near
> and that will have the Beagle SPL patches and I'd like to say it's
> safe for pandas too.

U-Boot SPL 2011.09-01433-g01baa05 (Dec 08 2011 - 16:49:37)
Texas Instruments OMAP4460 ES1.1
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-01433-g01baa05 (Dec 08 2011 - 16:49:37)

CPU  : OMAP4460 ES1.1
Board: OMAP4 Panda
I2C:   ready
DRAM:  1 GiB
MMC:   OMAP SD/MMC: 0
Using default environment

In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0=20
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

4079360 bytes read
Booting from mmc0 ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Angstrom/2.6.35.7/omap4430-panda
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4079296 Bytes =3D 3.9 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

So mainline works, I'll wait for 2011.12 final and move beagle, panda, =
crane, hawk to that. What's the state of TI EVMs in mainline?

regards,

Koen=

--Apple-Mail=_93DDB445-7BB4-44F2-A9F6-C19445E0D19F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7g3f8ACgkQMkyGM64RGpGmVwCcCns8mQn8MagrvhgkW0ywc+Wq
PgwAniLRreLEgPqYSmE9IdsBdqNN8RPp
=vZEo
-----END PGP SIGNATURE-----

--Apple-Mail=_93DDB445-7BB4-44F2-A9F6-C19445E0D19F--
