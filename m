Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC3E784B9
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 14:46:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.83741.1696257999888769217
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 07:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=EOP1R2Cd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 392EkbxO022815;
	Mon, 2 Oct 2023 09:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696257997;
	bh=fQ4Axm1FjrkT02KZsH7H8w4bgRIwV7J4yQcYqiJKQuo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EOP1R2Cdj26Vw9ho3EOskuxKXTwoI5+9c5ioCH+coBmwUFMOGaa468up4fw+jBErp
	 11e92ZGB188UXV9MgitH5sznfamYsQJQIJ78l78dvJQuBhrWeDIKY+QjLc4kia9pI2
	 ZSp7l46LZMH3Hiiq9RFE6FS4iSXCENu2/PdGAPjU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 392EkbFw016930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Oct 2023 09:46:37 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Oct 2023 09:46:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Oct 2023 09:46:37 -0500
Received: from [10.250.34.24] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 392EkbMf008071;
	Mon, 2 Oct 2023 09:46:37 -0500
Message-ID: <592d7a9a-5e23-4d19-91b7-42f631a425ad@ti.com>
Date: Mon, 2 Oct 2023 09:46:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone] u-boot-ti: Fix SPL binary name for
 SD/MMC media on HS boards
To: Julien Panis <jpanis@baylibre.com>, <meta-ti@lists.yoctoproject.org>
References: <20230929122555.10794-1-jpanis@baylibre.com>
 <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 392EkbxO022815
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Oct 2023 14:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17040



On 10/2/2023 9:06 AM, Julien Panis wrote:
> On 9/29/23 14:25, Julien Panis wrote:
>> The SPL binary built by u-boot for SD/MMC/eMMC media on HS platforms i=
s
>> u-boot-spl_HS_MLO. Thanks to this fix, the binary is properly installe=
d
>> and deployed.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index d9a3a520e857..9ca0fb44d127 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -100,9 +100,9 @@ UBOOT_HS_XLD_IMAGE =3D=20
>> "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
>> =C2=A0 UBOOT_HS_XLD_SYMLINK =3D "u-boot-spl_HS_X-LOADER-${MACHINE}"
>> =C2=A0 # HS MLO
>> -UBOOT_HS_MLO_BINARY =3D "u-boot_HS_MLO"
>> -UBOOT_HS_MLO_IMAGE =3D "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
>> -UBOOT_HS_MLO_SYMLINK =3D "u-boot_HS_MLO-${MACHINE}"
>> +UBOOT_HS_MLO_BINARY =3D "u-boot-spl_HS_MLO"
>> +UBOOT_HS_MLO_IMAGE =3D "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
>> +UBOOT_HS_MLO_SYMLINK =3D "u-boot-spl_HS_MLO-${MACHINE}"
>> =C2=A0 # HS ISSW
>> =C2=A0 UBOOT_HS_ISSW_BINARY =3D "u-boot-spl_HS_ISSW"
>=20
> I'm not sure that this patch should be applied actually.
> In doc/README.ti-secure, u-boot_HS_MLO is mentioned for Keystone2 Secur=
e=20
> Devices.
> So, maybe this name was used intentionally...(?)

Ok.  I'll stop testing it and wait for further feedback.


>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17039): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17039
> Mute This Topic: https://lists.yoctoproject.org/mt/101656237/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

