Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F98C3ABCB
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 06:54:48 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.96486.1747205682272963641
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 May 2025 23:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ImpyXpxr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54E6scLZ2545993;
	Wed, 14 May 2025 01:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747205678;
	bh=3ZBng8ltK4ZC8773nTz5vp1vybWYa4obMHgkiRf/WAw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ImpyXpxre8vusP0nSIt4Dk8u5xamGLlAWEdp6LcWUF3rMPnuuLctQbmyQYzWgAUAD
	 H+tJsEm/BI3nXYqh15c9J0xZx7JDD1Q9j5ey6k7/OBmBC7ocwkakbIv9rmuDYaoly8
	 jS38igyWWe5qfONSipgTzFs3EJuIauqTLn/Lotno=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54E6scqN3128437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 01:54:38 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 01:54:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 01:54:38 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54E6sZLi062793;
	Wed, 14 May 2025 01:54:35 -0500
Message-ID: <fad59a02-3c11-4763-99eb-0941a9b9dafd@ti.com>
Date: Wed, 14 May 2025 12:24:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH v3] meta-ti-bsp : Add build support
 for am62dxx-evm
To: Daniel Schultz <d.schultz@phytec.de>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250513145709.1181316-1-p-bhagat@ti.com>
 <af87ab8f-4028-4704-9292-3725aef113f5@phytec.de>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <af87ab8f-4028-4704-9292-3725aef113f5@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 54E6scLZ2545993
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 May 2025 06:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18558

Hi Daniel,


On 14/05/25 10:05, Daniel Schultz wrote:
>
> On 5/13/25 16:57, Paresh Bhagat via lists.yoctoproject.org wrote:
>> The AM62D SoC is a high-performance Digital Signal Processing (DSP)
>> device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores, and
>> a Cx7 DSP core with Matrix Multiplication Accelerator (MMA). It featur=
es
>> a range of peripherals, including multichannel audio serial ports,
>> Ethernet, UARTs, SPI, I2C, USB, and more.
>>
>> This SoC is part of K3-AM62x family, which includes the AM62A and AM62=
P
>> variants. While the AM62A and AM62D are largely similar, the AM62D is
>> specifically targeted for general-purpose DSP applications, whereas th=
e
>> AM62A focuses on edge AI workloads. A key distinction is that the AM62=
D
>> does not include multimedia components such as the video=20
>> encoder/decoder,
>> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
>> processing, or the display subsystem. Additionally, the AM62D has a
>> different pin configuration compared to the AM62A, which impacts=20
>> embedded
>> software development.
>>
>> The EVM board is a low-cost, expandable platform designed for the AM62=
D2
>> SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, aud=
io
>> jacks, USB ports, and more.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>
>> Boot logs
>> https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383d=
b6
>>
>> Change log:
>> =C2=A0=C2=A0=C2=A0=C2=A0 v2->v3:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Drop cnm-wave-fw fo=
r am62d.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Package correct c7 =
firmware for am62d.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 v1->v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Drop MACHINE_FEATUR=
ES for screen, touchsereen.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Update ti-rtos-echo=
-test-fw to package firmware for am62d.
>>
>> =C2=A0 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=
 | 11 +++++++++++
>> =C2=A0 meta-ti-bsp/conf/machine/am62dxx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++++
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62dxx.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 +++++++++++++++
>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +++
>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 ++
>> =C2=A0 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++++++
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 ++
>> =C2=A0 .../optee/optee-os-ti-overrides.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 8 files changed, 63 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.co=
nf
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm.conf
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/include/am62dxx.inc
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf=20
>> b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
>> new file mode 100644
>> index 00000000..00906420
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
>> @@ -0,0 +1,11 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62D HS-FS EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI AM62D EVM (R5F core)
>> +
>> +require conf/machine/include/k3r5.inc
>> +
>> +SYSFW_SOC =3D "am62dx"
>> +SYSFW_CONFIG =3D "evm"
>> +SYSFW_SUFFIX =3D "hs-fs"
>> +
>> +UBOOT_MACHINE =3D "am62dx_evm_r5_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>> new file mode 100644
>> index 00000000..f2da559c
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>> @@ -0,0 +1,15 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62DXX EVM
>> +#@DESCRIPTION: Machine configuration for the TI AM62DXX EVM
>> +
>> +require conf/machine/include/am62dxx.inc
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62d2 \
>> +"
>> +
>> +KERNEL_DEVICETREE =3D ""
> why not add the evm device-tree?


