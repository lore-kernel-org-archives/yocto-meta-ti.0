Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C814C25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 15:05:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.347.1717859139892616782
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 08 Jun 2024 08:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jiIm30Qw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 458F5Zt4017171;
	Sat, 8 Jun 2024 10:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717859135;
	bh=5zmk+PZQNAaloKA0YHcPkbI41EHYxwDM7qdvG8lpb8M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jiIm30Qwrw9VZaaeXZISrYMivKGL9BP+8fx55mFHSpFdpp/V8ovHlDviOXNaDKNqD
	 HZxoezKCnksVyNlW7N1h7wJYn6CXRgZfSJOBsPdhScMBFd+zps7qKcPQafMFJMSOR2
	 D6h0V86qELomnEo5WeszsggJAwK6y9woBY9/4Tyo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 458F5Z3h025111
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Jun 2024 10:05:35 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 8
 Jun 2024 10:05:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 8 Jun 2024 10:05:35 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 458F5WV5083377;
	Sat, 8 Jun 2024 10:05:33 -0500
Message-ID: <eb1e9d3a-d91c-4ed0-99ee-4d855d7f1c7b@ti.com>
Date: Sat, 8 Jun 2024 20:35:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [master/scarthgap][PATCH] conf/machine,
 linux-bb.org: re-org DT lists for Beagle platforms
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Gyan Gupta <g-gupta@ti.com>, Ryan Eatmon <reatmon@ti.com>
References: <20240606194825.3404589-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240606194825.3404589-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 458F5Zt4017171
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 08 Jun 2024 15:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17714

Hi Denys,

Thanks for this re-org patch on linux-bb.org
As discussed on call, we would need similar re-org for
u-boot-bb.org as defconfigs are different in U-Boot 2024.04
vs U-Boot 2023.04


On 07/06/24 01:18, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> In order=
 to be able to=20
> switch between different kernel providers, as well as different=20
> versions of kernel LTS (e.=E2=80=8Ag. 6.=E2=80=8A1 vs. 6.=E2=80=8A6), l=
et's re-organize Device=20
> Tree lists as follows: * Move all
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> In order to be able to switch between different kernel providers, as we=
ll
> as different versions of kernel LTS (e.g. 6.1 vs. 6.6), let's re-organi=
ze
> Device Tree lists as follows:
>
> * Move all Beagle-specific DTBs and overlays into corresponding linux-b=
b.org
> recipe for now, to be used when building beagleboard.org baseline
> * Update KERNEL_DEVICETREE in the machine configs to only list what alr=
eady
> exists in the upstream/mainline kernel
> * Update KERNEL_DEVICETREE_PREFIX to match the list when building TI ba=
seline
>
> With this change it is now very easy to switch the kernel between provi=
ders
> supported by meta-ti - linux-ti-mainline, linux-ti-staging and linux-bb=
.org
>
> Please note that 6.6 LTS has moved to "vendored" device tree layout eve=
n for
> 32-bit platforms, while BB.org still uses 6.1 LTS and flat DT layout.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---

Reviewed-by: Chirag Shilwant <c-shilwant@ti.com>

