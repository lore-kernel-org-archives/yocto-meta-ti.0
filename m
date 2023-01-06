Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBF4C4708E
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 00:21:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1780.1672964501475992035
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 16:21:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=uCK/BmBV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3060Lb15081146;
	Thu, 5 Jan 2023 18:21:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672964497;
	bh=0S9EFYh9vfWab0hX4896ME/gbKbnG76Rx2qkKBbu1Hs=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=uCK/BmBVqWwOL6LSMC2Fv769BwwIGKGIY9dtM0a9Xj0gCmuyue07hlMK/3sM+azMo
	 eM1QjvyXrtnKfe5VTHA9Ap/Rtiuehtax1dIVS+jS9RtphkATmJ8lxbGlYZ0c7KQpPA
	 G8jE15k7RIYulMHxlIVIFmoy0xd/HA3iL66joufE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3060Lb48004356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Jan 2023 18:21:37 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 5
 Jan 2023 18:21:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 5 Jan 2023 18:21:37 -0600
Received: from [10.247.24.212] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3060Lb3e045319;
	Thu, 5 Jan 2023 18:21:37 -0600
Message-ID: <48459e31-6dcb-7cd0-763f-270bb7220756@ti.com>
Date: Thu, 5 Jan 2023 18:21:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH v3] machine: Add am62axx evm
 configuration
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <g-gupta@ti.com>, <s-adivi@ti.com>, "Nagalla, Hari" <hnagalla@ti.com>,
        <m-chawdhry@ti.com>, "Gurudasani, Kamlesh" <kamlesh@ti.com>
References: <20221208201239.25465-1-p-bhagat@ti.com>
 <1a082c8e-ed1b-335e-b36b-a8335f60dbff@ti.com>
In-Reply-To: <1a082c8e-ed1b-335e-b36b-a8335f60dbff@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 3060Lb15081146
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Jan 2023 00:21:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15534

Paresh,Kamlesh,Chirag


On 1/5/2023 6:16 PM, Bajjuri, Praneeth wrote:
> Paresh,
>=20
> On 12/8/2022 2:12 PM, Paresh Bhagat wrote:
>> Lets add the basic AM62Axx-evm configuration.
>> - Add configurations.
>> - Add firmware overrides.
>> - Add u-boot overrides.
>> - Add tifs-lpm-stub.
>> - Add cnm-wave-fw.

In the related context the firmware recipe update needs to be taken care=20
for am62q HS SE platform support patch as well
Ref: https://lists.yoctoproject.org/g/meta-ti/topic/95900374

