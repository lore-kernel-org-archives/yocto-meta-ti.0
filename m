Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDEA6E01472
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 08:52:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55Fqkuh026243;
	Wed, 5 Jun 2013 10:52:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55Fqkle023116;
	Wed, 5 Jun 2013 10:52:46 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 5 Jun 2013 10:52:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Wed, 5 Jun 2013 10:52:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv2] u-boot-dra7xx: add latest u-boot from the
	integration branch
Thread-Index: AQHOYfl23L4yP5VCfkCw2sbg1PgOyJknRV4w
Date: Wed, 5 Jun 2013 15:52:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101595C686F@DLEE11.ent.ti.com>
References: <1370442662-9540-1-git-send-email-denis@denix.org>
In-Reply-To: <1370442662-9540-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] u-boot-dra7xx: add latest u-boot from the	integration branch
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2013 15:52:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, June 05, 2013 9:31 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCHv2] u-boot-dra7xx: add latest u-boot from
>the integration branch
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>While the code is being pulled from ti-u-boot integration tree,
>J6/DRA7xx bring up
>is being done from a separate branch that does not include all the
>commits made
>for am335x. Hence, until those branches are merged with the
>mainline and unified
>in a single recipe, a separate recipe just for DRA7xx makes more
>sense. This
>recipe should eventually go away and unified under u-boot-ti-
>staging one.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
>v2 - add detailed explanation for the new recipe
>
> conf/machine/dra7xx-evm.conf                |  7 +++++--
> recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb | 16 ++++++++++++++++
> 2 files changed, 21 insertions(+), 2 deletions(-)
> create mode 100644 recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
>
>diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-
>evm.conf
>index d968d3b..5897a5f 100644
>--- a/conf/machine/dra7xx-evm.conf
>+++ b/conf/machine/dra7xx-evm.conf
>@@ -8,6 +8,11 @@ IMAGE_FSTYPES +=3D "ubi tar.gz"
>
> SERIAL_CONSOLE =3D "115200 ttyO0"
>
>+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-dra7xx"
>+PREFERRED_PROVIDER_u-boot =3D "u-boot-dra7xx"
>+
>+UBOOT_MACHINE =3D "dra7xx_evm_config"
>+
> # UBI information.  Note that this is board and kernel specific.
>Changes
> # in your kernel port may require changes in these variables.
>For more
> # details about this board please see
>@@ -29,8 +34,6 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
> # UBI: VID header offset:          2048 (aligned 2048)
> UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
>
>-UBOOT_MACHINE =3D "dra7xx_evm_config"
>-
> # Currently removing the sgx machine feature because there is no
>SGX package
> # available for omap5
> MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2
>screen touchscreen"
>diff --git a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
>b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
>new file mode 100644
>index 0000000..eb3fc05
>--- /dev/null
>+++ b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
>@@ -0,0 +1,16 @@
>+require u-boot-ti.inc
>+
>+DESCRIPTION =3D "u-boot bootloader for TI devices"
>+
>+COMPATIBLE_MACHINE =3D "dra7xx-evm"
>+
>+PR =3D "r0+gitr${SRCPV}"
>+
>+SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+BRANCH ?=3D "ti-u-boot-2013.04+"
>+
>+# This commit corresponds to ti2013.04.02 release tag
>+SRCREV =3D "e2315adf674b60132f0c5c8fe6eac5d109b81688"
>+
>+SPL_BINARY =3D "MLO"
>--
>1.8.2.1
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

