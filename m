Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.646.1588372442891414420
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 May 2020 15:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NFyXWxB+;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B919FE01AC0; Fri,  1 May 2020 15:34:02 -0700 (PDT)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 727A3E01A40
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2020 15:34:00 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041MY0Jk094608
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 17:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588372440;
	bh=j2Z9g01E4eDzcUJM9qMa5oamt7rKLFjwZggiTL5eBAg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=NFyXWxB+YGLSy0kwgmDvFnfv8NUzLOPCdvKE8wKnGIvTH8G6ZapibuAAw9DwkqNJa
	 CmvCEYmMHr65h64omqGl9GRAFLwDTWeFRi3KUEUsD35155Se6i9h14wxrmLWfbA0aq
	 4A4nRx2EPtmCH/Rifrr21Z9W5g1R+PMjvsbHSz8A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 041MY06O107763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 17:34:00 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 1 May
 2020 17:33:59 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Fri, 1 May 2020 17:33:59 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH] ti-img-rogue-umlibs: Update srcrev to pick latest
Thread-Topic: [meta-ti][zeus/master][PATCH] ti-img-rogue-umlibs: Update srcrev
 to pick latest
Thread-Index: AQHWIAcsm5dG4E/NUEm6GRjDlorYVaiUJE6A//+sszA=
Date: Fri, 1 May 2020 22:33:59 +0000
Message-ID: <64836e3f3ded4abb9025818ac50851df@ti.com>
References: <20200501222339.6078-1-g-tammana@ti.com>
 <20200501223135.GL11212@beryl>
In-Reply-To: <20200501223135.GL11212@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.49.252]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Friday, May 01, 2020 5:32 PM
>To: Tammana, Gowtham
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti][zeus/master][PATCH] ti-img-rogue-umlibs: Update src=
rev
>to pick latest
>
>Thanks! This also looks good, but won't apply to master due to J7 HS addit=
ion.
>Can you please rebase? Thanks.

Ok. Will submit a v2.

Gowtham

>
>On Fri, May 01, 2020 at 05:23:39PM -0500, Gowtham Tammana wrote:
>> Updating srcrev to pick latest libs
>>
>>   - Support for surfaceless EGL display token
>>   - RGBA4444 format support as window surface
>>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.b=
b
>b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
>> index 0e0335b4..9e241b73 100644
>> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
>> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
>> @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e76f"
>>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>  COMPATIBLE_MACHINE =3D "j7-evm"
>>
>> -PR =3D "r6"
>> +PR =3D "r7"
>>
>>  BRANCH =3D "linuxws/zeus/k5.4/${PV}"
>>
>>  SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-
>umlibs.git;branch=3D${BRANCH}"
>> -SRCREV =3D "0721cdfc1fc86f40c93745159e3f1bcad5beda17"
>> +SRCREV =3D "20748df00f123d56079cab07f83b0133e3378b53"
>>
>>  PVR_SOC ?=3D "j721e_linux"
>>  PVR_BUILD ?=3D "release"
>> --
>> 2.17.1
>>
