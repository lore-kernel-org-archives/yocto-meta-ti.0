Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138A1C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 16:26:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.14565.1737649582276711031
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 08:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ELM38rzI;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NGQJfB1204867
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 10:26:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737649579;
	bh=abEHtJ5JGA74ggy858SSG9rZM12iQfyhKxHKh8N15Wg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ELM38rzIFP2Fd3rAjtoWM1RweOinyGYKkxTd2/bappTbJfH6eGuaP17lA0VHr337s
	 Iw7kegmdKxGyooWy9ib5AkPRvzeNVvgugMiO072FrnfoGx7+sfv7mbR6BQgbj1Lmmu
	 gvDj58p6oRgbvXB030mpWvaOf4ittRIH5d5ps+ao=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NGQJOD088166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 10:26:19 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 10:26:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 10:26:19 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NGQJwo043452;
	Thu, 23 Jan 2025 10:26:19 -0600
Message-ID: <100e668a-a211-4d27-a0e1-6d58b8935473@ti.com>
Date: Thu, 23 Jan 2025 10:26:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH] linux-ti-staging: Add
 config-fragments for v6.12 Kernel
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        <denys@konsulko.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250121175625.4114041-1-b-padhi@ti.com>
 <7ea61ec8-e499-48d7-9fb5-f5159c6bc82d@ti.com>
 <f829641b-ae91-4b31-9077-9547f05a670b@ti.com>
 <4f841008-3741-4e52-8373-34ea10f78b53@ti.com>
 <20250122232711.GV21836@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250122232711.GV21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 50NGQJfB1204867
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2025 16:26:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18232

On 1/22/25 5:27 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 22, 2025 at 11:39:14AM -0600, Andrew Davis via lists.yoctop=
roject.org wrote:
>> On 1/22/25 11:10 AM, Ryan Eatmon wrote:
>>>
>>>
>>> On 1/22/2025 10:50 AM, Andrew Davis wrote:
>>>> On 1/21/25 11:56 AM, Beleswar Padhi wrote:
>>>>> ti-linux-kernel tree has several prune config fragments for ARM/ARM=
64/RT
>>>>> configurations. Enable the prune config fragments here.
>>>>>
>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>>> ---
>>>>>  =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/defconfig=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>>  =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>>  =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defcon=
fig=C2=A0 | 2 +-
>>>>>  =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defcon=
fig=C2=A0 | 2 +-
>>>>>  =C2=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>>  =C2=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defcon=
fig=C2=A0 | 2 +-
>>>>>  =C2=A0 .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
 +-
>>>>>  =C2=A0 .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
 +-
>>>>>  =C2=A0 8 files changed, 8 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12=
/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defco=
nfig
>>>>> index 9d579e41..24b53cf7 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defcon=
fig
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defcon=
fig
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12=
/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3=
/defconfig
>>>>> index fd07b34e..ef1d3efd 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/def=
config
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/def=
config
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Ddefconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12=
/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12=
/ti33x/defconfig
>>>>> index 9d579e41..e6a967e1 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/=
defconfig
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/=
defconfig
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/c=
onfigs/no_smp.config
>>>>
>>>> We are running into some issues with the no_smp.config, seems some k=
ernel
>>>> sysfs items relating to CPU counts are misbehaving (Chirag has more =
details
>>>> if anyone is interested). Disabling SMP is not well tested in genera=
l anymore
>>>> as it is often enabled by default even for single-core systems. The =
very small
>>>> performance change is not worth the lack of testing and instability =
caused
>>>> by going with non-standard configurations IMHO.
>>>>
>>>> Everything else here looks good, but could we drop no_smp.config for=
 now
>>>> and take up a debate on adding it in at a later time?
>>>>
>>>> This also has the side benefit of reducing our kernel builds from 6 =
variations
>>>> to just 4 (arm32/64 x rt/non-rt).
>>>
>>> We only have 4 now... the no_smp was just added to ti33 and ti43 for =
backwards compat to fix some issues.=C2=A0=C2=A0 But we never did additio=
nal kernel builds because of it...
>>>
>>> What were the 6 variations you were referring to?
>>>
>>
>> multi_v7_defconfig + ti_multi_v7_prune.config
>> multi_v7_defconfig + ti_multi_v7_prune.config + no_smp.config
>> multi_v7_defconfig + ti_multi_v7_prune.config + ti_rt.config
>> multi_v7_defconfig + ti_multi_v7_prune.config + no_smp.config + ti_rt.=
config
>> defconfig + ti_arm64_prune.config
>> defconfig + ti_arm64_prune.config + ti_rt.config
>>
>> These are the variations, so without no_smp.config there would
>> only be 2 kernels across all am3/4/5, one with and one without RT.
>>
>> On the side I've been working to make the kernel build into
>> one for all of aarch64 (i.e. one package in aarch64-oe-linux
>> vs kernel for each and every platform). Would like to do the
>> same for armv7.
>=20
> FWIW, the way it is now being handled in OE-Core is with genericarm64 m=
achine
> to target Arm System Ready devices. And BeaglePlay is currently the Ref=
erence
> Platform for this use case. Basically, OE-Core builds a generic kernel =
that
> can run on any Aarch64 device...
>=20
> But it is not ideal though, as it completely ignores everything that co=
mes
> before the kernel (SYSFW/PM/DM/RM/SCI/FS, SPLs, TF-A, OPTEE, U-boot, DT=
s...),
> treating them as black box firmware blobs, which are very machine-speci=
fic.
>=20
> But it seems too fragile to me - luckily meta-ti builds and assembles a=
ll
> those pieces for every device. Getting something that combines the best=
 of
> both worlds would be challenging, but interesting...
>=20
>=20

We don't seem too far from it, just need to figure out the DT passing iss=
ue
and we might be ready. Currently all our kernels use the same config, we
only change the list of DTBs in the "kernel-devicetree" package. Which I
think we should stop filtering and just include them all (Debian/Fedora
do it that way too). It isn't that much data (at least compared to the
size of the module packages), but if we want we could also have the
device-tree bbclass split DTBs out automatically into packages by
directory. So something like:

kernel-devicetree-k3
kernel-devicetree-ti-omap
kernel-devicetree-ti-keystone
ect..

Then we just select which to include in the image based on platform.

Andrew

>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12=
/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12=
/ti43x/defconfig
>>>>> index 9d579e41..e6a967e1 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/=
defconfig
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/=
defconfig
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/c=
onfigs/no_smp.config
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6=
.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12=
/defconfig
>>>>> index 9d579e41..43089dc8 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/def=
config
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/def=
config
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/c=
onfigs/ti_rt.config
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6=
.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6=
.12/k3/defconfig
>>>>> index fd07b34e..47d78664 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/=
defconfig
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/=
defconfig
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Ddefconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config kernel/conf=
igs/ti_rt.config
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6=
.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-r=
t-6.12/ti33x/defconfig
>>>>> index 9d579e41..5de2b229 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti3=
3x/defconfig
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti3=
3x/defconfig
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/c=
onfigs/ti_rt.config kernel/configs/no_smp.config
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6=
.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-r=
t-6.12/ti43x/defconfig
>>>>> index 9d579e41..5de2b229 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti4=
3x/defconfig
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti4=
3x/defconfig
>>>>> @@ -1,2 +1,2 @@
>>>>>  =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>>>> -config-fragment=3D
>>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/c=
onfigs/ti_rt.config kernel/configs/no_smp.config

