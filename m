Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F6AC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 22:07:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.66582.1699049234211160872
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 15:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Ac3L91Rk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3M77C7043760;
	Fri, 3 Nov 2023 17:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699049227;
	bh=LzM3paD1tM4oCpIUqnrRemaBl3MJOLLwAAj1CrCKyH8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ac3L91Rke5k/I7+TTl1swO+9AYtF1SePQvx1ZkeIAPKr1Te0s4uQlCr4Wt+cXPNSC
	 GdYGCKtsThAteg0tDFdmecepiKbg1QqBe9ALhWIv2xcP+2isiYCMhC4QFVTcfT2kWn
	 3pMDr5tbrqn7NDowPmTnVJrk7qWe5W74P1vCJ4xk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3M77if098127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 17:07:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 17:07:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 17:07:06 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3M76Tj008334;
	Fri, 3 Nov 2023 17:07:06 -0500
Message-ID: <dd167eca-f9e8-4f8a-a377-fa9c9cd02c8d@ti.com>
Date: Fri, 3 Nov 2023 17:07:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH] k3r5: Use the ?= default assignment
 to allow for overrides
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Massimiliano Minella <massimiliano.minella@gmail.com>,
        <meta-ti@lists.yoctoproject.org>,
        Massimiliano Minella
	<massimiliano.minella@se.com>
References: <20231102104828.100681-1-massimiliano.minella@gmail.com>
 <20231103010853.GK2408@denix.org>
 <2e63846f-641d-42aa-b911-34445bd8fed6@ti.com>
 <20231103200520.GN2408@denix.org>
 <179438B12F98E7CD.3650@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <179438B12F98E7CD.3650@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 3A3M77C7043760
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 22:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17239



On 11/3/2023 4:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 11/3/2023 3:05 PM, Denys Dmytriyenko wrote:
>> On Fri, Nov 03, 2023 at 11:23:47AM -0500, Ryan Eatmon wrote:
>>>
>>>
>>> On 11/2/2023 8:08 PM, Denys Dmytriyenko wrote:
>>>> On Thu, Nov 02, 2023 at 11:48:28AM +0100, Massimiliano Minella wrote=
:
>>>>> From: Ryan Eatmon <reatmon@ti.com>
>>>>>
>>>>> Move to setting the values for PREFERRED_PROVIDER using the
>>>>> ?=3D default assignment so that we can override the setting if
>>>>> we would like to.
>>>>>
>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>> Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
>>>>> ---
>>>>> =C2=A0 meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
>>>>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc=20
>>>>> b/meta-ti-bsp/conf/machine/include/k3r5.inc
>>>>> index c5c03cbf..184d3a09 100644
>>>>> --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
>>>>> +++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
>>>>> @@ -11,9 +11,9 @@ require=20
>>>>> conf/machine/include/arm/armv7a/tune-cortexa8.inc
>>>>> =C2=A0 #=20
>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e=
_evm.rst
>>>>> =C2=A0 #=20
>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x=
_sk.rst
>>>>> =C2=A0 #=20
>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rs=
t
>>>>> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
>>>>> -PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
>>>>> -PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>>>>> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-dummy"
>>>>> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
>>>>> +PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
>>>>
>>>> Being able to override u-boot for k3r5 makes sense.
>>>>
>>>> But allowing to change the kernel for k3r5 multiconfig that is now=20
>>>> marked as
>>>> baremetal is rather dubious...
>>>>
>>>> What kind of use-case requires it?
>>>
>>> I think the the use case that I created the original patch for was
>>> the upstream testing.=C2=A0 We need to be able to change the kernel a=
nd
>>> uboot versions for the testing not having the ?=3D was causing issues.
>>
>> Please note this is specifically for k3r5, a baremetal config, where
>> kernel is "neutered" by setting it to "linux-dummy". There are tons of
>> implicit dependencies deep inside the OE on the kernel and all its=20
>> pieces,
>> modules, packages, and supporting components, which linux-dummy cuts o=
ut,
>> making it a NOP.
>>
>> There's no reason to ever change it even for upstream builds and testi=
ng.
>> Not allowing it to be changed is a safeguard of sorts.
>>
>> And since it is now being requested for backporting by Massimiliano,=20
>> hence
>> my question about the use-case...
>=20
> Yep.=C2=A0 I'll take a look and see if it is needed for upstream...

You know what it may have been... I needed to add the ?=3D for the uboot=20
settings, and I just added it for the kernel as well since I was testing=20
that stuff.

I agree.  The kernel one should go back to just =3D.  I'll submit the=20
patch for that.


>=20
>>
>>> And since this patch is on master and thus will be coming to the
>>> upcoming scarthgap branch shortly, I see no reason to not take it
>>> for kirkstone.
>>>
>>> But if we want to rethink all of this, I'm not opposed.
>>>
>>>>
>>>>> =C2=A0 SPL_SUFFIX =3D "bin"
>>>>> =C2=A0 SPL_BINARY =3D=20
>>>>> "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}=
"
>>>>> --=20
>>>>> 2.42.0
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17238): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17238
> Mute This Topic: https://lists.yoctoproject.org/mt/102339031/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