>   meta-ti-bsp/conf/machine/beagle-x15.conf      |  15 ++-
>   .../conf/machine/beaglebone-ai64-k3r5.conf    |   1 -
>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  11 --
>   meta-ti-bsp/conf/machine/beaglebone.conf      |  67 +++-------
>   meta-ti-bsp/conf/machine/beagleplay.conf      |  34 -----
>   .../recipes-kernel/linux/linux-bb.org_git.bb  | 120 +++++++++++++++++=
+
>   6 files changed, 144 insertions(+), 104 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/con=
f/machine/beagle-x15.conf
> index 6fc7957c..706f999a 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -5,14 +5,17 @@
>   require conf/machine/include/beagle.inc
>   require conf/machine/include/am57xx.inc
>  =20
> -KERNEL_DEVICETREE_PREFIX =3D "am57xx-beagle-x15"
> +KERNEL_DEVICETREE_PREFIX =3D " \
> +ti/omap/am57xx-beagle-x15 \
> +ti/omap/am57xx-idk-lcd \
> +"
>  =20
>   KERNEL_DEVICETREE =3D " \
> -am57xx-beagle-x15.dtb \
> -am57xx-beagle-x15-revb1.dtb \
> -am57xx-beagle-x15-revc.dtb \
> -am57xx-idk-lcd-osd101t2045.dtbo \
> -am57xx-idk-lcd-osd101t2587.dtbo \
> +ti/omap/am57xx-beagle-x15.dtb \
> +ti/omap/am57xx-beagle-x15-revb1.dtb \
> +ti/omap/am57xx-beagle-x15-revc.dtb \
> +ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
> +ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
>   "
>  =20
>   MACHINE_GUI_CLASS =3D "bigscreen"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-=
ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> index f57ae065..2bf58bce 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> @@ -16,7 +16,6 @@ UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUF=
FIX}"
>  =20
>   UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
>  =20
> -
>   # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments wh=
ich has to be build
>   # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-b=
oot-mergeconfig.inc
>   # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bs=
p/conf/machine/beaglebone-ai64.conf
> index 4ce7e11a..aaf94fa5 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -7,7 +7,6 @@ require conf/machine/include/j721e.inc
>  =20
>   UBOOT_MACHINE =3D "j721e_evm_a72_config"
>  =20
> -
>   # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments wh=
ich has to be build
>   # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-b=
oot-mergeconfig.inc
>   # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> @@ -20,19 +19,9 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>   KERNEL_DEVICETREE =3D " \
>   ti/k3-j721e-beagleboneai64.dtb \
>   ti/k3-j721e-common-proc-board.dtb \
> -ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
> -ti/k3-j721e-common-proc-board-infotainment.dtbo \
> -ti/k3-j721e-evm-csi2-ov5640.dtbo \
> -ti/k3-j721e-evm-fusion.dtbo \
>   ti/k3-j721e-evm-gesi-exp-board.dtbo \
> -ti/k3-j721e-evm-pcie0-ep.dtbo \
>   ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
> -ti/k3-j721e-evm-virt-mac-client.dtbo \
>   ti/k3-j721e-sk.dtb \
> -ti/k3-j721e-sk-csi2-ov5640.dtbo \
> -ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
> -ti/k3-j721e-sk-fusion.dtbo \
> -ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>   "
>  =20
>   MACHINE_GUI_CLASS =3D "bigscreen"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/con=
f/machine/beaglebone.conf
> index 8b8b9d29..9d001599 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -5,60 +5,23 @@
>   require conf/machine/include/beagle.inc
>   require conf/machine/include/ti33x.inc
>  =20
> -KERNEL_DEVICETREE_PREFIX =3D "am335x-bone"
> -
> -KERNEL_DEVICETREE =3D " \
> -am335x-bone.dtb \
> -am335x-boneblack.dtb \
> -am335x-boneblack-pps.dtb \
> -am335x-boneblack-uboot.dtb \
> -am335x-boneblack-uboot-univ.dtb \
> -am335x-boneblack-wireless.dtb \
> -am335x-boneblue.dtb \
> -am335x-bonegreen.dtb \
> -am335x-bonegreen-gateway.dtb \
> -am335x-bonegreen-wireless.dtb \
> -am335x-bonegreen-wireless-uboot-univ.dtb \
> -am335x-pocketbeagle.dtb \
> -am335x-sancloud-bbe.dtb \
> -am335x-sancloud-bbe-extended-wifi.dtb \
> -am335x-sancloud-bbe-lite.dtb \
> +KERNEL_DEVICETREE_PREFIX =3D " \
> +ti/omap/am335x-bone \
> +ti/omap/am335x-pocketbeagle \
> +ti/omap/am335x-sancloud-bbe \
>   "
>  =20
> -# Extra DT overlays/capes
> -KERNEL_DEVICETREE +=3D " \
> -AM335X-PRU-UIO-00A0.dtbo \
> -BB-ADC-00A0.dtbo \
> -BB-BBBW-WL1835-00A0.dtbo \
> -BB-BBGG-WL1835-00A0.dtbo \
> -BB-BBGW-WL1835-00A0.dtbo \
> -BB-BONE-4D5R-01-00A1.dtbo \
> -BB-BONE-eMMC1-01-00A0.dtbo \
> -BB-BONE-LCD4-01-00A1.dtbo \
> -BB-BONE-NH7C-01-A0.dtbo \
> -BB-CAPE-DISP-CT4-00A0.dtbo \
> -BB-HDMI-TDA998x-00A0.dtbo \
> -BB-I2C1-MCP7940X-00A0.dtbo \
> -BB-I2C1-RTC-DS3231.dtbo \
> -BB-I2C1-RTC-PCF8563.dtbo \
> -BB-I2C2-BME680.dtbo \
> -BB-I2C2-MPU6050.dtbo \
> -BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
> -BB-NHDMI-TDA998x-00A0.dtbo \
> -BBORG_COMMS-00A2.dtbo \
> -BBORG_FAN-A000.dtbo \
> -BBORG_RELAY-00A2.dtbo \
> -BB-SPIDEV0-00A0.dtbo \
> -BB-SPIDEV1-00A0.dtbo \
> -BB-UART1-00A0.dtbo \
> -BB-UART2-00A0.dtbo \
> -BB-UART4-00A0.dtbo \
> -BB-W1-P9.12-00A0.dtbo \
> -BONE-ADC.dtbo \
> -M-BB-BBG-00A0.dtbo \
> -M-BB-BBGG-00A0.dtbo \
> -PB-MIKROBUS-0.dtbo \
> -PB-MIKROBUS-1.dtbo \
> +KERNEL_DEVICETREE =3D " \
> +ti/omap/am335x-bone.dtb \
> +ti/omap/am335x-boneblack.dtb \
> +ti/omap/am335x-boneblack-wireless.dtb \
> +ti/omap/am335x-boneblue.dtb \
> +ti/omap/am335x-bonegreen.dtb \
> +ti/omap/am335x-bonegreen-wireless.dtb \
> +ti/omap/am335x-pocketbeagle.dtb \
> +ti/omap/am335x-sancloud-bbe.dtb \
> +ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
> +ti/omap/am335x-sancloud-bbe-lite.dtb \
>   "
>  =20
>   MACHINE_GUI_CLASS =3D "bigscreen"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/con=
f/machine/beagleplay.conf
> index 29a463e2..02bc6566 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -35,42 +35,8 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>  =20
>   KERNEL_DEVICETREE =3D " \
>   ti/k3-am625-beagleplay.dtb \
> -ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
> -ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
> -ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
> -ti/k3-am625-beaglemod.dtb \
> -ti/k3-am625-beaglemod-audio.dtbo \
> -ti/k3-am625-beaglemod-can0.dtbo \
> -ti/k3-am625-beaglemod-can1.dtbo \
> -ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
> -ti/k3-am625-beaglemod-eeprom.dtbo \
> -ti/k3-am625-beaglemod-eth.dtbo \
> -ti/k3-am625-beaglemod-hdmi.dtbo \
> -ti/k3-am625-beaglemod-io-expand.dtbo \
> -ti/k3-am625-beaglemod-lt-lcd185.dtbo \
> -ti/k3-am625-beaglemod-ospi-flash.dtbo \
> -ti/k3-am625-beaglemod-rs485-1.dtbo \
> -ti/k3-am625-beaglemod-rs485-2.dtbo \
> -ti/k3-am625-beaglemod-rtc.dtbo \
> -ti/k3-am625-beaglemod-wl1835.dtbo \
>   ti/k3-am625-sk.dtb \
> -ti/k3-am625-sk-dmtimer-pwm.dtbo \
> -ti/k3-am625-sk-ecap-capture.dtbo \
> -ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
> -ti/k3-am625-sk-mcspi-loopback.dtbo \
> -ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
> -ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
> -ti/k3-am625-sk-pwm.dtbo \
> -ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
> -ti/k3-am62x-sk-csi2-imx219.dtbo \
> -ti/k3-am62x-sk-csi2-ov5640.dtbo \
> -ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
> -ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
> -ti/k3-am62x-sk-eqep.dtbo \
>   ti/k3-am62x-sk-hdmi-audio.dtbo \
> -ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
> -ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
> -ti/k3-am62x-sk-mcan.dtbo \
>   "
>  =20
>   MACHINE_GUI_CLASS =3D "bigscreen"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/met=
a-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index 21d32516..534fc047 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -14,6 +14,126 @@ DEPENDS +=3D "gmp-native libmpc-native"
>  =20
>   KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_AR=
GS}"
>  =20
> +KERNEL_DEVICETREE:beaglebone =3D " \
> +am335x-bone.dtb \
> +am335x-boneblack.dtb \
> +am335x-boneblack-pps.dtb \
> +am335x-boneblack-uboot.dtb \
> +am335x-boneblack-uboot-univ.dtb \
> +am335x-boneblack-wireless.dtb \
> +am335x-boneblue.dtb \
> +am335x-bonegreen.dtb \
> +am335x-bonegreen-gateway.dtb \
> +am335x-bonegreen-wireless.dtb \
> +am335x-bonegreen-wireless-uboot-univ.dtb \
> +am335x-pocketbeagle.dtb \
> +am335x-sancloud-bbe.dtb \
> +am335x-sancloud-bbe-extended-wifi.dtb \
> +am335x-sancloud-bbe-lite.dtb \
> +"
> +
> +KERNEL_DEVICETREE:beagle-x15 =3D " \
> +am57xx-beagle-x15.dtb \
> +am57xx-beagle-x15-revb1.dtb \
> +am57xx-beagle-x15-revc.dtb \
> +am57xx-idk-lcd-osd101t2045.dtbo \
> +am57xx-idk-lcd-osd101t2587.dtbo \
> +"
> +
> +# Extra DT overlays/capes
> +KERNEL_DEVICETREE:append:armv7a =3D " \
> +AM335X-PRU-UIO-00A0.dtbo \
> +BB-ADC-00A0.dtbo \
> +BB-BBBW-WL1835-00A0.dtbo \
> +BB-BBGG-WL1835-00A0.dtbo \
> +BB-BBGW-WL1835-00A0.dtbo \
> +BB-BONE-4D5R-01-00A1.dtbo \
> +BB-BONE-eMMC1-01-00A0.dtbo \
> +BB-BONE-LCD4-01-00A1.dtbo \
> +BB-BONE-NH7C-01-A0.dtbo \
> +BB-CAPE-DISP-CT4-00A0.dtbo \
> +BB-HDMI-TDA998x-00A0.dtbo \
> +BB-I2C1-MCP7940X-00A0.dtbo \
> +BB-I2C1-RTC-DS3231.dtbo \
> +BB-I2C1-RTC-PCF8563.dtbo \
> +BB-I2C2-BME680.dtbo \
> +BB-I2C2-MPU6050.dtbo \
> +BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
> +BB-NHDMI-TDA998x-00A0.dtbo \
> +BBORG_COMMS-00A2.dtbo \
> +BBORG_FAN-A000.dtbo \
> +BBORG_RELAY-00A2.dtbo \
> +BB-SPIDEV0-00A0.dtbo \
> +BB-SPIDEV1-00A0.dtbo \
> +BB-UART1-00A0.dtbo \
> +BB-UART2-00A0.dtbo \
> +BB-UART4-00A0.dtbo \
> +BB-W1-P9.12-00A0.dtbo \
> +BONE-ADC.dtbo \
> +M-BB-BBG-00A0.dtbo \
> +M-BB-BBGG-00A0.dtbo \
> +PB-MIKROBUS-0.dtbo \
> +PB-MIKROBUS-1.dtbo \
> +"
> +
> +KERNEL_DEVICETREE:beaglebone-ai64 =3D " \
> +ti/k3-j721e-beagleboneai64.dtb \
> +ti/k3-j721e-common-proc-board.dtb \
> +ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
> +ti/k3-j721e-common-proc-board-infotainment.dtbo \
> +ti/k3-j721e-evm-csi2-ov5640.dtbo \
> +ti/k3-j721e-evm-fusion.dtbo \
> +ti/k3-j721e-evm-gesi-exp-board.dtbo \
> +ti/k3-j721e-evm-pcie0-ep.dtbo \
> +ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
> +ti/k3-j721e-evm-virt-mac-client.dtbo \
> +ti/k3-j721e-sk.dtb \
> +ti/k3-j721e-sk-csi2-ov5640.dtbo \
> +ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
> +ti/k3-j721e-sk-fusion.dtbo \
> +ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
> +"
> +
> +KERNEL_DEVICETREE:beagleplay =3D " \
> +ti/k3-am625-beagleplay.dtb \
> +ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
> +ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
> +ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
> +ti/k3-am625-beaglemod.dtb \
> +ti/k3-am625-beaglemod-audio.dtbo \
> +ti/k3-am625-beaglemod-can0.dtbo \
> +ti/k3-am625-beaglemod-can1.dtbo \
> +ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
> +ti/k3-am625-beaglemod-eeprom.dtbo \
> +ti/k3-am625-beaglemod-eth.dtbo \
> +ti/k3-am625-beaglemod-hdmi.dtbo \
> +ti/k3-am625-beaglemod-io-expand.dtbo \
> +ti/k3-am625-beaglemod-lt-lcd185.dtbo \
> +ti/k3-am625-beaglemod-ospi-flash.dtbo \
> +ti/k3-am625-beaglemod-rs485-1.dtbo \
> +ti/k3-am625-beaglemod-rs485-2.dtbo \
> +ti/k3-am625-beaglemod-rtc.dtbo \
> +ti/k3-am625-beaglemod-wl1835.dtbo \
> +ti/k3-am625-sk.dtb \
> +ti/k3-am625-sk-dmtimer-pwm.dtbo \
> +ti/k3-am625-sk-ecap-capture.dtbo \
> +ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
> +ti/k3-am625-sk-mcspi-loopback.dtbo \
> +ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
> +ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
> +ti/k3-am625-sk-pwm.dtbo \
> +ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
> +ti/k3-am62x-sk-csi2-imx219.dtbo \
> +ti/k3-am62x-sk-csi2-ov5640.dtbo \
> +ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
> +ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
> +ti/k3-am62x-sk-eqep.dtbo \
> +ti/k3-am62x-sk-hdmi-audio.dtbo \
> +ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
> +ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
> +ti/k3-am62x-sk-mcan.dtbo \
> +"
> +
>   S =3D "${WORKDIR}/git"
>  =20
>   # 6.1.80 version for 32-bit
> --=20
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17707): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17707__;!!G3vK!XoZ1FdrkQrU4v92IYrMn_s4P=
1zem1pHOTCiZtenX8exZTLPEa3Q6e1WiYnYLGWXt3TQztdNs8UvM$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/106530468/7030289__;!!G3vK!XoZ1FdrkQrU4v92IYrMn_s4P1zem1pHOTCiZte=
nX8exZTLPEa3Q6e1WiYnYLGWXt3TQztU0lUrQ9$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!XoZ1FdrkQrU4v92IYrMn_s4P1zem1pHOTCiZtenX8exZTLP=
Ea3Q6e1WiYnYLGWXt3TQztUqwwvdx$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

