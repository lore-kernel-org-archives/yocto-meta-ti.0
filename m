Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365DBC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 17:10:42 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.49240.1737565833172093400
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 09:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Koei7y17;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MHAWsG230642
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 11:10:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737565832;
	bh=YpQFAdRX7Tg+7LgMJ5W+n/jqZAAwDkD8t30tMlYdwwI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Koei7y17Y95HBbQkWEhQTb0WiFCdGHpfEgW/3hEyxsPZbB/HIboaSAwQ8OZdd59dA
	 4mjuqLwxBpdkMTyDgMXKssn6cHYBfgppUF+OdjTkwV0XVVdgj3Tswr+3eUhHjKa849
	 ulehBFzQgYKCar9Livx7x2lZDhBAvof6sJH1ANUY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MHAWoI011632
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 11:10:32 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 11:10:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 11:10:32 -0600
Received: from [10.249.32.65] ([10.249.32.65])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MHAVuf075033;
	Wed, 22 Jan 2025 11:10:31 -0600
Message-ID: <f829641b-ae91-4b31-9077-9547f05a670b@ti.com>
Date: Wed, 22 Jan 2025 11:10:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] linux-ti-staging: Add config-fragments for
 v6.12 Kernel
To: Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250121175625.4114041-1-b-padhi@ti.com>
 <7ea61ec8-e499-48d7-9fb5-f5159c6bc82d@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <7ea61ec8-e499-48d7-9fb5-f5159c6bc82d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50MHAWsG230642
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 17:10:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18215



On 1/22/2025 10:50 AM, Andrew Davis wrote:
> On 1/21/25 11:56 AM, Beleswar Padhi wrote:
>> ti-linux-kernel tree has several prune config fragments for ARM/ARM64/=
RT
>> configurations. Enable the prune config fragments here.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/defconfig=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig=C2=
=A0 | 2 +-
>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig=C2=
=A0 | 2 +-
>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig=C2=
=A0 | 2 +-
>> =C2=A0 .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 8 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
>> index 9d579e41..24b53cf7 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
>> index fd07b34e..ef1d3efd 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defcon=
fig
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defcon=
fig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Ddefconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconf=
ig
>> index 9d579e41..e6a967e1 100644
>> ---=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconf=
ig
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconf=
ig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config=20
>> kernel/configs/no_smp.config
>=20
> We are running into some issues with the no_smp.config, seems some kern=
el
> sysfs items relating to CPU counts are misbehaving (Chirag has more det=
ails
> if anyone is interested). Disabling SMP is not well tested in general=20
> anymore
> as it is often enabled by default even for single-core systems. The ver=
y=20
> small
> performance change is not worth the lack of testing and instability cau=
sed
> by going with non-standard configurations IMHO.
>=20
> Everything else here looks good, but could we drop no_smp.config for no=
w
> and take up a debate on adding it in at a later time?
>=20
> This also has the side benefit of reducing our kernel builds from 6=20
> variations
> to just 4 (arm32/64 x rt/non-rt).

We only have 4 now... the no_smp was just added to ti33 and ti43 for=20
backwards compat to fix some issues.   But we never did additional=20
kernel builds because of it...

What were the 6 variations you were referring to?


> Andrew
>=20
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconf=
ig
>> index 9d579e41..e6a967e1 100644
>> ---=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconf=
ig
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconf=
ig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config=20
>> kernel/configs/no_smp.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
>> index 9d579e41..43089dc8 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defcon=
fig
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defcon=
fig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config=20
>> kernel/configs/ti_rt.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconf=
ig
>> index fd07b34e..47d78664 100644
>> ---=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconf=
ig
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconf=
ig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Ddefconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config=20
>> kernel/configs/ti_rt.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/d=
efconfig
>> index 9d579e41..5de2b229 100644
>> ---=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defc=
onfig
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defc=
onfig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config=20
>> kernel/configs/ti_rt.config kernel/configs/no_smp.config
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/d=
efconfig
>> index 9d579e41..5de2b229 100644
>> ---=20
>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defc=
onfig
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defc=
onfig
>> @@ -1,2 +1,2 @@
>> =C2=A0 use-kernel-config=3Dmulti_v7_defconfig
>> -config-fragment=3D
>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config=20
>> kernel/configs/ti_rt.config kernel/configs/no_smp.config

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

