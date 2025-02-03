Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFDBC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:06:42 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.93027.1738602395623027430
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 09:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LSmBWMN8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513H6ZwO2173423
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 11:06:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738602395;
	bh=HxY0HQbIXOP6D85f8BU+HBuUOQh3Dk/StAdoDtqERtE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=LSmBWMN8aXoKlT44otufp6qlrbkE0jhnx6vDvc7nlpiyn02xtbmz4UNQX6OUcobaH
	 PZK3yZ3e1362wnEe//4BlDJUTfZe8gu6t2jBhgLwFKyysM28o1Ep8rcF+xtsvPIBD1
	 Axl8sSJaz5kPIjHutij5y9YpU5IRuOmrdJbfdTu4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513H6Yeg125932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 11:06:34 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 11:06:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 11:06:34 -0600
Received: from [10.249.32.112] ([10.249.32.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513H6YMh111741;
	Mon, 3 Feb 2025 11:06:34 -0600
Message-ID: <d66c95bb-6220-44f0-b7f2-eab00598ede8@ti.com>
Date: Mon, 3 Feb 2025 11:06:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update filenames
 for initial bootloader tiboot3
To: <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250203132307.2862016-1-a-limaye@ti.com>
 <3e299711-bbf8-4176-a101-0baec7df9772@ti.com>
 <b19caa47-d7c2-42bf-bd7c-54953a45ceb5@ti.com>
 <1820BCABCD14D62F.1760@lists.yoctoproject.org>
 <6fa499cb-2207-477d-9483-f2129b752e65@ti.com>
 <1820BE33E39AAE18.15786@lists.yoctoproject.org>
 <f5c13567-3f50-4643-85d6-c731418f28fc@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <f5c13567-3f50-4643-85d6-c731418f28fc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 513H6ZwO2173423
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 17:06:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18249



On 2/3/2025 10:09 AM, Aniket Limaye via lists.yoctoproject.org wrote:
>=20
>=20
> On 03/02/25 21:33, Aniket Limaye via lists.yoctoproject.org wrote:
>>
>>
>> On 03/02/25 21:10, Ryan Eatmon wrote:
>>>
>>>
>>> On 2/3/2025 9:35 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>
>>>>
>>>> On 2/3/2025 9:25 AM, Aniket Limaye wrote:
>>>>>
>>>>>
>>>>> On 03/02/25 20:16, Ryan Eatmon wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/2025 7:18 AM, Aniket Limaye wrote:
>>>>>>> Update the filenames for tiboot3.bin variants built by the u-boot=
=20
>>>>>>> recipe
>>>>>>> and also the files expected by the wic image.
>>>>>>>
>>>>>>> So far am69-sk and j784s4-evm have shared the same binman include=
=20
>>>>>>> file
>>>>>>> and hence the same filenames for u-boot images. However, with the
>>>>>>> configs and the devicetree being different, the same built binary=
=20
>>>>>>> does
>>>>>>> not support both boards. Hence the filenames of images built for=20
>>>>>>> am69-sk
>>>>>>> should reflect support for the same. The corresponding
>>>>>>>
>>>>>>> This change is currently only applicable to ti-u-boot-2025.01,=20
>>>>>>> and hence
>>>>>>> it is restricted to the override bsp-ti-6_12.
>>>>>>
>>>>>> Actually... I would prefer to align all of the defaults with the=20
>>>>>> current default BSP.=C2=A0 Which right now is 6.12.
>>>>>>
>>>>>> So can you flip this patch around?=C2=A0 Make the default be the n=
ew=20
>>>>>> name and add multiple settings for the old name on the other BSPs?=
=20
>>>>>> I think it would be more confusing to try and unravel the twisty=20
>>>>>> maze of settings otherwise if we don't have a standard.
>>>>>>
>>>>>
>>>>> Yeah I can do that... I was wondering the same but thought I would=20
>>>>> keep the patch smaller by adding an override for only the BSP that=20
>>>>> requires it, instead of override for every other BSP. But yeah=20
>>>>> since overrides will not be required for upstream eventually, makes=
=20
>>>>> sense to do it the other way around from the get go. Will send a v2
>>>>>
>>>>> Another question I had was about the SYSFW_* variables... These are=
=20
>>>>> ONLY being used by SPL_BINARY variable defined in k3r5.inc for the=20
>>>>> u-boot recipe. Should I rename those variables to UBOOT_*, since it=
=20
>>>>> is quite confusing currently.
>>>>> Eg: SYSFW_SOC =3D am69 but will use tifs binary with j784s4 and=20
>>>>> produce tiboot3-am69-*.bin
>>>>>
>>>>> Infact why not define SPL_BINARY directly in <board>-k3r5.conf=20
>>>>> instead of having these additional unnecessary variables to=20
>>>>> configure the SPL_BINARY from k3r5.inc
>>>>
>>>> Generally speaking, I'm not opposed to cleaning up variable names to=
=20
>>>> be more clear, but since this would be a change that would impact=20
>>>> all platforms, I would prefer this patch leave the SYSFW stuff and=20
>>>> then submit a second patch that cleans up all of the platforms at on=
ce.
>>>>
>>>> The only issue I can see with naming them UBOOT_* is that it might=20
>>>> be confusing that these variable are used in the uboot recipe=20
>>>> itself. Maybe TI_UBOOT_* would better to show that they are TI=20
>>>> specific variables.
>>>
>>> I also meant to say...
>>>
>>> Using the multiple variables makes it really easy to build a=20
>>> consistent naming system for SPL_BINARY.=C2=A0 By setting it directly=
 in=20
>>> each machine config you run the risk of the naming drifting across=20
>>> platforms.
>>
>> Fair enough...
>=20
> Although on the other hand, if I keep it as multiple variables, all of=20
> those multiple variables need to be overridden in the case of this=20
> patch, for 4 BSP versions. Instead of overriding the SPL_BINARY variabl=
e=20
> for 4 BSPs (next, mainline, 6.6, 6.1), I will need to override 2 of=20
> those SYSFW_ variables for 4 BSPs. Just doesn't seem very clean when al=
l=20
> it does is override one filename?
>=20
> Unless you'd prefer, specifically in this case, to override the=20
> SPL_BINARY directly while also keeping the SYSFW_* variables for the=20
> default case.

I would prefer to *NOT* override SPL_BINARY for this patch.

What does SPL_BINARY feed into?  Is that name something that comes out=20
of binman from uboot? or is it just a name that yocto is using to name=20
the file in the deploy directory?  If it is solely a yocto thing, then=20
we can change the order of the variables in the file and merge SYSFW_SOC=20
and SYSFW_CONFIG into a single variable.  That would reduce the number=20
of variables you would need to be setting with this patches change.  But=20
again, that's for a second clean up patch...


>=20
>> And yes was going to keep it a separate patch for the cleanup.
>>
>> Thanks,
>> Aniket
>>
>>>
>>>>
>>>>> Maybe I'll address this in v2 as well...
>>>>>
>>>>>>
>>>>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>>>>> ---
>>>>>>> This patch needs to be merged in sync with the corresponding=20
>>>>>>> patch for
>>>>>>> ti-u-boot-2025.01.
>>>>>>>
>>>>>>> The u-boot patch has also been posted to upstream u-boot and when=
=20
>>>>>>> merged
>>>>>>> there, the next/upstream BSP packages will also need this change.
>>>>>>> https://lore.kernel.org/u-boot/20250106-b4-upstream-j742s2-v2-2-4=
2d6129ce333@ti.com/
>>>>>>> ---
>>>>>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 2 ++
>>>>>>> =C2=A0 meta-ti-bsp/conf/machine/include/am69.inc=C2=A0 | 7 ++++--=
-
>>>>>>> =C2=A0 2 files changed, 6 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf=20
>>>>>>> b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>>>> index 9d2b4cd6..376d8153 100644
>>>>>>> --- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>>>> @@ -5,7 +5,9 @@
>>>>>>> =C2=A0 require conf/machine/include/k3r5.inc
>>>>>>> =C2=A0 SYSFW_SOC =3D "j784s4"
>>>>>>> +SYSFW_SOC:bsp-ti-6_12 =3D "am69"
>>>>>>> =C2=A0 SYSFW_CONFIG =3D "evm"
>>>>>>> +SYSFW_CONFIG:bsp-ti-6_12 =3D "sk"
>>>>>>> =C2=A0 SYSFW_SUFFIX =3D "hs-fs"
>>>>>>> =C2=A0 UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
>>>>>>> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc=20
>>>>>>> b/meta-ti-bsp/conf/machine/include/am69.inc
>>>>>>> index da8a5a8b..e82d58e2 100644
>>>>>>> --- a/meta-ti-bsp/conf/machine/include/am69.inc
>>>>>>> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
>>>>>>> @@ -9,10 +9,11 @@ require conf/machine/include/mesa-pvr.inc
>>>>>>> =C2=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D=20
>>>>>>> "${BSP_ROGUE_DRIVER_PROVIDER}"
>>>>>>> =C2=A0 # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
>>>>>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
>>>>>>> +# Add tiboot3.bin for all SOC types, to the wic image.
>>>>>>> +BSP_BOOTLOADER_FILES =3D "tiboot3-j784s4-hs-fs-evm.bin=20
>>>>>>> tiboot3-j784s4-hs-evm.bin"
>>>>>>> +BSP_BOOTLOADER_FILES:bsp-ti-6_12 =3D "tiboot3-am69-hs-fs-sk.bin=20
>>>>>>> tiboot3-am69-hs-sk.bin"
>>>>>>> -# Since default tiboot3.bin on AM69 is for HS-FS, add a version=20
>>>>>>> for SR1.0 HS-SE
>>>>>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
>>>>>>> +IMAGE_BOOT_FILES +=3D "${BSP_BOOTLOADER_FILES}"
>>>>>>> =C2=A0 TFA_BOARD =3D "j784s4"
>>>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18248): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18248
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

