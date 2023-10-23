Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BA6C25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 19:01:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.14.1698087659570790171
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 12:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=HRhtkKxm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NJ0sUX014058;
	Mon, 23 Oct 2023 14:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698087654;
	bh=nhwwDGypoylAKDoXQOgbNsZzP0uMk1NlmLKITRwEG44=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HRhtkKxmFSbdnU0ED9xyLRMEy5pm72DDc+5c5odQJozYxnPbWKQQmtMmUTbAEzMHy
	 c9U6dXoVK9Q2HIAruOP7PAMIApIcVoIn+txxpbpPN4lumc1P7nmBzYniTj8BFnAek1
	 +hJYkCy75C8Ps2H1U2IElTOhkR6/Rm57RmGQI300=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NJ0slC052810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 14:00:54 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 14:00:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 14:00:53 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NJ0rvt115073;
	Mon, 23 Oct 2023 14:00:53 -0500
Message-ID: <c7db3c3a-f4fd-4a72-978f-b34c2afb9b93@ti.com>
Date: Mon, 23 Oct 2023 14:00:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/kirkstone][PATCH] conf: machine: move
 RDEPENDS and RRECOMMENDS from kernel-rdepends.inc
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231023181902.1152453-1-denis@denix.org>
 <894c5dcb-d84d-41f5-8b25-8902458b35e9@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <894c5dcb-d84d-41f5-8b25-8902458b35e9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 39NJ0sUX014058
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 19:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17177



On 10/23/2023 1:48 PM, Andrew Davis via lists.yoctoproject.org wrote:
> On 10/23/23 1:19 PM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Instead of making kernel RDEPENDS on devicetree and different FW=20
>> images with
>> lots of machine-override appends that are hard to modify downstream,=20
>> use proper
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS and=20
>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS vars
>> that are specifically designed for this purpose.
>>
>> This also makes such dependencies generic and not tied to a particular=
=20
>> kernel
>> recipe including kernel-rdepends.inc with the entire machine-specific=20
>> list.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>=20
> Acked-by: Andrew Davis <afd@ti.com>

Acked-by: Ryan Eatmon <reatmon@ti.com>

>=20
>> =C2=A0 meta-ti-bsp/conf/machine/am65xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/beagle-x15.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 -
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |=C2=A0 4 --
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 --
>> =C2=A0 meta-ti-bsp/conf/machine/beagleplay.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 --
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62axx.inc=C2=A0 |=C2=A0 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/am64xx.inc=C2=A0=C2=A0 |=C2=A0=
 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/am65xx.inc=C2=A0=C2=A0 |=C2=A0=
 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/j7200.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721e.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721s2.inc=C2=A0=C2=A0 |=C2=A0=
 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/j784s4.inc=C2=A0=C2=A0 |=C2=A0=
 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/omap-a15.inc |=C2=A0 4 ++
