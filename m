Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68CBC4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 21:08:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1501.1714165697673377660
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 14:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ta3QwFtL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43QL8GYA121866;
	Fri, 26 Apr 2024 16:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714165696;
	bh=KuvCTntUp2MVTUX/oTTAWCMaue4HQTZhYwsh72X4lSE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ta3QwFtLJBrhSz1IZLfKXqREteowN5qZekAn3eHbXYzliKLS32c9rPyrlo4my+0Zs
	 PjmOdKseDmoM3qvsg2FgTs6Yt9aUEAsX4Uu2YoSf6SRVJ5dhkLMV7DGqEcaIHBEKBC
	 JdsEfrbuiIqET2fTd9fTKeFizszx0Y+w/9UuyHqA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43QL8G52006510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Apr 2024 16:08:16 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Apr 2024 16:08:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Apr 2024 16:08:15 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43QL8FMG035759;
	Fri, 26 Apr 2024 16:08:15 -0500
Message-ID: <211f56ae-87b3-4c59-b056-6ae512fca992@ti.com>
Date: Fri, 26 Apr 2024 16:08:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK
 machine configuration
To: Denys Dmytriyenko <denis@denix.org>
CC: "Limaye, Aniket" <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <b-padhi@ti.com>
References: <20240424083546.2190336-1-a-limaye@ti.com>
 <33f34e2b-ab8b-469e-b2f3-6261a5067428@ti.com>
 <8309620e-3aed-4bae-b0f2-b6b0a98b33ca@ti.com>
 <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
 <20240426190100.GJ28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240426190100.GJ28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 43QL8GYA121866
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Apr 2024 21:08:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17607



On 4/26/2024 2:01 PM, Denys Dmytriyenko wrote:
> On Thu, Apr 25, 2024 at 02:36:10PM -0500, Ryan Eatmon via lists.yoctopr=
oject.org wrote:
>>
>>
>> On 4/24/2024 10:59 PM, Limaye, Aniket wrote:
>>> On 4/24/2024 6:53 PM, Ryan Eatmon wrote:
>>>>
>>>> We have consistently named the machines with -evm and not -sk.
>>>> Is there a good reason to not name this am69-evm?
>>>>
>>> Well this is just following the naming convention that got
>>> accepted in u-boot:
>>>
>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-boo=
t-2024.04
>>>
>>> Yeah other parts have been like "am62x_evm_*_defconfig" and such,
>>> but for am69 we have gone with "am69_sk_*_defconfig"
>>>
>>> Even the dts files for these, everywhere, have -sk suffixes.
>>>
>>> Hence the change here as well.
>>
>> Just because the configs in uboot have sk does not imply that the
>> machine name in meta-ti needs to have sk.  From my understanding,
>> generally the sk comes first and latest a full up evm.  But the
>> Yocto machine usually supports all of the variations and so they
>> were named with -evm to be the broadest possible name.
>>
>> My personal preference would be to eliminate the -evm for all of the
>> machines and just go with the soc name.
>=20
> Just make sure that won't conflict with the SoC family name, as current=
ly
> the part of the machine name w/o -evm is what's used for SoC name...

Good point.  I didn't say my preference was fleshed out... =3D)

>=20
>> But if we are going to have
>> it then I think they should be consistent.
>>
>>
>>> Regards,
>>> Aniket
>>>
>>>>
>>>>
>>>> On 4/24/2024 3:35 AM, Aniket Limaye wrote:
>>>>> From: Beleswar Padhi <b-padhi@ti.com>
>>>>>
>>>>> As of commits [1] and [2] in ti-u-boot-2024.04 and upstream respect=
ively
>>>>> there is a separate defconfig to build u-boot for j784s4-evm and am=
69-sk
>>>>>
>>>>> Hence, introduce new yocto machine configs for am69-sk. Also remove=
 am69
>>>>> devicetree builds from the j784s4-evm conf
>>>>>
>>>>> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-b=
oot-2024.04&id=3D8a46af7a39e6218e4de5c6195697af36201c778c
>>>>> [2]: https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e1=
540d620baadbcc46fdf24db2
>>>>>
>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>>> ---
>>>>>  =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
>>>>>  =C2=A0 meta-ti-bsp/conf/machine/am69-sk.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 20 ++++++++++++++++++++
>>>>>  =C2=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0 |=C2=A0=
 1 -
>>>>>  =C2=A0 3 files changed, 31 insertions(+), 1 deletion(-)
>>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.co=
nf
>>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>> b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>> new file mode 100644
>>>>> index 00000000..9d2b4cd6
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>>> @@ -0,0 +1,11 @@
>>>>> +#@TYPE: Machine
>>>>> +#@NAME: AM69 SK (R5F)
>>>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core)
>>>>> +
>>>>> +require conf/machine/include/k3r5.inc
>>>>> +
>>>>> +SYSFW_SOC =3D "j784s4"
>>>>> +SYSFW_CONFIG =3D "evm"
>>>>> +SYSFW_SUFFIX =3D "hs-fs"
>>>>> +
>>>>> +UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
>>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf
>>>>> b/meta-ti-bsp/conf/machine/am69-sk.conf
>>>>> new file mode 100644
>>>>> index 00000000..233a4618
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
>>>>> @@ -0,0 +1,20 @@
>>>>> +#@TYPE: Machine
>>>>> +#@NAME: AM69 SK
>>>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK
>>>>> +
>>>>> +require conf/machine/include/j784s4.inc
>>>>> +
>>>>> +TFA_K3_USART =3D "0x8"
>>>>> +OPTEE_K3_USART =3D "0x8"
>>>>> +
>>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>>> +"
>>>>> +
>>>>> +KERNEL_DEVICETREE =3D " \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk.dtb \
>>>>> +"
>>>>> +
>>>>> +UBOOT_MACHINE =3D "am69_sk_a72_defconfig"
>>>>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>> b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>> index e451bf47..6573e5c5 100644
>>>>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>>> @@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j784s4 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback \
>>>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>>>  =C2=A0 "
>>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

