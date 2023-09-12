Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9953CA0EC9
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:44:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.18296.1694493855643454151
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nqagXpLA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38C4iEXt039196
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 23:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694493854;
	bh=n3tr1CEY+0qjQ7In6LdJGclZc7FCFeTtUwCPBugpi2k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nqagXpLAVymdGUlVWFuz9lZUcv4+LM6vZHs/rZCMqYr45ZhV1mT4duDEEHNe/N8Qk
	 9yf+BqIQzoIjon+1LNk1YYv8QADH+25xgIXhP0vfa55Vqf33JjsGwWV6Da7e3FYzRX
	 mr/IQq30Ga2+Sy37zb2rmLuFWdpeLCQBfV2OCBEg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38C4iEmj060883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 23:44:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Sep 2023 23:44:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Sep 2023 23:44:14 -0500
Received: from [172.24.227.83] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38C4iChf019649;
	Mon, 11 Sep 2023 23:44:12 -0500
Message-ID: <627617d6-c35b-8dad-ea41-10959ae6cf99@ti.com>
Date: Tue, 12 Sep 2023 10:14:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <srk@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
 <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
 <c9ad8147-1d29-c288-3272-06973626eb78@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <c9ad8147-1d29-c288-3272-06973626eb78@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 38C4iEXt039196
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:44:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16950



On 9/11/23 9:02 PM, Ryan Eatmon wrote:
>=20
>=20
> On 9/10/2023 11:28 PM, Ravi Gunasekaran wrote:
>> Andrew,
>>
>> On 9/8/23 7:49 PM, Andrew Davis wrote:
>>> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote:
>>>> Remove the PRU Ethernet firmwares from being packaged for
>>>> AM33x, AM43x and AM57x.
>>>>
>>>
>>> Commit messages should give the "why", we can read the code.
>>
>> I will provide reasoning in the v2.
>>
>>>
>>> Are we dropping support for PRUETH from these boards? I still
>>> use this, I'm sure others do too.
>>>
>>
>> PRUETH drivers for these devices are not upstreamed and PRUTETH will n=
ot
>> be supported in SDK 9.1 as well. Plan to upstream and port to SDK is s=
till
>> being worked on. So I wanted to remove these firmwares from being pack=
aged.
>=20
> What does upstreaming support have to do with this?=C2=A0 The drivers a=
re available in what are we ship now.=C2=A0 And if people are currently u=
sing this software today then removing it seems like the wrong thing to d=
o. What am I missing?

By "what we ship now", do you mean in the SDK? The drivers will be not pr=
esent in SDK 9.x refresh release for these devices.
So I didn't want these firmwares to be packaged as it might give an impre=
ssion that we somehow support the feature.
If there is any other way to prevent the packaging of these firmwares in =
the SDK, please let me know.=20

>=20
>=20
>>> Andrew
>>>
>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>> ---
>>>> Changes from v1:
>>>> --------------
>>>> * Corrected the commit message.
>>>>
>>>> =C2=A0=C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | =
3 ---
>>>> =C2=A0=C2=A0 1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/=
meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> index 266a7ef5..317ab1b1 100644
>>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx=
 =3D " vpdma-fw"
>>>> =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D =
" goodix-fw"
>>>> =C2=A0=C2=A0 =C2=A0 # Add run-time dependency for PRU Ethernet firmw=
are to the rootfs
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw =
prusw-fw pruhsr-fw pruprp-fw"
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw p=
ruhsr-fw pruprp-fw"
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw p=
ruhsr-fw pruprp-fw"
>>>> =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D =
" prueth-fw-am65x"
>>>> =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =
=3D " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>> =C2=A0=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D =
" prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>>
>>>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
>>>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#16932): https://lists.yoctoproject.org/g/meta-ti=
/message/16932
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/101234600/3619733
>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.=
com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>
>=20

--=20
Regards,
Ravi

