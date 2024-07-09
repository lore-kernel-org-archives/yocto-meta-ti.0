Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3159C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:27:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.11678.1720528052183348942
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 05:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VBgzrCf+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469CRSGv085170;
	Tue, 9 Jul 2024 07:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720528048;
	bh=llgwaXiUcS2oTOlLyKrufXz85O2N/BvtiCu1WWktTo0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VBgzrCf+ehI6iBg/+UwQxPJn9KCwZ/NeGBdqbFOuGk6CI3KttsVVl6LZeRBlJwRqf
	 lBaSqDCMkPHVp/3OfdJ7bVhuJ6MDVHC6EEwz3DKDyfdm9HKfix09+z+nAZq37MSGbg
	 4a8/xfrss15ktNU4RN70ZppZusCGB/u5pwVBVN7s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469CRS7L083478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 07:27:28 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 07:27:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 07:27:28 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469CRP2g107726;
	Tue, 9 Jul 2024 07:27:26 -0500
Message-ID: <8da60c73-16e5-456d-83a9-698a82d76db0@ti.com>
Date: Tue, 9 Jul 2024 17:57:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] ti-extras: Update SRCREV and BRANCH for
 ti-extras sources
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20240709120020.3025264-1-p-bhagat@ti.com>
 <4d8f8f38-729d-492f-bae5-88d95597d21e@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <4d8f8f38-729d-492f-bae5-88d95597d21e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 469CRSGv085170
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 12:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17843

Hi Chirag,
On 09/07/24 17:43, Chirag Shilwant wrote:
> Hi,
>
> I believe this patch is applicable to master branch as well.
> So, an update is needed in patch title.
>
> s/[scarthgap]/[master/scarthgap]
Will send a v2 shortly
>
> ---
> Chirag
>
> On 09/07/24 17:30, Paresh Bhagat wrote:
>> Update u-boot/ti-extras.inc to 2024.04 version.
>> Update linux/ti-extras-rt.inc to 6.6 version.
>> Update linux/ti-extras.inc to version 6.6.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 8 ++++----
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc | 8 ++++----
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc=C2=A0=C2=A0=C2=A0=
 | 8 ++++----
>> =C2=A0 3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>> index d32c6529..0252e2c3 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>> @@ -3,10 +3,10 @@
>> =C2=A0 =C2=A0 COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
>> =C2=A0 -BRANCH =3D "ti-u-boot-2023.04"
>> -BRANCH:tie-jailhouse =3D "ti-u-boot-2023.04-jailhouse"
>> +BRANCH =3D "ti-u-boot-2024.04"
>> +BRANCH:tie-jailhouse =3D "ti-u-boot-2024.04-jailhouse"
>> =C2=A0 -SRCREV =3D "b0d868ee086eb5c96a3d32f72a7cb9670abf5b90"
>> -SRCREV:tie-jailhouse =3D "765cab112d16fcf68a3266738073663dae67a55d"
>> +SRCREV =3D "b3c10f333acccef49ebaf4abc575616ea7326d50"
>> +SRCREV:tie-jailhouse =3D "b3c10f333acccef49ebaf4abc575616ea7326d50"
>> =C2=A0 =C2=A0 UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-=
boot.git"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc=20
>> b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
>> index 530a1783..df10d594 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
>> @@ -4,8 +4,8 @@
>> =C2=A0 =C2=A0 COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
>> =C2=A0 -BRANCH =3D "ti-rt-linux-6.1.y"
>> -BRANCH:tie-jailhouse =3D "ti-rt-linux-6.1.y-jailhouse"
>> +BRANCH =3D "ti-rt-linux-6.6.y"
>> +BRANCH:tie-jailhouse =3D "ti-rt-linux-6.6.y-jailhouse"
>> =C2=A0 -SRCREV =3D "685e77152461bd6b791500f717bec62d17c1b36d"
>> -SRCREV:tie-jailhouse =3D "a74088b40b4d27478a2af5c20cdc0b4ec8ed9470"
>> +SRCREV =3D "fb89cd4d622ce6cc1b7b254ae21298570d437a08"
>> +SRCREV:tie-jailhouse =3D "ea592a872ebdb974f26f6f839596e0a79e9d408b"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc=20
>> b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>> index 0b22aca9..880d5d87 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>> @@ -4,11 +4,11 @@
>> =C2=A0 =C2=A0 COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
>> =C2=A0 -BRANCH =3D "ti-linux-6.1.y"
>> -BRANCH:tie-jailhouse =3D "ti-linux-6.1.y-jailhouse"
>> +BRANCH =3D "ti-linux-6.6.y"
>> +BRANCH:tie-jailhouse =3D "ti-linux-6.6.y-jailhouse"
>> =C2=A0 -SRCREV =3D "ec058c3ddc5377c629e988a95ef84826b14a3307"
>> -SRCREV:tie-jailhouse =3D "d035e0cc72399f1c087a63c4210d29e79a7a66e4"
>> +SRCREV =3D "e298dab666632b6f62ed61eac35813331341c3aa"
>> +SRCREV:tie-jailhouse =3D "b45ba5ae4b724d4a09c0c7125ffb49e9d58c04f7"
>> =C2=A0 =C2=A0 KERNEL_GIT_URI =3D "git://git.ti.com/git/processor-sdk/l=
inux.git"

