Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EE44E006B4
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 22:38:59 -0700 (PDT)
Received: by bkar19 with SMTP id r19so4444010bka.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 22:38:58 -0700 (PDT)
Received: by 10.223.39.20 with SMTP id d20mr13745657fae.37.1319089137869;
	Wed, 19 Oct 2011 22:38:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h24sm13817615fad.22.2011.10.19.22.38.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 22:38:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319075659-3888-1-git-send-email-joelagnel@ti.com>
Date: Thu, 20 Oct 2011 07:38:55 +0200
Message-Id: <0331B838-623C-4939-A81A-F45D82632FC1@dominion.thruhere.net>
References: <1319075659-3888-1-git-send-email-joelagnel@ti.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: Re: [Angstrom-devel] [PATCH v2 meta-ti] linux-ti33x-psp 3.1rc8: Add pin mux and init for beaglebone specific devices
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
X-List-Received-Date: Thu, 20 Oct 2011 05:39:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

[added meta-ti list]


Op 20 okt. 2011, om 03:54 heeft Joel A Fernandes het volgende =
geschreven:

> Currently added for following:
>  * User LEDs (added by Koen Kooi <k-kooi@ti.com>)
>  * BeagleBone tester
>=20
> Build and run time tested.
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> v2 changes:
> Replaced correct patch

I don't like this, at all. Please do your changes as a seperate patch, =
not as a change to an existing patch. And if you  update a patch in the =
future please use -B -C to git format-patch so it can detect the rename =
and produce a real diff instead of a add+delete pair.

regards,

Koen


