Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE219C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 15:05:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.65183.1710169543760581012
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 08:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=idG2LQrY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: u-kumar1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BF5g7J047969;
	Mon, 11 Mar 2024 10:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710169542;
	bh=q1guhkUmb4e8/C3WGNsFbFsqBsVKgNDDjgr2xYokNJc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=idG2LQrY9c6F2MpYRhu6Zdx0Q5gCsrHNSUaYNQKphejZ2mDRcN14P2Ivldkr6lLuy
	 euPu18hi0+eYhGzUgWOkPhBZVEQxDAJmweKPjPKDoK33gc0vrRcEkdIXOZ+PTjVwqK
	 5bfk6/8TdxFpZEGbIWr8C8sOdn/jqjR1oYhlQAZA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BF5gJS087573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Mar 2024 10:05:42 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 10:05:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 10:05:42 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BF5bwm060399;
	Mon, 11 Mar 2024 10:05:40 -0500
Message-ID: <1b823d79-d68f-4a0f-b8aa-0f258c6bb1a0@ti.com>
Date: Mon, 11 Mar 2024 20:35:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH] export ov10635 camera device tree overlay
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <sbellary@baylibre.com>, <sinthu.raja@mistralsolutions.com>
References: <20240311111359.1556157-1-u-kumar1@ti.com>
 <56ceda24-b8b5-4074-80bc-cd800ab18321@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <56ceda24-b8b5-4074-80bc-cd800ab18321@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 42BF5g7J047969
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 15:05:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17508

Hi Ryan

On 3/11/2024 6:05 PM, Ryan Eatmon wrote:
>
> We typically put the file grouping of the change in the commit=20
> message. For example:
>
> conf: machine: am57xx: export ov10635 camera device tree overlay
>
>
> On 3/11/2024 6:14 AM, Udit Kumar via lists.yoctoproject.org wrote:
>> Adding ov10635 camera overlay in default build
>>
>>
>> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> index 43a6a833..9a06e801 100644
>> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> @@ -29,6 +29,7 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am57xx-beagle-x15-revc.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am5729-beagleboneai.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am571x-idk.dtb \
>> +=C2=A0=C2=A0=C2=A0 ov10635.dtbo \
>
> This change is not needed to get this overlay into the TI kernels.=C2=A0=
=20
> This is already included in the KERNEL_DEVICETREE_PREFIX variable and=20
> is part of the builds.=C2=A0 The KERNEL_DEVICETREE is used to reference=
=20
> files that are upstreamed, which is seems on quick glance, that this=20
> overlay is not upstreamed.
>
Yes, this overlay is not upstreamed and present in ti kernels


> Were you seeing a problem that this patch is seeking to resolve?


I am not able to get this overlay as part of yocto build. So I am=20
planning to export this dtbo into build


>
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am572x-idk.dtb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am574x-idk.dtb \
>> =C2=A0 "
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17505):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/17505
>> Mute This Topic: https://lists.yoctoproject.org/mt/104860956/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [reatmon@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

