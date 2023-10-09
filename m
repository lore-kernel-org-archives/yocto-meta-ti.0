Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4588BCD613D
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 21:33:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.75874.1696887229008252815
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 14:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Bv/mdoxX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399LXkxH053946;
	Mon, 9 Oct 2023 16:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696887226;
	bh=Ib/DkD6T5XPNIW9SRCd0i8U9VtP0V12O5yCHm0EO/iw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Bv/mdoxXz/mlfwLwM76dR4G5JIVQ8Dvy/E0UYtQI5XrFF4CU+M02grGTHha8CqTqx
	 dgLO5njxDlW1KdSi9o33jSq7hu3p1bfdJs3SYwjkmH7aWobBc1mTXyAl6/cTa41nCq
	 4RXSYf0iPIElTnLt3k56HsX8EybfM1N4QJtLofUY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399LXkpp062021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 16:33:46 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 16:33:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 16:33:46 -0500
Received: from [10.250.38.120] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399LXjXt087350;
	Mon, 9 Oct 2023 16:33:45 -0500
Message-ID: <31adf88d-2cff-4121-8fb1-cd029347782d@ti.com>
Date: Mon, 9 Oct 2023 16:33:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH v3 1/2] preuth-fw: Remove packaging
 of PRU-ICSSM firmwares
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <r-gunasekaran@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <srk@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <20231009070926.21629-2-r-gunasekaran@ti.com>
 <20231009202027.GD2408@denix.org>
 <1086ef7c-d92e-4496-8a3f-38711fda8530@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1086ef7c-d92e-4496-8a3f-38711fda8530@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 399LXkxH053946
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 21:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17087

On 10/9/23 4:25 PM, Ryan Eatmon wrote:
>=20
>=20
> On 10/9/2023 3:20 PM, Denys Dmytriyenko wrote:
>> On Mon, Oct 09, 2023 at 12:39:25PM +0530, Ravi Gunasekaran via lists.y=
octoproject.org wrote:
>>> PRU-ICSS on AM33x, AM43x, supports different ethernet modes such
>>> as Ethernet, HSR and PRP by means of different firmwares and the
>>> driver loads one of the these firmware. The PRU-ICSS linux driver
>>> may not be available for all kernel versions.
>>>
>>> So add an .inc file that avoids the packaging of such firmwares
>>> in the SDK, so that it can be referenced by kernel recipes that
>>> don't support PRU-ICSS.
>>>
>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
>>> =C2=A0 1 file changed, 3 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.=
inc
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc b/meta-ti=
-bsp/recipes-kernel/linux/prueth-fw.inc
>>> new file mode 100644
>>> index 00000000..6698c9ed
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
>>> @@ -0,0 +1,3 @@
>>> +# Do not package firmwares for kernels that don't support PRUETH
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x =3D " prueth-fw pr=
uhsr-fw pruprp-fw"
>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x =3D " prueth-fw pr=
uhsr-fw pruprp-fw"
>>
>> This is asking for trouble - there's no way to un-do :remove downstrea=
m (e.g.
>> any of the Distro, SDK, Product Line or Customer layers)
>>
>> It is not recommended to use :remove (and :append to a lesser degree) =
on a
>> regular basis when it can be done differently.
>>
>> Moreover, what is a difference from v2? It is a more convoluted way to=
 drop
>> those FW images from getting installed, but it is still done unconditi=
onally
>> here in meta-ti - are there any benefits of doing it this way?
>=20
>  From my understanding...=C2=A0=C2=A0 This firmware was supported under=
 5.10.=C2=A0 It is not being supported for 6.1 but will be supported next=
 year some time.
>=20
> So I was trying to communicate via the recipes that overall it is suppo=
rted, but for this blip it is removed.
>=20
> Either way we are adding some odd conditionals to support the logic. Tw=
o choices:
>=20
> 1) Enabled by default, disable in the kernels were it is not supported.
> 2) Disabled by default, enable in 5.10 and in the future.
>=20

3) Install firmware unconditionally

linux-firmware has plenty of firmware shipped that different version of t=
he
kernel can/cannot use. Why is this one little firmware so important to *n=
ot*
ship right now?

Andrew

> Thoughts?
>=20
>=20