>=20
> ...pin-mux-and-init-for-beaglebone-specific-.patch |  132 =
++++++++++++++++++++
> ...5x-evm-hack-in-LED-support-for-beaglebone.patch |  109 =
----------------
> recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    4 +-
> 3 files changed, 134 insertions(+), 111 deletions(-)
> create mode 100644 =
recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Add-pin-mux-and=
-init-for-beaglebone-specific-.patch
> delete mode 100644 =
recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-evm-hack-in-LED=
-support-for-beaglebone.patch
>=20
> diff --git =
a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Add-pin-mux-a=
nd-init-for-beaglebone-specific-.patch =
b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Add-pin-mux-a=
nd-init-for-beaglebone-specific-.patch
> new file mode 100644
> index 0000000..a501c8a
> --- /dev/null
> +++ =
b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Add-pin-mux-a=
nd-init-for-beaglebone-specific-.patch
> @@ -0,0 +1,132 @@
> +=46rom 5be793dc9de7e694d9256396aecfdc136c8e2cf6 Mon Sep 17 00:00:00 =
2001
> +From: Joel A Fernandes <joelagnel@ti.com>
> +Date: Mon, 17 Oct 2011 02:00:39 -0400
> +Subject: [PATCH] am335x: Add pin mux and init for beaglebone specific =
devices
> +
> +Currently added for following:
> +  * User LEDs (added by Koen Kooi <k-kooi@ti.com>)
> +  * BeagleBone tester
> +
> +Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> +---
> + arch/arm/mach-omap2/board-am335xevm.c |   69 =
+++++++++++++++++++++++++++++++++
> + arch/arm/mach-omap2/mux33xx.c         |    2 +-
> + 2 files changed, 70 insertions(+), 1 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/board-am335xevm.c =
b/arch/arm/mach-omap2/board-am335xevm.c
> +index f625510..6beaa23 100644
> +--- a/arch/arm/mach-omap2/board-am335xevm.c
> ++++ b/arch/arm/mach-omap2/board-am335xevm.c
> +@@ -17,6 +17,7 @@
> + #include <linux/i2c.h>
> + #include <linux/i2c/at24.h>
> + #include <linux/gpio.h>
> ++#include <linux/leds.h>
> + #include <linux/spi/spi.h>
> + #include <linux/spi/flash.h>
> + #include <linux/mtd/mtd.h>
> +@@ -590,6 +591,61 @@ static struct pinmux_config usb1_pin_mux[] =3D {
> + 	{NULL, 0},
> + };
> +=20
> ++/* LEDS - gpio1_21 -> gpio1_24 */
> ++
> ++#define BEAGLEBONE_USR1_LED  GPIO_TO_PIN(1, 21)
> ++#define BEAGLEBONE_USR2_LED  GPIO_TO_PIN(1, 22)
> ++#define BEAGLEBONE_USR3_LED  GPIO_TO_PIN(1, 23)
> ++#define BEAGLEBONE_USR4_LED  GPIO_TO_PIN(1, 24)
> ++
> ++static struct gpio_led gpio_leds[] =3D {
> ++	{
> ++		.name			=3D "beaglebone::usr0",
> ++		.default_trigger	=3D "heartbeat",
> ++		.gpio			=3D BEAGLEBONE_USR1_LED,
> ++	},
> ++	{
> ++		.name			=3D "beaglebone::usr1",
> ++		.default_trigger	=3D "mmc0",
> ++		.gpio			=3D BEAGLEBONE_USR2_LED,
> ++	},
> ++	{
> ++		.name			=3D "beaglebone::usr2",
> ++		.gpio			=3D BEAGLEBONE_USR3_LED,
> ++	},
> ++	{
> ++		.name           =3D "beaglebone::usr3",
> ++		.gpio           =3D BEAGLEBONE_USR4_LED,
> ++	},
> ++};
> ++
> ++static struct gpio_led_platform_data gpio_led_info =3D {
> ++	.leds		=3D gpio_leds,
> ++	.num_leds	=3D ARRAY_SIZE(gpio_leds),
> ++};
> ++
> ++static struct platform_device leds_gpio =3D {
> ++	.name	=3D "leds-gpio",
> ++	.id	=3D -1,
> ++	.dev	=3D {
> ++		.platform_data	=3D &gpio_led_info,
> ++	},
> ++};
> ++
> ++static struct platform_device *bone_devices[] __initdata =3D {
> ++		    &leds_gpio,
> ++};
> ++
> ++static struct pinmux_config bone_pin_mux[] =3D {
> ++	/* User LED gpios (gpio1_21 to gpio1_24) */
> ++    {"gpmc_a5.rgmii2_td0", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
> ++    {"gpmc_a6.rgmii2_tclk", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
> ++    {"gpmc_a7.rgmii2_rclk", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
> ++    {"gpmc_a8.rgmii2_rd3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
> ++    /* Grounding gpio1_6 (pin 3 Conn A) signals bone tester to start =
diag tests */
> ++    {"gpmc_ad6.gpio1_6", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
> ++};
> ++
> + /* Module pin mux for eCAP0 */
> + static struct pinmux_config ecap0_pin_mux[] =3D {
> + 	{"ecap0_in_pwm0_out.gpio0_7", AM33XX_PIN_OUTPUT},
> +@@ -698,6 +754,18 @@ static void tsc_init(int evm_id, int profile)
> + 		pr_err("failed to register touchscreen device\n");
> + }
> +=20
> ++/*
> ++ * Initialization of BeagleBone specific devices
> ++ */
> ++static void bone_init(int evm_id, int profil )
> ++{
> ++	int err;
> ++	setup_pin_mux(bone_pin_mux);
> ++	err =3D platform_add_devices(bone_devices, =
ARRAY_SIZE(bone_devices));
> ++	if (err)
> ++		pr_err("failed to register LEDS\n");
> ++}
> ++
> + static void rgmii1_init(int evm_id, int profile)
> + {
> + 	setup_pin_mux(rgmii1_pin_mux);
> +@@ -1103,6 +1171,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] =
=3D {
> + 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
> + 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
> + 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
> ++	{bone_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
> + 	{NULL, 0, 0},
> + };
> +=20
> +diff --git a/arch/arm/mach-omap2/mux33xx.c =
b/arch/arm/mach-omap2/mux33xx.c
> +index 0286c4f..f09e827 100644
> +--- a/arch/arm/mach-omap2/mux33xx.c
> ++++ b/arch/arm/mach-omap2/mux33xx.c
> +@@ -49,7 +49,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] =
=3D {
> + 		NULL, NULL, NULL, NULL),
> + 	_AM33XX_MUXENTRY(GPMC_AD6, 0,
> + 		"gpmc_ad6", "mmc1_dat6", NULL, NULL,
> +-		NULL, NULL, NULL, NULL),
> ++		NULL, NULL, NULL, "gpio1_6"),
> + 	_AM33XX_MUXENTRY(GPMC_AD7, 0,
> + 		"gpmc_ad7", "mmc1_dat7", NULL, NULL,
> + 		NULL, NULL, NULL, NULL),
> +--=20
> +1.7.1
> +
> diff --git =
a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-evm-hack-in-L=
ED-support-for-beaglebone.patch =
b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-evm-hack-in-L=
ED-support-for-beaglebone.patch
> deleted file mode 100644
> index b043ce9..0000000
> --- =
a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-evm-hack-in-L=
ED-support-for-beaglebone.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -=46rom f658d7975f2e7232786190002ddd24d6b92ba965 Mon Sep 17 00:00:00 =
2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Mon, 17 Oct 2011 02:00:39 -0400
> -Subject: [PATCH] am335x-evm: hack in LED support for beaglebone
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - arch/arm/mach-omap2/board-am335xevm.c |   63 =
+++++++++++++++++++++++++++++++++
> - 1 files changed, 63 insertions(+), 0 deletions(-)
> -
> -diff --git a/arch/arm/mach-omap2/board-am335xevm.c =
b/arch/arm/mach-omap2/board-am335xevm.c
> -index 87eec7b..3a3c55b 100644
> ---- a/arch/arm/mach-omap2/board-am335xevm.c
> -+++ b/arch/arm/mach-omap2/board-am335xevm.c
> -@@ -17,6 +17,7 @@
> - #include <linux/i2c.h>
> - #include <linux/i2c/at24.h>
> - #include <linux/gpio.h>
> -+#include <linux/leds.h>
> - #include <linux/spi/spi.h>
> - #include <linux/spi/flash.h>
> - #include <linux/mtd/mtd.h>
> -@@ -588,6 +589,58 @@ static struct pinmux_config usb1_pin_mux[] =3D {
> - 	{NULL, 0},
> - };
> -=20
> -+/* LEDS - gpio1_21 -> gpio1_24 */
> -+
> -+#define BEAGLEBONE_USR1_LED  GPIO_TO_PIN(1, 21)
> -+#define BEAGLEBONE_USR2_LED  GPIO_TO_PIN(1, 22)
> -+#define BEAGLEBONE_USR3_LED  GPIO_TO_PIN(1, 23)
> -+#define BEAGLEBONE_USR4_LED  GPIO_TO_PIN(1, 24)
> -+
> -+static struct gpio_led gpio_leds[] =3D {
> -+	{
> -+		.name			=3D "beaglebone::usr0",
> -+		.default_trigger	=3D "heartbeat",
> -+		.gpio			=3D BEAGLEBONE_USR1_LED,
> -+	},
> -+	{
> -+		.name			=3D "beaglebone::usr1",
> -+		.default_trigger	=3D "mmc0",
> -+		.gpio			=3D BEAGLEBONE_USR2_LED,
> -+	},
> -+	{
> -+		.name			=3D "beaglebone::usr2",
> -+		.gpio			=3D BEAGLEBONE_USR3_LED,
> -+	},
> -+	{
> -+		.name           =3D "beaglebone::usr3",
> -+		.gpio           =3D BEAGLEBONE_USR4_LED,
> -+	},
> -+};
> -+
> -+static struct gpio_led_platform_data gpio_led_info =3D {
> -+	.leds		=3D gpio_leds,
> -+	.num_leds	=3D ARRAY_SIZE(gpio_leds),
> -+};
> -+
> -+static struct platform_device leds_gpio =3D {
> -+	.name	=3D "leds-gpio",
> -+	.id	=3D -1,
> -+	.dev	=3D {
> -+		.platform_data	=3D &gpio_led_info,
> -+	},
> -+};
> -+
> -+static struct platform_device *bone_devices[] __initdata =3D {
> -+		    &leds_gpio,
> -+};
> -+
> -+static struct pinmux_config boneled_pin_mux[] =3D {
> -+    {"gpmc_a5.rgmii2_td0", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // =
gpio 21
> -+    {"gpmc_a6.rgmii2_tclk", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // =
gpio22
> -+    {"gpmc_a7.rgmii2_rclk", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // =
gpio23
> -+    {"gpmc_a8.rgmii2_rd3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // =
gpio 24
> -+};
> -+
> - /* Module pin mux for eCAP0 */
> - static struct pinmux_config ecap0_pin_mux[] =3D {
> - 	{"ecap0_in_pwm0_out.gpio0_7", AM33XX_PIN_OUTPUT},
> -@@ -696,6 +749,15 @@ static void tsc_init(int evm_id, int profile)
> - 		pr_err("failed to register touchscreen device\n");
> - }
> -=20
> -+static void bone_leds_init(int evm_id, int profil )
> -+{
> -+	int err;
> -+	setup_pin_mux(boneled_pin_mux);
> -+	err =3D platform_add_devices(bone_devices, =
ARRAY_SIZE(bone_devices));
> -+	if (err)
> -+		pr_err("failed to register LEDS\n");
> -+}
> -+
> - static void rgmii1_init(int evm_id, int profile)
> - {
> - 	setup_pin_mux(rgmii1_pin_mux);
> -@@ -1101,6 +1163,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] =
=3D {
> - 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
> - 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
> - 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
> -+	{bone_leds_init,  DEV_ON_BASEBOARD, PROFILE_ALL},
> - 	{NULL, 0, 0},
> - };
> -=20
> ---=20
> -1.7.0.4
> -
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb =
b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> index e42b8a0..ba40bdb 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX =3D ""
>=20
> BRANCH =3D "master"
> SRCREV =3D "a95ceb11b5858feae89895d14d7f7bc41cca9fd6"
> -MACHINE_KERNEL_PR_append =3D "d+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append =3D "e+gitr${SRCREV}"
>=20
> COMPATIBLE_MACHINE =3D "(ti33x)"
>=20
> @@ -26,7 +26,7 @@ SRC_URI +=3D =
"git://arago-project.org/git/projects/linux-am33x.git;protocol=3Dgit;br
>=20
> PATCHES_OVER_PSP =3D " \
> 	file://0001-f_rndis-HACK-around-undefined-variables.patch \
> -	file://0001-am335x-evm-hack-in-LED-support-for-beaglebone.patch =
\
> +	=
file://0001-am335x-Add-pin-mux-and-init-for-beaglebone-specific-.patch \
> 	=
file://0001-mach-types-Add-new-machine-type-beaglebone-to-mach-t.patch \
> 	file://0002-Kconfig-Add-support-for-beaglebone-machine-id.patch =
\
> 	file://0003-am335xevm-Use-new-beaglebone-machine-id.patch \
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel


