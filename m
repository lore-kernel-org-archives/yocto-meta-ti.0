Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91882C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 17:01:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.19900.1699462898100014037
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 09:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=WBmzVxBN;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: jm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8H1bKg071488
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 11:01:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699462897;
	bh=OsygW5Msti8Rn4ew3O7gY7e1OMA7GZjZmevP0djZ/7w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WBmzVxBN0pjA0fNTaSVtdROThgRCrOa7h2cCNl3mSGfkiDOVkqQLIv7oM57m5ctvp
	 SJM8TIeJGwgvNqoq+0JDLfiG+Q5Riju/43QYkSexchBwLHETR5vvfMLsUxU+mZfRg/
	 l5/UmP662AlwNhg9eSP6gFOZTnGsjWhAR3tmg7Lg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8H1bHU102321
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 11:01:37 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 11:01:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 11:01:37 -0600
Received: from [128.247.81.105] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8H1b3U091439;
	Wed, 8 Nov 2023 11:01:37 -0600
Message-ID: <92aa2093-dd5a-45d4-9223-7de61fcd23b2@ti.com>
Date: Wed, 8 Nov 2023 11:01:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone PATCH v2] conf: machine: am62*: extend picking common
 overlays by prefix
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Jai Luthra <j-luthra@ti.com>
References: <20231108160437.15536-1-praneeth@ti.com>
 <9c519c91-6f8e-450a-b0d3-b37194eb63a2@ti.com>
 <0f8f2d4b-8c42-45a0-b470-1c3952b8c9c8@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <0f8f2d4b-8c42-45a0-b470-1c3952b8c9c8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3A8H1bKg071488
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 17:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17281

On 11/8/23 10:59 AM, Ryan Eatmon wrote:
>=20
>=20
> On 11/8/2023 10:43 AM, Judith Mendez wrote:
>> Hi Praneeth,
>>
>> On 11/8/23 10:04 AM, Praneeth Bajjuri wrote:
>>> commit f5851386 ("conf: machine: am62*: Pick common overlays by prefi=
x")
>>> picks common HDMI and CSI overlays for am62 platform variants.
>>>
>>> Adding capability to extend the same prefix for common overlays for=20
>>> applicable
>>> am62 platforms in more generic way to include new mcan overlays added=
=20
>>> [1]
>>>
>>> [1]:=20
>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=3D=
3b01c392627f
>>>
>>> given the differences in SK-AM62-LP containing=C2=A0 B2B HDMI Samtec=20
>>> connector,
>>> just added the kernel prefix to pick common mcan overlay.
>>>
>>> for am62pxx: It has 4 MCANs vs all other am62xx devices have 3 MCANs,
>>> hence keeping this prefix seperate for am62pxx to pick right overlay.
>>>
>>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>> ---
>>> v2: updated am62xxsip conf and updated for am62pxx to pick different
>>> mcan overlay
>>>
>>> =C2=A0 meta-ti-bsp/conf/machine/am62axx-evm.conf=C2=A0=C2=A0 | 3 +--
>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0 | 3=
 +--
>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>>> =C2=A0 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 4 ++--
>>> =C2=A0 4 files changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>> index ef60e9d1..22f61401 100644
>>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>> @@ -6,8 +6,7 @@ require conf/machine/include/am62axx.inc
>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>> =C2=A0 "
>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>>> index b60ba156..fadbc6f4 100644
>>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>>> @@ -7,8 +7,7 @@ require conf/machine/include/ti-extras.inc
>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>> =C2=A0 "
>>> =C2=A0 KERNEL_DEVICETREE =3D " \
>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>>> index 0d2f89ca..afa5e061 100644
>>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>>> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcan \
>>> =C2=A0 "
>>
>> This change is not required for 62 LP. MCAN overlay is
>> already included here:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk \
>=20
> Are you sure?
>=20
> ti/k3-am625-sk !=3D ti/k3-am62x-sk
>=20
> 5 versus x
>=20
My apologies, I saw an x instead of 5. The change is correct

>=20
>=20
>>> =C2=A0 KERNEL_DEVICETREE =3D " \
>>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>>> index b3bda44a..cae58afe 100644
>>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>>> @@ -6,8 +6,8 @@ require conf/machine/include/am62xx.inc
>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>> +
>>> =C2=A0 "
>>> =C2=A0 KERNEL_DEVICETREE =3D " \
>>
>> ~ Judith
>=20


