Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8BBC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:46:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.121314.1738687563889186848
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 08:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=yIxMGzGG;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514Gk2ox3187552
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 10:46:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738687562;
	bh=5BxBwU0OLS2Ny+2VmpxjAGpv09Ktmb03R0udIMvsP2U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yIxMGzGGWFO5Fqm99lHoVaZRmK+byM/Ay9adr6f+ZoI6xV32KZsVstTZ4qHYnVkjv
	 GOTHRonUZhyvYlY0RIaVR23Uv/0kGriDBiyAktQPZiFCuGoSnhJFiSgfg4ZKpu9FIx
	 11G+SZ0K0j8ycS4AVygRf/JT4FK5CvoOvfxUOoWM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514Gk2wf095790;
	Tue, 4 Feb 2025 10:46:02 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 10:46:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 10:46:02 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514Gk2PA118329;
	Tue, 4 Feb 2025 10:46:02 -0600
Message-ID: <315a9c38-b3f0-43ee-a764-09d0b5ae6dbc@ti.com>
Date: Tue, 4 Feb 2025 10:46:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/3] meta-ti-bsp: Add Support
 for AM62L
To: Andrew Davis <afd@ti.com>, <c-shilwant@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>
References: <20250204134925.968150-1-c-shilwant@ti.com>
 <20250204134925.968150-3-c-shilwant@ti.com>
 <eb673423-a7e7-4d32-bf61-e1efad5e3f5a@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <eb673423-a7e7-4d32-bf61-e1efad5e3f5a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 514Gk2ox3187552
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 16:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18264



On 2/4/2025 10:42 AM, Andrew Davis wrote:
> On 2/4/25 7:49 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
>> - Add machine configuration for am62lxx-evm
>> - Add TFA, OPTEE, firmware & u-boot overrides
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62lxx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
 | 16 ++++
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62lxx.inc=C2=A0 | 14 ++++
>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb=C2=A0 |=C2=A0 2 +
>> =C2=A0 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++
>> =C2=A0 .../trusted-firmware-a-ti.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 | 21 ++++++
>> =C2=A0 .../Add-initial-support-for-AM62Lx-SoC.patch=C2=A0 | 75 +++++++=
++++++++++++
>> =C2=A0 .../optee/optee-os-ti-overrides.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 .../optee/optee-os_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++
>> =C2=A0 9 files changed, 144 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62L=
x-SoC.patch
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> new file mode 100644
>> index 00000000..93ad0089
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> @@ -0,0 +1,16 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62L EVM
>> +#@DESCRIPTION: Machine configuration for the TI AM62L EVM
>> +
>> +require conf/machine/include/am62lxx.inc
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62l \
>> +"
>> +
>> +KERNEL_DEVICETREE =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62l.dtb \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62l3-evm.dtb \
>> +"
>> +
>> +UBOOT_MACHINE =3D "am62lx_evm_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62lxx.inc
>> new file mode 100644
>> index 00000000..94eadd4b
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
>> @@ -0,0 +1,14 @@
>> +require conf/machine/include/k3.inc
>> +SOC_FAMILY:append =3D ":am62lxx"
>> +
>> +MACHINE_FEATURES +=3D "screen"
>> +
>> +# Default tiboot3.bin on AM62L is for HS-FS
>> +IMAGE_BOOT_FILES +=3D "tiboot3-am62lx-hs-fs-evm.bin"
>> +
>> +TFA_BOARD =3D "am62l"
>> +TFA_K3_SYSTEM_SUSPEND =3D "1"
>> +
>> +OPTEEMACHINE =3D "k3-am62lx"
>> +
>> +SERIAL_CONSOLES =3D "115200;ttyS2"
>=20
> Do the default SERIAL_CONSOLES in k3.inc not work?
>=20
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> index 0b6792b6..638138f4 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> @@ -31,6 +31,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> +PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> =C2=A0 DM_FW_DIR =3D "ti-dm/${PLAT_SFX}"
>> @@ -50,6 +51,7 @@ DM_FW_LIST:am65xx =3D=C2=A0 ""
>> =C2=A0 DM_FW_LIST:am64xx =3D=C2=A0 ""
>> =C2=A0 DM_FW_LIST:am62xx =3D=C2=A0 "${DM_FIRMWARE}"
>> =C2=A0 DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"
>> +DM_FW_LIST:am62lxx =3D ""
>> =C2=A0 DM_FW_LIST:am62pxx =3D "${DM_FIRMWARE}"
>> =C2=A0 do_install() {
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 12292c88..0d724862 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -26,4 +26,10 @@ do_deploy:k3r5() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sysfw/ti-fs-stub=
-firmware-*=20
>> ${DEPLOYDIR}/ti-sysfw
>> =C2=A0 }
>> +do_deploy:am62lxx(){
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/ti=
-sysfw
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sys=
fw/ti-sci-firmware-*=20
>> ${DEPLOYDIR}/ti-sysfw
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sys=
fw/ti-fs-firmware-*=20
>> ${DEPLOYDIR}/ti-sysfw
>> +}
>> +
>> =C2=A0 addtask deploy before do_build after do_compile
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc=
=20
>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> index e4a9c49b..9c7cae07 100644
>> ---=20
>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> @@ -8,5 +8,8 @@ TFA_BUILD_TARGET:k3 =3D "all"
>> =C2=A0 TFA_INSTALL_TARGET:k3 =3D "bl31"
>> =C2=A0 TFA_SPD:k3 =3D "opteed"
>> +# For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
>> +TFA_INSTALL_TARGET:am62lxx =3D "bl31 bl1"
>> +
>> =C2=A0 EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_USART=3D' +=20
>> d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>> =C2=A0 EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_PM_SYSTEM_SUSPEND=3D' +=20
>> d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND')=
=20
>> else ''}"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 0e7e2c6e..80b79122 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -53,8 +53,10 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> +PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> +PACKAGECONFIG[ap-trusted-rom] =3D=20
>> "BL1=3D${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>> =C2=A0 PACKAGECONFIG[atf] =3D=20
>> "BL31=3D${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
>> =C2=A0 PACKAGECONFIG[optee] =3D=20
>> "TEE=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,op=
tee-os"
>> =C2=A0 PACKAGECONFIG[dm] =3D=20
>> "DM=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_=
SFX}/${DM_FIRMWARE},,ti-dm-fw"
>> @@ -68,6 +70,7 @@ PACKAGECONFIG:append:j722s =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:j742s2 =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62xx =3D " dm"
>> =C2=A0 PACKAGECONFIG:append:am62axx =3D " dm"
>> +PACKAGECONFIG:append:am62lxx =3D " ap-trusted-rom"
>> =C2=A0 PACKAGECONFIG:append:am62pxx =3D " dm"
>> =C2=A0 COMPATIBLE_MACHINE =3D "(ti-soc)"
>> @@ -226,6 +229,16 @@ uboot_deploy_config:append:k3r5 () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>> =C2=A0 }
>> +uboot_deploy_config:append:am62lxx () {
>> +=C2=A0=C2=A0=C2=A0 for f in ${B}/${config}/tiboot3-*.bin; do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if [ -f "$f" ]; then
>=20
> Seems to be some mixed tabs and spaces. That is already an issue in thi=
s
> file I see, but no reason to keep doing it. I would prefer tabs everywh=
ere
> but not sure if there is a standard is in Yocto.
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_=
base=3D$(basename $f)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
tall -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln=
 -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 done
>> +}
>> +
>> =C2=A0 uboot_deploy:append:k3r5 () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for f in ${B}/tiboot3-*.bin; do
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f "$f" ];=
 then
