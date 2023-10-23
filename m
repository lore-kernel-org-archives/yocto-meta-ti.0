Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADD4C004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 13:56:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.121134.1698069397969963740
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 06:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Yg4aJgmx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NDuYAo045818;
	Mon, 23 Oct 2023 08:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698069394;
	bh=PDLQkW3fWrPJ5isinjvC03rLdGTwrYnl8ZoNZ9bxhvg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Yg4aJgmxl8JLTnP9Z9ElNGg/phrQjAYfgcK2Z2XwwOlhS83iJPbPGbO2hgBhFR7xq
	 8FTS4t9n7GALmqL/3RTIjV/+au1Gw7dwAKFUjgpyQWO1z8g0NhKkykUddPNDkwbysg
	 7dxDwhPSy7D/WUWQSiIK0sMpBbbeK0/5hF40cK0c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NDuYoC122214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 08:56:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 08:56:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 08:56:33 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NDuXoe051928;
	Mon, 23 Oct 2023 08:56:33 -0500
Message-ID: <8a4a7a3d-0b38-440e-a158-60ba15db1ffd@ti.com>
Date: Mon, 23 Oct 2023 08:56:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH v3 1/2] preuth-fw: Remove packaging
 of PRU-ICSSM firmwares
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <srk@ti.com>,
        <afd@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <20231009070926.21629-2-r-gunasekaran@ti.com>
 <20231009202027.GD2408@denix.org>
 <2ddee779-2ede-4ff0-8c20-fe8675fc8206@ti.com>
 <4d0b7f24-6473-5921-dc8a-841e3e64fa0e@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <4d0b7f24-6473-5921-dc8a-841e3e64fa0e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 39NDuYAo045818
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 13:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17165



On 10/22/2023 11:49 PM, Ravi Gunasekaran wrote:
>=20
>=20
> On 10/21/23 3:50 AM, Ryan Eatmon wrote:
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
>>>>  =C2=A0 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
>>>>  =C2=A0 1 file changed, 3 insertions(+)
>>>>  =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-f=
w.inc
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
>>
>> Ravi, I hate to ask this of you as most of the waffling is from me.
>>
>> But I agree with Denys.=C2=A0 I think what we need is the v2 patch, bu=
t with better wording (like what you have in v3) that explains the situat=
ion.
>>
>> Can you put together a new v4 that looks like that?
>>
>>
>=20
> Thanks for revisiting this patch.
>=20
> Based on Andrew's comment on installing the firmware unconditionally, I=
 informed the
> concerned parties that approach to selectively package firmwares is lit=
tle messy.
> It's been more than a week and haven't heard back anything.
>=20
> So I would like to drop this patch, unless there is a strong request fo=
r it.

Sounds good.  We can revisit later if needed.



--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

