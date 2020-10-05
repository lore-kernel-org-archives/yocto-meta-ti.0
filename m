Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.785.1601921265438338579
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=mks2dqIM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: prao@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095I7iUZ012885
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601921264;
	bh=iMOa1cPl/4zn8RuvkcCWkaF+C1lTKX4NBctdwAES7vQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=mks2dqIMYjLOEXGfCwhItjheJQ5IZNKg1MbT+wKtI+VhAUndU6Wi+g/nkXplexMpW
	 EojDWuocSQckgYXM8FLfSwAQhpsC4gMnxJ8oPCbo/zAaDvnrGDzIyceU54TrkHLhCr
	 TTDRKGfU9aZvrlu/kPdUBX0yz1AOq5ZpzUzi2YDI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095I7iAU112690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:07:44 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:07:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 13:07:44 -0500
Received: from [10.250.41.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095I7ivn068859;
	Mon, 5 Oct 2020 13:07:44 -0500
Subject: Re: [meta-ti][master][patch][v2] ti-sci-fw: update imggen SRCREV to the latest
To: Dan Murphy <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@ti.com>, <vigneshr@ti.com>, <piyali_g@ti.com>
CC: <nikhil.nd@ti.com>, <shyam.jagannathan@ti.com>, <l-weaver@ti.com>
References: <20201005144611.31380-1-prao@ti.com>
 <00b5a4c7-4ad5-19f0-d502-54820e145e11@ti.com>
From: prao@ti.com
Message-ID: <48e5d6a8-a4c3-b586-4257-1e39aef67945@ti.com>
Date: Mon, 5 Oct 2020 13:07:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00b5a4c7-4ad5-19f0-d502-54820e145e11@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 095I7iUZ012885
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

OK Dan.

Vignesh, Nikhil,
Are the latest k3-img-gen patches supported for am65evm?

On 10/5/20 12:36 PM, Dan Murphy wrote:
> Praveen
>=20
> On 10/5/20 9:46 AM, prao@ti.com wrote:
>> From: Praveen Rao <prao@ti.com>
>>
>> Signed-off-by: Praveen Rao <prao@ti.com>
>> ---
>> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc=20
>> b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> index 183ac8a7..7d278815 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> @@ -7,7 +7,7 @@ PV =3D "2020.07-rc3"
>> =C2=A0 SRCREV =3D "f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2"
>> =C2=A0 BRANCH ?=3D "ti-linux-firmware"
>> -SRCREV_imggen =3D "5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56"
>> +SRCREV_imggen =3D "09256d5c21e6281d224646c1d4163d4dd0925238"
>> =C2=A0 SRCREV_FORMAT =3D "imggen"
>> =C2=A0 SRC_URI =3D " \
>=20
> This failed to build for am65evm
>=20
> http://lcpd.gt.design.ti.com/builds/arago-dunfell-next/prod/am65xx-evm/=
145408/logs/am65xx-evm-error-logs/ti-sci-fw_2020.07-rc3-r1_do_compile.log=
=20
>=20
>=20
> Dan
>=20
