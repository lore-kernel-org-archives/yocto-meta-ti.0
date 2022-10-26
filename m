Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B583EC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 00:33:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1812.1666744391256047142
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 17:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=q60DHIpr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29Q0X8Bv027762;
	Tue, 25 Oct 2022 19:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666744388;
	bh=+EcVoRIkSy3lgj0aooRhw/ip/R+r74jEX+s7wN3fpAQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=q60DHIpr4LQcBTGgc9EJu37nSte2LmccMQKVUwkXCM+NOOAzNk9xgOLWYGn0dyrUc
	 mUwrqBd+ThtYLAn6Vlxb4k/JIGlwZhzTjrW3UALczrRU/H549+Py6sX2+5gfBIwUQ6
	 YECA2ZqRugwWFNIAIN5+w3hYgm4vdkke/CLBzo4Y=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29Q0X8GF124331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Oct 2022 19:33:08 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 25
 Oct 2022 19:33:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 25 Oct 2022 19:33:07 -0500
Received: from [10.247.29.70] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29Q0X7C6006560;
	Tue, 25 Oct 2022 19:33:07 -0500
Message-ID: <40dc3283-3d65-bce5-2621-d8599384def1@ti.com>
Date: Tue, 25 Oct 2022 19:33:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [dunfell PATCH] cnm-wave-fw: update firmware name to
 wave521c_k3_codec_fw.bin
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20221025224919.17617-1-praneeth@ti.com>
 <1cfc86e9-dbb5-f275-1c5c-7ae8404183b7@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <1cfc86e9-dbb5-f275-1c5c-7ae8404183b7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 29Q0X8Bv027762
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 00:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15201



On 10/25/2022 6:02 PM, Ryan Eatmon wrote:
>=20
>=20
> On 10/25/2022 17:49, Praneeth Bajjuri wrote:
>> update firmware name to wave521c_k3_codec_fw.bin to align with
>> linux-firmware main branch. the following patch is part of
>> ti-linux-firmware thru mainline sync.
>>
>> commit 48407ffd ("cnm: update chips&media wave521c firmware.")
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>> =C2=A0 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=20
>> b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> index b5ad3e31..75b8ce21 100644
>> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> @@ -21,9 +21,9 @@ S =3D "${WORKDIR}/git"
>> =C2=A0 TARGET_WAVE521C =3D "wave521c_codec_fw.bin"
>> =C2=A0 SOURCE_WAVE521C =3D "wave521c_codec_fw.bin"
>> -SOURCE_WAVE521C_j721s2-evm =3D "wave521c_j721s2_codec_fw.bin"
>> -SOURCE_WAVE521C_j721s2-hs-evm =3D "wave521c_j721s2_codec_fw.bin"
>> -SOURCE_WAVE521C_j784s4-evm =3D "wave521c_j721s2_codec_fw.bin"
>> +SOURCE_WAVE521C_j721s2-evm =3D "wave521c_k3_codec_fw.bin"
>> +SOURCE_WAVE521C_j721s2-hs-evm =3D "wave521c_k3_codec_fw.bin"
>> +SOURCE_WAVE521C_j784s4-evm =3D "wave521c_k3_codec_fw.bin"
>=20
>=20
> I'm going to say No to this patch.=C2=A0 The only reason I set the file=
 up=20
> the way I did was because of the name of the orig file:=20
> wave521c_j721s2_codec_fw.bin
>=20
> If all of the platforms will now use the same file, then I would rather=
=20
> eliminate the machine overrides and just change the default setting for=
=20
> SOURCE_WAVE521C to be the "correct" value.
>=20
> I'll put out an alternative patch here in a few minutes.

Thanks for quick review. Sounds good to me.


>=20
>=20
>=20
>> =C2=A0 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D=20
>> "${base_libdir}/firmware/${TARGET_WAVE521C}"
>> =C2=A0 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D=20
>> "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
>=20

