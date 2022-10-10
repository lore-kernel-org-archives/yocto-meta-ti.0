Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA312C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 22:13:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.670.1665439978457359510
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 15:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=st/u9pwj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AMCvNw084403
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 17:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665439977;
	bh=Ev6LtsVeXBKhnxM9rHKbzDVGapX53iPMINrAoUE/ENg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=st/u9pwjROFdkVzbv6XPdFo2/08nWpnEJ+9u68Mv0iQ1/DFfs+Ze7oTc9N35KCD7g
	 XItC9zphv2qMHAkzID96smYYAcIBZnLuP7WmQE/9BmhfplLb3hPxENj+/yVJPEXXRs
	 75hQ2qC/eGT4q02H5Kz/84Z1syJ7vyqKPKotU2nI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AMCvT7007799
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 17:12:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 17:12:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 17:12:56 -0500
Received: from [10.247.29.70] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AMCuh7057980;
	Mon, 10 Oct 2022 17:12:56 -0500
Message-ID: <638e91b0-b7d2-e3c1-6a2b-d652ade6244b@ti.com>
Date: Mon, 10 Oct 2022 17:12:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti][dunfell PATCH v2 1/4] optee-os: Update SRCREV for
 OP-TEE TRNG in J784S4
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>
References: <20221010153058.28310-1-j-choudhary@ti.com>
 <20221010153058.28310-2-j-choudhary@ti.com>
 <5bb358fe-c7de-5621-a23e-99febc90261f@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <5bb358fe-c7de-5621-a23e-99febc90261f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 29AMCvNw084403
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 22:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15134



On 10/10/2022 10:34 AM, Andrew Davis wrote:
> On 10/10/22 10:30 AM, Jayesh Choudhary wrote:
>> Update the SRCREV to the commit when sa3ul support was
>> added in upstream OP-TEE for J784S4 platform to access rng.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>=20
>=20
> I had Ack'd this whole series in v1, you should add the
> acks collected to your patches so when you re-post them
> they are maintained here.
>=20
> Andrew
>=20
>=20
>> ---
>> =C2=A0 recipes-security/optee/optee-os_%.bbappend | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-security/optee/optee-os_%.bbappend=20
>> b/recipes-security/optee/optee-os_%.bbappend
>> index e7de5157..ff639baa 100644
>> --- a/recipes-security/optee/optee-os_%.bbappend
>> +++ b/recipes-security/optee/optee-os_%.bbappend
>> @@ -1,5 +1,5 @@
>> =C2=A0 PV_ti-soc =3D "3.18.0+git${SRCPV}"
>> -SRCREV_ti-soc =3D "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
>> +SRCREV_ti-soc =3D "6bf4a81a8f5388e6cb6b1d7e8ebe57c5089c0954"

This is part of https://github.com/OP-TEE/optee_os/commits/3.19.0-rc1

Please update PV as well s/3.18.0/3.19.0-rc1

>> =C2=A0 SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protoc=
ol=3Dhttps"
>> =C2=A0 DEPENDS_append_ti-soc =3D " python3-cryptography-native"