>> @@ -240,6 +253,14 @@ uboot_deploy:append:k3r5 () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>> =C2=A0 }
>> +uboot_deploy:append:am62lxx () {
>> +=C2=A0=C2=A0=C2=A0 for f in ${B}/tiboot3*.bin; do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if [ -f "$f" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
tall -m 644 $f ${DEPLOYDIR}/
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 done
>> +}
>> +
>> =C2=A0 uboot_deploy_config:append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${DEPLOYDIR}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "x${SPL_UART_BINARY}" !=3D "x" ]; =
then
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM6=
2Lx-SoC.patch b/meta-ti-bsp/recipes-security/optee/files/Add-initial-supp=
ort-for-AM62Lx-SoC.patch
>> new file mode 100644
>> index 00000000..c0a42016
>> --- /dev/null
>> +++=20
>> b/meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM6=
2Lx-SoC.patch
>> @@ -0,0 +1,75 @@
>> +From 781cbb54ec52209af791aa5573b18b25cc0f4ca2 Mon Sep 17 00:00:00 200=
1
>> +From: Vignesh Raghavendra <vigneshr@ti.com>
>> +Date: Tue, 1 Oct 2024 10:30:11 +0530
>> +Subject: [PATCH] plat-k3: Add initial support for AM62Lx SoC
>> +
>> +AM62Lx newest among on the K3 class of SoCs designed to be low footpr=
int
>> +system where DDR can be as small as 128M. Hence, move the DDR locatio=
n
>> +to the beginning of DDR right after TF-A.
>> +
>> +Disable TI SCI, secure boot info and HW unique ID support for now, th=
ey
>> +will be incrementally at later point in time as the underlying
>> +communication layer is different than AM62x.
>> +
>> +This patch is posted upstream [1] & will be dropped once it's merged
>> +
>> +[1]: https://github.com/OP-TEE/optee_os/pull/7258
>=20
> Looks like this just got taken upstream, might be easier now to
> update our OP-TEE to the latest master. I know it is off release,
> but I don't think there will be any harm in staying up to date.
>=20
> Andrew

