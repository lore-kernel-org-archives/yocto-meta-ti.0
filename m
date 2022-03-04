Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.963.1646422864306356260
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 11:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=bYR8v6bN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224Jf0h6108646;
	Fri, 4 Mar 2022 13:41:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646422860;
	bh=BMU6T4MWyO8+fxj1B6tVeKiUGPr+OJm75Nrtevf0gI4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bYR8v6bNleqQ4lF7bj0Ixrk2IhhMXulAMAQpLlsvU9BxYiYwQcuWOmxJovrub6MK7
	 R2zciU/Mnz/nkOVqOf++SFpdJd04f8HCXYNjef+I6RoJn1yzuu+cPlhR76VSo65EEg
	 aeeDFE+BLAHQk1vawmyXuCLPCf3Zj4XU12Iym2xQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224Jf0F6041768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 13:41:00 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 13:41:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 13:41:00 -0600
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224Jex99125001;
	Fri, 4 Mar 2022 13:40:59 -0600
Message-ID: <3ec5372a-d727-d88b-a996-8594a0e61f97@ti.com>
Date: Fri, 4 Mar 2022 13:40:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [dunfell/master PATCH] pruss-fw: am57xx: Update hsr/prp/sw/dual-emac firmware
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Yogesh
 Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Priya N S <priya.ns@mistralsolutions.com>,
        Kishon Vijay Abraham
	<kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220304191540.8578-1-praneeth@ti.com>
 <20e409f2-7eaa-ef7b-06df-ef1fcbab1309@ti.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20e409f2-7eaa-ef7b-06df-ef1fcbab1309@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 224Jf0h6108646
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 3/4/2022 1:25 PM, Ryan Eatmon wrote:
>> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb=20
>> b/recipes-bsp/prueth-fw/prueth-fw.bb
>> similarity index 88%
>> rename from recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
>> rename to recipes-bsp/prueth-fw/prueth-fw.bb
>> index f7336fb1..e41bb3c0 100644
>> --- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
>> +++ b/recipes-bsp/prueth-fw/prueth-fw.bb
>> @@ -2,6 +2,9 @@ SUMMARY =3D "PRU Ethernet firmware for AM57xx, AM437x=20
>> and AM335x"
>> =C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +PV =3D "${PRUETH_FW_AM335X_VERSION}"
>> +PV =3D "${PRUETH_FW_AM437X_VERSION}"
>> +PV =3D "${PRUETH_FW_AM57XX_VERSION}"
>> =C2=A0 PR =3D "${INC_PR}.0"
>=20
> I think you need to uniquify the PV variable for each platform.=C2=A0 R=
ight=20
> now you are just resetting each time and not overriding it.
>=20
> PV_am335x-evm =3D "${PRUETH_FW_AM335X_VERSION}"
> etc...

Thanks for the quick review,
Does this work instead? PV_ti-soc?

The FW version for each platform could be different as the mentioned=20
commit in commitmessage points to updating the firmware only for am57xx=20
but not for am335x/am437x.


>=20
