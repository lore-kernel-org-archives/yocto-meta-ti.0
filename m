Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261B3EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:32:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.62526.1694446370058537736
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 08:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=r5iGQ3AH;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38BFWmoX072520
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 10:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694446368;
	bh=1LR73UHTvZIBReJqTcF7OZOCknFu/bVKa4qkfQjJd60=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=r5iGQ3AHgY0EjwYihR9uqw92czMNtij6G9VCGsOB2JVeQi/7veAtYYMfauM2ZmVcg
	 zoS1lOwiMI7VSwLJYpCxeworZD36ZMq1z62CGLsecMFlVVtDtuU3z5EqVALwWsa9h4
	 SmN8U+BxUBBdL6l9XahjKl/JZC8okLIpo/ptX+gA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38BFWmr4013171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 10:32:48 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Sep 2023 10:32:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Sep 2023 10:32:47 -0500
Received: from [10.249.36.168] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38BFWlZP060690;
	Mon, 11 Sep 2023 10:32:47 -0500
Message-ID: <c9ad8147-1d29-c288-3272-06973626eb78@ti.com>
Date: Mon, 11 Sep 2023 10:32:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <srk@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
 <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 38BFWmoX072520
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 15:32:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16946



On 9/10/2023 11:28 PM, Ravi Gunasekaran wrote:
> Andrew,
>=20
> On 9/8/23 7:49 PM, Andrew Davis wrote:
>> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote:
>>> Remove the PRU Ethernet firmwares from being packaged for
>>> AM33x, AM43x and AM57x.
>>>
>>
>> Commit messages should give the "why", we can read the code.
>=20
> I will provide reasoning in the v2.
>=20
>>
>> Are we dropping support for PRUETH from these boards? I still
>> use this, I'm sure others do too.
>>
>=20
> PRUETH drivers for these devices are not upstreamed and PRUTETH will no=
t
> be supported in SDK 9.1 as well. Plan to upstream and port to SDK is st=
ill
> being worked on. So I wanted to remove these firmwares from being packa=
ged.

What does upstreaming support have to do with this?  The drivers are=20
available in what are we ship now.  And if people are currently using=20
this software today then removing it seems like the wrong thing to do.=20
What am I missing?


>> Andrew
>>
>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>> ---
>>> Changes from v1:
>>> --------------
>>> * Corrected the commit message.
>>>
>>>  =C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
>>>  =C2=A0 1 file changed, 3 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/m=
eta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> index 266a7ef5..317ab1b1 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =
=3D " vpdma-fw"
>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " good=
ix-fw"
>>>  =C2=A0 =C2=A0 # Add run-time dependency for PRU Ethernet firmware to=
 the rootfs
>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw p=
rusw-fw pruhsr-fw pruprp-fw"
>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw pr=
uhsr-fw pruprp-fw"
>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw pr=
uhsr-fw pruprp-fw"
>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " prue=
th-fw-am65x"
>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D " =
prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D " prue=
th-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>
>>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#16932): https://lists.yoctoproject.org/g/meta-ti/=
message/16932
>>> Mute This Topic: https://lists.yoctoproject.org/mt/101234600/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.c=
om]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