This dtb is not part of mainline kernel yet. For details you can refer=20
here. https://lists.yoctoproject.org/g/meta-ti/message/18263


>> +
>> +FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62d2-evm.dtb"
>> +
>> +UBOOT_MACHINE =3D "am62dx_evm_a53_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> new file mode 100644
>> index 00000000..ac4e8e17
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> @@ -0,0 +1,15 @@
>> +require conf/machine/include/k3.inc
>> +require conf/machine/include/mc_k3r5.inc
>> +
>> +SOC_FAMILY:append =3D ":am62dxx"
>> +
>> +TFA_K3_SYSTEM_SUSPEND =3D "1"
>> +
>> +# Default tiboot3.bin on AM62D is for HS-FS
>> +IMAGE_BOOT_FILES +=3D "tiboot3-am62dx-hs-fs-evm.bin"
>> +
>> +# Since default tiboot3.bin on AM62D is for HS-FS, add a version for=20
>> HS-SE
>> +IMAGE_BOOT_FILES +=3D "tiboot3-am62dx-hs-evm.bin"
>> +
>> +TFA_BOARD =3D "lite"
>> +OPTEEMACHINE =3D "k3-am62x"
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> index a7d15e30..85cfc97e 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> @@ -33,6 +33,7 @@ PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> =C2=A0 PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>
> keep alphabetic order everywhere you add am62d.
>
> - Daniel


Will fix this. Thanks


