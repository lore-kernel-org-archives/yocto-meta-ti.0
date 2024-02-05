Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E45C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:43:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.65760.1707147835691263379
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 07:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=tl70kHV6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415Fhsf0023000;
	Mon, 5 Feb 2024 09:43:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707147834;
	bh=aqrmDpyExl15EvSJs/Kplwmrb5m33sDOBuF3JPCEgJs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tl70kHV6Tl7cVVWFGeSKbZr2K309kDDrqQi49WOIWYd5Z3ALKo7LRhbxN2oOtv/s/
	 orIMpu37fJKsZyloVvyrQpzyZvohSq2N7N/mbQifA4ifEN34Fhd5QBfopGBk+NoIMD
	 svLP6OGawCUfHpTEF5tvmyCAMvgfEuYpelnyb6mA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415FhsOv023008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 09:43:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 09:43:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 09:43:53 -0600
Received: from [10.249.128.48] ([10.249.128.48])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415Fhomp074486;
	Mon, 5 Feb 2024 09:43:51 -0600
Message-ID: <a7da287c-c38e-8171-bbcd-42158d42e68e@ti.com>
Date: Mon, 5 Feb 2024 21:13:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2] meta-ti-bsp: Add bootsplash
 image file for AM62P
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <c-shilwant@ti.com>
References: <20240203070525.1728676-1-devarsht@ti.com>
 <6c7d7efe-7816-48f1-808c-7f3e686de8a2@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <6c7d7efe-7816-48f1-808c-7f3e686de8a2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 415Fhsf0023000
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Feb 2024 15:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17440



On 05/02/24 20:44, Ryan Eatmon wrote:
>=20
>=20
> On 2/3/2024 1:05 AM, Devarsh Thakkar wrote:
>> Add TI logo image as bootsplash image file for AM62P and install it in
>> boot directory from where u-boot can read from and display during
>> boot-up time.
>=20
>=20
> Thank you for the rebase.=C2=A0 Was the config fragment that Chirag ask=
ed=20
> about ever sent to uboot to avoid an issue with the recipe in the=20
> processor-sdk?
>=20

Yes, I had submitted a patch to ti-u-boot. I have sent you the link offli=
ne.

Regards
Devarsh
>=20
>=20
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V2: Rebase to updated uboot recipes
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc |=C2=A0 3 +++
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ++++++++++
>> =C2=A0 2 files changed, 13 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> index bac68253..38e35851 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
>> @@ -17,3 +17,6 @@ OPTEEMACHINE =3D "k3-am62x"
>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>> +
>> +# Bitmap image tarball for early splashscreen
>> +IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 493c1c31..42ddf40f 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -341,4 +341,14 @@ do_deploy:append:am62xx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_log=
o_414x97_32bpp.bmp.gz=20
>> ${DEPLOYDIR}
>> =C2=A0 }
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
>> +
>> =C2=A0 TOOLCHAIN =3D "gcc"
>=20

