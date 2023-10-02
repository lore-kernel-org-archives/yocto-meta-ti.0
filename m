Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08580E784BE
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 15:31:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.85158.1696260661819260397
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 08:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=cJVRBBC/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 392FV0Zx050014;
	Mon, 2 Oct 2023 10:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696260660;
	bh=8jz9FCgmxBqTiKrv8uqy1G4NjGaIx30f9eL9KiNC/d4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cJVRBBC/+kQ9gFvtbov5J01/KZlqaS6enKj2zLKkZPsZuGf1Qjew+LT6D1jicSXdz
	 /HBtkvudaaegLYiEo/jWz/TGMd/xNRIFbSI0vNKYCvybqDsCKRfGGQAGVAu13S3JZ1
	 p0A8cu3+22N7ZI8F4mqcxKD5wgf36vNL0W7FmytA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 392FV0We015351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Oct 2023 10:31:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Oct 2023 10:30:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Oct 2023 10:30:59 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 392FUxp6052318;
	Mon, 2 Oct 2023 10:30:59 -0500
Message-ID: <34336d8c-86e3-df50-ff28-3c5632e4479e@ti.com>
Date: Mon, 2 Oct 2023 10:30:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [meta-ti] [master/kirkstone] u-boot-ti: Fix SPL binary name for
 SD/MMC media on HS boards
Content-Language: en-US
To: Julien Panis <jpanis@baylibre.com>, <meta-ti@lists.yoctoproject.org>
References: <20230929122555.10794-1-jpanis@baylibre.com>
 <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 392FV0Zx050014
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Oct 2023 15:31:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17041

On 10/2/23 9:06 AM, Julien Panis wrote:
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
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bs=
p/recipes-bsp/u-boot/u-boot-ti.inc
>> index d9a3a520e857..9ca0fb44d127 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -100,9 +100,9 @@ UBOOT_HS_XLD_IMAGE =3D "u-boot-spl_HS_X-LOADER-${M=
ACHINE}-${PV}-${PR}"
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
e Devices.
> So, maybe this name was used intentionally...(?)
>=20

On Keystone2 HS, we do not use SPL, so the ROM loaded image (MLO) is the
normal U-Boot image, we name it u-boot_HS_MLO. For others that do use SPL
the ROM image is the SPL, and it is called u-boot-spl_HS_MLO.

So this patch has the right idea, just we should add another deployed ima=
ge
var in addition to this one, not replace it, maybe:

SPL_HS_MLO_BINARY =3D "u-boot-spl_HS_MLO"
...

Andrew

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17039): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17039
> Mute This Topic: https://lists.yoctoproject.org/mt/101656237/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

