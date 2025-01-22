Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACEC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 17:39:22 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.94.1737567557184970389
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 09:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=xEXS7P5p;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MHdFZ1234482
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 11:39:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737567555;
	bh=I7a/PuGO5gKDpM9hDOBLV5p1eLefESthnT6yGQO/juA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xEXS7P5pnQmCBMLPFbDamyEHgg6VpY/GEdi/yvk5fGv4el6uKStKpgZXrl8AnZncc
	 88o5isF7PpuwhO3xDaIqn2KsC3DcoqWk0oFHsr/7SeG7rNiI6/0GzLiBllc7nbZtkb
	 i1EGS6pyD5olVO4gBOWZ9yPluJebPnUhQ2RVOIWQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MHdFJM028628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 11:39:15 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 11:39:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 11:39:15 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MHdEGo104994;
	Wed, 22 Jan 2025 11:39:15 -0600
Message-ID: <4f841008-3741-4e52-8373-34ea10f78b53@ti.com>
Date: Wed, 22 Jan 2025 11:39:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] linux-ti-staging: Add config-fragments for
 v6.12 Kernel
To: Ryan Eatmon <reatmon@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250121175625.4114041-1-b-padhi@ti.com>
 <7ea61ec8-e499-48d7-9fb5-f5159c6bc82d@ti.com>
 <f829641b-ae91-4b31-9077-9547f05a670b@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <f829641b-ae91-4b31-9077-9547f05a670b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50MHdFZ1234482
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 17:39:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18217

On 1/22/25 11:10 AM, Ryan Eatmon wrote:
>=20
>=20
> On 1/22/2025 10:50 AM, Andrew Davis wrote:
>> On 1/21/25 11:56 AM, Beleswar Padhi wrote:
>>> ti-linux-kernel tree has several prune config fragments for ARM/ARM64=
/RT
>>> configurations. Enable the prune config fragments here.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/defconfig=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig=
=C2=A0 | 2 +-
>>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig=
=C2=A0 | 2 +-
>>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig=
=C2=A0 | 2 +-
>>> =C2=A0 .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 8 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/d=
efconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig
>>> index 9d579e41..24b53cf7 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfi=
g
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfi=
g
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k=
3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/d=
efconfig
>>> index fd07b34e..ef1d3efd 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defco=
nfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defco=
nfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Ddefconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/t=
i33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/t=
i33x/defconfig
>>> index 9d579e41..e6a967e1 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/de=
fconfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/de=
fconfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/con=
figs/no_smp.config
>>
>> We are running into some issues with the no_smp.config, seems some ker=
nel
>> sysfs items relating to CPU counts are misbehaving (Chirag has more de=
tails
>> if anyone is interested). Disabling SMP is not well tested in general =
anymore
>> as it is often enabled by default even for single-core systems. The ve=
ry small
>> performance change is not worth the lack of testing and instability ca=
used
>> by going with non-standard configurations IMHO.
>>
>> Everything else here looks good, but could we drop no_smp.config for n=
ow
>> and take up a debate on adding it in at a later time?
>>
>> This also has the side benefit of reducing our kernel builds from 6 va=
riations
>> to just 4 (arm32/64 x rt/non-rt).
>=20
> We only have 4 now... the no_smp was just added to ti33 and ti43 for ba=
ckwards compat to fix some issues.=C2=A0=C2=A0 But we never did additiona=
l kernel builds because of it...
>=20
> What were the 6 variations you were referring to?
>=20

multi_v7_defconfig + ti_multi_v7_prune.config
multi_v7_defconfig + ti_multi_v7_prune.config + no_smp.config
multi_v7_defconfig + ti_multi_v7_prune.config + ti_rt.config
multi_v7_defconfig + ti_multi_v7_prune.config + no_smp.config + ti_rt.con=
fig
defconfig + ti_arm64_prune.config
defconfig + ti_arm64_prune.config + ti_rt.config

These are the variations, so without no_smp.config there would
only be 2 kernels across all am3/4/5, one with and one without RT.

On the side I've been working to make the kernel build into
one for all of aarch64 (i.e. one package in aarch64-oe-linux
vs kernel for each and every platform). Would like to do the
same for armv7.

Andrew

>=20
>> Andrew
>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/t=
i43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/t=
i43x/defconfig
>>> index 9d579e41..e6a967e1 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/de=
fconfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/de=
fconfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/con=
figs/no_smp.config
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1=
2/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/d=
efconfig
>>> index 9d579e41..43089dc8 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defco=
nfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defco=
nfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/con=
figs/ti_rt.config
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1=
2/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1=
2/k3/defconfig
>>> index fd07b34e..47d78664 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/de=
fconfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/de=
fconfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Ddefconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config kernel/config=
s/ti_rt.config
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1=
2/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.12/ti33x/defconfig
>>> index 9d579e41..5de2b229 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x=
/defconfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x=
/defconfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/con=
figs/ti_rt.config kernel/configs/no_smp.config
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1=
2/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.12/ti43x/defconfig
>>> index 9d579e41..5de2b229 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x=
/defconfig
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x=
/defconfig
>>> @@ -1,2 +1,2 @@
>>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>>> -config-fragment=3D
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/con=
figs/ti_rt.config kernel/configs/no_smp.config
>=20

