Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433E6C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 16:46:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.672.1678812390432347951
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 09:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xpdALkCn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32EGkOxp050849;
	Tue, 14 Mar 2023 11:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678812384;
	bh=LRKibWJdZItzrenl+bx+ouYb0yftyJujCvYB/uqoytc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xpdALkCnF7WT+iaHjE52nksof+yovd3ATEWKj69G1P080wslR91MaqCq2K267pUu4
	 SwN7o9JJayGMuNtahqfC1KRQTHhgT5gJqT5VrtCDMTrk4IwemSpPkjmQiMVUv6Jo1x
	 +qskcyzKXWaW8QA/9fx1mEvLnm2cS0ctA+wQVaFc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32EGkOTF021719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Mar 2023 11:46:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Mar 2023 11:46:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Mar 2023 11:46:23 -0500
Received: from [10.247.30.6] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32EGkNsh010552;
	Tue, 14 Mar 2023 11:46:24 -0500
Message-ID: <5a346fe0-c71a-155f-3d60-fe28d05d9929@ti.com>
Date: Tue, 14 Mar 2023 11:46:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] linux-ti-staging: Add 6.1
 recipe
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko
	<denis@denix.org>,
        Randolph Sapp <rs@ti.com>
References: <20230314162027.28974-1-afd@ti.com>
 <f744c42c-7678-a43a-4dd7-c7323ec3236d@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <f744c42c-7678-a43a-4dd7-c7323ec3236d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 32EGkOxp050849
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Mar 2023 16:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15979



On 3/14/2023 11:37 AM, Ryan Eatmon wrote:
>=20
> Is there a better way of adding 6.1 without destroying the 5.10 support=
?=20
>  =C2=A0Because until we have 6.1 up and working it would be nice to hav=
e a=20
> working kirkstone for anyone using it...
>=20

Want to hear from denys as well based on past migration history.

IMO, there was a window during early migration at 5.10 phase where we=20
limited features to get the initial baseline ready and added overlays=20
over the time when kernel added the same.

Its ok to limit GPU to sw rendering and add the initial kernel 6.1=20
support and switch to hwa once gpu ddk km and um migration to 6.1 kernel=20
happens.
(Randolph , pitch in)


>=20
>=20
> On 3/14/2023 11:20, Andrew Davis wrote:
>> Remove all non-upstream Device Tree Overlays. We could have filtered t=
hem
>> out like as done in mainline and next testing. The issue would be as t=
hey
>> are added back to 6.1 and upstream we would need to conditionally
>> re-enable each. Easier to get a clean start.
>>
>> Switch to software rendering as the Rogue kernel mode driver does not
>> build yet for kernel v6.1.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am57xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 ----
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=C2=A0=C2=A0 |=C2=A0=
 1 -
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 51 ------------=
-------
>> =C2=A0 meta-ti-bsp/conf/machine/dra7xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 8 ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62xx.inc=C2=A0=C2=A0 |=C2=A0=
 2 +-
>> =C2=A0 meta-ti-bsp/conf/machine/include/am64xx.inc=C2=A0=C2=A0 |=C2=A0=
 3 --
>> =C2=A0 meta-ti-bsp/conf/machine/include/am65xx.inc=C2=A0=C2=A0 | 10 --=
--
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721e.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721s2.inc=C2=A0=C2=A0 |=C2=A0=
 2 +-
>> =C2=A0 meta-ti-bsp/conf/machine/include/j784s4.inc=C2=A0=C2=A0 |=C2=A0=
 2 +-
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti43x.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 -
>> =C2=A0 meta-ti-bsp/conf/machine/j721e-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 meta-ti-bsp/conf/machine/j721s2-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
>> =C2=A0 .../linux/linux-ti-staging-6.1/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +
>> =C2=A0 .../linux/linux-ti-staging-6.1/k3/defconfig=C2=A0=C2=A0 |=C2=A0=
 2 +
>> =C2=A0 .../linux-ti-staging-6.1/omapl138/defconfig=C2=A0=C2=A0 |=C2=A0=
 1 +
