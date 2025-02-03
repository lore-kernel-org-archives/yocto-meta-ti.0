Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16587C02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 15:41:10 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.90551.1738597260594914220
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 07:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=u+mo+2Wf;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513FexKk2161476
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 09:40:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738597259;
	bh=tiagDPn74KFc352BbKEw/FNcRYkXG8czZFPWMLx6dtM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=u+mo+2WfScnTe73YNGyU2Y24SL6ytMlywnBYoBEvXA30ASZLQCmK2hzkLTKqwa42K
	 0U1SJf7wWXd5KmtxmTk1wk7tp9q/MlhWlmasAee6foCVmGYrG5kofnFA4EDvU1/vZB
	 93VaGfyoqfKi9kW1H4+6lSvSg7mNENYDu7ErtncQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513FexPa071212
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 09:40:59 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 09:40:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 09:40:59 -0600
Received: from [10.249.32.112] ([10.249.32.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Fewrs021894;
	Mon, 3 Feb 2025 09:40:58 -0600
Message-ID: <6fa499cb-2207-477d-9483-f2129b752e65@ti.com>
Date: Mon, 3 Feb 2025 09:40:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update filenames
 for initial bootloader tiboot3
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <m-chawdhry@ti.com>, <r-ravikumar@ti.com>,
        <s-sinha@ti.com>
References: <20250203132307.2862016-1-a-limaye@ti.com>
 <3e299711-bbf8-4176-a101-0baec7df9772@ti.com>
 <b19caa47-d7c2-42bf-bd7c-54953a45ceb5@ti.com>
 <1820BCABCD14D62F.1760@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1820BCABCD14D62F.1760@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 513FexKk2161476
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 15:41:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18246



On 2/3/2025 9:35 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/3/2025 9:25 AM, Aniket Limaye wrote:
>>
>>
>> On 03/02/25 20:16, Ryan Eatmon wrote:
>>>
>>>
>>> On 2/3/2025 7:18 AM, Aniket Limaye wrote:
>>>> Update the filenames for tiboot3.bin variants built by the u-boot=20
>>>> recipe
>>>> and also the files expected by the wic image.
>>>>
>>>> So far am69-sk and j784s4-evm have shared the same binman include fi=
le
>>>> and hence the same filenames for u-boot images. However, with the
>>>> configs and the devicetree being different, the same built binary do=
es
>>>> not support both boards. Hence the filenames of images built for=20
>>>> am69-sk
>>>> should reflect support for the same. The corresponding
>>>>
>>>> This change is currently only applicable to ti-u-boot-2025.01, and=20
>>>> hence
>>>> it is restricted to the override bsp-ti-6_12.
>>>
>>> Actually... I would prefer to align all of the defaults with the=20
>>> current default BSP.=C2=A0 Which right now is 6.12.
>>>
>>> So can you flip this patch around?=C2=A0 Make the default be the new =
name=20
>>> and add multiple settings for the old name on the other BSPs?=C2=A0 I=
=20
>>> think it would be more confusing to try and unravel the twisty maze=20
>>> of settings otherwise if we don't have a standard.
>>>
>>
>> Yeah I can do that... I was wondering the same but thought I would=20
>> keep the patch smaller by adding an override for only the BSP that=20
>> requires it, instead of override for every other BSP. But yeah since=20
>> overrides will not be required for upstream eventually, makes sense to=
=20
>> do it the other way around from the get go. Will send a v2
>>
>> Another question I had was about the SYSFW_* variables... These are=20
>> ONLY being used by SPL_BINARY variable defined in k3r5.inc for the=20
>> u-boot recipe. Should I rename those variables to UBOOT_*, since it is=
=20
>> quite confusing currently.
>> Eg: SYSFW_SOC =3D am69 but will use tifs binary with j784s4 and produc=
e=20
>> tiboot3-am69-*.bin
>>
>> Infact why not define SPL_BINARY directly in <board>-k3r5.conf instead=
=20
>> of having these additional unnecessary variables to configure the=20
>> SPL_BINARY from k3r5.inc
>=20
> Generally speaking, I'm not opposed to cleaning up variable names to be=
=20
> more clear, but since this would be a change that would impact all=20
> platforms, I would prefer this patch leave the SYSFW stuff and then=20
> submit a second patch that cleans up all of the platforms at once.
>=20
> The only issue I can see with naming them UBOOT_* is that it might be=20
> confusing that these variable are used in the uboot recipe itself. Mayb=
e=20
> TI_UBOOT_* would better to show that they are TI specific variables.

I also meant to say...

Using the multiple variables makes it really easy to build a consistent=20
naming system for SPL_BINARY.  By setting it directly in each machine=20
config you run the risk of the naming drifting across platforms.

>=20
>> Maybe I'll address this in v2 as well...
>>
>>>
>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>> ---
>>>> This patch needs to be merged in sync with the corresponding patch f=
or
>>>> ti-u-boot-2025.01.
>>>>
>>>> The u-boot patch has also been posted to upstream u-boot and when=20
>>>> merged
>>>> there, the next/upstream BSP packages will also need this change.
>>>> https://lore.kernel.org/u-boot/20250106-b4-upstream-j742s2-v2-2-42d6=
129ce333@ti.com/
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 2 ++
>>>> =C2=A0 meta-ti-bsp/conf/machine/include/am69.inc=C2=A0 | 7 ++++---
>>>> =C2=A0 2 files changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>> index 9d2b4cd6..376d8153 100644
>>>> --- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>> @@ -5,7 +5,9 @@
>>>> =C2=A0 require conf/machine/include/k3r5.inc
>>>> =C2=A0 SYSFW_SOC =3D "j784s4"
>>>> +SYSFW_SOC:bsp-ti-6_12 =3D "am69"
>>>> =C2=A0 SYSFW_CONFIG =3D "evm"
>>>> +SYSFW_CONFIG:bsp-ti-6_12 =3D "sk"
>>>> =C2=A0 SYSFW_SUFFIX =3D "hs-fs"
>>>> =C2=A0 UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc=20
>>>> b/meta-ti-bsp/conf/machine/include/am69.inc
>>>> index da8a5a8b..e82d58e2 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/am69.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
>>>> @@ -9,10 +9,11 @@ require conf/machine/include/mesa-pvr.inc
>>>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D=20
>>>> "${BSP_ROGUE_DRIVER_PROVIDER}"
>>>> =C2=A0 # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
>>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
>>>> +# Add tiboot3.bin for all SOC types, to the wic image.
>>>> +BSP_BOOTLOADER_FILES =3D "tiboot3-j784s4-hs-fs-evm.bin=20
>>>> tiboot3-j784s4-hs-evm.bin"
>>>> +BSP_BOOTLOADER_FILES:bsp-ti-6_12 =3D "tiboot3-am69-hs-fs-sk.bin=20
>>>> tiboot3-am69-hs-sk.bin"
>>>> -# Since default tiboot3.bin on AM69 is for HS-FS, add a version for=
=20
>>>> SR1.0 HS-SE
>>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
>>>> +IMAGE_BOOT_FILES +=3D "${BSP_BOOTLOADER_FILES}"
>>>> =C2=A0 TFA_BOARD =3D "j784s4"
>>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18245): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18245
> Mute This Topic: https://lists.yoctoproject.org/mt/110970137/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

