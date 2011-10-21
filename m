Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E74EE01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 00:15:14 -0700 (PDT)
Received: by eyh5 with SMTP id 5so4910051eyh.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 00:15:13 -0700 (PDT)
Received: by 10.14.16.97 with SMTP id g73mr1663858eeg.73.1319181312758;
	Fri, 21 Oct 2011 00:15:12 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a10sm32281308een.6.2011.10.21.00.15.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 00:15:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319159079-4220-2-git-send-email-joelagnel@ti.com>
Date: Fri, 21 Oct 2011 09:15:06 +0200
Message-Id: <DE864DC8-58BC-4496-9078-767C86952EB9@dominion.thruhere.net>
References: <1319159079-4220-1-git-send-email-joelagnel@ti.com>
	<1319159079-4220-2-git-send-email-joelagnel@ti.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: Re: [Angstrom-devel] [PATCH meta-ti 2/2] u-boot 2011.10rc: Read EEPROM header correctly for BeagleBone board detection
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
X-List-Received-Date: Fri, 21 Oct 2011 07:15:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 03:04 heeft Joel A Fernandes het volgende =
geschreven:

> This patch fixes the case where the EEPROM is programmed but we still =
use the
> fall back case to detect the bone board. Now that EEPROMs are =
programmed, we should
> correctly detect the bone board instead of relying on fall back to =
bone mode.
>=20
> PR bumped

Can you please rebase this on top of Denys' earlier patch that he sent =
to the meta-ti mailiinglist?


>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> * Build and run time tested
> * This also verifies Jason's 8 bit EEPROM read patch
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
> index 35c84da..7054c11 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> @@ -4,7 +4,7 @@ require u-boot.inc
> COMPATIBLE_MACHINE =3D "(ti33x)"
> DEFAULT_PREFERENCE_ti33x =3D "99"
> PV =3D "2011.09+git"
> -PR =3D "r12"
> +PR =3D "r13"
>=20
> # SPL build
> UBOOT_BINARY =3D "u-boot.img"
> @@ -17,6 +17,7 @@ SRC_URI =3D =
"git://arago-project.org/git/projects/u-boot-am33x.git;protocol=3Dgit;br
>            =
file://2011.09git/0003-am335x-evm-make-rootfs-RO-on-boot.patch \
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
> SRCREV =3D "066e4c106677e9243bd7ae26e638f8d98e1f0606"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel


