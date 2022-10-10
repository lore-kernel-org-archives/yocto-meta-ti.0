Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4ECC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:11:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.7393.1665414700524475464
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=GgHcepSv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFBdWl074070
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665414700;
	bh=ijmuEKd58dlA/aNwW8RAt7fw5xrNAcPCrkpUKollYn0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GgHcepSvLP7MShIyP/fdlc8qTD6NlJn1/3Y8qGhkRfaWWIv2TNwJUTduFIDojr/DW
	 xsjDiHfsE9lmh+PmYZdp883azi8x3L/WFYHmlfcsJ85PSgk0QsCWVM+EdnucnMYogH
	 LyKGpbdPI3rvvyVZ1FfEzR6NaIUAyqBzNEPFOaWo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFBdaC046864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:11:39 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:11:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:11:39 -0500
Received: from [172.24.145.134] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFBbAE106345;
	Mon, 10 Oct 2022 10:11:38 -0500
Message-ID: <d84ea250-db3f-12ce-0337-3643eed51f1e@ti.com>
Date: Mon, 10 Oct 2022 20:41:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][dunfell PATCH 3/4] conf: machine: j721s2: Add OP-TEE
 flavour
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>
References: <20221010134649.20977-1-j-choudhary@ti.com>
 <20221010134649.20977-4-j-choudhary@ti.com>
 <d013d36b-adff-f4c1-7aea-e3ab3fe76e83@ti.com>
 <492de27f-bb13-22d1-e929-cd5ec0ae5e8b@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <492de27f-bb13-22d1-e929-cd5ec0ae5e8b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id
 29AFBdWl074070
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15125



On 10/10/22 20:37, Ryan Eatmon wrote:
>=20
>=20
> On 10/10/2022 9:26, Andrew Davis wrote:
>> On 10/10/22 8:46 AM, Jayesh Choudhary wrote:
>>> Add the new OP-TEE flavour for J721S2 instead of default k3-j721e.
>>> The TI-SCI ID for MCU domain sa2ul/sa3ul are not the same for
>>> J721E and J721S2. So a new flavour is added in upstream OP-TEE.
>>>
>>
>> You are not really adding a new flavor for J721S2 but rather
>> re-using J784s4 as they both use SA3UL. Would be better to
>> add a different commit message here to make that clear.
>=20
>=20
> On a similar note, it was bad enough that we used j721s2 for the j784s2=
=20
> since some things were not ready, but this patch goes the other way and=
=20
> uses j784s4 in in the j721s2 config...=C2=A0 Why are we doing that?=C2=A0=
 That=20
> seems really confusing.
>
> Are doing this because we are not upstreaming something to optee for=20
> j721s2 and are just reusing something from j784s4?
>=20

Yes Ryan,
sa3ul support has been added to upstream optee for j784s4 already.
For j721s2, no additional changes are required.
So we are reusing the same optee flavour.

-Jayesh


>=20
>> Otherwise the series LGTM,
>>
>> Acked-by: Andrew Davis <afd@ti.com>
>>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>> =C2=A0 conf/machine/j721s2-evm.conf | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.c=
onf
>>> index ba5e8def..ec9b7454 100644
>>> --- a/conf/machine/j721s2-evm.conf
>>> +++ b/conf/machine/j721s2-evm.conf
>>> @@ -9,6 +9,7 @@ MACHINE_FEATURES +=3D "gpu"
>>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS10"
>>> =C2=A0 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>>> =C2=A0 TFA_K3_USART =3D "0x8"
>>> +OPTEEMACHINE =3D "k3-j784s4"
>>> =C2=A0 OPTEE_K3_USART =3D "0x8"
>>> =C2=A0 KERNEL_DEVICETREE =3D " \
>=20