>> =C2=A0 .../linux/linux-ti-staging_6.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 +++++++++++++
>> =C2=A0 18 files changed, 45 insertions(+), 92 deletions(-)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconf=
ig
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>>
>> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> index b3525a0b..7d190753 100644
>> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> @@ -13,19 +13,9 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am57xx-beagle-x15-revb1.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am57xx-beagle-x15-revc.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am5729-beagleboneai.dtb \
>> -=C2=A0=C2=A0=C2=A0 ${@oe.utils.conditional('PREFERRED_PROVIDER_virtua=
l/kernel',=20
>> 'linux-ti-mainline', '', 'am57xx-evm.dtb', d)} \
>> -=C2=A0=C2=A0=C2=A0 ti/am57xx-evm-common.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ${@oe.utils.conditional('PREFERRED_PROVIDER_virtua=
l/kernel',=20
>> 'linux-ti-mainline', '', 'am57xx-evm-reva3.dtb', d)} \
>> -=C2=A0=C2=A0=C2=A0 ti/am57xx-evm-reva3.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am571x-idk.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/am571x-idk-touchscreen.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am572x-idk.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am574x-idk.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/am57xx-idk-osd-lcd-common.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/am572x-idk-touchscreen.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/lcd-osd101t2587.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/lcd-osd101t2045.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ${@oe.utils.conditional('PREFERRED_PROVIDER_virtua=
l/kernel',=20
>> 'linux-ti-mainline', '', 'ti/ov10635.dtbo', d)} \
>> =C2=A0 "
>> =C2=A0 KERNEL_DEVICETREE +=3D=20
>> "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1',=20
>> 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb=20
>> am571x-idk-pru-excl-uio.dtb', '', d)}"
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> index 73859d5f..35910ff3 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> @@ -8,7 +8,6 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-skeleton.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-lpmdemo.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-csi2-ov5640.dtbo \
>> =C2=A0 "
>> =C2=A0 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index ec9ce596..32ffaaa0 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -8,7 +8,6 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-lp-sk.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-skeleton.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-lpmdemo.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-csi2-ov5640.dtbo \
>> =C2=A0 "
>> =C2=A0 UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf=20
>> b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> index 6e8c863c..10861c63 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> @@ -17,58 +17,7 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0 ti/k3-j721e-beagleboneai64.dtb \
>> =C2=A0 ti/k3-j721e-beagleboneai64-no-shared-mem.dtb \
>> =C2=A0 ti/k3-j721e-common-proc-board.dtb \
>> -ti/k3-j721e-common-proc-board-infotainment.dtbo \
>> -ti/k3-j721e-cpb-csi2-ov5640.dtbo \
>> -ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
>> -ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
>> -ti/k3-j721e-fpdlink-sk-fusion.dtbo \
>> -ti/k3-j721e-gesi-exp-board.dtbo \
>> -ti/k3-j721e-proc-board-tps65917.dtb \
>> -ti/k3-j721e-quad-port-eth-exp.dtbo \
>> -ti/k3-j721e-sk-csi2-ov5640.dtbo \
>> =C2=A0 ti/k3-j721e-sk.dtb \
>> -ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
>> -ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>> -ti/overlays/BBAI64-CSI0-imx219.dtbo \
>> -ti/overlays/BBAI64-CSI1-imx219.dtbo \
>> -ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
>> -ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
>> -ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
>> -ti/overlays/BB-I2C2-MPU6050.dtbo \
>> -ti/overlays/BBORG_LOAD-00A2.dtbo \
>> -ti/overlays/BBORG_RELAY-00A2.dtbo \
>> -ti/overlays/BBORG_SERVO-00A2.dtbo \
>> -ti/overlays/BONE-FAN.dtbo \
>> -ti/overlays/BONE-I2C1.dtbo \
>> -ti/overlays/BONE-I2C2.dtbo \
>> -ti/overlays/BONE-I2C3.dtbo \
>> -ti/overlays/BONE-LED_P8_03.dtbo \
>> -ti/overlays/BONE-LED_P9_11.dtbo \
>> -ti/overlays/BONE-PWM0.dtbo \
>> -ti/overlays/BONE-PWM1.dtbo \
>> -ti/overlays/BONE-PWM2.dtbo \
>> -ti/overlays/BONE-SPI0_0.dtbo \
>> -ti/overlays/BONE-SPI0_1.dtbo \
>> -ti/overlays/BONE-UART1.dtbo \
>> -ti/overlays/BONE-USB0-host.dtbo \
>> -ti/overlays/J721E-PRU-UIO-00A0.dtbo \
>> -ti/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtbo \
>> -ti/overlays/robotics-cape.dtbo \
>> =C2=A0 "
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw.itb"
>> diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
>> index 813e0e06..1944792e 100644
>> --- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
>> @@ -10,18 +10,10 @@ SERIAL_CONSOLES =3D "115200;ttyS0"
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dra7-evm.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/dra7x-evm-osd-lcd-common.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dra71-evm.dtb \
>> -=C2=A0=C2=A0=C2=A0 ${@oe.utils.conditional('PREFERRED_PROVIDER_virtua=
l/kernel',=20
>> 'linux-ti-mainline', '', 'dra71-evm-nand.dtb', d)} \
>> -=C2=A0=C2=A0=C2=A0 ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dra72-evm.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dra72-evm-revc.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/dra72-evm-touchscreen.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/dra74-evm-touchscreen.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dra76-evm.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/dra76-evm-tfp410.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/lcd-osd101t2045.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/lcd-osd101t2587.dtbo \
>> =C2=A0 "
>> =C2=A0 UBOOT_MACHINE =3D "dra7xx_evm_config"
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> index 98df24b2..c0f2adb2 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -6,7 +6,7 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>> =C2=A0 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> -PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index a2e5d673..ff7f66e3 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -7,9 +7,6 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am642-evm.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am642-sk.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am642-evm-icssg1-dualemac.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am642-evm-icssg1-dualemac-mii.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am642-evm-nand.dtbo \
>> =C2=A0 "
>> =C2=A0 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index 0ae00761..fef73da2 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -10,16 +10,6 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am654-base-board.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-base-board-sr1.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-gp.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-idk.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-idk-sr1.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-sr1.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-pcie-usb2.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-pcie-usb3.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-evm-tc358876.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-evm-oldi-lcd1evm.dtbo \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am654-evm-ov5640.dtbo \
>> =C2=A0 "
>> =C2=A0 # On AM65x the file tiboot3.bin comes from the bootloader not t=
i-sci-fw
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc=20
>> b/meta-ti-bsp/conf/machine/include/j721e.inc
>> index 8f9c24e6..46f9564e 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY:append =3D ":j721e"
>> =C2=A0 MACHINE_FEATURES +=3D "screen gpu"
>> -PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
>> =C2=A0 # On J721e the file tiboot3.bin comes from the bootloader not t=
i-sci-fw
>> =C2=A0 do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_de=
ploy"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc=20
>> b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> index 70569a16..a23aed73 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY:append =3D ":j721s2"
>> =C2=A0 MACHINE_FEATURES +=3D "screen gpu"
>> -PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
>> =C2=A0 TFA_BOARD =3D "generic"
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc=20
>> b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> index d03ee4a4..3066193b 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -3,7 +3,7 @@ SOC_FAMILY:append =3D ":j784s4"
>> =C2=A0 MACHINE_FEATURES +=3D "screen gpu"
>> -PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
>> =C2=A0 TFA_BOARD =3D "j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> index ec6d9c07..3228418e 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> @@ -20,10 +20,8 @@ KERNEL_IMAGETYPE =3D "zImage"
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am437x-gp-evm.dtb \
>> -=C2=A0=C2=A0=C2=A0 ${@oe.utils.conditional('PREFERRED_PROVIDER_virtua=
l/kernel',=20
>> 'linux-ti-mainline', '', 'am437x-gp-evm-hdmi.dtb', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am437x-sk-evm.dtb am437x-idk-evm.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am43x-epos-evm.dtb \
>> -=C2=A0=C2=A0=C2=A0 ${@oe.utils.conditional('PREFERRED_PROVIDER_virtua=
l/kernel',=20
>> 'linux-ti-mainline', '', 'am43x-epos-evm-hdmi.dtb', d)} \
>> =C2=A0 "
>> =C2=A0 KERNEL_DEVICETREE +=3D=20
>> "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1',=20
>> 'am437x-idk-pru-excl-uio.dtb', '', d)}"
>> diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf=20
>> b/meta-ti-bsp/conf/machine/j721e-evm.conf
>> index fe28e6f5..f6af3b6d 100644
>> --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
>> @@ -9,7 +9,6 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-common-proc-board.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-j721e-common-proc-board-infotainment.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-sk.dtb \
>> =C2=A0 "
>> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf=20
>> b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> index 3576414d..740036b1 100644
>> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> @@ -11,7 +11,6 @@ OPTEE_K3_USART =3D "0x8"
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721s2-common-proc-board.dtb \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-j721s2-gesi-exp-board.dtbo \
>> =C2=A0 "
>> =C2=A0 UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
>> new file mode 100644
>> index 00000000..24b53cf7
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=3Dmulti_v7_defconfig
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
>> new file mode 100644
>> index 00000000..ef1d3efd
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconf=
ig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=3Ddefconfig
>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defco=
nfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/def=
config
>> new file mode 100644
>> index 00000000..099493af
>> --- /dev/null
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defco=
nfig
>> @@ -0,0 +1 @@
>> +use-kernel-config=3Ddavinci_all_defconfig
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> new file mode 100644
>> index 00000000..2b2196c7
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> @@ -0,0 +1,36 @@
>> +SECTION =3D "kernel"
>> +SUMMARY =3D "Linux kernel for TI devices"
>> +LICENSE =3D "GPL-2.0-only"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aed=
cd7e46"
>> +
>> +inherit kernel
>> +
>> +require recipes-kernel/linux/setup-defconfig.inc
>> +require recipes-kernel/linux/kernel-rdepends.inc
>> +require recipes-kernel/linux/ti-kernel.inc
>> +
>> +DEPENDS +=3D "gmp-native libmpc-native"
>> +
>> +# Look in the generic major.minor directory for files
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
>> +
>> +KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${EXTRA_DTC_ARGS}"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +BRANCH =3D "ti-linux-6.1.y"
>> +
>> +SRCREV =3D "e553069c227ddeb22ac283676f7b5a6bf9d16cb8"
>> +PV =3D "v6.1+git${SRCPV}"
>> +
>> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a=20
>> rebuild
>> +MACHINE_KERNEL_PR:append =3D "b"
>> +PR =3D "${MACHINE_KERNEL_PR}"
>> +
>> +KERNEL_GIT_URI =3D=20
>> "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>> +KERNEL_GIT_PROTOCOL =3D "https"
>> +SRC_URI +=3D=20
>> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANCH=
} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi=
le://defconfig"
>> +
>> +FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.=
itb"
>=20

