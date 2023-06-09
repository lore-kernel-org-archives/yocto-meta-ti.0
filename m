Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D95AC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:48:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15288.1686322082814653615
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SrrwldJG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359Em1vA010020;
	Fri, 9 Jun 2023 09:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686322081;
	bh=c4BdC2LBp/Sxyst9ic7C8sN7UFz7gFYfyT1O1j6vtL0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SrrwldJGyNtDGOhd72bNIDZc6kri7apZNfu1Mpz5t+1U/kmuztwPZ+2Zc2rPvaf4s
	 pGURnD6guHdX29vgkgZ37CDO+aNyPb2sgsJHygQ9k/nOmPnmAIN+oPUYnRsufM9dmO
	 DvJG7kJK0BhmwB3kA+v3bZEQPL3kQOl+Al1qDkWE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359Em1dW021843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:48:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:48:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:48:01 -0500
Received: from [10.250.37.94] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359Em0s0029096;
	Fri, 9 Jun 2023 09:48:00 -0500
Message-ID: <b80ed67d-6b84-41c5-3106-01145e4c08ba@ti.com>
Date: Fri, 9 Jun 2023 09:48:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH 1/2] u-boot-ti-staging_2023.04: Copy
 bitmap file to boot partition for AM62x
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>
References: <20230609142901.2958733-1-devarsht@ti.com>
 <20230609142901.2958733-2-devarsht@ti.com>
 <e1371f0a-3dbe-6039-022b-d1b5ce403028@ti.com>
 <4bd83e0d-2678-8e0f-824e-7f58472346bf@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4bd83e0d-2678-8e0f-824e-7f58472346bf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 359Em1vA010020
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16705

On 6/9/23 9:40 AM, Devarsh Thakkar wrote:
> Hi Andrew,
>=20
> Thanks for the quick review.
>=20
> On 09/06/23 20:05, Andrew Davis wrote:
>> On 6/9/23 9:29 AM, Devarsh Thakkar wrote:
>>> Early splash screen support for AM62x has been enabled in u-boot
>>> and it requires ti.gz bitmap file to be present in boot partition
>>> as per the default environment settings done in u-boot [1].
>>>
>>> Copy ti.gz [2] to boot partition to enable out of box early display o=
n
>>> AM62x when it is flashed with the wic image compiled using TI's
>>> bsp.
>>>
>>> [1]
>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x=
.env?h=3D09.00.00.001#n34
>>> [2]
>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/tools/logos/ti.gz?h=3D=
ti-u-boot-2023.04
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>>  =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>>  =C2=A0 1 file changed, 9 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04=
.bb
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> index 4bbb6433..5067e3c8 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>>>  =C2=A0 =C2=A0 SRCREV =3D "d8e6f9178f6c80abff4ed2e9094001357bda40d4"
>>>  =C2=A0 +do_install:append:am62xx() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti.gz ${D}/boot
>>
>> Could you copy this over as ti_logo.gz or similar so we have some idea=
 of the
>> contents.
>>
>=20
> I agree with you regarding naming convention, but unfortunately I think=
 this
> file is already present in upstream as ti.gz [1] so we thought to stick=
 with
> it and rather not change it in ti-u-boot.
>=20

In u-boot it is in a folder called "logos", you are moving it into the
generic "boot" partition. Could you put it in /boot/logo/ti.gz instead?

> [1] https://github.com/u-boot/u-boot/blob/master/tools/logos/ti.gz
>=20
> Regards
> Devarsh
>=20
>> Andrew
>>
>>> +}
>>> +
>>> +do_deploy:append:am62xx() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti.gz ${DEPLOYDI=
R}
>>> +}

