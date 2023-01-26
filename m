Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0740EC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:38:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.87336.1674769107861817262
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 13:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=gRjTvhFm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QLcRW2107281
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 15:38:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674769107;
	bh=9yN0+Rs0aeH/rFcWSwYQExr94IW6JVga4/ykkdmIji0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gRjTvhFmp5IgRDSGYeh4Zl0Ore/EMO/TUS34L2/PSVWx/GMxxvB+2y/j1b247EeEm
	 Kz8bKz5ytwIxpDjMJJz9sevqQ7emiRpYsVFnfmHhHA8EmDfE8fjHnl8eepmWGPWRD5
	 GDHw3Dmt8tToxXOewVkgQ0FDEgJgZjqMUxlgbdKg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QLcRT1099137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 15:38:27 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 15:38:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 15:38:27 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QLcQI0017402;
	Thu, 26 Jan 2023 15:38:26 -0600
Message-ID: <fd035bea-2b52-cd4a-bdeb-1126e56e636c@ti.com>
Date: Thu, 26 Jan 2023 15:38:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [kirkstone PATCH 3/4] meta-ti-bsp: machine: Remove all gpu
 features
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Randolph Sapp <rs@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
 <20230126030834.3889448-4-rs@ti.com>
 <475e77fb-0d0e-24de-5d9f-567078615ad5@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <475e77fb-0d0e-24de-5d9f-567078615ad5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 30QLcRW2107281
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 21:38:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15686



