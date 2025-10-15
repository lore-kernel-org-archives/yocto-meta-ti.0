Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63802CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 15:50:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21242.1760543450287591788
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 08:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZxWKVde5;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FFondC1359819
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 10:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760543449;
	bh=Ew1WuuRuugIIphySNe92jlkj10mTbtPZrvAvZ1qDcaQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZxWKVde5WA0i7ouDIuKl0P2P3qXqaW1Qv7ft2vY7fhp3S0XSDsXycAj42pTnxbT35
	 +5ViUCvdPzjn+34uFBiyRKLkn95wvjSkzZotYZEIcWWSut1U5mGhOo/KjvZlxcZf27
	 +wnCgEzXmT3WW+Ka6/MekpDLpTXGtvCJQHMJ4MK4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FFonpY934560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 10:50:49 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 15
 Oct 2025 10:50:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 10:50:49 -0500
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FFojqO2209289;
	Wed, 15 Oct 2025 10:50:46 -0500
Message-ID: <71bcd8c9-aff6-4430-a8d3-266144bb8963@ti.com>
Date: Wed, 15 Oct 2025 21:20:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-dm-fw: Update DM for
 am62dxx
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
        <sebin.francis@ti.com>, <vishalm@ti.com>, <v-krishnamoorthy@ti.com>
References: <20251013115734.1403394-1-p-bhagat@ti.com>
 <9f11242d-a331-4cf2-b6d9-b0aa84cf20ca@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <9f11242d-a331-4cf2-b6d9-b0aa84cf20ca@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 59FFondC1359819
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 15:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19132

Hi Andrew,


On 13/10/25 17:31, Andrew Davis wrote:
> On 10/13/25 6:57 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
>> am62dxx previously reused am62axx DM, but now that a dedicated DM is
>> available, migrate to device-specific DM.
>>
>
> What does this DM do differently than the AM62a DM?
>
> Andrew


Nope, there is no difference currently. We have separate DMs because=20
am62a and am62d each have their own MCU SDK (allows customers to use=20
native am62d MCU SDK for their customization).


>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> Boot logs
>> https://gist.github.com/paresh-bhagat12/2c09bb5e3c22b70b8afd823abc2704=
c9
>>
>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 6 ++++--
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>> =C2=A0 2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> index 03016993..2d9ad499 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> @@ -29,7 +29,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> -PLAT_SFX:am62dxx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62dxx"
>> =C2=A0 PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> =C2=A0 @@ -87,7 +87,7 @@ do_deploy() {
>> =C2=A0 ALTERNATIVE:${PN}:am62xx=C2=A0 =3D "am62-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:am62pxx=C2=A0 =3D "am62p-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:am62axx =3D "am62a-main-r5f0_0-fw"
>> -ALTERNATIVE:${PN}:am62dxx =3D "am62a-main-r5f0_0-fw"
>> +ALTERNATIVE:${PN}:am62dxx =3D "am62d-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:j721e=C2=A0=C2=A0 =3D "j7-mcu-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:j7200=C2=A0=C2=A0 =3D "j7200-mcu-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE:${PN}:j721s2=C2=A0 =3D "j721s2-mcu-r5f0_0-fw"
>> @@ -99,6 +99,7 @@ ALTERNATIVE:${PN}:j742s2=C2=A0 =3D "j742s2-mcu-r5f0_=
0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]=C2=A0 =3D=20
>> "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62p-main-r5f0_0-fw]=C2=A0 =3D=20
>> "${nonarch_base_libdir}/firmware/am62p-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62a-main-r5f0_0-fw] =3D=20
>> "${nonarch_base_libdir}/firmware/am62a-main-r5f0_0-fw"
>> +ALTERNATIVE_LINK_NAME[am62d-main-r5f0_0-fw] =3D=20
>> "${nonarch_base_libdir}/firmware/am62d-main-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D=20
>> "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]=C2=A0 =3D=20
>> "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] =3D=20
>> "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
>> @@ -110,6 +111,7 @@ ALTERNATIVE_LINK_NAME[j742s2-mcu-r5f0_0-fw] =3D=20
>> "${nonarch_base_libdir}/firmware/j
>> =C2=A0 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]=C2=A0 =3D=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> =C2=A0 ALTERNATIVE_TARGET[am62p-main-r5f0_0-fw]=C2=A0 =3D=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> =C2=A0 ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] =3D=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> +ALTERNATIVE_TARGET[am62d-main-r5f0_0-fw] =3D=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> =C2=A0 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> =C2=A0 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]=C2=A0 =3D=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> =C2=A0 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] =3D=20
>> "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index eeb3f428..4e956cbb 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -63,7 +63,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> -PLAT_SFX:am62dxx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62dxx"
>> =C2=A0 PLAT_SFX:am62lxx =3D "am62lxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19116):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/19116
>> Mute This Topic: https://lists.yoctoproject.org/mt/115732782/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

