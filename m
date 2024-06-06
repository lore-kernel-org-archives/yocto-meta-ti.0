Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CFBC27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 20:16:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25316.1717704970104408875
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 13:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 782F840C85;
	Thu,  6 Jun 2024 20:16:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dwS7P1wPIIo; Thu,  6 Jun 2024 20:16:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5435940C21;
	Thu,  6 Jun 2024 20:16:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 38B5F163F8E; Thu,  6 Jun 2024 16:16:07 -0400 (EDT)
Date: Thu, 6 Jun 2024 16:16:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [PATCH] conf/machine, linux-bb.org: re-org DT lists
 for Beagle platforms
Message-ID: <20240606201607.GR21287@denix.org>
References: <17D68208C5D1046F.28298@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17D68208C5D1046F.28298@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jun 2024 20:16:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17708

Oops, this is meant for master/scarthgap - forgot the branch tag, but sent the 
updated version.


On Thu, Jun 06, 2024 at 03:47:56PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> In order to be able to switch between different kernel providers, as well
> as different versions of kernel LTS (e.g. 6.1 vs. 6.6), let's re-organize
> Device Tree lists as follows:
> 
> * Move all Beagle-specific DTBs and overlays into corresponding linux-bb.org
> recipe for now, to be used when building beagleboard.org baseline
> * Update KERNEL_DEVICETREE in the machine configs to only list what already
> exists in the upstream/mainline kernel
> * Update KERNEL_DEVICETREE_PREFIX to match the list when building TI baseline
> 
> With this change it is now very easy to switch the kernel between providers
> supported by meta-ti - linux-ti-mainline, linux-ti-staging and linux-bb.org
> 
> Please note that 6.6 LTS has moved to "vendored" device tree layout even for
> 32-bit platforms, while BB.org still uses 6.1 LTS and flat DT layout.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/machine/beagle-x15.conf      |  15 ++-
>  .../conf/machine/beaglebone-ai64-k3r5.conf    |   1 -
>  meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  11 --
>  meta-ti-bsp/conf/machine/beaglebone.conf      |  67 +++-------
>  meta-ti-bsp/conf/machine/beagleplay.conf      |  34 -----
>  .../recipes-kernel/linux/linux-bb.org_git.bb  | 120 ++++++++++++++++++
>  6 files changed, 144 insertions(+), 104 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index 6fc7957c..706f999a 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -5,14 +5,17 @@
>  require conf/machine/include/beagle.inc
>  require conf/machine/include/am57xx.inc
>  
> -KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
> +KERNEL_DEVICETREE_PREFIX = " \
> +ti/omap/am57xx-beagle-x15 \
> +ti/omap/am57xx-idk-lcd \
> +"
>  
>  KERNEL_DEVICETREE = " \
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
>  "
>  
>  MACHINE_GUI_CLASS = "bigscreen"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> index f57ae065..2bf58bce 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> @@ -16,7 +16,6 @@ UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>  
>  UBOOT_MACHINE = "j721e_evm_r5_defconfig"
>  
> -
>  # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
>  # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
>  # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> index 4ce7e11a..aaf94fa5 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -7,7 +7,6 @@ require conf/machine/include/j721e.inc
>  
>  UBOOT_MACHINE = "j721e_evm_a72_config"
>  
> -
>  # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
>  # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
>  # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> @@ -20,19 +19,9 @@ KERNEL_DEVICETREE_PREFIX = " \
>  KERNEL_DEVICETREE = " \
>  ti/k3-j721e-beagleboneai64.dtb \
>  ti/k3-j721e-common-proc-board.dtb \
> -ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
> -ti/k3-j721e-common-proc-board-infotainment.dtbo \
> -ti/k3-j721e-evm-csi2-ov5640.dtbo \
> -ti/k3-j721e-evm-fusion.dtbo \
>  ti/k3-j721e-evm-gesi-exp-board.dtbo \
> -ti/k3-j721e-evm-pcie0-ep.dtbo \
>  ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
> -ti/k3-j721e-evm-virt-mac-client.dtbo \
>  ti/k3-j721e-sk.dtb \
> -ti/k3-j721e-sk-csi2-ov5640.dtbo \
> -ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
> -ti/k3-j721e-sk-fusion.dtbo \
> -ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>  "
>  
>  MACHINE_GUI_CLASS = "bigscreen"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> index 8b8b9d29..9d001599 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -5,60 +5,23 @@
>  require conf/machine/include/beagle.inc
>  require conf/machine/include/ti33x.inc
>  
> -KERNEL_DEVICETREE_PREFIX = "am335x-bone"
> -
> -KERNEL_DEVICETREE = " \
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
> +KERNEL_DEVICETREE_PREFIX = " \
> +ti/omap/am335x-bone \
> +ti/omap/am335x-pocketbeagle \
> +ti/omap/am335x-sancloud-bbe \
>  "
>  
> -# Extra DT overlays/capes
> -KERNEL_DEVICETREE += " \
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
> +KERNEL_DEVICETREE = " \
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
>  "
>  
>  MACHINE_GUI_CLASS = "bigscreen"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index 29a463e2..02bc6566 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -35,42 +35,8 @@ KERNEL_DEVICETREE_PREFIX = " \
>  
>  KERNEL_DEVICETREE = " \
>  ti/k3-am625-beagleplay.dtb \
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
>  ti/k3-am625-sk.dtb \
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
>  ti/k3-am62x-sk-hdmi-audio.dtbo \
> -ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
> -ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
> -ti/k3-am62x-sk-mcan.dtbo \
>  "
>  
>  MACHINE_GUI_CLASS = "bigscreen"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index 21d32516..534fc047 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -14,6 +14,126 @@ DEPENDS += "gmp-native libmpc-native"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>  
> +KERNEL_DEVICETREE:beaglebone = " \
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
> +KERNEL_DEVICETREE:beagle-x15 = " \
> +am57xx-beagle-x15.dtb \
> +am57xx-beagle-x15-revb1.dtb \
> +am57xx-beagle-x15-revc.dtb \
> +am57xx-idk-lcd-osd101t2045.dtbo \
> +am57xx-idk-lcd-osd101t2587.dtbo \
> +"
> +
> +# Extra DT overlays/capes
> +KERNEL_DEVICETREE:append:armv7a = " \
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
> +KERNEL_DEVICETREE:beaglebone-ai64 = " \
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
> +KERNEL_DEVICETREE:beagleplay = " \
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
>  S = "${WORKDIR}/git"
>  
>  # 6.1.80 version for 32-bit
> -- 
> 2.25.1

