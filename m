Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2595EC636D3
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 13:37:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.11774.1675172220754987229
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 31 Jan 2023 05:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=pxXHN8UX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30VDauPY069903;
	Tue, 31 Jan 2023 07:36:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675172216;
	bh=s4nVzUlKGSkeFF3r3UtOYLKXD9ro9/Htmp6yTBnr+jU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pxXHN8UXaJkGIYzdl05ZTxtDW2JtadjOO9p7sTlAk9QmeVIfEZMAZKHeYTJrWetgi
	 iWQ2DlGxgoht/4dtNadI8CaEho1uQqDONbjZRBZN0FlmZihGAQezAjgmtg/sdPbc/Y
	 kTs7ZAd/YIEfy724hEypQrlPTJRtWvDAeGpVnb5s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30VDaubi017518
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Jan 2023 07:36:56 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 31
 Jan 2023 07:36:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 31 Jan 2023 07:36:55 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30VDatcj101277;
	Tue, 31 Jan 2023 07:36:55 -0600
Message-ID: <73adc249-a052-2b8f-0b37-fd3e5f22e538@ti.com>
Date: Tue, 31 Jan 2023 07:36:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH] meta-ti-bsp: add BeagleBone
 AI-64 support
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20230126014311.3879336-1-denis@denix.org>
 <1bc3c5a9-1747-c486-ee4f-c4c243f0a386@ti.com>
 <20230130234611.GM22689@denix.org>
 <173F66995C7CF48C.28029@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <173F66995C7CF48C.28029@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 30VDauPY069903
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 31 Jan 2023 13:37:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15715



