Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFEEEB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:17:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19678.1686838667941455948
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=skHTTL24;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FEHife026849;
	Thu, 15 Jun 2023 09:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686838664;
	bh=PzidJMKXp0TmtYYauMkEOkM6RkMmNC2M8FgZJgArWH0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=skHTTL24jfBTXOdgTTFY5ex0/drwAwD7hTm3oQD7KW3r78VBQyczxfLJKSD/cZKN7
	 gL2zfqv1yMmYZq7YAYI+RPRFA0EQ04JqG9FUdoOySFYnaADcVb3tlRIdDvQSDjV2ZA
	 z76DYy9WF3F5hX+gKpb+as5GCfAmwDtHs7BM9Dhc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FEHiYB083898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 09:17:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 09:17:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 09:17:43 -0500
Received: from [172.24.145.199] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FEHdCJ008112;
	Thu, 15 Jun 2023 09:17:40 -0500
Message-ID: <00807bf5-9d10-458b-e55a-4ca0f0e76abf@ti.com>
Date: Thu, 15 Jun 2023 19:47:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04:
 Copy bitmap file to boot partition for AM62x
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denys@konsulko.com>,
        <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
 <20230615141055.GB1518@denix.org>
 <a497d65c-5798-9e23-0259-b33b36feccb3@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <a497d65c-5798-9e23-0259-b33b36feccb3@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 35FEHife026849
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16735



On 15/06/23 19:42, Ryan Eatmon wrote:
>=20
>=20
> On 6/15/2023 9:10 AM, Denys Dmytriyenko wrote:
>> On Thu, Jun 15, 2023 at 08:36:36AM -0500, Ryan Eatmon via
>> lists.yoctoproject.org wrote:
>>>
>>>
>>> On 6/14/2023 9:33 AM, Devarsh Thakkar wrote:
>>>> Early splash screen support for AM62x has been enabled in u-boot
>>>> and it requires bitmap tarball to be present in boot partition
>>>> as per the default environment settings done in u-boot [1].
>>>>
>>>> Copy the ti logo bitmap tarball to boot partition of wic image in or=
der
>>>> to enable out of box early display on AM62x.
>>>>
>>>> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/=
am62x.env
>>>>
>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>> ---
>>>> V2: Rename ti logo tarball as per suggested changes (same is being
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 done in ti-u-boot too)
>>>> ---
>>>> =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>>> =C2=A0 1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.0=
4.bb
>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>> index e6da84cb..c948e1ed 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>>>> =C2=A0 SRCREV =3D "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>>>> +do_install:append:am62xx() {
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_=
32bpp.bmp.gz ${D}/boot
>>>> +}
>>>> +
>>>> +do_deploy:append:am62xx() {
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_=
32bpp.bmp.gz
>>>> ${DEPLOYDIR}
>>>> +}
>>>
>>>
>>> Denys,
>>>
>>> In the longer term, should this be in the u-boot.inc file and not in
>>> the recipe itself?=C2=A0 That's were all of the other do_* appends ar=
e...
>>
>> In the longer term I was going to ask if this logo should be enabled f=
or
>> all TI platforms, instead of just am62x?
>=20
> Valid question.
>=20

I am not sure about all but I see it as possibility for many TI K3 platfo=
rms
having display support displaying logo during bootup in future, although =
they
may use different files for logo depending upon resolution, memory e.t.c.

Regards
Devarsh
>=20