>> =C2=A0 meta-ti-bsp/conf/machine/include/omapl138.inc |=C2=A0 2 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-soc.inc=C2=A0=C2=A0 |=C2=A0=
 4 ++
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti33x.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti43x.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++-
>> =C2=A0 .../recipes-kernel/linux/kernel-rdepends.inc=C2=A0 | 38 -------=
------------
>> =C2=A0 .../linux/linux-ti-mainline_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 .../linux/linux-ti-staging_5.10.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 .../linux/linux-ti-staging_6.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 22 files changed, 37 insertions(+), 56 deletions(-)
>> =C2=A0 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/kernel-rdep=
ends.inc
>>
>> diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am65xx-evm.conf
>> index 8b6ef546..f6eb6f0c 100644
>> --- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
>> @@ -5,3 +5,5 @@
>> =C2=A0 require conf/machine/include/am65xx.inc
>> =C2=A0 UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x-sr2=20
>> pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf=20
>> b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> index 3b857165..be27705c 100644
>> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
>> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> @@ -19,5 +19,3 @@ MACHINE_GUI_CLASS =3D "bigscreen"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>> =C2=A0 UBOOT_MACHINE =3D "am57xx_evm_config"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-zimage"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf=20
>> b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> index 3f5a027e..e529f565 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> @@ -24,7 +24,3 @@ ti/k3-j721e-sk.dtb \
>> =C2=A0 "
>> =C2=A0 MACHINE_GUI_CLASS =3D "bigscreen"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-image"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf=20
>> b/meta-ti-bsp/conf/machine/beaglebone.conf
>> index 45944ce8..d9353e9b 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
>> @@ -21,7 +21,3 @@ MACHINE_GUI_CLASS =3D "bigscreen"
>> =C2=A0 MACHINE_FEATURES +=3D "screen"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS0"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-zimage"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3"
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf=20
>> b/meta-ti-bsp/conf/machine/beagleplay.conf
>> index 4dd550a1..978bbc5a 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>> @@ -42,7 +42,3 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
>> =C2=A0 "
>> =C2=A0 MACHINE_GUI_CLASS =3D "bigscreen"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-image"
>> -
>> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D ""
>> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> index 12889057..93a41d8d 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> @@ -16,3 +16,5 @@ IMAGE_BOOT_FILES +=3D "tiboot3-am62ax-hs-evm.bin"
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index 9112b78b..85652eef 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -20,3 +20,5 @@ IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am64x"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x-sr2=20
>> pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index 2c427b88..7c9d5fb1 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -25,3 +25,5 @@ IMAGE_BOOT_FILES +=3D "sysfw-am65x_sr2-hs-evm.itb"
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-am65x"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x"
>> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc=20
>> b/meta-ti-bsp/conf/machine/include/j7200.inc
>> index d21e26cc..f23e70cd 100644
>> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
>> @@ -4,3 +4,5 @@ SOC_FAMILY:append =3D ":j7200"
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-j721e"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-eth-fw"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc=20
>> b/meta-ti-bsp/conf/machine/include/j721e.inc
>> index ca653770..92235527 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -23,3 +23,5 @@ IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-j721e"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw=20
>> ti-eth-fw"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc=20
>> b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> index 98cc611f..cc58fb89 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> @@ -9,3 +9,5 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D=20
>> "ti-img-rogue-driver"
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw=
"
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc=20
>> b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> index de207687..d4cf876b 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -9,3 +9,5 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D=20
>> "ti-img-rogue-driver"
>> =C2=A0 TFA_BOARD =3D "j784s4"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw=
=20
>> ti-eth-fw"
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>> b/meta-ti-bsp/conf/machine/include/k3.inc
>> index a8e80fa7..2415f0ba 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -40,6 +40,8 @@ FIT_SIGN_ALG ?=3D "rsa4096"
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-image"
>> +
>> =C2=A0 TFA_PLATFORM =3D "k3"
>> =C2=A0 # Use the expected value of the ubifs filesystem's volume name =
in=20
>> the kernel
>> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc=20
>> b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> index c1eb659b..b68b32f6 100644
>> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> @@ -40,6 +40,10 @@ UBOOT_SUFFIX =3D "img"
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "vpdma-fw goodix-fw prueth-f=
w=20
>> prusw-fw pruhsr-fw pruprp-fw"
>> +
>> =C2=A0 # Use the expected value of the ubifs filesystem's volume name =
in=20
>> the kernel
>> =C2=A0 # and u-boot.
>> =C2=A0 UBI_VOLNAME =3D "rootfs"
>> diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc=20
>> b/meta-ti-bsp/conf/machine/include/omapl138.inc
>> index 72cfd659..7f8262a5 100644
>> --- a/meta-ti-bsp/conf/machine/include/omapl138.inc
>> +++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
>> @@ -11,4 +11,6 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
>> +
>> =C2=A0 MACHINE_FEATURES =3D "serial usbhost usbgadget alsa"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> index 2792d2a0..a1fd3cbf 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> @@ -1,5 +1,9 @@
>> =C2=A0 # This is a generic TI SOC family. It is a superset of all othe=
r SOCs
>> =C2=A0 # and platforms defined in meta-ti to allow BSP-level overrides.
>> =C2=A0 SOC_FAMILY =3D "ti-soc"
>> +
>> +# TI platforms all use devicetrees with overlays
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree"
>> =C2=A0 KERNEL_DTB_OVERLAY_SUPPORT ?=3D "1"
>> +
>> =C2=A0 require conf/machine/include/soc-family.inc
>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti33x.inc
>> index 567cf128..d6a70895 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>> @@ -63,6 +63,10 @@ UBI_VOLNAME =3D "rootfs"
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3 prueth-fw pruhsr-f=
w=20
>> pruprp-fw"
>> +
>> =C2=A0 # List common SoC features, may need to add touchscreen for spe=
cific=20
>> machines
>> =C2=A0 MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 alsa gpu"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> index c70a8363..05a28b77 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> @@ -57,7 +57,11 @@ UBOOT_SUFFIX =3D "img"
>> =C2=A0 # and u-boot.
>> =C2=A0 UBI_VOLNAME =3D "rootfs"
>> -EXTRA_IMAGEDEPENDS +=3D "u-boot"
>> +EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3 prueth-fw pruhsr-f=
w=20
>> pruprp-fw"
>> =C2=A0 # List common SoC features, may need to add touchscreen for spe=
cific=20
>> machines
>> =C2=A0 MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 screen al=
sa gpu"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc=20
>> b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> deleted file mode 100644
>> index 266a7ef5..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -# Pull in the devicetree files into the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base +=3D "kernel-devicetree"
>> -
>> -# Add run-time dependency for PM firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " amx3-cm3"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " amx3-cm3"
>> -
>> -# Add run-time dependency for VPE VPDMA firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " vpdma-fw"
>> -
>> -# Add run-time dependency for Goodix firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " goodix-fw"
>> -
>> -# Add run-time dependency for PRU Ethernet firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw=20
>> prusw-fw pruhsr-fw pruprp-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw=20
>> pruhsr-fw pruprp-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw=20
>> pruhsr-fw pruprp-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " prueth-fw-am=
65x"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D "=20
>> prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D "=20
>> prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>> -
>> -# Add run-time dependency for Cadence MHDP firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " cadence-mhdp-=
fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cadence-mhdp=
-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cadence-mhdp=
-fw"
>> -
>> -# Add run-time dependency for Video Decoding firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " vxd-dec-fw"
>> -
>> -# Add run-time dependency for Chips&Media Wave521 firmware to the roo=
tfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cnm-wave-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " cnm-wave-fw=
"
>> -
>> -# Add run-time dependency for TI ETH firmware to the rootfs
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " ti-eth-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7200 =3D " ti-eth-fw"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " ti-eth-fw"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb=
=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> index dfa46f48..a7b5ca74 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>> =C2=A0 inherit kernel
>> -require recipes-kernel/linux/kernel-rdepends.inc
>> =C2=A0 require recipes-kernel/linux/ti-kernel.inc
>> =C2=A0 DEPENDS +=3D "gmp-native libmpc-native"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb=
=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> index 7f3911e4..0cf0a319 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> @@ -9,7 +9,6 @@ inherit kernel
>> =C2=A0 DEFCONFIG_BUILDER =3D "${S}/ti_config_fragments/defconfig_build=
er.sh"
>> =C2=A0 require recipes-kernel/linux/setup-defconfig.inc
>> -require recipes-kernel/linux/kernel-rdepends.inc
>> =C2=A0 require recipes-kernel/linux/ti-kernel.inc
>> =C2=A0 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.i=
nc'=20
>> if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> index 66be6944..ee106a7f 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> @@ -7,7 +7,6 @@ inherit ti-secdev
>> =C2=A0 inherit kernel
>> =C2=A0 require recipes-kernel/linux/setup-defconfig.inc
>> -require recipes-kernel/linux/kernel-rdepends.inc
>> =C2=A0 require recipes-kernel/linux/ti-kernel.inc
>> =C2=A0 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.i=
nc'=20
>> if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>> =C2=A0 include ${@ 'recipes-kernel/linux/ti-extras.inc' if=20
>> d.getVar('TI_EXTRAS') else ''}
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17176): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17176
> Mute This Topic: https://lists.yoctoproject.org/mt/102141624/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

