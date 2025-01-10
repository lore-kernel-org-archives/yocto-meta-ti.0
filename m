Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DEAE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:00:31 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.508.1736539229738225318
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 12:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Du4modLp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50AK0R8H124412;
	Fri, 10 Jan 2025 14:00:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736539227;
	bh=/yHWLCEWLs1m9ijlc7cWxdjLXFCBqSnHRwP5f8BvNKo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Du4modLpjBX8mNK9QKWoySZ9mj7zyg4ZArhUou4XuR3b4AKyT4pL0/0MYcv+E+mOx
	 SvkQQSbF9dO/7E1c9c3I8AKcWOTH9pcwLKqZqe4Ybh+l/+rWU9UOOhh6x1SZjSwuvc
	 wz+EEeZQC56Xs3ek8LQ/NScmCUtIu/J314PqL4F4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AK0RcS003931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 14:00:27 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 14:00:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 14:00:27 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AK0QWN081176;
	Fri, 10 Jan 2025 14:00:27 -0600
Message-ID: <3021224f-197b-46ef-8218-7862100f3ce7@ti.com>
Date: Fri, 10 Jan 2025 14:00:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH v2] ti-bsp: Disable GC320
 support conditionally on BSP version
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20250108205145.542754-1-afd@ti.com>
 <20250110180624.GE21836@denix.org>
 <18196B9D6FC9E354.10803@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18196B9D6FC9E354.10803@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 50AK0R8H124412
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 20:00:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18184



On 1/10/2025 1:30 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 1/10/2025 12:06 PM, Denys Dmytriyenko wrote:
>> On Wed, Jan 08, 2025 at 02:51:45PM -0600, Andrew Davis via=20
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
>>>
>>> Changes for v2:
>>> =C2=A0 - Rebased on latest with new meta-beagle layer
>>>
>>> =C2=A0 meta-beagle/conf/machine/include/beagle-bsp.inc |=C2=A0 6 ++++=
++
>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-bsp.inc=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 +++++++++++++++
>>> =C2=A0 2 files changed, 21 insertions(+)
>>>
>>> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc=20
>>> b/meta-beagle/conf/machine/include/beagle-bsp.inc
>>> index 34889b41..06483ba9 100644
>>> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
>>> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
>>> @@ -23,6 +23,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
>>> +# GC320 support requires out-of-tree drivers not yet available in=20
>>> bb.org 6.1
>>> +MACHINE_FEATURES:remove:bsp-bb_org-6_1 =3D "gc320"
>>> +
>>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 # bb_org-6_6
>>> =C2=A0 # BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
>>> @@ -41,3 +44,6 @@ BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D=20
>>> "ti-img-rogue-driver"
>>> =C2=A0 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
>>> =C2=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "24%"
>>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "23%"
>>> +
>>> +# GC320 support requires out-of-tree drivers not yet available in=20
>>> bb.org 6.6
>>> +MACHINE_FEATURES:remove:bsp-bb_org-6_6 =3D "gc320"
>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc=20
>>> b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>> index 4bbe7668..6773bb7a 100644
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
>>
>> Andrew, Ryan,
>>
>> Something went wrong here ^^^
>> Instead of removing "gc320" for bsp-next, like in the patch here, it g=
ot
>> committed removing it for bsp-ti-6_12 twice:
>>
>> https://git.yoctoproject.org/meta-ti/commit/?h=3Dmaster-wip&id=3Dfe0b3=
5f5f135b98d1ee0f8fe2488b10fbe9a7bb3
>>
>> Was there any manual massaging involved?
>=20
> Yes.=C2=A0 I did.=C2=A0 Let me look at it.

Fixed on master-wip, scarthgap-wip was correct.

>=20
>>
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
>>> =C2=A0 # sane fallback defaults
>>> =C2=A0 # if specific values are not defined or bsp is set incorrectly
>>> --=20
>>> 2.39.2
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18179): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18179
> Mute This Topic: https://lists.yoctoproject.org/mt/110504595/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

