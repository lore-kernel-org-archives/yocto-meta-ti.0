Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A735FA3740
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 21:40:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.229.1666993249400053575
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 14:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=VSGZEvoH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29SLem2Q112255;
	Fri, 28 Oct 2022 16:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666993248;
	bh=T14dQm0wsV73pisbtxNlfLByBjPvOHJNGwFdxz/xWew=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VSGZEvoH0bEy0jkK5mAnF1AclJNjkeM64ZazScsfVYfKXRNazIVVLDqJh4n1UCpmv
	 +Nw3vRvg69jLJsgAEKVQK9jFac1XMEhkO1PkRthJ6bi6Gnx0LTMmSdUtuPlgs/+KYl
	 yLGSEQ+dHPJs32Wc6gQapp8NVEcXbaXP2xsa/Fs0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29SLelLt003117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Oct 2022 16:40:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 28
 Oct 2022 16:40:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 28 Oct 2022 16:40:47 -0500
Received: from [128.247.81.102] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29SLelse109018;
	Fri, 28 Oct 2022 16:40:47 -0500
Message-ID: <03d25dba-2915-1b58-0bd6-c3e08beb0888@ti.com>
Date: Fri, 28 Oct 2022 16:40:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [dunfell PATCH] optee-os: Upgrade to upstream 3.19.0
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>, Andrew Davis <afd@ti.com>
References: <20221027233027.29967-1-praneeth@ti.com>
 <37f2be94-ea5e-3a44-1022-c35291f55574@ti.com>
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <37f2be94-ea5e-3a44-1022-c35291f55574@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 29SLem2Q112255
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Oct 2022 21:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15212

Hello,

On 10/27/2022 6:54 PM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 10/27/2022 6:30 PM, Praneeth Bajjuri wrote:
>> Update to the latest upstream master which is 3.19.0.
>=20
> +judith, jai to verify on TI platforms.
>=20

Verified-by: Judith Mendez <jm@ti.com>

>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>> =C2=A0 recipes-security/optee/optee-os_%.bbappend | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-security/optee/optee-os_%.bbappend=20
>> b/recipes-security/optee/optee-os_%.bbappend
>> index 38d1ce50..4a4ebfd7 100644
>> --- a/recipes-security/optee/optee-os_%.bbappend
>> +++ b/recipes-security/optee/optee-os_%.bbappend
>> @@ -1,5 +1,5 @@
>> -PV_ti-soc =3D "3.18.0+git${SRCPV}"
>> -SRCREV_ti-soc =3D "6bf4a81a8f5388e6cb6b1d7e8ebe57c5089c0954"
>> +PV_ti-soc =3D "3.19.0+git${SRCPV}"
>> +SRCREV_ti-soc =3D "afacf356f9593a7f83cae9f96026824ec242ff52"
>> =C2=A0 SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protoc=
ol=3Dhttps"
>> =C2=A0 DEPENDS_append_ti-soc =3D " python3-cryptography-native"

I have tested on AM64x HS-FS, verified with the following:

OP-TEE version: 3.19.0-32-g217277de

Regards,
Judith

