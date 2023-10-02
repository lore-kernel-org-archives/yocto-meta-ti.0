Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ED9E748F8
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 16:44:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.87189.1696265084826029756
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 09:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ESF5wDhx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 392Gighj068748;
	Mon, 2 Oct 2023 11:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696265082;
	bh=gxVVTDKF1pZ1dFcG4ERWfHMmoccExmB2ygnUKuzlFNs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ESF5wDhxTVsYxQ+aK5zdL8VRcXY7CBURpG043EH0J8+IWuGnUJmQV1eRU2tECC9+t
	 ri/WYqrAN+Aipcb53787FNSYqfN/33vPKmIU72WEeRjHHGNcTGN/1/uL0z8PWK+iPm
	 LXBumbdw6osWlf12aunp7/p4UcBbctdi7TNU6SKE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 392Gigt1112867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Oct 2023 11:44:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Oct 2023 11:44:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Oct 2023 11:44:42 -0500
Received: from [10.250.34.24] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 392GigPB027180;
	Mon, 2 Oct 2023 11:44:42 -0500
Message-ID: <a167fb89-d2bb-42f4-8bfa-62dfb389e79f@ti.com>
Date: Mon, 2 Oct 2023 11:44:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone] u-boot-ti: Fix SPL binary name for
 SD/MMC media on HS boards
Content-Language: en-US
To: <afd@ti.com>, Julien Panis <jpanis@baylibre.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230929122555.10794-1-jpanis@baylibre.com>
 <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
 <34336d8c-86e3-df50-ff28-3c5632e4479e@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <34336d8c-86e3-df50-ff28-3c5632e4479e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 392Gighj068748
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Oct 2023 16:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17042



On 10/2/2023 10:30 AM, Andrew Davis via lists.yoctoproject.org wrote:
> On 10/2/23 9:06 AM, Julien Panis wrote:
>> On 9/29/23 14:25, Julien Panis wrote:
>>> The SPL binary built by u-boot for SD/MMC/eMMC media on HS platforms =
is
>>> u-boot-spl_HS_MLO. Thanks to this fix, the binary is properly install=
ed
>>> and deployed.
>>>
>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 +++---
>>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index d9a3a520e857..9ca0fb44d127 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -100,9 +100,9 @@ UBOOT_HS_XLD_IMAGE =3D=20
>>> "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
>>> =C2=A0 UBOOT_HS_XLD_SYMLINK =3D "u-boot-spl_HS_X-LOADER-${MACHINE}"
>>> =C2=A0 # HS MLO
>>> -UBOOT_HS_MLO_BINARY =3D "u-boot_HS_MLO"
>>> -UBOOT_HS_MLO_IMAGE =3D "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
>>> -UBOOT_HS_MLO_SYMLINK =3D "u-boot_HS_MLO-${MACHINE}"
>>> +UBOOT_HS_MLO_BINARY =3D "u-boot-spl_HS_MLO"
>>> +UBOOT_HS_MLO_IMAGE =3D "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
>>> +UBOOT_HS_MLO_SYMLINK =3D "u-boot-spl_HS_MLO-${MACHINE}"
>>> =C2=A0 # HS ISSW
>>> =C2=A0 UBOOT_HS_ISSW_BINARY =3D "u-boot-spl_HS_ISSW"
>>
>> I'm not sure that this patch should be applied actually.
>> In doc/README.ti-secure, u-boot_HS_MLO is mentioned for Keystone2=20
>> Secure Devices.
>> So, maybe this name was used intentionally...(?)
>>
>=20
> On Keystone2 HS, we do not use SPL, so the ROM loaded image (MLO) is th=
e
> normal U-Boot image, we name it u-boot_HS_MLO. For others that do use S=
PL
> the ROM image is the SPL, and it is called u-boot-spl_HS_MLO.
>=20
> So this patch has the right idea, just we should add another deployed i=
mage
> var in addition to this one, not replace it, maybe:
>=20
> SPL_HS_MLO_BINARY =3D "u-boot-spl_HS_MLO"
> ...

And add the appropriate install code later in the file as well.


> Andrew
>=20
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17041): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17041
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