>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> =C2=A0 conf/machine/am62axx-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++
>> =C2=A0 conf/machine/am62axx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++=
+
>> =C2=A0 conf/machine/include/am62axx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++
>> =C2=A0 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 +--
>> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 .../tifs-lpm-stub/tifs-lpm-stub_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 recipes-bsp/u-boot/u-boot-ti.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 ++
>> =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb=C2=A0=C2=A0=C2=A0 | =
27 +++++++++++++++++++
>=20
> You might need to send a followup patch to update the remote core=20
> firmwares.
>=20
> Please check reference patch:=20
> https://git.yoctoproject.org/meta-ti/commit/?h=3Ddunfell&id=3Df3733afe9=
c7de77b087da51c84bf5df0c4a14bb5
>=20
> Error we see with bootup on a 62axx board currently is as follows
> ...
> Failed to load '/lib/firmware/am62a-mcu-r5f0_0-fw-sec'
> Failed to load '/lib/firmware/am62a-c71_0-fw-sec'
> ...
>=20
>=20
>> =C2=A0 9 files changed, 72 insertions(+), 3 deletions(-)
>> =C2=A0 create mode 100644 conf/machine/am62axx-evm-k3r5.conf
>> =C2=A0 create mode 100644 conf/machine/am62axx-evm.conf
>> =C2=A0 create mode 100644 conf/machine/include/am62axx.inc
>>
>> diff --git a/conf/machine/am62axx-evm-k3r5.conf=20
>> b/conf/machine/am62axx-evm-k3r5.conf
>> new file mode 100644
>> index 00000000..ca30537f
>> --- /dev/null
>> +++ b/conf/machine/am62axx-evm-k3r5.conf
>> @@ -0,0 +1,11 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62AXX EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core=
)
>> +
>> +require conf/machine/include/k3r5.inc
>> +
>> +SYSFW_SOC =3D "am62ax"
>> +SYSFW_CONFIG =3D "evm"
>> +SYSFW_SUFFIX =3D "gp"
>> +
>> +UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
>> diff --git a/conf/machine/am62axx-evm.conf=20
>> b/conf/machine/am62axx-evm.conf
>> new file mode 100644
>> index 00000000..4eb179f3
>> --- /dev/null
>> +++ b/conf/machine/am62axx-evm.conf
>> @@ -0,0 +1,11 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62AXX EVM
>> +#@DESCRIPTION: Machine configuration for the TI AM62AXX EVM
>> +
>> +require conf/machine/include/am62axx.inc
>> +
>> +KERNEL_DEVICETREE =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk.dtb \
>> +"
>> +
>> +UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
>> diff --git a/conf/machine/include/am62axx.inc=20
>> b/conf/machine/include/am62axx.inc
>> new file mode 100644
>> index 00000000..383d1c3f
>> --- /dev/null
>> +++ b/conf/machine/include/am62axx.inc
>> @@ -0,0 +1,16 @@
>> +require conf/machine/include/k3.inc
>> +SOC_FAMILY_append =3D ":am62axx"
>> +
>> +MACHINE_FEATURES +=3D "screen touchscreen"
>> +
>> +SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>> +SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> +
>> +TFA_K3_SYSTEM_SUSPEND =3D "1"
>> +
>> +do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> +
>> +TFA_BOARD =3D "lite"
>> +OPTEEMACHINE =3D "k3-am62x"
>> +OPTEEOUTPUTMACHINE =3D "k3"
>> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=20
>> b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> index c904ba62..fac7bb06 100644
>> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> @@ -13,7 +13,7 @@ PR =3D "${INC_PR}.1"
>> =C2=A0 CLEANBROKEN =3D "1"
>> -COMPATIBLE_MACHINE =3D "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs=
-evm"
>> +COMPATIBLE_MACHINE =3D=20
>> "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx"
>> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> @@ -27,7 +27,7 @@ ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D=20
>> "${base_libdir}/firmware/cnm/${TARGE
>> =C2=A0 ALTERNATIVE_PRIORITY =3D "10"
>> =C2=A0 # Set up names for the firmwares
>> -ALTERNATIVE_${PN}_j7 =3D "\
>> +ALTERNATIVE_${PN} =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wave521c_codec_fw.=
bin"
>> =C2=A0 do_install() {
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=20
>> b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 79c39ee5..1b8530ec 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -39,6 +39,7 @@ SYSFW_PREFIX_j784s4-evm-k3r5 =3D "fs"
>> =C2=A0 SYSFW_PREFIX_j784s4-hs-evm-k3r5 =3D "fs"
>> =C2=A0 SYSFW_PREFIX_am62xx-evm-k3r5 =3D "fs"
>> =C2=A0 SYSFW_PREFIX_am62xx-lp-evm-k3r5 =3D "fs"
>> +SYSFW_PREFIX_am62axx-evm-k3r5 =3D "fs"
>> =C2=A0 SYSFW_TISCI =3D=20
>> "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb=20
>> b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>> index 876036f2..30b2e315 100644
>> --- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>> @@ -7,7 +7,7 @@ PR =3D "${INC_PR}.0"
>> =C2=A0 CLEANBROKEN =3D "1"
>> -COMPATIBLE_MACHINE =3D "am62xx-evm|am62xx-lp-evm"
>> +COMPATIBLE_MACHINE =3D "am62xx|am62axx"
>> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/recipes-bsp/u-boot/u-boot-ti.inc
>> index 97f9fa2b..90f60980 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -34,6 +34,7 @@ PACKAGECONFIG[dm] =3D=20
>> "DM=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
>> =C2=A0 PACKAGECONFIG_append_aarch64 =3D " atf optee"
>> =C2=A0 PACKAGECONFIG_append_j7 =3D " dm"
>> =C2=A0 PACKAGECONFIG_append_am62xx =3D " dm"
>> +PACKAGECONFIG_append_am62axx =3D " dm"
>> =C2=A0 COMPATIBLE_MACHINE =3D "(ti-soc)"
>> diff --git a/recipes-kernel/linux/kernel-rdepends.inc=20
>> b/recipes-kernel/linux/kernel-rdepends.inc
>> index 08f3f462..86d678ee 100644
>> --- a/recipes-kernel/linux/kernel-rdepends.inc
>> +++ b/recipes-kernel/linux/kernel-rdepends.inc
>> @@ -53,8 +53,10 @@=20
>> RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm =3D " cnm-wave-=
fw"
>> =C2=A0 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm =3D "=
=20
>> cnm-wave-fw"
>> =C2=A0 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-evm =3D " cn=
m-wave-fw"
>> =C2=A0 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-hs-evm =3D "=
=20
>> cnm-wave-fw"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx =3D " cnm-wave-fw=
"
>> =C2=A0 # Add run-time dependency for TIFS Low Power Module stub
>> =C2=A0 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm =3D "=20
>> tifs-lpm-stub"
>> =C2=A0 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-evm =3D "=
=20
>> tifs-lpm-stub"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx =3D " tifs-lpm-st=
ub"
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb=20
>> b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> index 31212aae..59145740 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -24,6 +24,7 @@ PLAT_SFX_j784s4-hs-evm =3D "j784s4"
>> =C2=A0 PLAT_SFX_am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX_am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX_am62xx =3D "am62xx"
>> +PLAT_SFX_am62axx =3D "am62axx"
>> =C2=A0 FILESEXTRAPATHS_prepend :=3D=20
>> "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>> =C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -354,6 +355,13 @@ do_install_am62xx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f=20
>> ${LEGACY_DM_FW_DIR}
>> =C2=A0 }
>> +do_install_am62axx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>> +=C2=A0=C2=A0=C2=A0 # DM+IPC Firmware
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_=
0-fw=20
>> ${LEGACY_IPC_FW_DIR}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f=20
>> ${LEGACY_DM_FW_DIR}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71=20
>> ${LEGACY_IPC_FW_DIR}
>> +}
>> =C2=A0 do_deploy() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>> @@ -364,6 +372,11 @@ do_deploy_am62xx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDI=
R}
>> =C2=A0 }
>> +do_deploy_am62axx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDI=
R}
>> +}
>> +
>> =C2=A0 # Set up names for the firmwares
>> =C2=A0 ALTERNATIVE_${PN}_am65xx =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-mcu-r5f0_0-f=
w \
>> @@ -382,6 +395,11 @@ ALTERNATIVE_${PN}_am62xx =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62-main-r5f0_0-f=
w \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +ALTERNATIVE_${PN}_am62axx =3D "\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-mcu-r5f0_0-fw \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +
>> =C2=A0 ALTERNATIVE_${PN}_j7-hs-evm =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-mcu-r5f0_0-fw \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-mcu-r5f0_1-fw \
>> @@ -514,6 +532,9 @@ TARGET_MCU_M4FSS0_0_am64xx =3D "am64-mcu-m4f0_0-fw=
"
>> =C2=A0 TARGET_MAIN_R5FSS0_0_am62xx =3D "am62-main-r5f0_0-fw"
>> =C2=A0 TARGET_MCU_M4FSS0_0_am62xx =3D "am62-mcu-m4f0_0-fw"
>> +TARGET_C7X_0_am62axx =3D "am62a-c71_0-fw"
>> +TARGET_MCU_R5F0_0_am62axx =3D "am62a-mcu-r5f0_0-fw"
>> +
>> =C2=A0 TARGET_MCU_R5FSS0_0_j7 =3D "j7-mcu-r5f0_0-fw"
>> =C2=A0 TARGET_MCU_R5FSS0_1_j7 =3D "j7-mcu-r5f0_1-fw"
>> =C2=A0 TARGET_MAIN_R5FSS0_0_j7 =3D "j7-main-r5f0_0-fw"
>> @@ -619,6 +640,9 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MC
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
>> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_C7X_0}"
>> +ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MCU_R5F0_0}"
>> +
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>> @@ -699,6 +723,9 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/ipc_ec
>> =C2=A0 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.x=
er5f"
>> =C2=A0 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_releas=
e_strip.xer5f"
>> +ALTERNATIVE_TARGET[am62a-c71_0-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe7=
1"
>> +ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/am62a-mcu-r5f0_0-fw"
>> +
>> =C2=A0 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.x=
er5f"
>> =C2=A0 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D=20
>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xe=
r5f"
>> =C2=A0 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D=20
>> "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"

