Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7331AC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 19:36:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.26189.1714073772484056019
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 12:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=XEsVfe9y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43PJaBdA127863
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 Apr 2024 14:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714073771;
	bh=CDOPIir0wjmo0oKX/Jw7RLKAAeCegRvgMuIa7dtMAGQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XEsVfe9yyVpV00aJComazuEu+cE2KVjhPS83mJQWIWCnFQuEcGCtlEVrIb7zU1miS
	 lHm3PeVrz0h6dccdCjLC/rWN9Camptjn/dGAuIaI+Va9T54UHvKGe4/SD23YKSofyy
	 nLkUFKkcrAbFa+8h7jRMHQmzYJbTofqufffAWHoE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43PJaBBp124477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 Apr 2024 14:36:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Apr 2024 14:36:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Apr 2024 14:36:11 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43PJaBCl120598;
	Thu, 25 Apr 2024 14:36:11 -0500
Message-ID: <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
Date: Thu, 25 Apr 2024 14:36:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK
 machine configuration
To: "Limaye, Aniket" <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>
References: <20240424083546.2190336-1-a-limaye@ti.com>
 <33f34e2b-ab8b-469e-b2f3-6261a5067428@ti.com>
 <8309620e-3aed-4bae-b0f2-b6b0a98b33ca@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <8309620e-3aed-4bae-b0f2-b6b0a98b33ca@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 43PJaBdA127863
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Apr 2024 19:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17601



On 4/24/2024 10:59 PM, Limaye, Aniket wrote:
> On 4/24/2024 6:53 PM, Ryan Eatmon wrote:
>>
>> We have consistently named the machines with -evm and not -sk.=C2=A0 I=
s=20
>> there a good reason to not name this am69-evm?
>>
> Well this is just following the naming convention that got accepted in=20
> u-boot:
>=20
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-boot-=
2024.04
>=20
> Yeah other parts have been like "am62x_evm_*_defconfig" and such, but=20
> for am69 we have gone with "am69_sk_*_defconfig"
>=20
> Even the dts files for these, everywhere, have -sk suffixes.
>=20
> Hence the change here as well.

Just because the configs in uboot have sk does not imply that the=20
machine name in meta-ti needs to have sk.  From my understanding,=20
generally the sk comes first and latest a full up evm.  But the Yocto=20
machine usually supports all of the variations and so they were named=20
with -evm to be the broadest possible name.

My personal preference would be to eliminate the -evm for all of the=20
machines and just go with the soc name.  But if we are going to have it=20
then I think they should be consistent.


> Regards,
> Aniket
>=20
>>
>>
>> On 4/24/2024 3:35 AM, Aniket Limaye wrote:
>>> From: Beleswar Padhi <b-padhi@ti.com>
>>>
>>> As of commits [1] and [2] in ti-u-boot-2024.04 and upstream respectiv=
ely
>>> there is a separate defconfig to build u-boot for j784s4-evm and am69=
-sk
>>>
>>> Hence, introduce new yocto machine configs for am69-sk. Also remove a=
m69
>>> devicetree builds from the j784s4-evm conf
>>>
>>> [1]:=20
>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-202=
4.04&id=3D8a46af7a39e6218e4de5c6195697af36201c778c
>>> [2]:=20
>>> https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e1540d620=
baadbcc46fdf24db2
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 ++++++++++++++++++++
>>> =C2=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0 |=C2=A0 1=
 -
>>> =C2=A0 3 files changed, 31 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf=20
>>> b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>> new file mode 100644
>>> index 00000000..9d2b4cd6
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>> @@ -0,0 +1,11 @@
>>> +#@TYPE: Machine
>>> +#@NAME: AM69 SK (R5F)
>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core)
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +
>>> +SYSFW_SOC =3D "j784s4"
>>> +SYSFW_CONFIG =3D "evm"
>>> +SYSFW_SUFFIX =3D "hs-fs"
>>> +
>>> +UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf=20
>>> b/meta-ti-bsp/conf/machine/am69-sk.conf
>>> new file mode 100644
>>> index 00000000..233a4618
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
>>> @@ -0,0 +1,20 @@
>>> +#@TYPE: Machine
>>> +#@NAME: AM69 SK
>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK
>>> +
>>> +require conf/machine/include/j784s4.inc
>>> +
>>> +TFA_K3_USART =3D "0x8"
>>> +OPTEE_K3_USART =3D "0x8"
>>> +
>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>> +"
>>> +
>>> +KERNEL_DEVICETREE =3D " \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk.dtb \
>>> +"
>>> +
>>> +UBOOT_MACHINE =3D "am69_sk_a72_defconfig"
>>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>> index e451bf47..6573e5c5 100644
>>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>> @@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j784s4 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>> =C2=A0 "
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