Agreed.


>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> +Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
>> +---
>> + .github/workflows/ci.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> + core/arch/arm/plat-k3/conf.mk | 5 +++++
>> + core/arch/arm/plat-k3/main.c=C2=A0 | 2 ++
>> + 3 files changed, 9 insertions(+)
>> +
>> +diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
>> +index 7df169729bf..b83d3b42f06 100644
>> +--- a/.github/workflows/ci.yml
>> ++++ b/.github/workflows/ci.yml
>> +@@ -211,6 +211,8 @@ jobs:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PL=
ATFORM=3Dk3-am64x CFG_ARM64_core=3Dy
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PL=
ATFORM=3Dk3-am62x
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PL=
ATFORM=3Dk3-am62x CFG_ARM64_core=3Dy
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PLATFOR=
M=3Dk3-am62lx
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PLATFOR=
M=3Dk3-am62lx CFG_ARM64_core=3Dy
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PL=
ATFORM=3Dti-dra7xx out/core/tee{,-pager,-pageable}.bin
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PL=
ATFORM=3Dti-am57xx
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _make PL=
ATFORM=3Dti-am43xx
>> +diff --git a/core/arch/arm/plat-k3/conf.mk=20
>> b/core/arch/arm/plat-k3/conf.mk
>> +index 2fd235e22fb..217e28359e3 100644
>> +--- a/core/arch/arm/plat-k3/conf.mk
>> ++++ b/core/arch/arm/plat-k3/conf.mk
>> +@@ -2,8 +2,13 @@ CFG_WITH_STATS ?=3D y
>> + CFG_CRYPTO_WITH_CE ?=3D y
>> + CFG_CONSOLE_UART ?=3D 0
>> +
>> ++ifeq ($(PLATFORM_FLAVOR),am62lx)
>> ++CFG_TZDRAM_START ?=3D 0x80200000
>> ++CFG_TZDRAM_SIZE ?=3D 0x00400000 # 20MB
>> ++else
>> + CFG_TZDRAM_START ?=3D 0x9e800000
>> + CFG_TZDRAM_SIZE ?=3D 0x01400000 # 20MB
>> ++endif
>> + CFG_SHMEM_START ?=3D ($(CFG_TZDRAM_START) + $(CFG_TZDRAM_SIZE))
>> + CFG_SHMEM_SIZE ?=3D 0x00400000 # 4MB
>> +
>> +diff --git a/core/arch/arm/plat-k3/main.c b/core/arch/arm/plat-k3/mai=
n.c
>> +index ecfe4837d7a..d4561ae8492 100644
>> +--- a/core/arch/arm/plat-k3/main.c
>> ++++ b/core/arch/arm/plat-k3/main.c
>> +@@ -49,6 +49,7 @@ void plat_console_init(void)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 register_serial_console(&console_data.chip);
>> + }
>> +
>> ++#ifndef PLATFORM_FLAVOR_am62lx
>> + static TEE_Result init_ti_sci(void)
>> + {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEE_Result ret =3D TEE_SUCCESS;
>> +@@ -105,3 +106,4 @@ TEE_Result tee_otp_get_hw_unique_key(struct=20
>> tee_hw_unique_key *hwkey)
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return TEE_SUCCESS;
>> + }
>> ++#endif
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> index f131f1ff..5756f3ff 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> @@ -6,6 +6,7 @@ EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
>> =C2=A0 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+=20
>> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>> =C2=A0 EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> +EXTRA_OEMAKE:append:am62lxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> index 0cee127f..442c42ef 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> @@ -7,3 +7,9 @@ OPTEE_TI_OVERRIDES =3D ""
>> =C2=A0 OPTEE_TI_OVERRIDES:ti-soc =3D "${BPN}-ti-overrides.inc"
>> =C2=A0 require ${OPTEE_TI_OVERRIDES}
>> +
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>> +
>> +SRC_URI:append:am62lxx =3D " \
>> +=C2=A0=C2=A0=C2=A0 file://Add-initial-support-for-AM62Lx-SoC.patch \
>> +"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18257):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18257
>> Mute This Topic: https://lists.yoctoproject.org/mt/110991530/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

