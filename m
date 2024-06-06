Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399A8C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 20:16:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.25173.1717705009552527015
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 13:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oZxUMT9a;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456KGkqh015837;
	Thu, 6 Jun 2024 15:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717705006;
	bh=M1lUlQX6sdzGMzfgqwrvzlEeHMon8Ajm9umWfx5rn6I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oZxUMT9axe/iQoB/VXQ4qHjhfBKWpmscCQ45KTHoHOy3/0KQiXFdHUgFfjuR3t1wj
	 +v5aQie+bPowP9B6q6JjNLBEASZ7CVkul2/Fz+iFNytqd+pwAgIdlKWCGBkliPvV3e
	 Mcgeuzrp/NR4PtIOy78DIKBj0omNZ72JrCYCc00Q=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456KGkNt043614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 15:16:46 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 15:16:46 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Thu, 6 Jun
 2024 15:16:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 15:16:45 -0500
Received: from [10.250.32.138] ([10.250.32.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456KGj5W046123;
	Thu, 6 Jun 2024 15:16:45 -0500
Message-ID: <20989423-a89c-4cfc-b4d7-7380a5589678@ti.com>
Date: Thu, 6 Jun 2024 15:16:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH] conf/machine, linux-bb.org: re-org DT lists for
 Beagle platforms
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <17D68208C5D1046F.28298@lists.yoctoproject.org>
 <20240606201607.GR21287@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240606201607.GR21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jun 2024 20:16:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17709



On 6/6/2024 3:16 PM, Denys Dmytriyenko wrote:
> Oops, this is meant for master/scarthgap - forgot the branch tag, but sent the
> updated version.

I was just going to ask...


> 
> On Thu, Jun 06, 2024 at 03:47:56PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> In order to be able to switch between different kernel providers, as well
>> as different versions of kernel LTS (e.g. 6.1 vs. 6.6), let's re-organize
>> Device Tree lists as follows:
>>
>> * Move all Beagle-specific DTBs and overlays into corresponding linux-bb.org
>> recipe for now, to be used when building beagleboard.org baseline
>> * Update KERNEL_DEVICETREE in the machine configs to only list what already
>> exists in the upstream/mainline kernel
>> * Update KERNEL_DEVICETREE_PREFIX to match the list when building TI baseline
>>
>> With this change it is now very easy to switch the kernel between providers
>> supported by meta-ti - linux-ti-mainline, linux-ti-staging and linux-bb.org
>>
>> Please note that 6.6 LTS has moved to "vendored" device tree layout even for
>> 32-bit platforms, while BB.org still uses 6.1 LTS and flat DT layout.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   meta-ti-bsp/conf/machine/beagle-x15.conf      |  15 ++-
>>   .../conf/machine/beaglebone-ai64-k3r5.conf    |   1 -
>>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  11 --
>>   meta-ti-bsp/conf/machine/beaglebone.conf      |  67 +++-------
>>   meta-ti-bsp/conf/machine/beagleplay.conf      |  34 -----
>>   .../recipes-kernel/linux/linux-bb.org_git.bb  | 120 ++++++++++++++++++
>>   6 files changed, 144 insertions(+), 104 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> index 6fc7957c..706f999a 100644
>> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
>> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> @@ -5,14 +5,17 @@
>>   require conf/machine/include/beagle.inc
>>   require conf/machine/include/am57xx.inc
>>   
>> -KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
>> +KERNEL_DEVICETREE_PREFIX = " \
>> +ti/omap/am57xx-beagle-x15 \
>> +ti/omap/am57xx-idk-lcd \
>> +"
>>   
>>   KERNEL_DEVICETREE = " \
>> -am57xx-beagle-x15.dtb \
>> -am57xx-beagle-x15-revb1.dtb \
>> -am57xx-beagle-x15-revc.dtb \
>> -am57xx-idk-lcd-osd101t2045.dtbo \
>> -am57xx-idk-lcd-osd101t2587.dtbo \
>> +ti/omap/am57xx-beagle-x15.dtb \
>> +ti/omap/am57xx-beagle-x15-revb1.dtb \
>> +ti/omap/am57xx-beagle-x15-revc.dtb \
>> +ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
>> +ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
>>   "
>>   
>>   MACHINE_GUI_CLASS = "bigscreen"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> index f57ae065..2bf58bce 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> @@ -16,7 +16,6 @@ UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>>   
>>   UBOOT_MACHINE = "j721e_evm_r5_defconfig"
>>   
>> -
>>   # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
>>   # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
>>   # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> index 4ce7e11a..aaf94fa5 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> @@ -7,7 +7,6 @@ require conf/machine/include/j721e.inc
>>   
>>   UBOOT_MACHINE = "j721e_evm_a72_config"
>>   
>> -
>>   # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
>>   # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
>>   # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> @@ -20,19 +19,9 @@ KERNEL_DEVICETREE_PREFIX = " \
>>   KERNEL_DEVICETREE = " \
>>   ti/k3-j721e-beagleboneai64.dtb \
>>   ti/k3-j721e-common-proc-board.dtb \
>> -ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
>> -ti/k3-j721e-common-proc-board-infotainment.dtbo \
>> -ti/k3-j721e-evm-csi2-ov5640.dtbo \
>> -ti/k3-j721e-evm-fusion.dtbo \
>>   ti/k3-j721e-evm-gesi-exp-board.dtbo \
>> -ti/k3-j721e-evm-pcie0-ep.dtbo \
>>   ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
>> -ti/k3-j721e-evm-virt-mac-client.dtbo \
>>   ti/k3-j721e-sk.dtb \
>> -ti/k3-j721e-sk-csi2-ov5640.dtbo \
>> -ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
>> -ti/k3-j721e-sk-fusion.dtbo \
>> -ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>>   "
>>   
>>   MACHINE_GUI_CLASS = "bigscreen"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
>> index 8b8b9d29..9d001599 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
>> @@ -5,60 +5,23 @@
>>   require conf/machine/include/beagle.inc
>>   require conf/machine/include/ti33x.inc
>>   
>> -KERNEL_DEVICETREE_PREFIX = "am335x-bone"
>> -
>> -KERNEL_DEVICETREE = " \
>> -am335x-bone.dtb \
>> -am335x-boneblack.dtb \
>> -am335x-boneblack-pps.dtb \
>> -am335x-boneblack-uboot.dtb \
>> -am335x-boneblack-uboot-univ.dtb \
>> -am335x-boneblack-wireless.dtb \
>> -am335x-boneblue.dtb \
>> -am335x-bonegreen.dtb \
>> -am335x-bonegreen-gateway.dtb \
>> -am335x-bonegreen-wireless.dtb \
>> -am335x-bonegreen-wireless-uboot-univ.dtb \
>> -am335x-pocketbeagle.dtb \
>> -am335x-sancloud-bbe.dtb \
>> -am335x-sancloud-bbe-extended-wifi.dtb \
>> -am335x-sancloud-bbe-lite.dtb \
>> +KERNEL_DEVICETREE_PREFIX = " \
>> +ti/omap/am335x-bone \
>> +ti/omap/am335x-pocketbeagle \
>> +ti/omap/am335x-sancloud-bbe \
>>   "
>>   
>> -# Extra DT overlays/capes
>> -KERNEL_DEVICETREE += " \
>> -AM335X-PRU-UIO-00A0.dtbo \
>> -BB-ADC-00A0.dtbo \
>> -BB-BBBW-WL1835-00A0.dtbo \
>> -BB-BBGG-WL1835-00A0.dtbo \
>> -BB-BBGW-WL1835-00A0.dtbo \
>> -BB-BONE-4D5R-01-00A1.dtbo \
>> -BB-BONE-eMMC1-01-00A0.dtbo \
>> -BB-BONE-LCD4-01-00A1.dtbo \
>> -BB-BONE-NH7C-01-A0.dtbo \
>> -BB-CAPE-DISP-CT4-00A0.dtbo \
>> -BB-HDMI-TDA998x-00A0.dtbo \
>> -BB-I2C1-MCP7940X-00A0.dtbo \
>> -BB-I2C1-RTC-DS3231.dtbo \
>> -BB-I2C1-RTC-PCF8563.dtbo \
>> -BB-I2C2-BME680.dtbo \
>> -BB-I2C2-MPU6050.dtbo \
>> -BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
>> -BB-NHDMI-TDA998x-00A0.dtbo \
>> -BBORG_COMMS-00A2.dtbo \
>> -BBORG_FAN-A000.dtbo \
>> -BBORG_RELAY-00A2.dtbo \
>> -BB-SPIDEV0-00A0.dtbo \
>> -BB-SPIDEV1-00A0.dtbo \
>> -BB-UART1-00A0.dtbo \
>> -BB-UART2-00A0.dtbo \
>> -BB-UART4-00A0.dtbo \
>> -BB-W1-P9.12-00A0.dtbo \
>> -BONE-ADC.dtbo \
>> -M-BB-BBG-00A0.dtbo \
>> -M-BB-BBGG-00A0.dtbo \
>> -PB-MIKROBUS-0.dtbo \
>> -PB-MIKROBUS-1.dtbo \
>> +KERNEL_DEVICETREE = " \
>> +ti/omap/am335x-bone.dtb \
>> +ti/omap/am335x-boneblack.dtb \
>> +ti/omap/am335x-boneblack-wireless.dtb \
>> +ti/omap/am335x-boneblue.dtb \
>> +ti/omap/am335x-bonegreen.dtb \
>> +ti/omap/am335x-bonegreen-wireless.dtb \
>> +ti/omap/am335x-pocketbeagle.dtb \
>> +ti/omap/am335x-sancloud-bbe.dtb \
>> +ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
>> +ti/omap/am335x-sancloud-bbe-lite.dtb \
>>   "
>>   
>>   MACHINE_GUI_CLASS = "bigscreen"
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
>> index 29a463e2..02bc6566 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>> @@ -35,42 +35,8 @@ KERNEL_DEVICETREE_PREFIX = " \
>>   
>>   KERNEL_DEVICETREE = " \
>>   ti/k3-am625-beagleplay.dtb \
>> -ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
>> -ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
>> -ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
>> -ti/k3-am625-beaglemod.dtb \
>> -ti/k3-am625-beaglemod-audio.dtbo \
>> -ti/k3-am625-beaglemod-can0.dtbo \
>> -ti/k3-am625-beaglemod-can1.dtbo \
>> -ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
>> -ti/k3-am625-beaglemod-eeprom.dtbo \
>> -ti/k3-am625-beaglemod-eth.dtbo \
>> -ti/k3-am625-beaglemod-hdmi.dtbo \
>> -ti/k3-am625-beaglemod-io-expand.dtbo \
>> -ti/k3-am625-beaglemod-lt-lcd185.dtbo \
>> -ti/k3-am625-beaglemod-ospi-flash.dtbo \
>> -ti/k3-am625-beaglemod-rs485-1.dtbo \
>> -ti/k3-am625-beaglemod-rs485-2.dtbo \
>> -ti/k3-am625-beaglemod-rtc.dtbo \
>> -ti/k3-am625-beaglemod-wl1835.dtbo \
>>   ti/k3-am625-sk.dtb \
>> -ti/k3-am625-sk-dmtimer-pwm.dtbo \
>> -ti/k3-am625-sk-ecap-capture.dtbo \
>> -ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
>> -ti/k3-am625-sk-mcspi-loopback.dtbo \
>> -ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
>> -ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
>> -ti/k3-am625-sk-pwm.dtbo \
>> -ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
>> -ti/k3-am62x-sk-csi2-imx219.dtbo \
>> -ti/k3-am62x-sk-csi2-ov5640.dtbo \
>> -ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
>> -ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
>> -ti/k3-am62x-sk-eqep.dtbo \
>>   ti/k3-am62x-sk-hdmi-audio.dtbo \
>> -ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
>> -ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
>> -ti/k3-am62x-sk-mcan.dtbo \
>>   "
>>   
>>   MACHINE_GUI_CLASS = "bigscreen"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>> index 21d32516..534fc047 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>> @@ -14,6 +14,126 @@ DEPENDS += "gmp-native libmpc-native"
>>   
>>   KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>>   
>> +KERNEL_DEVICETREE:beaglebone = " \
>> +am335x-bone.dtb \
>> +am335x-boneblack.dtb \
>> +am335x-boneblack-pps.dtb \
>> +am335x-boneblack-uboot.dtb \
>> +am335x-boneblack-uboot-univ.dtb \
>> +am335x-boneblack-wireless.dtb \
>> +am335x-boneblue.dtb \
>> +am335x-bonegreen.dtb \
>> +am335x-bonegreen-gateway.dtb \
>> +am335x-bonegreen-wireless.dtb \
>> +am335x-bonegreen-wireless-uboot-univ.dtb \
>> +am335x-pocketbeagle.dtb \
>> +am335x-sancloud-bbe.dtb \
>> +am335x-sancloud-bbe-extended-wifi.dtb \
>> +am335x-sancloud-bbe-lite.dtb \
>> +"
>> +
>> +KERNEL_DEVICETREE:beagle-x15 = " \
>> +am57xx-beagle-x15.dtb \
>> +am57xx-beagle-x15-revb1.dtb \
>> +am57xx-beagle-x15-revc.dtb \
>> +am57xx-idk-lcd-osd101t2045.dtbo \
>> +am57xx-idk-lcd-osd101t2587.dtbo \
>> +"
>> +
>> +# Extra DT overlays/capes
>> +KERNEL_DEVICETREE:append:armv7a = " \
>> +AM335X-PRU-UIO-00A0.dtbo \
>> +BB-ADC-00A0.dtbo \
>> +BB-BBBW-WL1835-00A0.dtbo \
>> +BB-BBGG-WL1835-00A0.dtbo \
>> +BB-BBGW-WL1835-00A0.dtbo \
>> +BB-BONE-4D5R-01-00A1.dtbo \
>> +BB-BONE-eMMC1-01-00A0.dtbo \
>> +BB-BONE-LCD4-01-00A1.dtbo \
>> +BB-BONE-NH7C-01-A0.dtbo \
>> +BB-CAPE-DISP-CT4-00A0.dtbo \
>> +BB-HDMI-TDA998x-00A0.dtbo \
>> +BB-I2C1-MCP7940X-00A0.dtbo \
>> +BB-I2C1-RTC-DS3231.dtbo \
>> +BB-I2C1-RTC-PCF8563.dtbo \
>> +BB-I2C2-BME680.dtbo \
>> +BB-I2C2-MPU6050.dtbo \
>> +BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
>> +BB-NHDMI-TDA998x-00A0.dtbo \
>> +BBORG_COMMS-00A2.dtbo \
>> +BBORG_FAN-A000.dtbo \
>> +BBORG_RELAY-00A2.dtbo \
>> +BB-SPIDEV0-00A0.dtbo \
>> +BB-SPIDEV1-00A0.dtbo \
>> +BB-UART1-00A0.dtbo \
>> +BB-UART2-00A0.dtbo \
>> +BB-UART4-00A0.dtbo \
>> +BB-W1-P9.12-00A0.dtbo \
>> +BONE-ADC.dtbo \
>> +M-BB-BBG-00A0.dtbo \
>> +M-BB-BBGG-00A0.dtbo \
>> +PB-MIKROBUS-0.dtbo \
>> +PB-MIKROBUS-1.dtbo \
>> +"
>> +
>> +KERNEL_DEVICETREE:beaglebone-ai64 = " \
>> +ti/k3-j721e-beagleboneai64.dtb \
>> +ti/k3-j721e-common-proc-board.dtb \
>> +ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
>> +ti/k3-j721e-common-proc-board-infotainment.dtbo \
>> +ti/k3-j721e-evm-csi2-ov5640.dtbo \
>> +ti/k3-j721e-evm-fusion.dtbo \
>> +ti/k3-j721e-evm-gesi-exp-board.dtbo \
>> +ti/k3-j721e-evm-pcie0-ep.dtbo \
>> +ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
>> +ti/k3-j721e-evm-virt-mac-client.dtbo \
>> +ti/k3-j721e-sk.dtb \
>> +ti/k3-j721e-sk-csi2-ov5640.dtbo \
>> +ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
>> +ti/k3-j721e-sk-fusion.dtbo \
>> +ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>> +"
>> +
>> +KERNEL_DEVICETREE:beagleplay = " \
>> +ti/k3-am625-beagleplay.dtb \
>> +ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
>> +ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
>> +ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
>> +ti/k3-am625-beaglemod.dtb \
>> +ti/k3-am625-beaglemod-audio.dtbo \
>> +ti/k3-am625-beaglemod-can0.dtbo \
>> +ti/k3-am625-beaglemod-can1.dtbo \
>> +ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
>> +ti/k3-am625-beaglemod-eeprom.dtbo \
>> +ti/k3-am625-beaglemod-eth.dtbo \
>> +ti/k3-am625-beaglemod-hdmi.dtbo \
>> +ti/k3-am625-beaglemod-io-expand.dtbo \
>> +ti/k3-am625-beaglemod-lt-lcd185.dtbo \
>> +ti/k3-am625-beaglemod-ospi-flash.dtbo \
>> +ti/k3-am625-beaglemod-rs485-1.dtbo \
>> +ti/k3-am625-beaglemod-rs485-2.dtbo \
>> +ti/k3-am625-beaglemod-rtc.dtbo \
>> +ti/k3-am625-beaglemod-wl1835.dtbo \
>> +ti/k3-am625-sk.dtb \
>> +ti/k3-am625-sk-dmtimer-pwm.dtbo \
>> +ti/k3-am625-sk-ecap-capture.dtbo \
>> +ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
>> +ti/k3-am625-sk-mcspi-loopback.dtbo \
>> +ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
>> +ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
>> +ti/k3-am625-sk-pwm.dtbo \
>> +ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
>> +ti/k3-am62x-sk-csi2-imx219.dtbo \
>> +ti/k3-am62x-sk-csi2-ov5640.dtbo \
>> +ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
>> +ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
>> +ti/k3-am62x-sk-eqep.dtbo \
>> +ti/k3-am62x-sk-hdmi-audio.dtbo \
>> +ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
>> +ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
>> +ti/k3-am62x-sk-mcan.dtbo \
>> +"
>> +
>>   S = "${WORKDIR}/git"
>>   
>>   # 6.1.80 version for 32-bit
>> -- 
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17708): https://lists.yoctoproject.org/g/meta-ti/message/17708
>> Mute This Topic: https://lists.yoctoproject.org/mt/106530461/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

