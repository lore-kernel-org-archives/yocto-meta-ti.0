Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D746FC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 14:18:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.49415.1748009886077718078
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 07:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=gm7DagZw;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NEI4Ds2128605;
	Fri, 23 May 2025 09:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748009884;
	bh=hbHaV8DZcQw6CrPnnNbUM4+TuEIxZrlSnbf+CD67qjI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gm7DagZwdLbt12eN0js5SwM4rpTfuXvfi6hrviYzLvnrrCgtN0Tzc0pxpHIB6d86Y
	 NmnWCR0F/jLhUeFWEEWY4hn+Qpaz1C3J73NLvhNo/CDGhfgpfJJ+Ko+xepgDy7+Hzk
	 6FO+AQ0RSqKfXWzD9lpcGW9kGaBF9OxF8/cfRt54=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NEI4qV130802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 09:18:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 09:18:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 09:18:04 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54NEI1DU116922;
	Fri, 23 May 2025 09:18:02 -0500
Message-ID: <9ea60b5f-9982-43be-8384-277fb669aee0@ti.com>
Date: Fri, 23 May 2025 19:48:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] meta-ti-bsp: am62lxx: Do not
 deploy extra tiboot3.bin copy
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
References: <20250522210712.2106045-1-afd@ti.com>
 <de91211e-df51-4ff6-983b-fe600129c5e3@ti.com>
 <d5d335da-3247-4b1d-b091-8d99c0fefd82@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <d5d335da-3247-4b1d-b091-8d99c0fefd82@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 54NEI4Ds2128605
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 14:18:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18592

Hi Praneeth & Andrew,
On 23/05/25 19:42, Bajjuri, Praneeth wrote:
>
>
> On 5/23/2025 4:00 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
>> On 23/05/25 02:37, Andrew Davis via lists.yoctoproject.org wrote:
>>> For AM62L there is no GP and both HS sub-types are supported by the
>>> same TIFS. This means we do not need multiple versions of tiboot3.bin.
>>> So no need to deploy an additional version which is identical to the
>>> default tiboot3.bin already deployed.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


>>>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62lxx.inc | 3 ---
>>> =C2=A0 1 file changed, 3 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc=20
>>> b/meta-ti-bsp/conf/machine/include/am62lxx.inc
>>> index d3bc81df..b4f0b8c9 100644
>>> --- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
>>> @@ -3,9 +3,6 @@ SOC_FAMILY:append =3D ":am62lxx"
>>> =C2=A0 MACHINE_FEATURES +=3D "screen"
>>> -# Default tiboot3.bin on AM62L is for HS-FS
>>> -IMAGE_BOOT_FILES +=3D "tiboot3-am62lx-hs-fs-evm.bin"
>>
>>
>> I still see the current ti-u-boot-2025.01-next shipping the=20
>> |tiboot3-am62lx-hs-fs-evm.bin|[0]
>> Are we planning to drop that entry from=20
>> arch/arm/dts/k3-am62l3-evm-binman.dtsi as well ?
>>
>>
>> [0]:=20
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-am62l=
3-evm-binman.dtsi?h=3Dti-u-boot-2025.01-next&id=3D3d024809613c2a8f1d69258=
554ab8954d26537f5#n54
>
> Part of
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-2025.=
01-next&id=3D3f6b151073dcf1358cdafe5cb64a1329c60282ea=20



Thanks for the information!
Ack from my end.


--
Chirag


>
>
>
>>
>>
>> --=20
>> Chirag
>>
>>
>>> -
>>> =C2=A0 TFA_BOARD =3D "am62l"
>>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>>>
>>>
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18589):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18589
>> Mute This Topic: https://lists.yoctoproject.org/mt/113254992/2167429
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [praneeth@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

