Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B4FC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:02:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2127.1751054550654320337
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Jp5ogo/5;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RK2Tv52501039;
	Fri, 27 Jun 2025 15:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751054549;
	bh=QpD2iU4DjQZZLa1wqMavPuOxsC7+62FCdqvjfabPg10=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Jp5ogo/53/LDEXpZxaclIbXIkuhoRbdEn5em7BXt16XQvViTaD94lQHLz0+XAtftn
	 oVqUth/yAOQF6L9ja3hg2hTXI8IsGoZlT+5PnUXsLYtY8KwiAB2f+pnTOI4HSONIwZ
	 ILdX69f9G4FBYQmwEjQncWejfDkZgxYrUSzM0bRs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RK2Txv3550234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:02:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:02:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:02:28 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RK2SBu3367922;
	Fri, 27 Jun 2025 15:02:28 -0500
Message-ID: <c7627ec0-2672-4c7a-981d-d14c65458e2d@ti.com>
Date: Fri, 27 Jun 2025 15:02:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/2] meta-ti-bsp: Add all
 tiboot3.bin variants by wildcard
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250627193003.575911-1-afd@ti.com>
 <20250627193003.575911-2-afd@ti.com>
 <2c5f05c9-80c8-4b08-980f-b124600e1156@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <2c5f05c9-80c8-4b08-980f-b124600e1156@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 55RK2Tv52501039
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:02:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18714

On 6/27/25 2:48 PM, Ryan Eatmon wrote:
>=20
>=20
> On 6/27/2025 2:30 PM, Andrew Davis wrote:
>> U-Boot generates all the valid versions of tiboot3.bin and picks the
>> default based on the board's binman files. No need to duplicate this
>> logic here, simply deploy what U-Boot gives us.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62axx.inc |=C2=A0 6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62dxx.inc |=C2=A0 6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc |=C2=A0 6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62xx.inc=C2=A0 |=C2=A0 9 ---=
------
>> =C2=A0 meta-ti-bsp/conf/machine/include/am64xx.inc=C2=A0 |=C2=A0 9 ---=
------
>> =C2=A0 meta-ti-bsp/conf/machine/include/am65xx.inc=C2=A0 |=C2=A0 2 --
>> =C2=A0 meta-ti-bsp/conf/machine/include/am68.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/am69.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j7200.inc=C2=A0=C2=A0 | 15 ---=
------------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721e.inc=C2=A0=C2=A0 |=C2=A0 =
6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721s2.inc=C2=A0 |=C2=A0 9 ---=
------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j722s.inc=C2=A0=C2=A0 |=C2=A0 =
6 ------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j742s2.inc=C2=A0 |=C2=A0 6 ---=
---
>> =C2=A0 meta-ti-bsp/conf/machine/include/j784s4.inc=C2=A0 |=C2=A0 9 ---=
------
>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
>> =C2=A0 15 files changed, 1 insertion(+), 101 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bs=
p/conf/machine/include/am62axx.inc
>> index e5f827a9..964be0ad 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> @@ -7,12 +7,6 @@ MACHINE_FEATURES +=3D "screen touchscreen"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> -# Default tiboot3.bin on AM62A is for HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62ax-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM62A is for HS-FS, add a version for =
HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62ax-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bs=
p/conf/machine/include/am62dxx.inc
>> index ac4e8e17..fc2ce4a3 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> @@ -5,11 +5,5 @@ SOC_FAMILY:append =3D ":am62dxx"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> -# Default tiboot3.bin on AM62D is for HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62dx-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM62D is for HS-FS, add a version for =
HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62dx-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bs=
p/conf/machine/include/am62pxx.inc
>> index 061d0e67..d59f607d 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> @@ -8,12 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on AM62Px is for HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62px-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM62Px is for HS-FS, add a version for=
 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62px-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp=
/conf/machine/include/am62xx.inc
>> index 1eb77b4e..74054a78 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -8,15 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on AM62x is for HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62x-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM62x is for HS-FS, add a version for =
GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62x-gp-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM62x is for HS-FS, add a version for =
HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62x-hs-evm.bin"
>> -
>> =C2=A0 # Bitmap image tarball for early splashscreen
>> =C2=A0 IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp=
/conf/machine/include/am64xx.inc
>> index 56b56afe..e353e687 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -20,15 +20,6 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am642-tqma64xxl-mbax4xxl.dtb \
>> =C2=A0 "
>> -# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a versio=
n for GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a versio=
n for SR2.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am64x"
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp=
/conf/machine/include/am65xx.inc
>> index 99a3b12f..feab624a 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -28,11 +28,9 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw.itb"
>> =C2=A0 # Default on AM65x is for GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am65x_sr2-gp-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-am65x_sr2-gp-evm.itb"
>> =C2=A0 # Since default on AM65x is for GP, add a version for HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-am65x_sr2-hs-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-am65x_sr2-hs-evm.itb"
>> =C2=A0 TFA_BOARD =3D "generic"
>> diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/c=
onf/machine/include/am68.inc
>> index 330a2973..b6d18fe0 100644
>> --- a/meta-ti-bsp/conf/machine/include/am68.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am68.inc
>> @@ -8,12 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on AM68 is for SR1.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM68 is for HS-FS, add a version for S=
R1.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/c=
onf/machine/include/am69.inc
>> index 1a19410a..759984ea 100644
>> --- a/meta-ti-bsp/conf/machine/include/am69.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
>> @@ -8,12 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on AM69 is for HS-FS, add a version for S=
R1.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "j784s4"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/=
conf/machine/include/j7200.inc
>> index e7ab409f..be5cb4cd 100644
>> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
>> @@ -3,21 +3,6 @@ require conf/machine/include/mc_k3r5.inc
>> =C2=A0 SOC_FAMILY:append =3D ":j7200"
>> -# Default tiboot3.bin on J7200 is for GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"
>> -
>> -# Since default tiboot3.bin on J7200 is for GP, add a version for SR1=
.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J7200 is for GP, add a version for SR1=
.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J7200 is for GP, add a version for SR2=
.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J721e is for GP, add a version for SR2=
.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-j721e"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/=
conf/machine/include/j721e.inc
>> index 3a5a9af6..5c7ef3b7 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -11,24 +11,18 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_R=
OGUE_DRIVER_PROVIDER}"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw.itb"
>> =C2=A0 # Default on J721e is for GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR1.1 HS-=
FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR1.1 HS-=
SE
>> -IMAGE_SR1_1_HS_SE_FILES =3D " "
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR2.0 HS-=
FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR2.0 HS-=
SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
>> =C2=A0 TFA_BOARD =3D "generic"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp=
/conf/machine/include/j721s2.inc
>> index e6e4f162..b6d18fe0 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> @@ -8,15 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on J721S2 is for GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-gp-evm.bin"
>> -
>> -# Since default tiboot3.bin on J721S2 is for GP, add a version for SR=
1.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J721S2 is for GP, add a version for SR=
1.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "generic"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/=
conf/machine/include/j722s.inc
>> index d49da340..8a02441b 100644
>> --- a/meta-ti-bsp/conf/machine/include/j722s.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j722s.inc
>> @@ -8,12 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on J722S is for HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j722s-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J722S is for HS-FS, add a version for =
HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j722s-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp=
/conf/machine/include/j742s2.inc
>> index 9a54e11e..d2de1d0d 100644
>> --- a/meta-ti-bsp/conf/machine/include/j742s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
>> @@ -8,12 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on J742S2 is for HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j742s2-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J742S2 is for HS-FS, add a version for=
 SR1.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j742s2-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "j784s4"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp=
/conf/machine/include/j784s4.inc
>> index 33224ee3..759984ea 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -8,15 +8,6 @@ MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 require conf/machine/include/mesa-pvr.inc
>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_P=
ROVIDER}"
>> -# Default tiboot3.bin on J784S4 is for GP
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-gp-evm.bin"
>> -
>> -# Since default tiboot3.bin on J784S4 is for GP, add a version for SR=
1.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
>> -
>> -# Since default tiboot3.bin on J784S4 is for GP, add a version for SR=
1.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
>> -
>> =C2=A0 TFA_BOARD =3D "j784s4"
>> =C2=A0 OPTEEMACHINE =3D "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/con=
f/machine/include/k3.inc
>> index 9b85f867..d0f0bd62 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -44,6 +44,7 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext=
2 alsa pci optee-ftpm"
>> =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>> =C2=A0 IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX}=
 tiboot3.bin"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-*-evm.bin"
>=20
> Does this match for all platforms?=C2=A0 Even the -sk platform?
>=20

Yes, the -evm part of tiboot3 is not directly related to the board
but instead the SYSFW board files used, which are always -evm.

I was going to go with "tiboot3*.bin" and get even tiboot3.bin
all in one go, but that pulls in the yocto generated symlinks
(like tiboot3-j722s-hs-fs-evm-beagley-ai-k3r5-2025.04) so the
above is the safest option that correctly pulls in all versions
and nothing extra.

Andrew

>=20
>> =C2=A0 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
>> =C2=A0 EFI_PROVIDER ?=3D "grub-efi"
>=20

