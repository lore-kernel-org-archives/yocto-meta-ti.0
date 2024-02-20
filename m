Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F96C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:00:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15166.1708441218103517825
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=MeZ5hYXj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KF0CJH020372;
	Tue, 20 Feb 2024 09:00:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708441212;
	bh=K3aKLYRaof3w5iMRSbfCpZbuhCqvASF8en2S0KAMsS8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MeZ5hYXj0KetvoG0IFjnZsRR4f71ARayPsSleZ3s4tkjM7+lHJ6GZ2uvRGCLavXAv
	 edpQukgPWB6KGFniHCWNl5BRirWQCgkOqMG2CkqgD6BN2NljIwbvzVQ1rkjSdB2dsx
	 n7VIV6Q9R+r9ZXzbqFwMxS8MVrIK6jSA21BmAXO8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KF0CJ8076046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Feb 2024 09:00:12 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 09:00:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 09:00:12 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KF0CWH054995;
	Tue, 20 Feb 2024 09:00:12 -0600
Message-ID: <853c4cbd-aed8-44f0-85e4-5a8a8362a424@ti.com>
Date: Tue, 20 Feb 2024 09:00:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: Use
 Cortex-A53/A72 CPU tune
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20240215212613.57012-1-afd@ti.com>
 <20240216202300.GC1572@denix.org>
 <d7c539d7-f9ff-46e4-9ae8-ca825e8f3fd1@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <d7c539d7-f9ff-46e4-9ae8-ca825e8f3fd1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41KF0CJH020372
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17489



On 2/20/2024 8:31 AM, Andrew Davis wrote:
> On 2/16/24 2:23 PM, Denys Dmytriyenko wrote:
>> Unfortunately, NAK.
>>
>> This is considered an antisocial behavior for a BSP in the Yocto Proje=
ct
>> world. And the performance benefit is questionable with 1%-2%, if at a=
ll.
>>
>=20
> This stated when a potential customer noticed building and running some
> benchmarks (linpack for instance) on our SDK were being out-performed b=
y
> some other vendors. Even though on paper our platforms should have been
> the better performing ones.
>=20
> After investigating it turns out these other vendors have these tune
> options in=C2=A0 their BSP layers, causing the performance discrepancy.
>=20
> So the performance here, even of a couple percent, is very important.
>=20
>> The proper place for any extra optimization tunes is in a distro=20
>> config. Maybe
>> even by end customer's final product, not a reference distro.
>>
>> Consider a distro that supports multiple HW platforms and uses=20
>> multiple BSPs
>> besides meta-ti - YoE, AGL, etc. You do want a common denominator=20
>> tunes in
>> order to get the most binary re-use across the platforms.
>>
>=20
> If one wants binary re-use they can override the tune. Otherwise maybe
> they should be using Debian or some other binary distro. The main selli=
ng
> point for Yocto IMHO is customizing like this. The best part of rebuild=
ing
> everything from scratch every time for every machine is we can have the=
se
> machine specific tunings.
>=20
>> For example, AGL goes to some extreme lengths to override such custom=20
>> tunes
>> set by misbehaving BSPs and it's quite ugly.
>>
>=20
> Then we should work to make it easier to override for those folks, not=20
> simply
> leave this performance on the table.
>=20
>> And moreover, we've gone through this motion in the past many years=20
>> ago when
>> we had our ARMv7 platforms set to their corresponding cortex-a8/a9/a15=
=20
>> tunes
>> by default, but eventually ended up setting a common ARMv7 tune:
>>
>> DEFAULTTUNE ?=3D "armv7athf-neon"
>>
>> So, you should either leave the current arch-arm64.inc inclusion as=20
>> is, or if
>> you insist on including tune-cortexa72-cortexa53.inc, set the default=20
>> tune
>> back to plain aarch64:
>>
>> DEFAULTTUNE ?=3D "aarch64"
>>
>=20
> I see our friends over in meta-xilinx are doing machine specific=20
> DEFAULTTUNEs.
> I was thinking of matching that to keep our BSP performance competitive=
.=20
> But
> as a compromise and to avoid "antisocial behavior" as you say, I think =
I=20
> can
> live with DEFAULTTUNE ?=3D "aarch64".
>=20
> Will resend with that.

So, if we include the more targeted tuning file, but set DEFAULTUNE to=20
the generic, then how do our builds use the more targeted tuning?  Is=20
that something we have to set in the local.conf as part of our builds?=20
Or is this some sort of magic that occurs that gets the correct thing?


> Andrew
>=20
>>
>> On Thu, Feb 15, 2024 at 03:26:13PM -0600, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> All current K3 devices use either A53 or A72. Use the compile tune
>>> configuration specific for these to allow the compiler to make
>>> better optimizations.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>>> b/meta-ti-bsp/conf/machine/include/k3.inc
>>> index 2415f0ba..7c3579af 100644
>>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>>> @@ -3,7 +3,7 @@
>>> =C2=A0 require conf/machine/include/ti-soc.inc
>>> =C2=A0 SOC_FAMILY:append =3D ":k3"
>>> -require conf/machine/include/arm/arch-arm64.inc
>>> +require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
>>> =C2=A0 BBMULTICONFIG +=3D "k3r5"
>>> --=20
>>> 2.39.2

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

