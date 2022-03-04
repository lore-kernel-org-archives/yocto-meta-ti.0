Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.1207.1646424412970848287
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 12:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=iTgroXw/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224K6mlQ085355;
	Fri, 4 Mar 2022 14:06:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646424408;
	bh=XJAfjcB+1OdT/u2oxotj2BiZg4pjNqfRgeoOXVntflE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iTgroXw/FvW2JW+vBJlA3nFUodxmVVmFgCEjr/HzzmF10eLiDRVjbzSbSj6XWZNsA
	 7fHqsu7DEMTHx7Mo0kKnYZUjPD+Iy1roZo9SYW27Rb+Iaqt+4sLHBY+EBRlQENZkfF
	 LoWta1cjg9RYVjXEGBQ8b+cN6+bX5jbrbDgJOtNg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224K6meC033681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 14:06:48 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 14:06:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 14:06:48 -0600
Received: from [10.249.37.96] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224K6l7E002301;
	Fri, 4 Mar 2022 14:06:48 -0600
Message-ID: <d02c287a-fe2d-0288-a159-cbc5275a3147@ti.com>
Date: Fri, 4 Mar 2022 14:06:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [dunfell/master PATCH] pruss-fw: am57xx: Update hsr/prp/sw/dual-emac firmware
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Priya N S <priya.ns@mistralsolutions.com>,
        Kishon Vijay Abraham
	<kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220304191540.8578-1-praneeth@ti.com>
 <20e409f2-7eaa-ef7b-06df-ef1fcbab1309@ti.com>
 <3ec5372a-d727-d88b-a996-8594a0e61f97@ti.com>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <3ec5372a-d727-d88b-a996-8594a0e61f97@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 224K6mlQ085355
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 3/4/2022 13:40, Bajjuri, Praneeth wrote:
>=20
>=20
> On 3/4/2022 1:25 PM, Ryan Eatmon wrote:
>>> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb=20
>>> b/recipes-bsp/prueth-fw/prueth-fw.bb
>>> similarity index 88%
>>> rename from recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
>>> rename to recipes-bsp/prueth-fw/prueth-fw.bb
>>> index f7336fb1..e41bb3c0 100644
>>> --- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
>>> +++ b/recipes-bsp/prueth-fw/prueth-fw.bb
>>> @@ -2,6 +2,9 @@ SUMMARY =3D "PRU Ethernet firmware for AM57xx, AM437x=
=20
>>> and AM335x"
>>> =C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> +PV =3D "${PRUETH_FW_AM335X_VERSION}"
>>> +PV =3D "${PRUETH_FW_AM437X_VERSION}"
>>> +PV =3D "${PRUETH_FW_AM57XX_VERSION}"
>>> =C2=A0 PR =3D "${INC_PR}.0"
>>
>> I think you need to uniquify the PV variable for each platform.=C2=A0 =
Right=20
>> now you are just resetting each time and not overriding it.
>>
>> PV_am335x-evm =3D "${PRUETH_FW_AM335X_VERSION}"
>> etc...
>=20
> Thanks for the quick review,
> Does this work instead? PV_ti-soc?
>=20
> The FW version for each platform could be different as the mentioned=20
> commit in commitmessage points to updating the firmware only for am57xx=
=20
> but not for am335x/am437x.

While I think that might technically work, there are only three machines=20
that come into these recipes.  I think it would be more confusing for=20
someone reading the recipe to wonder what all makes up ti-soc, rather=20
than just seeing the three specific variables called out.  Plus you=20
created three variables in the ti-linux-fw.inc.  It would fit more in=20
line with other things in the same recipe to just list them out:


TARGET =3D ""
TARGET_ti33x =3D "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
TARGET_ti43x =3D "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
TARGET_am57xx-evm =3D "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.el=
f"
TARGET_am57xx-hs-evm =3D "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw=
.elf"

and

PV =3D ""
PV_ti33x =3D "${PRUETH_FW_AM335X_VERSION}"
PV_ti43x =3D "${PRUETH_FW_AM437X_VERSION}"
PV_am57xx-evm =3D "${PRUETH_FW_AM57XX_VERSION}"
PV_am57xx-hs-evm =3D "${PRUETH_FW_AM57XX_VERSION}"


>=20
>>

--=20
Ryan Eatmon
reatmon@ti.com
