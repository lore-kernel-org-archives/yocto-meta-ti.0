Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01985C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:08:02 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22907.1750874874554941355
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=tB0O+u7M;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI7sbT1524317
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 13:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874874;
	bh=y6NZOJuS20B3xZ8Mqda31SHvKFEPN7xnAXhO6T1uyIo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tB0O+u7MxrTIDtv8agTvA98M/ZnwCiOGWfsIozoxOVr+1oQgWv1D4IgPdxJReUwlq
	 Bw+oEgWOhKEova1PZYBnDJXsTKVSwEj6C+XUmesKAkDca1tT5+8prv/WLK1FvUYxeN
	 YAu4BGOfA28T+r+jhb1DbdFEK50V1wZOu4q10MAw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI7sbq1225341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 13:07:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:07:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:07:53 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI7r3U4076712;
	Wed, 25 Jun 2025 13:07:53 -0500
Message-ID: <4c49cf37-baff-49a6-9161-19e45509ccf6@ti.com>
Date: Wed, 25 Jun 2025 13:07:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v1 2/4] meta-ti-bsp: tfa: add
 build flags for am62xxsip-evm
To: Andrew Davis <afd@ti.com>, <anshuld@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
References: <20250625171626.2863841-1-anshuld@ti.com>
 <20250625171626.2863841-3-anshuld@ti.com>
 <12653d81-23fe-4fb4-9b04-404642dcc577@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <12653d81-23fe-4fb4-9b04-404642dcc577@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 55PI7sbT1524317
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:08:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18683



On 6/25/2025 12:45 PM, Andrew Davis wrote:
> On 6/25/25 12:16 PM, Anshul Dalal via lists.yoctoproject.org wrote:
>> Due to 512MiB DDR limitation of am62x SiP, the memory map has been
>> modified with OP-TEE moved to bottom of DDR after atf to 0x80080000,
>> this requires modifications to ATF's BL32_BASE. PRELOADED_BL33_BASE ha=
s
>> also been updated to 0x81880000 to reflect the updated SPL_TEXT_BASE
>> from u-boot.
>>
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>> =C2=A0 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc=
=20
>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> index cb956a00..805ded8e 100644
>> ---=20
>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> @@ -19,4 +19,5 @@ TFA_SPD:am62lxx =3D ""
>> =C2=A0 EXTRA_OEMAKE +=3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART')=
 if=20
>> d.getVar('TFA_K3_USART') else ''}"
>> =C2=A0 EXTRA_OEMAKE +=3D "${@ 'K3_PM_SYSTEM_SUSPEND=3D' +=20
>> d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND')=
=20
>> else ''}"
>> +EXTRA_OEMAKE:append:am62xxsip-evm:bsp-ti-6_12 =3D "=20
>> PRELOADED_BL33_BASE=3D0x81880000 BL32_BASE=3D0x80080000"
>=20
> I wonder if we want to do something like we did with TFA_K3_USART and=20
> TFA_K3_SYSTEM_SUSPEND here
> so that we can set this is the machine .conf file, vs out here in the=20
> recipe.
>=20
> Might be something we can do later, as the same needs done for=20
> CFG_TEE_CORE_LOG_LEVEL in OP-TEE.

I like that plan for a follow up patch.


> Andrew
>=20
>> =C2=A0 EXTRA_OEMAKE:append:ti-falcon =3D " PRELOADED_BL33_BASE=3D0x820=
00000=20
>> K3_HW_CONFIG_BASE=3D0x88000000"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18672):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18672
>> Mute This Topic: https://lists.yoctoproject.org/mt/113829067/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