On 1/31/2023 7:06, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> On 1/30/23 17:46, Denys Dmytriyenko wrote:
>> On Mon, Jan 30, 2023 at 05:01:22PM -0600, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> On 1/25/2023 19:43, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>
>>>> BeagleBone AI-64 (https://beagleboard.org/ai-64) uses Texas Instrume=
nts
>>>> Jacinto TDA4VM/J721e SoC. Officially BeagleBone AI-64 supports Debia=
n
>>>> Linux and builds its BSP on top of meta-ti and TI SDK, but adds cust=
om
>>>> DTBs and DTBO overlays, plus integrates other drivers and features.
>>>>
>>>> Let's add corresponding recipes for beagleboard.org kernel and u-boo=
t
>>>> along with the BeagleBone AI-64 machine config.
>>>>
>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>>> ---
>>>> RFC -> v1:
>>>> * sort KERNEL_DEVICETREE list
>>>> * stick to ttyS2 for the console
>>>> * add patch description
>>>> * minor cleanups in the config files
>>>> * tested by building and booting core-image-minimal
>>>>
>>>> =C2=A0 .../conf/machine/beaglebone-ai64-k3r5.conf=C2=A0=C2=A0=C2=A0 =
| 22 ++++++
>>>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 79=20
>>>> +++++++++++++++++++
>>>> =C2=A0 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0 =
|=C2=A0 3 +
>>>> =C2=A0 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb=C2=A0=C2=A0 | 14 =
++++
>>>> =C2=A0 .../recipes-kernel/linux/linux-bb.org_git.bb=C2=A0 | 35 +++++=
+++
>>>> =C2=A0 5 files changed, 153 insertions(+)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64-k=
3r5.conf
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64.c=
onf
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>>>> new file mode 100644
>>>> index 00000000..21b8702b
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>>>> @@ -0,0 +1,22 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: BeagleBone AI-64 (R5F)
>>>> +#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F=20
>>>> core)
>>>> +
>>>> +require conf/machine/include/k3r5.inc
>>>> +
>>>> +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
>>>> +PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
>>>> +
>>>> +SYSFW_SOC =3D "j721e"
>>>> +SYSFW_CONFIG =3D "evm"
>>>> +SYSFW_SUFFIX =3D "gp"
>>>> +
>>>> +SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
>>>> +SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
>>>> +UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
>>>> +UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}=
"
>>>> +UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>>>> +
>>>> +UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
>>>> +
>>>> +TI_SECURE_DEV_PKG_K3 =3D "none"
>>>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf=20
>>>> b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>>> new file mode 100644
>>>> index 00000000..6e8c863c
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>>>> @@ -0,0 +1,79 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: BeagleBone AI-64 (A72)
>>>> +#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board=
=20
>>>> (A72 core)
>>>> +
>>>> +require conf/machine/include/j721e.inc
>>>> +
>>>> +SERIAL_CONSOLES =3D "115200;ttyS2"
>>>> +SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>>>> +
>>>> +UBOOT_MACHINE =3D "j721e_evm_a72_config"
>>>> +
>>>> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
>>>> +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
>>>> +PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
>>>> +
>>>> +KERNEL_DEVICETREE =3D " \
>>>> +ti/k3-j721e-beagleboneai64.dtb \
>>> This is not building correctly.=C2=A0 The above file does not appear =
to
>>> exist in the repo.=C2=A0 I get this error:
>>>
>>> make[2]: *** No rule to make target
>>> 'arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb'.=C2=A0 Stop.
>> Your setup, full log?
>> Doesn't appear you are building linux-bb.org kernel...
>> https://git.beagleboard.org/beagleboard/linux/-/blob/5.10-arm64/arch/a=
rm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>=20
>=20
>=20
> You are correct...
>=20
> cd=20
> /scratch/builds/arago-kirkstone-wip/build/build/arago-tmp-default-glibc=
/work-shared/beaglebone-ai64/kernel-source
>=20
> cat .git/config
> [core]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repositoryformatversion =3D=
 0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filemode =3D true
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bare =3D false
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logallrefupdates =3D true
> [remote "origin"]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 url =3D https://git.ti.com/=
git/ti-linux-kernel/ti-linux-kernel.git
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch =3D +refs/heads/*:ref=
s/remotes/origin/*
> [branch "master"]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote =3D origin
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 merge =3D refs/heads/master
> [branch "ti-linux-5.10.y"]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote =3D origin
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 merge =3D refs/heads/ti-lin=
ux-5.10.y
>=20
> Now... why is that?
>=20
> I have attached the log.
>=20
> It does look like the u-boot-bb recipe was chosen, but the linux-bb was=
=20
> not.
>=20
> I am running this through our normal build flow, so maybe something in=20
> the various targets we build is changing the value?
>=20
>  > Executing bitbake command: tisdk-core-bundle tisdk-tiny-image=20
> ti-world for machine beaglebone-ai64
>=20

Might the arago-prefs.inc?

meta-arago/meta-arago-distro/conf/distro/include/arago-prefs.inc

*snip*

PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging${ARAGO_KERNEL_SUF=
FIX}"

*snip*



>=20
>>>> +ti/k3-j721e-beagleboneai64-no-shared-mem.dtb \
>>>> +ti/k3-j721e-common-proc-board.dtb \
>>>> +ti/k3-j721e-common-proc-board-infotainment.dtbo \
>>>> +ti/k3-j721e-cpb-csi2-ov5640.dtbo \
>>>> +ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
>>>> +ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
>>>> +ti/k3-j721e-fpdlink-sk-fusion.dtbo \
>>>> +ti/k3-j721e-gesi-exp-board.dtbo \
>>>> +ti/k3-j721e-proc-board-tps65917.dtb \
>>>> +ti/k3-j721e-quad-port-eth-exp.dtbo \
>>>> +ti/k3-j721e-sk-csi2-ov5640.dtbo \
>>>> +ti/k3-j721e-sk.dtb \
>>>> +ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
>>>> +ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>>>> +ti/overlays/BBAI64-CSI0-imx219.dtbo \
>>>> +ti/overlays/BBAI64-CSI1-imx219.dtbo \
>>>> +ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
>>>> +ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
>>>> +ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
>>>> +ti/overlays/BB-I2C2-MPU6050.dtbo \
>>>> +ti/overlays/BBORG_LOAD-00A2.dtbo \
>>>> +ti/overlays/BBORG_RELAY-00A2.dtbo \
>>>> +ti/overlays/BBORG_SERVO-00A2.dtbo \
>>>> +ti/overlays/BONE-FAN.dtbo \
>>>> +ti/overlays/BONE-I2C1.dtbo \
>>>> +ti/overlays/BONE-I2C2.dtbo \
>>>> +ti/overlays/BONE-I2C3.dtbo \
>>>> +ti/overlays/BONE-LED_P8_03.dtbo \
>>>> +ti/overlays/BONE-LED_P9_11.dtbo \
>>>> +ti/overlays/BONE-PWM0.dtbo \
>>>> +ti/overlays/BONE-PWM1.dtbo \
>>>> +ti/overlays/BONE-PWM2.dtbo \
>>>> +ti/overlays/BONE-SPI0_0.dtbo \
>>>> +ti/overlays/BONE-SPI0_1.dtbo \
>>>> +ti/overlays/BONE-UART1.dtbo \
>>>> +ti/overlays/BONE-USB0-host.dtbo \
>>>> +ti/overlays/J721E-PRU-UIO-00A0.dtbo \
>>>> +ti/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtbo \
>>>> +ti/overlays/robotics-cape.dtbo \
>>>> +"
>>>> +
>>>> +IMAGE_BOOT_FILES +=3D "sysfw.itb"
>>>> +
>>>> +MACHINE_GUI_CLASS =3D "bigscreen"
>>>> +MACHINE_FEATURES +=3D "screen"
>>>> +
>>>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>>>> kernel-image-image"
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=20
>>>> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> index c99cd660..8fbb0fcb 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> @@ -9,6 +9,7 @@ DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 =3D=20
>>>> "virtual/bootloader"
>>>> =C2=A0 DEPENDS:remove:j721e-evm-k3r5 =3D "virtual/bootloader"
>>>> =C2=A0 DEPENDS:remove:j721e-hs-evm-k3r5 =3D "virtual/bootloader"
>>>> =C2=A0 DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 =3D "virtual/bootloade=
r"
>>>> +DEPENDS:remove:beaglebone-ai64-k3r5 =3D "virtual/bootloader"
>>>> =C2=A0 DEPENDS:append =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3'=
) else=20
>>>> ' ti-k3-secdev-native' }"
>>>> =C2=A0 CLEANBROKEN =3D "1"
>>>> @@ -31,6 +32,7 @@ SYSFW_PREFIX =3D "sci"
>>>> =C2=A0 SYSFW_PREFIX:j721e-evm-k3r5 =3D "fs"
>>>> =C2=A0 SYSFW_PREFIX:j721e-hs-evm-k3r5 =3D "fs"
>>>> =C2=A0 SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 =3D "fs"
>>>> +SYSFW_PREFIX:beaglebone-ai64-k3r5 =3D "fs"
>>>> =C2=A0 SYSFW_PREFIX:j7200-evm-k3r5 =3D "fs"
>>>> =C2=A0 SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
>>>> =C2=A0 SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
>>>> @@ -68,6 +70,7 @@ EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5-sr2 =3D=20
>>>> "SBL=3D"${STAGING_DIR_HOST}/boot/u-bo
>>>> =C2=A0 EXTRA_OEMAKE:remove:j721e-evm-k3r5 =3D=20
>>>> "SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>>>> =C2=A0 EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5 =3D=20
>>>> "SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>>>> =C2=A0 EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5-sr1-1 =3D=20
>>>> "SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>>>> +EXTRA_OEMAKE:remove:beaglebone-ai64-k3r5 =3D=20
>>>> "SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>>>> =C2=A0 do_compile() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${WORKDIR}/imggen/
>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb=20
>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
>>>> new file mode 100644
>>>> index 00000000..28a347be
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
>>>> @@ -0,0 +1,14 @@
>>>> +require u-boot-ti.inc
>>>> +
>>>> +SUMMARY =3D "BeagleBoard.org U-Boot"
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "beagle.*"
>>>> +
>>>> +LIC_FILES_CHKSUM =3D=20
>>>> "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd732446b988025"
>>>> +
>>>> +PV =3D "2021.01"
>>>> +
>>>> +UBOOT_GIT_URI =3D "git://git.beagleboard.org/beagleboard/u-boot.git=
"
>>>> +UBOOT_GIT_PROTOCOL =3D "https"
>>>> +BRANCH =3D "v2021.01-ti-08.05.00.005-SDK-8.5"
>>>> +SRCREV =3D "46ff4982b41067e5c93369bddd49b1541856d80b"
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>>>> new file mode 100644
>>>> index 00000000..2e0f2448
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>>>> @@ -0,0 +1,35 @@
>>>> +SECTION =3D "kernel"
>>>> +SUMMARY =3D "BeagleBoard.org Linux kernel"
>>>> +LICENSE =3D "GPL-2.0-only"
>>>> +LIC_FILES_CHKSUM =3D=20
>>>> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "beagle.*"
>>>> +
>>>> +inherit kernel
>>>> +
>>>> +require recipes-kernel/linux/ti-kernel.inc
>>>> +
>>>> +DEPENDS +=3D "gmp-native libmpc-native"
>>>> +
>>>> +KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_=
ARGS}"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +# 5.10.145 version
>>>> +SRCREV =3D "9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6"
>>>> +PV =3D "5.10.145+git${SRCPV}"
>>>> +BRANCH =3D "5.10"
>>>> +
>>>> +# 5.10.153 version
>>>> +SRCREV:k3 =3D "11ebcc09f32669fac8254dff56d500f86c4c2caf"
>>>> +PV:k3 =3D "5.10.153+git${SRCPV}"
>>>> +BRANCH:k3 =3D "5.10-arm64"
>>>> +
>>>> +SRC_URI =3D=20
>>>> "git://git.beagleboard.org/beagleboard/linux.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
>>>> +
>>>> +DEFCONFIG_NAME =3D "bb.org_defconfig"
>>>> +KERNEL_CONFIG_COMMAND =3D "oe_runmake -C ${S} O=3D${B} ${DEFCONFIG_=
NAME}"
>>>> +
>>>> +kernel_do_compile:append() {
>>>> +=C2=A0=C2=A0=C2=A0 oe_runmake dtbs CC=3D"${KERNEL_CC} $cc_extra " L=
D=3D"${KERNEL_LD}"=20
>>>> ${KERNEL_EXTRA_ARGS}
>>>> +}
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15714): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15714
> Mute This Topic: https://lists.yoctoproject.org/mt/96535581/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

