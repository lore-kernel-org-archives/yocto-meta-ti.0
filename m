Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4483.1624947113437453562
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 23:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ZhPcJaPR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T6Bnth037074;
	Tue, 29 Jun 2021 01:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624947109;
	bh=eJe1kNa90YhYxQEU/flWnKhwQ4DO3ZNbXw+N463MBU8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ZhPcJaPRqmcJ6u1j7sftWNDnedAIO/U0QeCrYo9sq1P1TDmOsEDCvu01fLkU7Q7q/
	 wbps3kNSXEiF65PWVVeUYnoDfqDS2dyyP3TJrBiBbDnB1AQfv3favkUzTOclzho193
	 0knVJeYZ8aeeFy48QwaiEWQtpwMgOfMs3Wh6aSto=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T6Bnx0051226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 01:11:49 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 01:11:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 01:11:48 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T6Bk8R119720;
	Tue, 29 Jun 2021 01:11:47 -0500
Subject: Re: [PATCH 1/2] prusw-fw: Update switch firmwares to 3.2.9 version
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
References: <20210628144805.16996-1-vigneshr@ti.com>
 <5df72a60-9793-04b2-bae9-5164b510ee02@ti.com>
From: "Vignesh Raghavendra" <vigneshr@ti.com>
Message-ID: <0a6f222b-ea1d-fa2b-c296-77fe44a67486@ti.com>
Date: Tue, 29 Jun 2021 11:41:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5df72a60-9793-04b2-bae9-5164b510ee02@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 15T6Bnth037074
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/28/21 11:10 PM, Bajjuri, Praneeth wrote:
> Yogesh,Vignesh,
>=20
> On 6/28/2021 9:48 AM, Vignesh Raghavendra wrote:
>> From: Lokesh Vutla <lokeshvutla@ti.com>
>>
>> Update prueth switch firmwares to 3.2.9 version
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>> =C2=A0 recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb =3D> prusw-fw_3.2.9.bb}=
 | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>> =C2=A0 rename recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb =3D> prusw-fw_3.=
2.9.bb}
>> (94%)
>>
>> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
>> b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
>> similarity index 94%
>> rename from recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
>> rename to recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
>> index 17de58c2..3f5ef7e7 100644
>> --- a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
>> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
>> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE =3D
>> "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>> =C2=A0 =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> =C2=A0 -SRCREV =3D "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
>> +SRCREV =3D "dccfb2328354be2933a5a179b528ec8a18b92d3a"
>=20
> Can we have once central recipe for ti-linux-firmware to pick the right
> SRCREV when firmware is integrated recipe-bsp/ti-linux-fw*/*.bb
> something like that, Instead of pointing to a different SRCREV in
> different bb recipe ?
>=20
> I see 9 different recipe-bsp/<>/ locations potentially pointing to
> different SRCREV.
>=20

Sounds good to me. Not sure if I can do it for this release though.
Don't want to end up with bunch of broken stuff.

Regards
Vignesh
