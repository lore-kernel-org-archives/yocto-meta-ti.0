Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B8AEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 13:58:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19219.1686837498409807059
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 06:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=y5VcyN2l;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FDwHmq020909;
	Thu, 15 Jun 2023 08:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686837497;
	bh=e1eb92sNTY6rNk5J/4PsfEbpGrFaFRyD2JWYGOIypQ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y5VcyN2lvTqzVaYDDV0OQwiaHN3RgeN1TsKWyIgqeG2WTHCWkTSnGiRtHcGCAtkzh
	 TpVURiqGLlyUjgagWtpbptopdZ/+XCa6zjRnd0HIcIfN/XNu8pjHG3JisHdeD/ZEe2
	 2xO/SH+yI3wBYJxwb8IEOECn6e/hzBo8r4P8CU6w=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FDwHhU028612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 08:58:17 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 08:58:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 08:58:16 -0500
Received: from [172.24.145.199] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FDwCbF015667;
	Thu, 15 Jun 2023 08:58:13 -0500
Message-ID: <9c179808-460e-02be-5598-d9651adee833@ti.com>
Date: Thu, 15 Jun 2023 19:28:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04:
 Copy bitmap file to boot partition for AM62x
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 35FDwHmq020909
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 13:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16731



On 15/06/23 19:06, Ryan Eatmon wrote:
>=20
>=20
> On 6/14/2023 9:33 AM, Devarsh Thakkar wrote:
>> Early splash screen support for AM62x has been enabled in u-boot
>> and it requires bitmap tarball to be present in boot partition
>> as per the default environment settings done in u-boot [1].
>>
>> Copy the ti logo bitmap tarball to boot partition of wic image in orde=
r
>> to enable out of box early display on AM62x.
>>
>> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am=
62x.env
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V2: Rename ti logo tarball as per suggested changes (same is being
>> =C2=A0=C2=A0=C2=A0=C2=A0 done in ti-u-boot too)
>> ---
>> =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>> =C2=A0 1 file changed, 9 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.=
bb
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> index e6da84cb..c948e1ed 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>> =C2=A0 =C2=A0 SRCREV =3D "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>> =C2=A0 +do_install:append:am62xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_32=
bpp.bmp.gz ${D}/boot
>> +}
>> +
>> +do_deploy:append:am62xx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_32=
bpp.bmp.gz ${DEPLOYDIR}
>> +}
>=20
>=20
> Denys,
>=20
> In the longer term, should this be in the u-boot.inc file and not in th=
e
> recipe itself?=C2=A0 That's were all of the other do_* appends are...
>=20

This I think is specific to u-boot 2023.04 version only as the logos were
recently added and are not available in previous versions of u-boot and h=
ence
I thought to have the changes in u-boot-ti-staging_2023.04.bb

Regards
Devarsh
>=20
>=20

