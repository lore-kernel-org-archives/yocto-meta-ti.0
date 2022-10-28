Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E36ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 09:22:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4213.1666948924281717678
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 02:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hoU1dyTw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29S9M1Km079153;
	Fri, 28 Oct 2022 04:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666948921;
	bh=gIC9XbbN4hyXXubDU8TF7yJh3FQoT0ELqkmo9ibVUJI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hoU1dyTwcOD+5b6cxf7uYJRCbzgZdT3u0my0GsuaApvdty0mhLNOYhdRqylnNd/y+
	 iQHn29QgIkFD/dgEGz2+YMcdg6eRJP5N0z2j62qQ/nyPNqgD2s305mf+VY4N4HOmHK
	 mhcRq1Ylid83eesxPEOIsuhf0V6jJXh27+FwhW6E=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29S9M1An013832
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Oct 2022 04:22:01 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 28
 Oct 2022 04:22:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 28 Oct 2022 04:22:01 -0500
Received: from [172.24.145.136] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29S9LwO6045908;
	Fri, 28 Oct 2022 04:21:59 -0500
Message-ID: <a79bce66-e526-07bc-06c8-7be6d0793a70@ti.com>
Date: Fri, 28 Oct 2022 14:51:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [dunfell PATCH] optee-os: Upgrade to upstream 3.19.0
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Judith Mendez <jm@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Andrew Davis <afd@ti.com>
References: <20221027233027.29967-1-praneeth@ti.com>
 <37f2be94-ea5e-3a44-1022-c35291f55574@ti.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <37f2be94-ea5e-3a44-1022-c35291f55574@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 29S9M1Km079153
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Oct 2022 09:22:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15211



On 28/10/22 05:24, Bajjuri, Praneeth wrote:
>=20
>=20
> On 10/27/2022 6:30 PM, Praneeth Bajjuri wrote:
>> Update to the latest upstream master which is 3.19.0.
>=20
> +judith, jai to verify on TI platforms.
>=20

+Kamlesh

AM62 sa2ul and rng support was merged couple of days ago[0]
So the SRCREV should be changed to have the OP-TEE support for that.

Also, J784S4 optee support is verified.

[0]:=20
https://github.com/OP-TEE/optee_os/commit/d6c5d0037b46f46caf71d67d7825d4b=
722cbcddf


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

