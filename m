Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FB7C54E49
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 06:19:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2394.1710224364218680608
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=eUUa7dU4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42C6JMqA007764;
	Tue, 12 Mar 2024 01:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710224362;
	bh=W11vOWbmazT6YRF7kM2N2ssePSp2r2qAmKdPQFuHEXQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eUUa7dU4pt1iZ6LtZt0VYk9nQ5y8Njjl2ZVOTPAXY1sUMEX3HR+FvlnS7kXctKoJF
	 FFPYfsfl8JYxOISWyz3YdhKu6C+EPdFowKmDChpSwFTLxft4FSD0IMIJzGIDqWZw8e
	 I44KoUyCGUo2K8ADb7+jlTiNltoEKsP2mjRGBAiw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42C6JMOq013168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 01:19:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 01:19:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 01:19:22 -0500
Received: from [172.24.20.156] (lt5cd2489kgj.dhcp.ti.com [172.24.20.156])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42C6JJ2M053324;
	Tue, 12 Mar 2024 01:19:20 -0500
Message-ID: <b73b3443-7aa5-48d0-9ec9-20f63faf5de9@ti.com>
Date: Tue, 12 Mar 2024 11:49:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH] export ov10635 camera device tree overlay
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <sbellary@baylibre.com>, <sinthu.raja@mistralsolutions.com>
References: <20240311111359.1556157-1-u-kumar1@ti.com>
 <56ceda24-b8b5-4074-80bc-cd800ab18321@ti.com>
 <17BBBE23B48A82C1.17779@lists.yoctoproject.org>
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <17BBBE23B48A82C1.17779@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 42C6JMqA007764
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 06:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17511

Hi Ryan

On 3/11/2024 8:35 PM, Udit Kumar via lists.yoctoproject.org wrote:
> Hi Ryan
>
> On 3/11/2024 6:05 PM, Ryan Eatmon wrote:
>>
>> We typically put the file grouping of the change in the commit=20
>> message. For example:
>>
>> conf: machine: am57xx: export ov10635 camera device tree overlay
>>
>>
>> On 3/11/2024 6:14 AM, Udit Kumar via lists.yoctoproject.org wrote:
>>> Adding ov10635 camera overlay in default build
>>>
>>>
>>> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>> index 43a6a833..9a06e801 100644
>>> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>> @@ -29,6 +29,7 @@ KERNEL_DEVICETREE =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am57xx-beagle-x15-revc.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am5729-beagleboneai.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am571x-idk.dtb \
>>> +=C2=A0=C2=A0=C2=A0 ov10635.dtbo \
>>
>> This change is not needed to get this overlay into the TI kernels.=C2=A0=
=20
>> This is already included in the KERNEL_DEVICETREE_PREFIX variable and=20
>> is part of the builds. The KERNEL_DEVICETREE is used to reference=20
>> files that are upstreamed, which is seems on quick glance, that this=20
>> overlay is not upstreamed.
>>
> Yes, this overlay is not upstreamed and present in ti kernels


are you ok to accept ti specific files , if yes I will send v2.

Thanks

Udit

>
>
>> Were you seeing a problem that this patch is seeking to resolve?
>
>
> I am not able to get this overlay as part of yocto build. So I am=20
> planning to export this dtbo into build
>
>
>>
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am572x-idk.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am574x-idk.dtb \
>>> =C2=A0 "
>>>
>>>
>>>
>>>
>>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17508): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17508
> Mute This Topic: https://lists.yoctoproject.org/mt/104860956/7571657
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [u-kumar1@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

