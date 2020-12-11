Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.7907.1607698588367518401
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 06:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Yatjo6C3;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9E52E38C1368
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 14:56:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBEuRJQ089447
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 08:56:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607698587;
	bh=RluJQOPO5J05eFaaIZcY9kXpBxtqYVuHSR4TKQX/Yq4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Yatjo6C3Y3LlGgY/mPD9POHRgmdDugXGxXEfwDd6wuEiaw9uJbnfnHuvGm9FEq50z
	 Kc4yz6ZHGuecGKuTEsKyUP5qOCAOWluVpxNPHsTWQRxFf9giSEajpux+zg7ov8ai3q
	 kaNqvlcPy6XStHJWtqWGcLN2hbXGvBwdio1emfKs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBEuRUn076897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 08:56:27 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 08:56:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 08:56:26 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBEuQfu113948;
	Fri, 11 Dec 2020 08:56:26 -0600
Subject: Re: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios: upgrade 6.76.03.01 -> 6.76.04.02
To: "Tammana, Gowtham" <g-tammana@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
References: <20201211133436.10566-1-dmurphy@ti.com>
 <bea5488ac8a74c069e2b19f0c1a66599@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <361317b8-11d8-64ce-7946-9a940346dd20@ti.com>
Date: Fri, 11 Dec 2020 08:56:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bea5488ac8a74c069e2b19f0c1a66599@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Gowtham

On 12/11/20 8:51 AM, Tammana, Gowtham wrote:
>
>> -----Original Message-----
>> From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> =
On
>> Behalf Of Dan Murphy via lists.yoctoproject.org
>> Sent: Friday, December 11, 2020 7:35 AM
>> To: meta-ti@yoctoproject.org
>> Cc: Murphy, Dan <dmurphy@ti.com>
>> Subject: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios: upg=
rade
>> 6.76.03.01 -> 6.76.04.02
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>> .../{ti-sysbios_6.76.03.01.bb =3D> ti-sysbios_6.76.04.02.bb}  | 6 +++-=
--
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>> rename recipes-ti/bios/{ti-sysbios_6.76.03.01.bb =3D> ti-
>> sysbios_6.76.04.02.bb} (68%)
>>
>> diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bio=
s/ti-
>> sysbios_6.76.04.02.bb
>> similarity index 68%
>> rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
>> rename to recipes-ti/bios/ti-sysbios_6.76.04.02.bb
>> index d242510f801e..237b48929739 100644
>> --- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
>> +++ b/recipes-ti/bios/ti-sysbios_6.76.04.02.bb
>> @@ -1,13 +1,13 @@
>> require recipes-ti/bios/ti-sysbios.inc
>>
>> PE =3D "1"
>> -PV =3D "6_76_03_01"
>> +PV =3D "6_76_04_02"
> PV not needed here as it is already specified in the recipe name.

Actually that is not true.=C2=A0 Recipe name is 6.76.04.02 PV has undersc=
ores=20
6_76_04_02 as the PV is used in the binary name from the download site

BINFILE =3D "bios_${PV}.run"

Dan

