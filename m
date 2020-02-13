Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2490.1581624197401383265
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 12:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DhHMgbur;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42EECE01589; Thu, 13 Feb 2020 12:03:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03971E00571
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 12:03:15 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DK3FDQ055529
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 14:03:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581624195;
	bh=+bMT3MRIVos9Qeo1BamlhTm9ETlcfvfswOwZEOZGXQE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=DhHMgburSsgu3lKTiq9JCKtUsFXFZ58Cgv8PUPM2Yn/susFQS8x6QDJlJEWS+WDeP
	 beER+vSuFKPFRJ0A/EfpQA45CUdOhMefqBFPhhf9QHOSQ1oGO45OVRF+xYpgbBxpD3
	 1SvAVQeoOKdTmGSMurpUgX+aGsVdzt5S/Ty1Sf/M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DK3F3Y018210
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 14:03:15 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 14:03:15 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1847.003; Thu, 13 Feb 2020 14:03:14 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][zeus][PATCH] ti-sgx-ddk-km: Update srcrev for rtlinux build
Thread-Topic: [meta-ti][zeus][PATCH] ti-sgx-ddk-km: Update srcrev for rtlinux
 build
Thread-Index: AQHV4qWAJe0rVDwk+0SqV698n7eT46gZ60EA//+gpGA=
Date: Thu, 13 Feb 2020 20:03:14 +0000
Message-ID: <ff853ea369bc411dad1cfa445a9f95a0@ti.com>
References: <20200213194108.18290-1-g-tammana@ti.com>
 <20200213194420.GF7085@beryl>
In-Reply-To: <20200213194420.GF7085@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.22.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, February 13, 2020 1:44 PM
>To: Tammana, Gowtham
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti][zeus][PATCH] ti-sgx-ddk-km: Update srcrev for rtlin=
ux
>build
>
>Thanks, can you please rebase it?

Yes, sent a v2.

Gowtham

>On Thu, Feb 13, 2020 at 01:41:08PM -0600, Gowtham Tammana wrote:
>> Update srcrev to pickup fix for rt linux build issue.
>>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> index 47581f63..1d8eb4c0 100644
>> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> @@ -7,7 +7,7 @@ inherit module
>>
>>  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
>>
>> -MACHINE_KERNEL_PR_append =3D "t"
>> +MACHINE_KERNEL_PR_append =3D "u"
>>  PR =3D "${MACHINE_KERNEL_PR}"
>>
>>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> @@ -24,7 +24,7 @@ SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-
>linux.git;protocol=3Dgit;branch
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -SRCREV =3D "1cc2eded30f83bfce58c8ccc8cd61005addf9c0b"
>> +SRCREV =3D "76f305295daf9a77d9f8a563ce81bcf9b94e8eac"
>>
>>  TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
>>  TARGET_PRODUCT_ti33x =3D "ti335x"
>> --
>> 2.25.0
>>