On 1/26/2023 12:02, Andrew Davis wrote:
> On 1/25/23 9:08 PM, Randolph Sapp wrote:
>> Remove all gpu machine features and instead rely on the new dependency
>> chain for resolving gpu dependencies. Set preferred providers for
>> virtual/gpudriver where needed.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=C2=A0=C2=A0 | 2 --
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62xx.inc=C2=A0=C2=A0 | 6 +--=
---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am65xx.inc=C2=A0=C2=A0 | 6 +--=
---
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721e.inc=C2=A0=C2=A0=C2=A0 | =
6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721s2.inc=C2=A0=C2=A0 | 6 ---=
---
>> =C2=A0 meta-ti-bsp/conf/machine/include/j784s4.inc=C2=A0=C2=A0 | 6 ---=
---
>> =C2=A0 meta-ti-bsp/conf/machine/include/omap-a15.inc | 6 +-----
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti33x.inc=C2=A0=C2=A0=C2=A0 | =
6 +-----
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti43x.inc=C2=A0=C2=A0=C2=A0 | =
6 +-----
>> =C2=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 ++
>> =C2=A0 10 files changed, 7 insertions(+), 45 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index ef8e8692..ec9ce596 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -4,8 +4,6 @@
>> =C2=A0 require conf/machine/include/am62xx.inc
>> -MACHINE_FEATURES +=3D "gpu"
>> -
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-lp-sk.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-skeleton.dtb \
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> index 411e5265..35f3f071 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -1,15 +1,11 @@
>> =C2=A0 require conf/machine/include/k3.inc
>> =C2=A0 SOC_FAMILY:append =3D ":am62xx"
>> -MACHINE_FEATURES +=3D "screen touchscreen gpu"
>> +MACHINE_FEATURES +=3D "screen touchscreen"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>> =C2=A0 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> =C2=A0 TFA_BOARD =3D "lite"
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index 424864d3..385bb164 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -1,15 +1,11 @@
>> =C2=A0 require conf/machine/include/k3.inc
>> =C2=A0 SOC_FAMILY:append =3D ":am65xx"
>> -MACHINE_FEATURES +=3D "screen touchscreen gpu"
>> +MACHINE_FEATURES +=3D "screen touchscreen"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
>> =C2=A0 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc=20
>> b/meta-ti-bsp/conf/machine/include/j721e.inc
>> index eba10d8d..67f5fe0f 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -1,12 +1,6 @@
>> =C2=A0 require conf/machine/include/k3.inc
>> =C2=A0 SOC_FAMILY:append =3D ":j721e"
>> -MACHINE_FEATURES +=3D "gpu"
>> -
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> =C2=A0 # On J721e the file tiboot3.bin comes from the bootloader not t=
i-sci-fw
>> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc=20
>> b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> index fc6493b8..f33a3aba 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> @@ -1,12 +1,6 @@
>> =C2=A0 require conf/machine/include/k3.inc
>> =C2=A0 SOC_FAMILY:append =3D ":j721s2"
>> -MACHINE_FEATURES +=3D "gpu"
>> -
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> =C2=A0 TFA_BOARD =3D "generic"
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc=20
>> b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> index d268b810..df0faede 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -1,12 +1,6 @@
>> =C2=A0 require conf/machine/include/k3.inc
>> =C2=A0 SOC_FAMILY:append =3D ":j784s4"
>> -MACHINE_FEATURES +=3D "gpu"
>> -
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> =C2=A0 TFA_BOARD =3D "j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc=20
>> b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> index 0843fb28..efa33a10 100644
>> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> @@ -10,10 +10,6 @@ MACHINE_KERNEL_PR =3D "r7"
>> =C2=A0 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
>> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
>> =C2=A0 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
>> =C2=A0 KERNEL_IMAGETYPE =3D "zImage"
>> @@ -45,7 +41,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> =C2=A0 UBI_VOLNAME =3D "rootfs"
>> =C2=A0 # List common SoC features, may need to add touchscreen for spe=
cific=20
>> machines
>> -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen=
=20
>> alsa ethernet gpu mmip dsp gc320"
>> +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen=
=20
>> alsa ethernet mmip dsp gc320"
>> =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>> =C2=A0 WKS_FILE ?=3D "sdimage-2part.wks"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti33x.inc
>> index cfacc30d..e2f75359 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>> @@ -11,10 +11,6 @@ MACHINE_KERNEL_PR =3D "r22"
>> =C2=A0 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
>> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
>> =C2=A0 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
>> =C2=A0 KERNEL_IMAGETYPE =3D "zImage"
>> @@ -55,7 +51,7 @@ UBI_VOLNAME =3D "rootfs"
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>> =C2=A0 # List common SoC features, may need to add touchscreen for spe=
cific=20
>> machines
>> -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 alsa=20
>> ethernet gpu"
>> +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 alsa=20
>> ethernet"
>> =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>> =C2=A0 WKS_FILE ?=3D "sdimage-2part.wks"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> index 74a964db..e9999910 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
>> @@ -11,10 +11,6 @@ MACHINE_KERNEL_PR =3D "r3"
>> =C2=A0 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
>> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
>> =C2=A0 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
>> -PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
>> -PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
>=20
> Thought we were going to call our version of mesa "ti-mesa" or similar,
> then we could PREFERRED_PROVIDER_virtual/x ?=3D "ti-mesa" here in these
> machine specific includes. Otherwise everyone who includes our BSP gets
> our hacky version of Mesa no matter what machine they are building for
> since we call it the same name..
>=20
> As before, not a blocker, lets iterate later
>=20
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
>> =C2=A0 KERNEL_IMAGETYPE =3D "zImage"
>> @@ -54,7 +50,7 @@ UBI_VOLNAME =3D "rootfs"
>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "u-boot"
>> =C2=A0 # List common SoC features, may need to add touchscreen for spe=
cific=20
>> machines
>> -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen=
=20
>> alsa ethernet gpu"
>> +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen=
=20
>> alsa ethernet"
>> =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>> =C2=A0 WKS_FILE ?=3D "sdimage-2part.wks"
>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf=20
>> b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> index 73f3eb8c..796ca116 100644
>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> @@ -9,6 +9,8 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> =C2=A0 TFA_K3_USART =3D "0x8"
>> =C2=A0 OPTEE_K3_USART =3D "0x8"
>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>> +
>=20
> Don't think this is needed as we already do this in j784s4.inc.

Part of the cleanup that you rebased on top of is cleaning this up.=20
Please move these changes to the include file.



> Otherwise,
>=20
> Acked-by: Andrew Davis <afd@ti.com>
>=20
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j784s4-evm.dtb \
>> =C2=A0 "

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

