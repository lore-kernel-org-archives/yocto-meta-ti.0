Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE08BCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 21:57:25 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.36095.1758146245476165917
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 14:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NdW094G1;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HLvMIn349307;
	Wed, 17 Sep 2025 16:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758146242;
	bh=6w1nSEDepWPCHhlj52NFfn0CKcxHDux2xRwQZe3+ohI=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=NdW094G1yHvzt0WfgPQ13Mrjh7/JQvelv5Jj5bFVs94z0+/2KnFtfomamnUA0p6PJ
	 Ru3k2WhnPvTvdX0kR3e2JEPYEJgdmJIf25nzYfVmw94GsQS0w3zAcDXOHeK5YR+Zws
	 FJ2ebldXynz5tTajwUWqff2TXn22UmHXFVzBmA/g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HLvMIo1858107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 16:57:22 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 16:57:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 16:57:22 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HLvMMj3739330;
	Wed, 17 Sep 2025 16:57:22 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Sep 2025 16:57:22 -0500
Message-ID: <DCVETTGHP5DT.1BAJYIDBIVLDD@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][RFC 2/6] ti-bsp: Do not remove gpu
 MACHINE_FEATURE conditionally on BSP version
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-2-afd@ti.com> <20250909204425.GE3125@denix.org>
 <843d1ceb-0d14-4b23-96dd-8bc0e8508a8b@ti.com>
 <20250912182425.GJ3125@denix.org>
 <d068ed20-5536-4ed5-a513-5da529aa39ff@ti.com>
In-Reply-To: <d068ed20-5536-4ed5-a513-5da529aa39ff@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 21:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19024

On Wed Sep 17, 2025 at 4:54 PM CDT, Andrew Davis wrote:
> On 9/12/25 1:24 PM, Denys Dmytriyenko wrote:
>> On Fri, Sep 12, 2025 at 11:31:19AM -0500, Andrew Davis wrote:
>>> On 9/9/25 3:44 PM, Denys Dmytriyenko wrote:
>>>> On Tue, Sep 09, 2025 at 10:10:24AM -0500, Andrew Davis via lists.yocto=
project.org wrote:
>>>>> Setting or removing the gpu MACHINE_FEATURE does not actually change
>>>>> if the GPU driver is built or not. That is done based on the setting
>>>>> of the BSP_{SGX,ROGUE}_{DRIVER,UMLIBS}_{PROVIDER,VERSION} vars. These
>>>>> are default empty for BSP versions without supported GPU drivers, whi=
ch
>>>>> will correctly cause a fallback to SW rendering when the GPU driver i=
s
>>>>> not available.
>>>>
>>>> While cleaning the remaining uses of "gpu" MACHINE_FEATURE, why not re=
move it
>>>> completely from all the machine configs?
>>>>
>>>
>>> I thought about that, but it could still be useful to key off of that f=
or
>>> other reasons, or even maybe turn the "gpu" MACHINE_FEATURE into "rgx" =
and
>>> "sgx" so we can later switch on that in the mesa-pvr driver.
>>=20
>> Heh, this MACHINE_FEATURE used to be called "sgx" back in the day. When =
Rogue
>> was being added, I briefly had a separate "rgx" flag, but eventually com=
bined
>> both into "gpu" one...
>>=20
>
> Okay so then I have two options, I can switch back to "sgx" and "rgx" for
> some later use, or I can just drop the MACHINE_FEATURE completely, any
> preference?

I'm partial to just dropping it entirely. If we don't intend external layer=
s to
read it, then it shouldn't be a MACHINE_FEATURE. We're already tracking tha=
t
information in other variables anyway.

- Randolph

>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 8 --------
>>>>>   1 file changed, 8 deletions(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bs=
p/conf/machine/include/ti-bsp.inc
>>>>> index 262aa884..a5d9a51f 100644
>>>>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>>> @@ -18,10 +18,6 @@ BSP_KERNEL_VERSION:bsp-mainline =3D "%"
>>>>>   BSP_BOOTLOADER_PROVIDER:bsp-mainline =3D "u-boot-ti-mainline"
>>>>>   BSP_BOOTLOADER_VERSION:bsp-mainline =3D "%"
>>>>> -# GPU support requires out-of-tree SGX and Rogue drivers not availab=
le
>>>>> -# in mainline, usually present in TI staging or derivative like BB.o=
rg
>>>>> -MACHINE_FEATURES:remove:bsp-mainline =3D "gpu"
>>>>> -
>>>>>   # GC320 support requires out-of-tree drivers not available in mainl=
ine
>>>>>   MACHINE_FEATURES:remove:bsp-mainline =3D "gc320"
>>>>> @@ -34,10 +30,6 @@ BSP_KERNEL_VERSION:bsp-next =3D "%"
>>>>>   BSP_BOOTLOADER_PROVIDER:bsp-next =3D "u-boot-ti-next"
>>>>>   BSP_BOOTLOADER_VERSION:bsp-next =3D "%"
>>>>> -# GPU support requires out-of-tree SGX and Rogue drivers not availab=
le
>>>>> -# in next, usually present in TI staging or derivative like BB.org
>>>>> -MACHINE_FEATURES:remove:bsp-next =3D "gpu"
>>>>> -
>>>>>   # GC320 support requires out-of-tree drivers not available in next
>>>>>   MACHINE_FEATURES:remove:bsp-next =3D "gc320"
>>>>> --=20
>>>>> 2.39.2


