Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16557E01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 10:00:55 -0700 (PDT)
Received: by eyh5 with SMTP id 5so5543747eyh.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 10:00:54 -0700 (PDT)
Received: by 10.223.81.205 with SMTP id y13mr25790297fak.34.1319216454299;
	Fri, 21 Oct 2011 10:00:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v17sm23059548fai.18.2011.10.21.10.00.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 10:00:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319207492-17342-1-git-send-email-joelagnel@ti.com>
Date: Fri, 21 Oct 2011 19:00:51 +0200
Message-Id: <E3543D7A-2862-4258-8704-66BAF49C64B6@dominion.thruhere.net>
References: <1319207492-17342-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH meta-ti v2] u-boot 2011.10rc: Read EEPROM header correctly for BeagleBone board detection
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
X-List-Received-Date: Fri, 21 Oct 2011 17:00:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Applied, thanks!

Op 21 okt. 2011, om 16:31 heeft Joel A Fernandes het volgende =
geschreven:

> This patch fixes the case where the EEPROM is programmed but we still =
use the
> fall back case to detect the bone board. Now that EEPROMs are =
programmed, we should
> correctly detect the bone board instead of relying on fall back to =
bone mode.
>=20
> PR bumped
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> v2: Resolved merge conflict with =
54906ebbec3447b47f298c92772fb619c969ec8a
>=20
> ...Read-name-field-in-EEPROM-header-for-Beag.patch |   28 =
++++++++++++++++++++
> recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    3 +-
> 2 files changed, 30 insertions(+), 1 deletions(-)
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-EE=
PROM-header-for-Beag.patch
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-=
EEPROM-header-for-Beag.patch =
b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-=
EEPROM-header-for-Beag.patch
> new file mode 100644
> index 0000000..ef901a9
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-=
EEPROM-header-for-Beag.patch
> @@ -0,0 +1,28 @@
> +=46rom 186250ee6abca3f080b5321504a1c5881ffbf7c6 Mon Sep 17 00:00:00 =
2001
> +From: Joel A Fernandes <joelagnel@ti.com>
> +Date: Thu, 20 Oct 2011 19:46:53 -0500
> +Subject: [PATCH] am335x-evm: Read name field in EEPROM header for =
BeagleBoard bone detection
> +
> +Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> +---
> + board/ti/am335x/evm.c |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
> +
> +diff --git a/board/ti/am335x/evm.c b/board/ti/am335x/evm.c
> +index 37e348f..b63dcbe 100755
> +--- a/board/ti/am335x/evm.c
> ++++ b/board/ti/am335x/evm.c
> +@@ -501,6 +501,10 @@ int board_init(void)
> + 		detect_daughter_board_profile();
> + 	} else if (!strncmp("SKU#03", header.config, 6)) {
> + 		board_id =3D IPP_BOARD;
> ++	} else if (!strncmp("A335BONE", header.name, 8)) {
> ++		board_id =3D BONE_BOARD;
> ++		profile =3D 1;	/* profile 0 is internally considered as =
1 */
> ++		daughter_board_connected =3D 0;
> + 	} else {
> + 		printf("Did not find a recognized configuration, "
> + 			"assuming BeagleBone\n");
> +--=20
> +1.7.1
> +
> diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb =
b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> index 0bd39d3..ca7b670 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> @@ -4,7 +4,7 @@ require u-boot.inc
> COMPATIBLE_MACHINE =3D "(ti33x)"
> DEFAULT_PREFERENCE_ti33x =3D "99"
> PV =3D "2011.09+git"
> -PR =3D "r14"
> +PR =3D "r15"
>=20
> # SPL build
> UBOOT_BINARY =3D "u-boot.img"
> @@ -18,6 +18,7 @@ SRC_URI =3D =
"git://arago-project.org/git/projects/u-boot-am33x.git;protocol=3Dgit;br
>            =
file://2011.09git/0001-mach-types-Add-new-beaglebone-machine-type.patch =
\
>            =
file://2011.09git/0003-am335x_evm-single-byte-address-EEPROM-for-board-ide=
n.patch \
>            =
file://2011.09git/0004-am335x-evm-fall-back-to-bone-if-header.config-is-em=
p.patch \
> +           =
file://2011.09git/0005-am335x-evm-Read-name-field-in-EEPROM-header-for-Bea=
g.patch \
>           "
>=20
> SRCREV =3D "9158d7f37d596b867039345cb2e3f8f18f54fe46"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


