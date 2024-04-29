Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4347CC04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 17:56:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.28355.1714413385587067030
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 10:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=sxVU0oNJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43THuP64129333
	for <meta-ti@lists.yoctoproject.org>; Mon, 29 Apr 2024 12:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714413385;
	bh=alRkYJ9EhWZ8Hqi3WG7ci7Qnp/60gL/JaS98wFG+pWQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sxVU0oNJeZvRNfby42vQo85Bs/XenROaFam8fTMJaXwmRwlXiqvnI+5FSwvhhIBEC
	 RqvgPBYPKWArtw11peN9mlh/B4rSiizVMQ/CIfh/uL4oT4RZj0FjiVUPGRphcgg68W
	 zy9ldLnZLaG468Fmkv9ythRID9FDsBMoYUcxxK7I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43THuPN7028894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 29 Apr 2024 12:56:25 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Apr 2024 12:56:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Apr 2024 12:56:24 -0500
Received: from [172.24.30.181] (lt5cd112gt3k.dhcp.ti.com [172.24.30.181])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43THuMEq083649;
	Mon, 29 Apr 2024 12:56:23 -0500
Message-ID: <9a083386-48a0-4604-87d5-721cd4d8dce5@ti.com>
Date: Mon, 29 Apr 2024 23:26:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK
 machine configuration
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>
References: <20240424083546.2190336-1-a-limaye@ti.com>
 <33f34e2b-ab8b-469e-b2f3-6261a5067428@ti.com>
 <8309620e-3aed-4bae-b0f2-b6b0a98b33ca@ti.com>
 <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
 <41531592-4d1d-41b8-8855-949cb1bb44b1@ti.com>
 <308e8874-351e-4c61-94c5-9de218c038f8@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <308e8874-351e-4c61-94c5-9de218c038f8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 43THuP64129333
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Apr 2024 17:56:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17610


On 4/29/2024 8:30 PM, Ryan Eatmon wrote:
>
>
> On 4/29/2024 8:51 AM, Limaye, Aniket wrote:
>>
>> On 4/26/2024 1:06 AM, Ryan Eatmon wrote:
>>>
>>>
>>> On 4/24/2024 10:59 PM, Limaye, Aniket wrote:
>>>> On 4/24/2024 6:53 PM, Ryan Eatmon wrote:
>>>>>
>>>>> We have consistently named the machines with -evm and not -sk.=C2=A0=
 Is=20
>>>>> there a good reason to not name this am69-evm?
>>>>>
>>>> Well this is just following the naming convention that got accepted=20
>>>> in u-boot:
>>>>
>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-bo=
ot-2024.04=20
>>>>
>>>>
>>>> Yeah other parts have been like "am62x_evm_*_defconfig" and such,=20
>>>> but for am69 we have gone with "am69_sk_*_defconfig"
>>>>
>>>> Even the dts files for these, everywhere, have -sk suffixes.
>>>>
>>>> Hence the change here as well.
>>>
>>> Just because the configs in uboot have sk does not imply that the=20
>>> machine name in meta-ti needs to have sk.=C2=A0 From my understanding=
,=20
>>> generally the sk comes first and latest a full up evm.=C2=A0 But the=20
>>> Yocto machine usually supports all of the variations and so they=20
>>> were named with -evm to be the broadest possible name.
>>>
>> The yocto machine did used to support all of the variations up until=20
>> now, but starting the next LTS stream, the j784s4-evm build will not=20
>> work for the am69-sk. U-boot will only be packing one dtb in the=20
>> u-boot img, which means we require a source code / build config=20
>> change between j784s4-evm and am68-sk (and all future boards with=20
>> different dtbs), to be able to boot the board.
>>
>> The above only explains the need for a new yocto machine for the=20
>> SKs... As for the naming, everywhere on ti.com we have always used=20
>> am69-*sk* as the product, including documentation. For example, [1]=20
>> vs [2].
>> [1]: https://www.ti.com/tool/J784S4XEVM
>> [2]: https://www.ti.com/tool/SK-AM69
>>
>> I don't think we should deviate from ti.com naming, u-boot board=20
>> names, and the current public documentation, just to have consistency=20
>> in meta-ti?
>>
>> For future devices, we can keep using -evm as the default since those=20
>> boards come first (not the corresponding SKs, not sure if it was a=20
>> typo in your msg). And then add the -sk boards for the SOCs as=20
>> applicable.
>>
>>> My personal preference would be to eliminate the -evm for all of the=20
>>> machines and just go with the soc name.=C2=A0 But if we are going to =
have=20
>>> it then I think they should be consistent.
>>
>> am69-sk and j784s4-evm will be including the same soc include=20
>> (j784s4.inc), but they do need different dtbs, u-boot configs,=20
>> GP/HS-FS defaults... That is to say we are configuring board specific=20
>> settings in our builds for our boards. So I don't think we should=20
>> move to just using the soc name.
>
> I'm still not happy about introducing the inconsistency, but I'll=20
> accept this patch for now and work on a better longer term solution=20
> for the machine naming that can be both high level (multi-board=20
> support) and low level (single board support).
>
> I have some ideas on that, I just need time to put together an RFC so=20
> that we can have a larger discussion.

