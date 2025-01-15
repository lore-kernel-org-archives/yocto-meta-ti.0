Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F50C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 22:25:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.35102.1736979920175701328
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 14:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=EarfShj0;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50FMPJof4102885
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 15 Jan 2025 16:25:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736979919;
	bh=1QFkdPV0jDiEcBTS4qSJyCOo+hpBDASsobLbv94dCbo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EarfShj0rCuL3ng1Xs5b/a/EdiyFdmddj+QE2oDaRhXfWKoVpT9U4K75l9rxRrUv/
	 EFV7KZScVRjV9dv5N6LCP+pAwYN23cwlYcm/6scrDWhuewSowkCfYeG/ZFep/USO9y
	 0t+Xki3EE3WwKKo3P/TCRXQN1Ml9dY++7XOEOkkg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50FMPJm6036014;
	Wed, 15 Jan 2025 16:25:19 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Jan 2025 16:25:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Jan 2025 16:25:18 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50FMPIqY007047;
	Wed, 15 Jan 2025 16:25:18 -0600
Message-ID: <8b338091-ec38-4af2-a2d0-9f5ba3ad9be1@ti.com>
Date: Wed, 15 Jan 2025 16:25:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/2] conf: machine:
 beaglebone-ai64: Update SPLY_BINARY
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250113225222.13622-1-reatmon@ti.com>
 <20250113225222.13622-2-reatmon@ti.com>
 <bb311c87-bd6c-4e20-8023-102005fb44e6@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bb311c87-bd6c-4e20-8023-102005fb44e6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 50FMPJof4102885
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jan 2025 22:25:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18198



On 1/15/2025 1:07 PM, Andrew Davis wrote:
> On 1/13/25 4:52 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Rather than override the value for SPL_BINARY for all bsps, simply jus=
t
>> set the value to the correct value.=C2=A0 This should be ok since all
>> beaglebone-ai64 variations should use tispl.bin_unsigned.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>=20
> Typo in subject line, s/SPLY_BINAR/SPL_BINARY

Yeah.  I'm going to do a v2 before I accept it.


> Andrew
>=20
>> =C2=A0 meta-beagle/conf/machine/beaglebone-ai64.conf | 6 +-----
>> =C2=A0 1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf=20
>> b/meta-beagle/conf/machine/beaglebone-ai64.conf
>> index a521c8cf..ecd3a6e7 100644
>> --- a/meta-beagle/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
>> @@ -18,11 +18,7 @@ UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D=20
>> "j721e_beagleboneai64_a72.config"
>> =C2=A0 UBOOT_MACHINE:bsp-bb_org-6_1 =3D "j721e_evm_a72_config"
>> =C2=A0 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D=20
>> "j721e_beagleboneai64_a72.config"
>> -SPL_BINARY:bsp-ti-6_6 =3D "tispl.bin_unsigned"
>> -SPL_BINARYNAME:bsp-ti-6_6 =3D "tispl.bin"
>> -
>> -SPL_BINARY:bsp-bb_org-6_6 =3D "tispl.bin_unsigned"
>> -SPL_BINARYNAME:bsp-bb_org-6_6 =3D "tispl.bin"
>> +SPL_BINARY =3D "tispl.bin_unsigned"
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e \
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18190):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18190
>> Mute This Topic: https://lists.yoctoproject.org/mt/110598031/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

