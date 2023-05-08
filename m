Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0638EC77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 15:47:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.111224.1683560862247373605
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 May 2023 08:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=fyRst7Dx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 348FlZXc056673;
	Mon, 8 May 2023 10:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683560855;
	bh=t8+8iMAsvuJSacWdF/ksu13l2rnjX3CC8aNtqtFesQg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fyRst7DxQRlBi7rz52Jkwx+cGkzwCb9NW0of3iz6zx7ZeYVJzIBAdHYSX34v5X5v4
	 jznOBlTo4EVlvnsUJhMIghEWWaYWF0glntEEm81hnxqbAZT9GFPvbc8dTY0uSdZ3hm
	 TCLURv+LblbI29YlX44c7kQUvdMPTe2h30pZvLWk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 348FlZuI123863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 May 2023 10:47:35 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 May 2023 10:47:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 May 2023 10:47:35 -0500
Received: from [10.247.31.254] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 348FlZl8087387;
	Mon, 8 May 2023 10:47:35 -0500
Message-ID: <b8e5e148-8864-c412-62a0-11892b006607@ti.com>
Date: Mon, 8 May 2023 10:47:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-driver: enable
 bxs/8xe apm
To: <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>,
        <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230508153330.327470-1-rs@ti.com>
 <f8a68f99-3f8b-28eb-12d1-1df6b0b3a348@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <f8a68f99-3f8b-28eb-12d1-1df6b0b3a348@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 348FlZXc056673
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 May 2023 15:47:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16501



On 5/8/2023 10:38 AM, Randolph Sapp via lists.yoctoproject.org wrote:
> On 5/8/23 10:33, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Bump the src revision to enable the following features on Jacinto:
>> =C2=A0=C2=A0=C2=A0=C2=A0- Active power managment
>> =C2=A0=C2=A0=C2=A0=C2=A0- Power island control via firmware
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.640=
4501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.=
1.6404501.bb
>> index f8489e80..daee230b 100644
>> ---=20
>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.640=
4501.bb
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.640=
4501.bb
>> @@ -22,7 +22,7 @@ SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttp=
s;
>> =C2=A0 S =3D "${WORKDIR}/git"
>> -SRCREV =3D "b69b689252a1158bff205603288ad12b9482770b"
>> +SRCREV =3D "84e164c11ee8c734c58594eca5e74b86a6e6c612"
>> =C2=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
>> =C2=A0 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>=20
> Please note, this will break kernel 5.10 support until the following=20
> patch set is merged:
> https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review=
/list/?series=3D4147

Internal link :)


>=20
> And of course k6.1 has already taken the required patches into CICD so=20
> the current kernel module is broken until this patch is merged. Are you=
=20
> having fun? I know I am!
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16500): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16500
> Mute This Topic: https://lists.yoctoproject.org/mt/98763746/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

