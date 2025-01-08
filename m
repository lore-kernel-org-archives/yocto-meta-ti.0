Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0282BE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 20:33:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.30874.1736368424672445303
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 12:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=GHUr6hz2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508KXfY8025686;
	Wed, 8 Jan 2025 14:33:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736368421;
	bh=jf23Pk4wer93HKS0UXP6cu5wcw03MbGAwtruEnAvUjc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GHUr6hz2yEQVac/wO7B3cDrd3bW1XfAlMqyB5/IRoc9inQgqCPBk8lW460PKun1Qq
	 x+9iNpMII0f1HbM0yAmAQa3ZTJ5dQJ2u+vp4aSRuc7zZgRJY5YKJOGFz9lTC6gdKZn
	 TBS2tFLef2yTpk/AI8jv/TpthNxBlfKHveY3veVw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508KXfXj057886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 14:33:41 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 14:33:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 14:33:40 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508KXeuM112941;
	Wed, 8 Jan 2025 14:33:40 -0600
Message-ID: <9aa6c1a4-3fb8-4cc6-9241-7c0c2d4c2dba@ti.com>
Date: Wed, 8 Jan 2025 14:33:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-bsp: Disable GC320 support
 conditionally on BSP version
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20241217205945.46805-1-afd@ti.com>
 <20241218211927.GI23825@denix.org>
 <85f7d35e-67ab-4e83-bbc3-ac20f3a29890@ti.com>
 <1812B2E7EAFBFD94.26783@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1812B2E7EAFBFD94.26783@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 508KXfY8025686
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 20:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18170



On 12/19/2024 3:58 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 12/18/2024 6:05 PM, Andrew Davis wrote:
>> On 12/18/24 3:19 PM, Denys Dmytriyenko wrote:
>>> Andrew,
>>>
>>> Thanks for the patches. Ryan and I were discussing them yesterday.
>>>
>>> Couple points/questions:
>>>
>>> 1. There's meta-beagle restructuring going on in master right now - t=
he
>>> changes are in master-next and should be merged to master shortly. I=20
>>> also
>>> just posted a series to backport these changes to scarthgap. That wil=
l
>>> affect your change below to ti-bsp.inc and will need to be re-spinned.
>>>
>>
>> No worries. The restructure looks good btw, looking forward to having
>> cleaner separation (and the new BeagleY-AI builds :D). I'll re-spin th=
is
>> when meta-beagle lands in master and scarthgap.
>=20
> I have pushed all of the needed patches to scarthgap/master.=C2=A0 You =
can=20
> re-spin the series if you want.

Andrew,

Ping.  There is a patch on meta-arago that is waiting for this patch=20
series.  Can you respin this now that meta-beagle is in place?



>=20
>=20
>>> 2. A more generic question... GC320 is a unique peripheral of legacy=20
>>> AM57/J6
>>> platforms and the driver for it hasn't been updated since 5.10 times.=
 It
>>> has been disabled globally in the Distro layer for a couple years=20
>>> now. While
>>> I do understand your change to move this disablenent from the Distro =
to
>>> BSP, are there any plans to revive GC320 support and not simply=20
>>> remove it
>>> altogether?
>>>
>>
>> The fix to get the GC320 kernel module building again is rather=20
>> trivial. Just
>> never got around to pushing the fixes. So mostly just wishful thinking=
=20
>> that it
>> will get re-enabled here at some point..
>>
>> Andrew
>>
>>>
>>> On Tue, Dec 17, 2024 at 02:59:45PM -0600, Andrew Davis via=20
>>> lists.yoctoproject.org wrote:
>>>> Like we do with GPU support, GC320 support is conditional on the
>>>> kernel we are building and so should be disabled here for kernels
>>>> on which it is not functional yet.
>>>>
>>>> We can then remove these disabling lines as the driver is updated
>>>> for each supported kernel, instead of blanket disabling in the
>>>> distro layer as done currently.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 18 ++++++++++++=
++++++
>>>> =C2=A0 1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc=20
>>>> b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> index 814c6ca8..bdc8bef7 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> @@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline =3D "%"
>>>> =C2=A0 # in mainline, usually present in TI staging or derivative li=
ke=20
>>>> BB.org
>>>> =C2=A0 MACHINE_FEATURES:remove:bsp-mainline =3D "gpu"
>>>> +# GC320 support requires out-of-tree drivers not available in mainl=
ine
>>>> +MACHINE_FEATURES:remove:bsp-mainline =3D "gc320"
>>>> +
>>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0 # next
>>>> =C2=A0 # upcoming upstream/mainline kernel, u-boot
>>>> @@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next =3D "%"
>>>> =C2=A0 # in next, usually present in TI staging or derivative like B=
B.org
>>>> =C2=A0 MACHINE_FEATURES:remove:bsp-next =3D "gpu"
>>>> +# GC320 support requires out-of-tree drivers not available in next
>>>> +MACHINE_FEATURES:remove:bsp-next =3D "gc320"
>>>> +
>>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0 # ti-6_12
>>>> =C2=A0 # TI staging kernel 6.12, u-boot 2024.10
>>>> @@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2024.10%"
>>>> =C2=A0 # in 6.12 yet
>>>> =C2=A0 MACHINE_FEATURES:remove:bsp-ti-6_12 =3D "gpu"
>>>> +# GC320 support requires out-of-tree drivers not yet available in 6=
.12
>>>> +MACHINE_FEATURES:remove:bsp-ti-6_12 =3D "gc320"
>>>> +
>>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0 # ti-6_6
>>>> =C2=A0 # TI staging kernel 6.6, u-boot 2024.04
>>>> @@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
>>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 =3D "24%"
>>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "23%"
>>>> +# GC320 support requires out-of-tree drivers not yet available in 6=
.6
>>>> +MACHINE_FEATURES:remove:bsp-ti-6_6 =3D "gc320"
>>>> +
>>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0 # ti-6_1
>>>> =C2=A0 # TI staging kernel 6.1, u-boot 2023.04
>>>> @@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 =3D "23%"
>>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 =3D "23%"
>>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_1 =3D "22%"
>>>> +# GC320 support requires out-of-tree drivers not yet available in 6=
.1
>>>> +MACHINE_FEATURES:remove:bsp-ti-6_1 =3D "gc320"
>>>> +
>>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0 # bb_org
>>>> =C2=A0 # BeagleBoard.org kernel 6.1, u-boot 2023.04
>>>> @@ -101,6 +116,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
>>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
>>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
>>>> +# GC320 support requires out-of-tree drivers not yet available in=20
>>>> bb.org
>>>> +MACHINE_FEATURES:remove:bsp-bb_org =3D "gc320"
>>>> +
>>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0 # sane fallback defaults
>>>> =C2=A0 # if specific values are not defined or bsp is set incorrectl=
y
>>>> --=20
>>>> 2.39.2
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18160): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18160
> Mute This Topic: https://lists.yoctoproject.org/mt/110170195/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

