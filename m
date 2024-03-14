Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD461C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 18:51:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.857.1710442294226745930
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 11:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=M/9iRVUF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42EIpTrb029211;
	Thu, 14 Mar 2024 13:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710442289;
	bh=eJk55PK9GydcIbwyerXdDuH3CPtn7hpw+p1XQD/4Fo4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M/9iRVUFkTPyILyxXFOd/tABYjUSjzPvm4D7hnO/p5KmJEbNMZhrW/HgwQPaRkJYQ
	 lKAupl53AizhnLfTabtZdTa3ha8AwQ6tPc+zw8g/vkqIby8a/BSfiWO0OqTCrGhq/x
	 8t6Yq/LJALgs8pwbLD/RBaHxHHiqSbM4sZIQ4qZI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42EIpTUr111969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Mar 2024 13:51:29 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 13:51:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 13:51:28 -0500
Received: from [128.247.81.222] (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42EIpSik057422;
	Thu, 14 Mar 2024 13:51:28 -0500
Message-ID: <542fd913-da1d-38c4-084a-a8c36b51d668@ti.com>
Date: Thu, 14 Mar 2024 13:51:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] conf: machine: am57xx: export
 ov10635 camera device tree overlay
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, "Kumar, Udit" <u-kumar1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <sbellary@baylibre.com>,
        <sinthu.raja@mistralsolutions.com>
References: <20240312171132.1330699-1-u-kumar1@ti.com>
 <20240312215009.GL6072@denix.org>
 <712e0516-202a-4a47-905b-6edb5ab4f079@ti.com>
 <20240314183015.GN6072@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240314183015.GN6072@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 42EIpTrb029211
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 18:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17533


On 3/14/24 13:30, Denys Dmytriyenko wrote:
> On Wed, Mar 13, 2024 at 10:13:47AM +0530, Kumar, Udit wrote:
>> On 3/13/2024 3:20 AM, Denys Dmytriyenko wrote:
>>> On Tue, Mar 12, 2024 at 10:41:32PM +0530, Udit Kumar via lists.yoctop=
roject.org wrote:
>>>> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>>>> ---
>>>> Changelog:
>>>> Changes in v2:
>>>> 1) Updated subject of patch
>>>> 2) moved overlay to KERNEL_DEVICETREE_PREFIX
>>>> link to v1:
>>>> https://lore.kernel.org/all/20240311111359.1556157-1-u-kumar1@ti.com=
/
>>>>
>>>>   meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/=
conf/machine/am57xx-evm.conf
>>>> index 43a6a833..8bcf20ea 100644
>>>> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>>> @@ -10,6 +10,7 @@ SERIAL_CONSOLES =3D "115200;ttyS2"
>>>>   KERNEL_DEVICETREE_PREFIX =3D " \
>>>>       am57 \
>>>> +    ov10635 \
>>>>       ti/ov10635 \
>>> What is the difference between these 2 entries? Which one is correct?
>>
>> Kernel 5.10 is hosting inside ti folder (arch/arm/boot/dts/ti/ov10635.=
dts)
>>
>> whereas in 6.1 moved to base folder. (./arch/arm/boot/dts/ov10635.dtso=
)
> There's no 5.10 kernel in meta-ti any more.
>
That is very true.=C2=A0 I need to go through all of the machines and see=
 if=20
we can clean up anything as we move through the kernels. I'll take a=20
note to do that next week.


--=20
Ryan Eatmon reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS


