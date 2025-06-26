Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F9BC7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 19:02:31 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3771.1750964542143504080
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 12:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=IYXR6kk3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QJ2LJ12220228
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 14:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750964541;
	bh=cKmPx9sHLNZggfccHvBpupzwC/pp5bIlTHCN/uN+oHQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IYXR6kk3a+g6adsvNOoJaDw3iEZGsJGMkE3lySuSddxJtfwHuLtN078+fcmHEdcfX
	 tk6uwojVB21ykd+mXymSsk2y5s92P0sxpfjoph65U/Sc6j190JfIv/AGe+hxfEsYnk
	 sqktuj3K+zCHcclD+On6MEz5wX17Pf+WIkJkUxyA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QJ2Lgv2510150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 14:02:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 14:02:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 14:02:20 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QJ2KEH1508517;
	Thu, 26 Jun 2025 14:02:20 -0500
Message-ID: <93920b10-6d7e-4d65-a390-80c4605e5a44@ti.com>
Date: Thu, 26 Jun 2025 14:02:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] Revert "conf: machine: k3:
 disable all fit signing for uboot"
To: Suman Anna <s-anna@ti.com>, <m-chawdhry@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Bryan Brattlof <bb@ti.com>
References: <20250626105933.564282-1-m-chawdhry@ti.com>
 <19eebdc9-dbb3-5c94-0f4c-65123cec35ef@ti.com>
 <184CABECBEB7DB92.20652@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <184CABECBEB7DB92.20652@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 55QJ2LJ12220228
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 19:02:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18695



On 6/26/2025 1:43 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 6/26/2025 12:11 PM, Suman Anna wrote:
>> Hi Manorit,
>>
>> On 6/26/25 05:59, Manorit Chawdhry via lists.yoctoproject.org wrote:
>>> The following revert requires a patch in U-boot as well which has bee=
n
>>> posted upstream [0] and backported internally too.
>>>
>>> This reverts commit 9656b79cb557a46d2611b67e7e51702f6da05594.
>>>
>>
>> Please add detail on what this patch is fixing and why we are=20
>> reverting this
>> commit. The current description gives zero information on why we are=20
>> doing this.
>=20
>=20
> To add more... am65 is now failing again with this patch reverted.=C2=A0=
 So,=20
> NAK on taking this revert.=C2=A0 Someone needs to actually fix the am65=
 issue=20
> that made us disable this in the first place.

Actually, it looks like this patch also requires a uboot patch to work.=20
I'll hold off looking at this then.

>=20
>=20
>> regards
>> Suman
>>
>>
>>> [0]:=20
>>> https://lore.kernel.org/all/20250626-b4-upstream-fix-icssg-fit-v1-1-9=
5eff1c853a4@ti.com/
>>>
>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc | 4 ++++
>>> =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>>> b/meta-ti-bsp/conf/machine/include/k3.inc
>>> index 9b85f867c206..14d7db8a1184 100644
>>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>>> @@ -25,6 +25,10 @@ SPL_BINARY =3D "tispl.bin"
>>> =C2=A0 SPL_BINARYNAME =3D "tispl.bin"
>>> =C2=A0 UBOOT_SUFFIX =3D "img"
>>> +UBOOT_SIGN_ENABLE =3D "1"
>>> +UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
>>> +UBOOT_SIGN_KEYNAME ?=3D "custMpk"
>>> +UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
>>> =C2=A0 FIT_HASH_ALG ?=3D "sha512"
>>> =C2=A0 FIT_SIGN_ALG ?=3D "rsa4096"
>>>
>>>
>>>
>>>
>>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18694): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18694
> Mute This Topic: https://lists.yoctoproject.org/mt/113841171/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

