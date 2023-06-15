Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B22EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:09:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.19498.1686838188425524721
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ViDQHjg1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FE9l4j044008;
	Thu, 15 Jun 2023 09:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686838187;
	bh=+QtOrZPBVhJ3rHVfOv7DaCH/jHOBRzTq9x4ivuH2VIQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ViDQHjg16reLSJGmdXXZPjw1mFrkT1hQdj7t8eB++/M1Z4y7ChmeIweEGVvm7TxHv
	 uaXCMECUnhAlkBLKyri/euSfhrnRxRNXbaoeYrhnNenxVtiaTuuTHVB/5cB/4TyO4Y
	 5XgoL4ribNzssBJugKotT/VN8Kk5CSbMvh6LsbN8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FE9lJk004772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 09:09:47 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 09:09:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 09:09:46 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FE9kMA130897;
	Thu, 15 Jun 2023 09:09:46 -0500
Message-ID: <5cc5551a-dd79-cfcd-04b1-75ecb97cb2dc@ti.com>
Date: Thu, 15 Jun 2023 09:09:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04:
 Copy bitmap file to boot partition for AM62x
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
 <9c179808-460e-02be-5598-d9651adee833@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9c179808-460e-02be-5598-d9651adee833@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35FE9l4j044008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:09:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16732



On 6/15/2023 8:58 AM, Devarsh Thakkar wrote:
>=20
>=20
> On 15/06/23 19:06, Ryan Eatmon wrote:
>>
>>
>> On 6/14/2023 9:33 AM, Devarsh Thakkar wrote:
>>> Early splash screen support for AM62x has been enabled in u-boot
>>> and it requires bitmap tarball to be present in boot partition
>>> as per the default environment settings done in u-boot [1].
>>>
>>> Copy the ti logo bitmap tarball to boot partition of wic image in ord=
er
>>> to enable out of box early display on AM62x.
>>>
>>> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/a=
m62x.env
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>> V2: Rename ti logo tarball as per suggested changes (same is being
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 done in ti-u-boot too)
>>> ---
>>>  =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>>  =C2=A0 1 file changed, 9 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04=
.bb
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> index e6da84cb..c948e1ed 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>>>  =C2=A0 =C2=A0 SRCREV =3D "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>>>  =C2=A0 +do_install:append:am62xx() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_3=
2bpp.bmp.gz ${D}/boot
>>> +}
>>> +
>>> +do_deploy:append:am62xx() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_3=
2bpp.bmp.gz ${DEPLOYDIR}
>>> +}
>>
>>
>> Denys,
>>
>> In the longer term, should this be in the u-boot.inc file and not in t=
he
>> recipe itself?=C2=A0 That's were all of the other do_* appends are...
>>
>=20
> This I think is specific to u-boot 2023.04 version only as the logos we=
re
> recently added and are not available in previous versions of u-boot and=
 hence
> I thought to have the changes in u-boot-ti-staging_2023.04.bb

But they will be there going forward and the only other version is=20
mainline which is meant to track the latest of u-boot which=20
theoretically will contain the logos.

Maybe the best plan would be to create a ti-logos.inc and put these=20
statements in there and add an include to that file in the recipe.  Just=20
trying to keep the spirit of the recipe.  We can then not include the=20
logos in mainline if they are not working.


> Regards
> Devarsh
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

