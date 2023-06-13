Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A803EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 15:03:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15606.1686668577542710879
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 08:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xl1COmXT;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35DF2tIw047672;
	Tue, 13 Jun 2023 10:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686668575;
	bh=xlor0EFIKFPtkPVU27XQSUrIZ2sWhcWuPIkIoN+SNAc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xl1COmXTEm0yOohT9vkgEBWJL+LJaQQrKN8H5hY11yGtf8QA6BfSlalG27NeNHeS1
	 4LEICjRB6swxHWUuTsv1scTxI6wbf+HQXlbcz6n4bB9uq7VYllP4bIu2Yup2snAkjq
	 3pJFW7RsJN1N/YxSoGeFxFfm/KCHAI6RSjagRBV4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35DF2tV5079273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jun 2023 10:02:55 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 10:02:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 10:02:54 -0500
Received: from [10.250.37.94] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35DF2riC128168;
	Tue, 13 Jun 2023 10:02:53 -0500
Message-ID: <6462ac4e-2d1e-6877-d051-ecf5cf004b6d@ti.com>
Date: Tue, 13 Jun 2023 10:02:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH 1/2] u-boot-ti-staging_2023.04: Copy
 bitmap file to boot partition for AM62x
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>,
        Nikhil <n-jain1@ti.com>
References: <20230609142901.2958733-1-devarsht@ti.com>
 <20230609142901.2958733-2-devarsht@ti.com>
 <e1371f0a-3dbe-6039-022b-d1b5ce403028@ti.com>
 <4bd83e0d-2678-8e0f-824e-7f58472346bf@ti.com>
 <b80ed67d-6b84-41c5-3106-01145e4c08ba@ti.com>
 <694f763e-6e33-5acc-1d6c-f6bdb4f506c1@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <694f763e-6e33-5acc-1d6c-f6bdb4f506c1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35DF2tIw047672
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jun 2023 15:03:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16714

On 6/13/23 6:50 AM, Devarsh Thakkar wrote:
> Hi Andrew,
>=20
> Thanks for the suggestions.
>=20
> On 09/06/23 20:18, Andrew Davis wrote:
>> On 6/9/23 9:40 AM, Devarsh Thakkar wrote:
>>> Hi Andrew,
>>>
>>> Thanks for the quick review.
>>>
>>> On 09/06/23 20:05, Andrew Davis wrote:
>>>> On 6/9/23 9:29 AM, Devarsh Thakkar wrote:
>>>>> Early splash screen support for AM62x has been enabled in u-boot
>>>>> and it requires ti.gz bitmap file to be present in boot partition
>>>>> as per the default environment settings done in u-boot [1].
>>>>>
>>>>> Copy ti.gz [2] to boot partition to enable out of box early display=
 on
>>>>> AM62x when it is flashed with the wic image compiled using TI's
>>>>> bsp.
>>>>>
>>>>> [1]
>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am6=
2x.env?h=3D09.00.00.001#n34
>>>>> [2]
>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/tools/logos/ti.gz?=
h=3Dti-u-boot-2023.04
>>>>>
>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>>> ---
>>>>>  =C2=A0=C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>>>>  =C2=A0=C2=A0 1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.=
04.bb
>>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>>> index 4bbb6433..5067e3c8 100644
>>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>>>>>  =C2=A0=C2=A0 =C2=A0 SRCREV =3D "d8e6f9178f6c80abff4ed2e9094001357b=
da40d4"
>>>>>  =C2=A0=C2=A0 +do_install:append:am62xx() {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti.gz ${D}/boo=
t
>>>>
>>>> Could you copy this over as ti_logo.gz or similar so we have some id=
ea of the
>>>> contents.
>>>>
>>>
>>> I agree with you regarding naming convention, but unfortunately I thi=
nk this
>>> file is already present in upstream as ti.gz [1] so we thought to sti=
ck with
>>> it and rather not change it in ti-u-boot.
>>>
>>
>> In u-boot it is in a folder called "logos", you are moving it into the
>> generic "boot" partition. Could you put it in /boot/logo/ti.gz instead=
?
>>
>=20
> Yeah, that also makes sense to me to have a logos directory if there is=
 a
> possibility of having multiple logos with different resolutions so that=
 user
> can choose based upon the connector being used.
>=20
> But this as well will require a change in u-boot's am62x.env file's spl=
ashfile
> variable, moreover I had to make a change in oe-core to allow installat=
ion of
> directories in boot partition for the same [1].
>=20
>=20
> Meanwhile I discussed with team here (Vignesh and Nikhil) and we agreed=
 to
> both rename the logo and have it in logos directory but we thought to d=
o the
> latter as a separate patch when [1] is available in kirkstone, until th=
en we
> thought it is better to just rename it as ti_logo_414x97.gz in boot par=
tition
>=20
> [1]
> https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_wic_b=
ootimg_add/99501427?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,99501=
427,previd%3D1686655986349989245,nextid%3D1686587607620747491&previd=3D16=
86655986349989245&nextid=3D1686587607620747491
>=20
> So is it ok to go ahead with ti_logo_414x97.gz in boot partition for no=
w
> and take logos directory change as a separate patch in future when [1] =
is
> available ?
>=20

Sounds good to me.

Andrew

> Regards
> Devarsh
>=20
>>> [1] https://github.com/u-boot/u-boot/blob/master/tools/logos/ti.gz
>>>
>>> Regards
>>> Devarsh
>>>
>>>> Andrew
>>>>
>>>>> +}
>>>>> +
>>>>> +do_deploy:append:am62xx() {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti.gz ${DEPLOY=
DIR}
>>>>> +}