Oh, that sounds good...
Will check it out when ready!

Thanks,
Aniket

>
>
>>>
>>>> Regards,
>>>> Aniket
>>>>
>>>>>
>>>>>
>>>>> On 4/24/2024 3:35 AM, Aniket Limaye wrote:
>>>>>> From: Beleswar Padhi <b-padhi@ti.com>
>>>>>>
>>>>>> As of commits [1] and [2] in ti-u-boot-2024.04 and upstream=20
>>>>>> respectively
>>>>>> there is a separate defconfig to build u-boot for j784s4-evm and=20
>>>>>> am69-sk
>>>>>>
>>>>>> Hence, introduce new yocto machine configs for am69-sk. Also=20
>>>>>> remove am69
>>>>>> devicetree builds from the j784s4-evm conf
>>>>>>
>>>>>> [1]:=20
>>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-=
2024.04&id=3D8a46af7a39e6218e4de5c6195697af36201c778c
>>>>>> [2]:=20
>>>>>> https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e1540d=
620baadbcc46fdf24db2
>>>>>>
>>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>>>> ---
>>>>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
>>>>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 20=20
>>>>>> ++++++++++++++++++++
>>>>>> =C2=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0 |=C2=A0=
 1 -
>>>>>> =C2=A0 3 files changed, 31 insertions(+), 1 deletion(-)
>>>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.co=
nf
>>>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf=20
>>>>>> b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>>> new file mode 100644
>>>>>> index 00000000..9d2b4cd6
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>>> @@ -0,0 +1,11 @@
>>>>>> +#@TYPE: Machine
>>>>>> +#@NAME: AM69 SK (R5F)
>>>>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core=
)
>>>>>> +
>>>>>> +require conf/machine/include/k3r5.inc
>>>>>> +
>>>>>> +SYSFW_SOC =3D "j784s4"
>>>>>> +SYSFW_CONFIG =3D "evm"
>>>>>> +SYSFW_SUFFIX =3D "hs-fs"
>>>>>> +
>>>>>> +UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
>>>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf=20
>>>>>> b/meta-ti-bsp/conf/machine/am69-sk.conf
>>>>>> new file mode 100644
>>>>>> index 00000000..233a4618
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
>>>>>> @@ -0,0 +1,20 @@
>>>>>> +#@TYPE: Machine
>>>>>> +#@NAME: AM69 SK
>>>>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK
>>>>>> +
>>>>>> +require conf/machine/include/j784s4.inc
>>>>>> +
>>>>>> +TFA_K3_USART =3D "0x8"
>>>>>> +OPTEE_K3_USART =3D "0x8"
>>>>>> +
>>>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>>>> +"
>>>>>> +
>>>>>> +KERNEL_DEVICETREE =3D " \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk.dtb \
>>>>>> +"
>>>>>> +
>>>>>> +UBOOT_MACHINE =3D "am69_sk_a72_defconfig"
>>>>>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf=20
>>>>>> b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>>> index e451bf47..6573e5c5 100644
>>>>>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>>> @@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j784s4 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback \
>>>>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>>>> =C2=A0 "
>>>>>
>>>
>

