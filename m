Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75886C48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 20:57:27 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.30473.1706216237652079259
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 12:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=biBC+8XZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40PKvFe5035300;
	Thu, 25 Jan 2024 14:57:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706216235;
	bh=wc1qJ4O+Fh7+Z7g5CBiPW/HNp5skCE8sy0GYcudUxa0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=biBC+8XZ4cDp+dPpTjw8hHqG6tBzx4ZUfpWdYcBKWQaG4NU+6LAPklNWwWHC2QOPQ
	 5g1NCByrzFkL0RJf1VtT6Jxlb5Ouxi+coqEKsY1RPPs08CX1hvGc/KYxg2JK3RCGyG
	 6lyYvWHKQfXLYF1zjn8WhO/PK0YO/RNSfTUMdYI4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40PKvFYQ116047
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jan 2024 14:57:15 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 14:57:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 14:57:15 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40PKvFfj011203;
	Thu, 25 Jan 2024 14:57:15 -0600
Message-ID: <30f34a0e-01cc-4750-b5f2-82d45cf2e233@ti.com>
Date: Thu, 25 Jan 2024 14:57:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone] [PATCH] meta-ti-bsp: Add bootsplash image
 file for AM62P
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <n-jain1@ti.com>
References: <20240124144617.327734-1-devarsht@ti.com>
 <17AD5BA25E70DA4A.23445@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17AD5BA25E70DA4A.23445@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 40PKvFe5035300
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jan 2024 20:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17417



On 1/24/2024 12:23 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 1/24/2024 8:46 AM, Devarsh Thakkar wrote:
>> Add TI logo image as bootsplash image file for AM62P and install it in
>> boot directory from where u-boot can read from and display during
>> boot-up time.
>=20
> I'm going to send another patch that updates the u-boot mainline recipe=
=20
> to 2024.01 and move the logo code out of the .bb files and into the=20
> common .inc file.=C2=A0 Can you rebase this patch on that patch once I =
send=20
> it and make this a v2?=C2=A0 This will reduce the number of places that=
 we=20
> need to maintain the logo install/deploy code.
>=20
> I'll let you know once these changes are in place for you to rebase off=
 of.

Ok.  If you want to redo your changes on top of kirkstone-wip you should=20
be good to go.

>=20
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>> =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=A0=
=C2=A0 | 10 ++++++++++
>> =C2=A0 2 files changed, 13 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> index bac68253..20e0771e 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> @@ -9,6 +9,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D=20
>> "ti-img-rogue-driver"
>> =C2=A0 # Default tiboot3.bin on AM62Px is for HS-FS
>> =C2=A0 IMAGE_BOOT_FILES +=3D "tiboot3-am62px-hs-fs-evm.bin"
>> +# Bitmap image tarball for early splashscreen
>> +IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
>> +
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> index 4fe1218a..c98cbe61 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> @@ -17,3 +17,13 @@ do_deploy:append:am62xx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_log=
o_414x97_32bpp.bmp.gz=20
>> ${DEPLOYDIR}
>> =C2=A0 }
>> +
>> +do_install:append:am62pxx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_32=
bpp.bmp.gz=20
>> ${D}/boot
>> +}
>> +
>> +do_deploy:append:am62pxx() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97_32=
bpp.bmp.gz=20
>> ${DEPLOYDIR}
>> +}
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17413): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17413
> Mute This Topic: https://lists.yoctoproject.org/mt/103932848/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

