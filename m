Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30293E0146B
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 08:44:40 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2QFiaYV011418
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 10:44:36 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2QFiaRJ015370
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 10:44:36 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 26 Mar 2013 10:44:36 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCHv3 2/2] omap5-evm: Add OMAP5 EVM configuration
Thread-Index: AQHOKji1Ci0Kz5qR3kScUJEwHqCZ6Ji4HR9w
Date: Tue, 26 Mar 2013 15:44:35 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594A11D7@DLEE11.ent.ti.com>
References: <1364312620-31774-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364312620-31774-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv3 2/2] omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Tue, 26 Mar 2013 15:44:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ignore this please.  I sent the wrong one.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Maupin, Chase
> Sent: Tuesday, March 26, 2013 10:44 AM
> To: meta-ti@yoctoproject.org
> Cc: Maupin, Chase
> Subject: [PATCHv3 2/2] omap5-evm: Add OMAP5 EVM configuration
>=20
> * Add the machine configuration for the OMAP5 EVM device.
> * Create the omap-a15.inc file to be shared with all OMAP
>   Cortex-A15 derivative devices.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> * Updated in version 3
>     * Moved XSERVER settings into the common SOC_FAMILY include
>       file.
>=20
> ---
>  conf/machine/include/omap-a15.inc                |   25
> ++++++++++++++++++++++
>  conf/machine/{am335x-evm.conf =3D> omap5-evm.conf} |   17 +++++++-
> -------
>  2 files changed, 33 insertions(+), 9 deletions(-)
>  create mode 100644 conf/machine/include/omap-a15.inc
>  copy conf/machine/{am335x-evm.conf =3D> omap5-evm.conf} (75%)
>=20
> diff --git a/conf/machine/include/omap-a15.inc
> b/conf/machine/include/omap-a15.inc
> new file mode 100644
> index 0000000..fa2037a
> --- /dev/null
> +++ b/conf/machine/include/omap-a15.inc
> @@ -0,0 +1,25 @@
> +SOC_FAMILY =3D "omap-a15"
> +require conf/machine/include/soc-family.inc
> +
> +require conf/machine/include/tune-cortexa15.inc
> +
> +# Increase this everytime you change something in the kernel
> +MACHINE_KERNEL_PR =3D "r0"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
> +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> +
> +KERNEL_IMAGETYPE =3D "uImage"
> +
> +UBOOT_ARCH =3D "arm"
> +UBOOT_ENTRYPOINT =3D "0x80008000"
> +UBOOT_LOADADDRESS =3D "0x80008000"
> +
> +EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
> +
> +PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
> +XSERVER =3D "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-video-fbdev"
> +
> +GUI_MACHINE_CLASS =3D "smallscreen"
> diff --git a/conf/machine/am335x-evm.conf b/conf/machine/omap5-
> evm.conf
> similarity index 75%
> copy from conf/machine/am335x-evm.conf
> copy to conf/machine/omap5-evm.conf
> index 21e79a2..4938535 100644
> --- a/conf/machine/am335x-evm.conf
> +++ b/conf/machine/omap5-evm.conf
> @@ -1,13 +1,6 @@
>  #@TYPE: Machine
> -#@NAME: AM335x EVM
> -#@DESCRIPTION: Machine configuration for the TI AM335x EVM
> -
> -require conf/machine/include/ti33x.inc
> -
> -# Use built-in LCD by default
> -XSERVER +=3D "xf86-input-tslib"
> -GUI_MACHINE_CLASS =3D "smallscreen"
> -MACHINE_FEATURES +=3D "touchscreen"
> +#@NAME: OMAP5 EVM
> +#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
>=20
>  IMAGE_FSTYPES +=3D "ubi tar.gz"
>=20
> @@ -33,3 +26,9 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
>  # UBI: sub-page size:              512
>  # UBI: VID header offset:          2048 (aligned 2048)
>  UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
> +
> +UBOOT_MACHINE =3D "omap5_evm_config"
> +
> +# Currently removing the sgx machine feature because there is no
> SGX package
> +# available for omap5
> +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2
> screen touchscreen"
> --
> 1.7.0.4


