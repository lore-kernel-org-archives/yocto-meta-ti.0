Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F35DC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 15:14:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.62595.1683818064088068231
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 08:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=UEvhy0tT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BFEJSA050287;
	Thu, 11 May 2023 10:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683818059;
	bh=w8D3WvkbEL9AiQU1UymhVMcNaxhfoA3D79pN8sq5Pfc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UEvhy0tTOFA6xM7PQQqKe0muYqCj2wu3f7Zjk8mrqRNmmO+vlh3+YC1aF7B0pUkiD
	 t/E7ZMsE2CUS5NqKOo9PHl6yaZl/66ewnhZfjP6TQghOaajQkgWqqexcgzv3nWv2Ru
	 1IXt+Qi4pg+sTuXj/gP9NswIuqKa24eeQQvDNWc8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BFEJlc067667
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 10:14:19 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 10:14:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 10:14:18 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BFEIKv073479;
	Thu, 11 May 2023 10:14:18 -0500
Message-ID: <2f0984a9-eaf3-86d3-57a4-b3c8c49d0e54@ti.com>
Date: Thu, 11 May 2023 10:14:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-driver: enable
 bxs/8xe apm
Content-Language: en-US, en-US-large
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230508153330.327470-1-rs@ti.com>
 <f8a68f99-3f8b-28eb-12d1-1df6b0b3a348@ti.com>
 <b8e5e148-8864-c412-62a0-11892b006607@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <b8e5e148-8864-c412-62a0-11892b006607@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 34BFEJSA050287
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 15:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16509

On 5/8/23 10:47, Bajjuri, Praneeth wrote:
>=20
>=20
> On 5/8/2023 10:38 AM, Randolph Sapp via lists.yoctoproject.org wrote:
>> On 5/8/23 10:33, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Bump the src revision to enable the following features on Jacinto:
>>> =C2=A0=C2=A0=C2=A0=C2=A0- Active power managment
>>> =C2=A0=C2=A0=C2=A0=C2=A0- Power island control via firmware
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>> =C2=A0 .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.64=
04501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23=
.1.6404501.bb
>>> index f8489e80..daee230b 100644
>>> ---=20
>>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.64=
04501.bb
>>> +++=20
>>> b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.64=
04501.bb
>>> @@ -22,7 +22,7 @@ SRC_URI =3D=20
>>> "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhtt=
ps;
>>> =C2=A0 S =3D "${WORKDIR}/git"
>>> -SRCREV =3D "b69b689252a1158bff205603288ad12b9482770b"
>>> +SRCREV =3D "84e164c11ee8c734c58594eca5e74b86a6e6c612"
>>> =C2=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
>>> =C2=A0 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>>
>> Please note, this will break kernel 5.10 support until the following=20
>> patch set is merged:
>> https://serenity.dal.design.ti.com/patchwork/project/linux-patch-revie=
w/list/?series=3D4147
>=20
> Internal link :)

Point me to a public mirror of our patchworks instance then. :)

>=20
>=20
>>
>> And of course k6.1 has already taken the required patches into CICD so=
=20
>> the current kernel module is broken until this patch is merged. Are=20
>> you having fun? I know I am!
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16500):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/16500
>> Mute This Topic: https://lists.yoctoproject.org/mt/98763746/2167429
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [praneeth@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


