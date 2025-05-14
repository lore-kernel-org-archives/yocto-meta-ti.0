Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AFCC3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 13:55:20 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.102445.1747229125678119524
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 May 2025 06:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=dVf4VLcZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: v-singh1@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54EDPMCE2629189;
	Wed, 14 May 2025 08:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747229122;
	bh=mW2yrrKvpYakI4rzVLD4gDpmU7Z01JrHt/uh4EFXrsY=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=dVf4VLcZ82hK6d6BeUoFA5Hj+2i84EfEaCBwoxst2cqKAcCsV2HrpFrJJlFmNs3Sk
	 sPt0KRV8YV8GKY6HFm/XV2R7Vzw6OHJhP5PZQn0UFA4BdmXT3TeTRkYmMooTKj6Thp
	 yKeyIrOoriDzDf6gYZ5E6lqKE0a/hYWgNRWxx1Fg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54EDPM4o2225757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 08:25:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 08:25:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 08:25:21 -0500
Received: from [172.24.227.153] (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EDPJSX126680;
	Wed, 14 May 2025 08:25:20 -0500
Message-ID: <fcacb305-3829-4f57-949a-6f7c67fc1c05@ti.com>
Date: Wed, 14 May 2025 18:55:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH v4] meta-ti-bsp : Add build support for am62dxx-evm
From: Vishnu Singh <v-singh1@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250514123917.169544-1-p-bhagat@ti.com>
 <bcde9d47-c65c-4356-b440-d7a65bd4104e@ti.com>
In-Reply-To: <bcde9d47-c65c-4356-b440-d7a65bd4104e@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 54EDPMCE2629189
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 May 2025 13:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18561


On 14/05/25 18:53, Vishnu Singh wrote:
>
> On 14/05/25 18:09, Paresh Bhagat wrote:
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
>> https://gist.github.com/paresh-bhagat12/ec22dd51789f081bb5116c01c748aa=
3f
>>
>> Change log:
>> =C2=A0=C2=A0=C2=A0=C2=A0 v3->v4:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Update changes to f=
ollow alphabetical order.
>>
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
> i think this "am62d2" is not correct, am62dx may be the correct one.=20
> Please check
>> +"
>> +
>> +KERNEL_DEVICETREE =3D ""
>> +
>> +FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62d2-evm.dtb"
same here
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
>> index a7d15e30..da6ad2e3 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> @@ -31,6 +31,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>> =C2=A0 PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
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
>> index 86e319c7..a5efecea 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> @@ -22,6 +22,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D=20
>> "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
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
>> index 57bf7a4e..63900be0 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -58,6 +58,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62axx"
>> =C2=A0 PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> =C2=A0 @@ -75,6 +76,7 @@ PACKAGECONFIG:append:j722s =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:j742s2 =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62xx =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62axx =3D " dm"
>> +PACKAGECONFIG:append:am62dxx =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62lxx =3D " ap-trusted-rom"
>> =C2=A0 PACKAGECONFIG:append:am62pxx =3D " dm"
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