>
>> =C2=A0 =C2=A0 DM_FW_DIR =3D "ti-dm/${PLAT_SFX}"
>> =C2=A0 @@ -52,6 +53,7 @@ DM_FW_LIST:am65xx =3D=C2=A0 ""
>> =C2=A0 DM_FW_LIST:am64xx =3D=C2=A0 ""
>> =C2=A0 DM_FW_LIST:am62xx =3D=C2=A0 "${DM_FIRMWARE}"
>> =C2=A0 DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"
>> +DM_FW_LIST:am62dxx =3D "${DM_FIRMWARE}"
>> =C2=A0 DM_FW_LIST:am62lxx =3D ""
>> =C2=A0 DM_FW_LIST:am62pxx =3D "${DM_FIRMWARE}"
>> =C2=A0 @@ -86,6 +88,7 @@ do_deploy() {
>> =C2=A0 ALTERNATIVE:${PN}:am62xx=C2=A0 =3D "am62-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:am62pxx=C2=A0 =3D "am62p-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:am62axx =3D "am62a-main-r5f0_0-fw"
>> +ALTERNATIVE:${PN}:am62dxx =3D "am62a-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:j721e=C2=A0=C2=A0 =3D "j7-mcu-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:j7200=C2=A0=C2=A0 =3D "j7200-mcu-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:j721s2=C2=A0 =3D "j721s2-mcu-r5f0_0-fw"
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
>> index cf9566dc..654d456c 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
>> @@ -31,6 +31,7 @@ PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>> =C2=A0 =C2=A0 ETH_FW_DIR =3D "ti-eth/${PLAT_SFX}"
>> =C2=A0 @@ -50,6 +51,7 @@ ETH_FW_LIST:am64xx =3D=C2=A0 ""
>> =C2=A0 ETH_FW_LIST:am62xx =3D=C2=A0 ""
>> =C2=A0 ETH_FW_LIST:am62pxx =3D ""
>> =C2=A0 ETH_FW_LIST:am62axx =3D ""
>> +ETH_FW_LIST:am62dxx =3D ""
>> =C2=A0 =C2=A0 do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # ETH firmware
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> index 86e319c7..54aa32bd 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> @@ -23,6 +23,7 @@ PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D=20
>> "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>> =C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -59,6 +60,7 @@ IPC_FW_LIST:am64xx =3D=C2=A0 "${MCU_1_0_FW} ${MCU_1_=
1_FW}=20
>> ${MCU_2_0_FW} ${MCU_2_1_FW} $
>> =C2=A0 IPC_FW_LIST:am62xx =3D=C2=A0 " ${MCU_2_0_FW}"
>> =C2=A0 IPC_FW_LIST:am62pxx =3D " ${MCU_2_0_FW}"
>> =C2=A0 IPC_FW_LIST:am62axx =3D " ${MCU_2_0_FW} ${C7X_1_FW}"
>> +IPC_FW_LIST:am62dxx =3D " ${MCU_2_0_FW} ${C7X_1_FW}"
>> =C2=A0 IPC_FW_LIST:j721e =3D=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${MCU_1_1_FW} ${MCU_2_0_=
FW}=20
>> ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>> ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
>> =C2=A0 IPC_FW_LIST:j7200 =3D=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${MCU_1_1_FW} ${MCU_2_0_=
FW}=20
>> ${MCU_2_1_FW}"
>> =C2=A0 IPC_FW_LIST:j721s2 =3D=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${MCU_1_1_FW} ${MCU_2_0_FW}=
=20
>> ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${C7X_1_FW} ${C7X_2_FW}"
>> @@ -98,6 +100,13 @@ do_install:prepend:am62axx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> =C2=A0 }
>> =C2=A0 +# Update the am62dxx ipc binaries to be consistent with other=20
>> platforms
>> +do_install:prepend:am62dxx() {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( cd ${S}/${IPC_FW_DIR}; \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> +}
>> +
>> =C2=A0 do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # IPC Firmware
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for FW_NAME in ${IPC_FW_LIST}
>> @@ -141,6 +150,11 @@ ALTERNATIVE:${PN}:am62axx =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw-sec \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 +ALTERNATIVE:${PN}:am62dxx =3D "\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-mcu-r5f0_0-fw am62a-m=
cu-r5f0_0-fw-sec \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw-sec \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +
>> =C2=A0 ALTERNATIVE:${PN}:j721e =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-mcu-r5f0_1-fw=C2=
=A0=C2=A0=C2=A0 j7-mcu-r5f0_1-fw-sec \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-main-r5f0_0-fw=C2=
=A0=C2=A0 j7-main-r5f0_0-fw-sec \
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 57bf7a4e..f6cd3aa2 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -60,6 +60,7 @@ PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> =C2=A0 PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>> =C2=A0 =C2=A0 PACKAGECONFIG[ap-trusted-rom] =3D=20
>> "BL1=3D${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>> =C2=A0 PACKAGECONFIG[atf] =3D=20
>> "BL31=3D${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
>> @@ -77,6 +78,7 @@ PACKAGECONFIG:append:am62xx =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62axx =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62lxx =3D " ap-trusted-rom"
>> =C2=A0 PACKAGECONFIG:append:am62pxx =3D " dm"
>> +PACKAGECONFIG:append:am62dxx =3D " dm"
>> =C2=A0 =C2=A0 COMPATIBLE_MACHINE =3D "(ti-soc)"
>> =C2=A0 diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> index ae6cca74..c37cf768 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> @@ -9,6 +9,7 @@ EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVE=
L=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:am62lxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> +EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 =C2=A0 do_compile:append:k3() {
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18556):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18556
>> Mute This Topic: https://lists.yoctoproject.org/mt/113091292/4454627
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [d.schultz@phytec.de]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

