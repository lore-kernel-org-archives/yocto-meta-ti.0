Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D2F1E00566; Tue, 26 Aug 2014 08:07:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 356A1E004DD
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 08:07:07 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7QF764I023574;
	Tue, 26 Aug 2014 10:07:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QF76HZ001501;
	Tue, 26 Aug 2014 10:07:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 26 Aug 2014 10:07:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] machine: clean up MACHINE_FEATURES for
	omap5, dra7,	am57
Thread-Index: AQHPwT6d7JVhOu1iKUmNcOqmAeMj5Zvi/Dhw
Date: Tue, 26 Aug 2014 15:07:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7059E8@DFLE08.ent.ti.com>
References: <1409065198-8468-1-git-send-email-denis@denix.org>
In-Reply-To: <1409065198-8468-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] machine: clean up MACHINE_FEATURES for omap5, dra7, am57
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
X-List-Received-Date: Tue, 26 Aug 2014 15:07:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, August 26, 2014 10:00 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] machine: clean up MACHINE_FEATURES for
> omap5, dra7, am57
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Enable "sgx" feature on all - the driver may still be missing, but GLES=
 is
>   available from omap5-sgx-ddk-linux package
> * Enable "touchscreen" feature only on dra7 and am57 - not available on
> omap5
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/machine/am57xx-evm.conf      | 6 ++----
>  conf/machine/dra7xx-evm.conf      | 6 ++----
>  conf/machine/include/omap-a15.inc | 5 ++++-
>  conf/machine/omap5-evm.conf       | 4 ----
>  4 files changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-
> evm.conf index 0beed60..25b1647 100644
> --- a/conf/machine/am57xx-evm.conf
> +++ b/conf/machine/am57xx-evm.conf
> @@ -4,6 +4,8 @@
>=20
>  require conf/machine/include/dra7xx.inc
>=20
> +MACHINE_FEATURES +=3D "touchscreen"
> +
>  IMAGE_FSTYPES +=3D "ubi tar.gz"
>=20
>  SERIAL_CONSOLE =3D "115200 ttyO2"
> @@ -30,7 +32,3 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
>  # UBI: sub-page size:              512
>  # UBI: VID header offset:          2048 (aligned 2048)
>  UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
> -
> -# Currently removing the sgx machine feature because there is no SGX
> package -# available for omap5 -MACHINE_FEATURES =3D "kernel26 apm
> usbgadget usbhost vfat ext2 screen touchscreen"
> diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-
> evm.conf index 7069b44..ba7b440 100644
> --- a/conf/machine/dra7xx-evm.conf
> +++ b/conf/machine/dra7xx-evm.conf
> @@ -4,6 +4,8 @@
>=20
>  require conf/machine/include/dra7xx.inc
>=20
> +MACHINE_FEATURES +=3D "touchscreen"
> +
>  IMAGE_FSTYPES +=3D "ubi tar.gz"
>=20
>  SERIAL_CONSOLE =3D "115200 ttyO0"
> @@ -30,7 +32,3 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
>  # UBI: sub-page size:              512
>  # UBI: VID header offset:          2048 (aligned 2048)
>  UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
> -
> -# Currently removing the sgx machine feature because there is no SGX
> package -# available for omap5 -MACHINE_FEATURES =3D "kernel26 apm
> usbgadget usbhost vfat ext2 screen touchscreen"
> diff --git a/conf/machine/include/omap-a15.inc
> b/conf/machine/include/omap-a15.inc
> index 3fef64e..d7ddb62 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -5,7 +5,7 @@ DEFAULTTUNE ?=3D "cortexa15thf-neon"
>  require conf/machine/include/tune-cortexa15.inc
>=20
>  # Increase this everytime you change something in the kernel -
> MACHINE_KERNEL_PR =3D "r4"
> +MACHINE_KERNEL_PR =3D "r5"
>=20
>  PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> @@ -29,3 +29,6 @@ GUI_MACHINE_CLASS =3D "smallscreen"
>  # Use the expected value of the ubifs filesystem's volume name in the ke=
rnel
> # and u-boot.
>  UBI_VOLNAME =3D "rootfs"
> +
> +# List common SoC features, may need to add touchscreen for specific
> +machines MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat
> ext2 screen alsa ethernet sgx"
> diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-
> evm.conf index ba60e7c..d21abc1 100644
> --- a/conf/machine/omap5-evm.conf
> +++ b/conf/machine/omap5-evm.conf
> @@ -30,7 +30,3 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
>  UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
>=20
>  UBOOT_MACHINE =3D "omap5_uevm_config"
> -
> -# Currently removing the sgx machine feature because there is no SGX
> package -# available for omap5 -MACHINE_FEATURES =3D "kernel26 apm
> usbgadget usbhost vfat ext2 screen touchscreen"
> --
> 2.0.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

