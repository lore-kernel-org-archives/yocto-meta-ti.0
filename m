Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3247.1644272486149317596
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 14:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=rx4uJBx5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217MLNff080798;
	Mon, 7 Feb 2022 16:21:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644272483;
	bh=3ca3cINa15SPWoBTAPHf6DWTjQHawaw+ZsUSFLUJguc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=rx4uJBx5ioGpSbVawyy6NtzcmloV6ypIQdcDkYTEbmyZwhH17QZVm4/bgqf2x0F4t
	 kqYnfaeoadn+swPvaTsVHvJTyejOZkYE+QxdbaYnUTWgkQKXtc+mg4Ht16nNuwLZ1q
	 3iP4nNYynEc0OcgfFXDDHu3FWMnYDWPMfYHMvMg4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217MLNP5117725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 16:21:23 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 16:21:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 16:21:22 -0600
Received: from [10.250.33.180] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217MLMW3113583;
	Mon, 7 Feb 2022 16:21:22 -0600
Message-ID: <8727421f-652e-8514-6e18-36bb994b7a62@ti.com>
Date: Mon, 7 Feb 2022 16:21:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [meta-ti][dunfell][PATCH] ti-linux-fw: Bump to 08.02.00.001 release
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220207195043.22226-1-reatmon@ti.com>
 <5ccc74db-39a5-51ec-e739-7e12730032d1@ti.com>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <5ccc74db-39a5-51ec-e739-7e12730032d1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 217MLNff080798
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2/7/2022 14:07, Bajjuri, Praneeth wrote:
>=20
>=20
> On 2/7/2022 1:50 PM, Ryan Eatmon wrote:
>> Updated the ti-linux-fw version for 08.02.00.001
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com> > ---
>> =C2=A0 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc=20
>> b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 014e89c8..612e0689 100644
>> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION =3D "1.2.17"
>> =C2=A0 IMG_DEC_FW_VERSION =3D "1.0"
>> =C2=A0 CNM_WAVE521_FW_VERSION =3D "1.0.00"
>=20
> Few more places needs recipe update.
> https://git.yoctoproject.org/meta-ti/tree/recipes-bsp/ti-linux-fw/ti-li=
nux-fw.inc?h=3Ddunfell=20
>=20
>=20
> How about
> K3_IMAGE_GEN_SRCREV ?=3D "892c86501ff745dfde4d535923ce686f45700da3"

That one was already changed by a previous patch that you submitted.

> and
>=20
> CORESDK_RTOS_VERSION =3D "08.02.00.04"

I have addressed this in v2.

> and
>=20
> PV =3D "2022.01"

That one was already changed by a previous patch that you submitted.


>> -TI_LINUX_FW_SRCREV ?=3D "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
>> +TI_LINUX_FW_SRCREV ?=3D "028414712b4ab3861dc4cc2aa14d7c5f5a37b521"
>> =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
>> =C2=A0 BRANCH ?=3D "ti-linux-firmware"

--=20
Ryan Eatmon
reatmon@ti.com
