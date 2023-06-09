Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4ECC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:41:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15133.1686321660389669603
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=aJ9AZZ49;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359Eexmv048800;
	Fri, 9 Jun 2023 09:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686321659;
	bh=s2feL3hwYnT6TZW+GnMioBDhAI0DXxv0ZJ8Y8R4L7B8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aJ9AZZ49aioqvcYhUZKep9Xpr1EehI/uasThzwMFJJzzhvtC0yGsbce0kbKM8loNs
	 tu31Pwe6HD3yS20+0ZSrkF3CtXncxxnbVxam+EL5X6pH323ffvgw/WQl5+r9sJbp1E
	 PD6GnoAmoSXuu4fF/RArF5r7+OHZ9OQiR+hAeGD8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359EexMx122621
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:40:59 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:40:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:40:58 -0500
Received: from [172.24.145.199] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359EesOj071197;
	Fri, 9 Jun 2023 09:40:55 -0500
Message-ID: <4bd83e0d-2678-8e0f-824e-7f58472346bf@ti.com>
Date: Fri, 9 Jun 2023 20:10:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH 1/2] u-boot-ti-staging_2023.04: Copy
 bitmap file to boot partition for AM62x
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>
References: <20230609142901.2958733-1-devarsht@ti.com>
 <20230609142901.2958733-2-devarsht@ti.com>
 <e1371f0a-3dbe-6039-022b-d1b5ce403028@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <e1371f0a-3dbe-6039-022b-d1b5ce403028@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 359Eexmv048800
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:41:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16704

Hi Andrew,

Thanks for the quick review.

On 09/06/23 20:05, Andrew Davis wrote:
> On 6/9/23 9:29 AM, Devarsh Thakkar wrote:
>> Early splash screen support for AM62x has been enabled in u-boot
>> and it requires ti.gz bitmap file to be present in boot partition
>> as per the default environment settings done in u-boot [1].
>>
>> Copy ti.gz [2] to boot partition to enable out of box early display on
>> AM62x when it is flashed with the wic image compiled using TI's
>> bsp.
>>
>> [1]
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.=
env?h=3D09.00.00.001#n34
>> [2]
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/tools/logos/ti.gz?h=3D=
ti-u-boot-2023.04
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>> =C2=A0 1 file changed, 9 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.=
bb
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> index 4bbb6433..5067e3c8 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>> =C2=A0 =C2=A0 SRCREV =3D "d8e6f9178f6c80abff4ed2e9094001357bda40d4"
>> =C2=A0 +do_install:append:am62xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti.gz ${D}/boot
>=20
> Could you copy this over as ti_logo.gz or similar so we have some idea =
of the
> contents.
>=20

I agree with you regarding naming convention, but unfortunately I think t=
his
file is already present in upstream as ti.gz [1] so we thought to stick w=
ith
it and rather not change it in ti-u-boot.

[1] https://github.com/u-boot/u-boot/blob/master/tools/logos/ti.gz

Regards
Devarsh

> Andrew
>=20
>> +}
>> +
>> +do_deploy:append:am62xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti.gz ${DEPLOYDIR=
}
>> +}

