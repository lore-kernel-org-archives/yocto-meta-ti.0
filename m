Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5111FE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:58:37 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.139791.1734645515443038068
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LuS2Qbfu;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLwWKb066453
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 15:58:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645512;
	bh=495WxeJ0UejU7QjDP3t0u8YvpP+3uzxj9SNRKjbUgw0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LuS2QbfueJEZ+OI+PeeHzMK8qXBhU6DaIW5FWMgG52I5pGFnH05nU3IqGNbEXfhPC
	 YjVSTzIFwogEVyVPpX2qEVldcqWiaEiXueLq1gCNovWVF/YjY1/EDcZxjSSo4kduDC
	 8Mrorjja1wV0DDMXq2XEAksfV2ThXirk/C0qij1g=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLwW9w053026;
	Thu, 19 Dec 2024 15:58:32 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:58:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:58:31 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLwVie070837;
	Thu, 19 Dec 2024 15:58:31 -0600
Message-ID: <e2948448-899c-47f7-8a44-4f97fc4ffa8f@ti.com>
Date: Thu, 19 Dec 2024 15:58:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-bsp: Disable GC320 support
 conditionally on BSP version
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20241217205945.46805-1-afd@ti.com>
 <20241218211927.GI23825@denix.org>
 <85f7d35e-67ab-4e83-bbc3-ac20f3a29890@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <85f7d35e-67ab-4e83-bbc3-ac20f3a29890@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 4BJLwWKb066453
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18160



On 12/18/2024 6:05 PM, Andrew Davis wrote:
> On 12/18/24 3:19 PM, Denys Dmytriyenko wrote:
>> Andrew,
>>
>> Thanks for the patches. Ryan and I were discussing them yesterday.
>>
>> Couple points/questions:
>>
>> 1. There's meta-beagle restructuring going on in master right now - th=
e
>> changes are in master-next and should be merged to master shortly. I a=
lso
>> just posted a series to backport these changes to scarthgap. That will
>> affect your change below to ti-bsp.inc and will need to be re-spinned.
>>
>=20
> No worries. The restructure looks good btw, looking forward to having
> cleaner separation (and the new BeagleY-AI builds :D). I'll re-spin thi=
s
> when meta-beagle lands in master and scarthgap.

I have pushed all of the needed patches to scarthgap/master.  You can=20
re-spin the series if you want.



>> 2. A more generic question... GC320 is a unique peripheral of legacy=20
>> AM57/J6
>> platforms and the driver for it hasn't been updated since 5.10 times. =
It
>> has been disabled globally in the Distro layer for a couple years now.=
=20
>> While
>> I do understand your change to move this disablenent from the Distro t=
o
>> BSP, are there any plans to revive GC320 support and not simply remove=
 it
>> altogether?
>>
>=20
> The fix to get the GC320 kernel module building again is rather trivial=
.=20
> Just
> never got around to pushing the fixes. So mostly just wishful thinking=20
> that it
> will get re-enabled here at some point..
>=20
> Andrew
>=20
>>
>> On Tue, Dec 17, 2024 at 02:59:45PM -0600, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> Like we do with GPU support, GC320 support is conditional on the
>>> kernel we are building and so should be disabled here for kernels
>>> on which it is not functional yet.
>>>
>>> We can then remove these disabling lines as the driver is updated
>>> for each supported kernel, instead of blanket disabling in the
>>> distro layer as done currently.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 18 +++++++++++++=
+++++
>>> =C2=A0 1 file changed, 18 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc=20
>>> b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>> index 814c6ca8..bdc8bef7 100644
>>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>> @@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline =3D "%"
>>> =C2=A0 # in mainline, usually present in TI staging or derivative lik=
e BB.org
>>> =C2=A0 MACHINE_FEATURES:remove:bsp-mainline =3D "gpu"
>>> +# GC320 support requires out-of-tree drivers not available in mainli=
ne
>>> +MACHINE_FEATURES:remove:bsp-mainline =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # next
>>> =C2=A0 # upcoming upstream/mainline kernel, u-boot
>>> @@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next =3D "%"
>>> =C2=A0 # in next, usually present in TI staging or derivative like BB=
.org
>>> =C2=A0 MACHINE_FEATURES:remove:bsp-next =3D "gpu"
>>> +# GC320 support requires out-of-tree drivers not available in next
>>> +MACHINE_FEATURES:remove:bsp-next =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # ti-6_12
>>> =C2=A0 # TI staging kernel 6.12, u-boot 2024.10
>>> @@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2024.10%"
>>> =C2=A0 # in 6.12 yet
>>> =C2=A0 MACHINE_FEATURES:remove:bsp-ti-6_12 =3D "gpu"
>>> +# GC320 support requires out-of-tree drivers not yet available in 6.=
12
>>> +MACHINE_FEATURES:remove:bsp-ti-6_12 =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # ti-6_6
>>> =C2=A0 # TI staging kernel 6.6, u-boot 2024.04
>>> @@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 =3D "24%"
>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "23%"
>>> +# GC320 support requires out-of-tree drivers not yet available in 6.=
6
>>> +MACHINE_FEATURES:remove:bsp-ti-6_6 =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # ti-6_1
>>> =C2=A0 # TI staging kernel 6.1, u-boot 2023.04
>>> @@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 =3D "23%"
>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 =3D "23%"
>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_1 =3D "22%"
>>> +# GC320 support requires out-of-tree drivers not yet available in 6.=
1
>>> +MACHINE_FEATURES:remove:bsp-ti-6_1 =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # bb_org
>>> =C2=A0 # BeagleBoard.org kernel 6.1, u-boot 2023.04
>>> @@ -101,6 +116,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
>>> +# GC320 support requires out-of-tree drivers not yet available in=20
>>> bb.org
>>> +MACHINE_FEATURES:remove:bsp-bb_org =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # sane fallback defaults
>>> =C2=A0 # if specific values are not defined or bsp is set incorrectly
>>> --=20
>>> 2.39.2

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

