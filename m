Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7C8CD68EF
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 04:23:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.83737.1696911803863213452
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 21:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=aRhWlSQZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39A4NKgc026463;
	Mon, 9 Oct 2023 23:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696911800;
	bh=VDxUnACkVoQcRK73Pyx7TZxXcfkIYhMKOa6DfTwN2b8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aRhWlSQZ5dMr0iMZ5ER27JfdNBPoolPw2buNlftoSEpxbhs2dm0KMGfF4LOnRKwGz
	 7s6JKBUr9GptKDZ3M9c/2VFBQqfXLgUJHMWcG3fuESLyh+0FnzoE2Xw+McSYv7XmZy
	 hwnOqQ9+V+cN9JFQP5L0pvagaa97dTgdYKuP2Tks=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39A4NKXB088435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 23:23:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 23:23:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 23:23:20 -0500
Received: from [172.24.227.83] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39A4NHSe074084;
	Mon, 9 Oct 2023 23:23:18 -0500
Message-ID: <ee69ff15-5dac-913b-b114-b9798a60f333@ti.com>
Date: Tue, 10 Oct 2023 09:53:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone][PATCH v3 1/2] preuth-fw: Remove packaging
 of PRU-ICSSM firmwares
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <srk@ti.com>,
        Ravi
 Gunasekaran <r-gunasekaran@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <20231009070926.21629-2-r-gunasekaran@ti.com>
 <20231009202027.GD2408@denix.org>
 <1086ef7c-d92e-4496-8a3f-38711fda8530@ti.com>
 <31adf88d-2cff-4121-8fb1-cd029347782d@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <31adf88d-2cff-4121-8fb1-cd029347782d@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 39A4NKgc026463
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Oct 2023 04:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17089



On 10/10/23 3:03 AM, Andrew Davis wrote:
> On 10/9/23 4:25 PM, Ryan Eatmon wrote:
>>
>>
>> On 10/9/2023 3:20 PM, Denys Dmytriyenko wrote:
>>> On Mon, Oct 09, 2023 at 12:39:25PM +0530, Ravi Gunasekaran via lists.=
yoctoproject.org wrote:
>>>> PRU-ICSS on AM33x, AM43x, supports different ethernet modes such
>>>> as Ethernet, HSR and PRP by means of different firmwares and the
>>>> driver loads one of the these firmware. The PRU-ICSS linux driver
>>>> may not be available for all kernel versions.
>>>>
>>>> So add an .inc file that avoids the packaging of such firmwares
>>>> in the SDK, so that it can be referenced by kernel recipes that
>>>> don't support PRU-ICSS.
>>>>
>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
>>>> =C2=A0 1 file changed, 3 insertions(+)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw=
.inc
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc b/meta-t=
i-bsp/recipes-kernel/linux/prueth-fw.inc
>>>> new file mode 100644
>>>> index 00000000..6698c9ed
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
>>>> @@ -0,0 +1,3 @@
>>>> +# Do not package firmwares for kernels that don't support PRUETH
>>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x =3D " prueth-fw p=
ruhsr-fw pruprp-fw"
>>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x =3D " prueth-fw p=
ruhsr-fw pruprp-fw"
>>>
>>> This is asking for trouble - there's no way to un-do :remove downstre=
am (e.g.
>>> any of the Distro, SDK, Product Line or Customer layers)
>>>
>>> It is not recommended to use :remove (and :append to a lesser degree)=
 on a
>>> regular basis when it can be done differently.
>>>
>>> Moreover, what is a difference from v2? It is a more convoluted way t=
o drop
>>> those FW images from getting installed, but it is still done uncondit=
ionally
>>> here in meta-ti - are there any benefits of doing it this way?
>>
>> =C2=A0From my understanding...=C2=A0=C2=A0 This firmware was supported=
 under 5.10.=C2=A0 It is not being supported for 6.1 but will be supporte=
d next year some time.
>>
>> So I was trying to communicate via the recipes that overall it is supp=
orted, but for this blip it is removed.
>>
>> Either way we are adding some odd conditionals to support the logic. T=
wo choices:
>>
>> 1) Enabled by default, disable in the kernels were it is not supported.
>> 2) Disabled by default, enable in 5.10 and in the future.
>>
>=20
> 3) Install firmware unconditionally
>=20
> linux-firmware has plenty of firmware shipped that different version of=
 the
> kernel can/cannot use. Why is this one little firmware so important to =
*not*
> ship right now?
>=20

The concern was raised by the Customer Apps team as the feature is not su=
pported. And the
presence of the firmwares may give an impression to the customer that fea=
ture is supported.

> Andrew
>=20
>> Thoughts?
>>
>>

--=20
Regards,
Ravi

