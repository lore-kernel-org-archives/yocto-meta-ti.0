Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2978.1634776874313629514
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 17:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Mf+EXoT2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19L0fAip040256;
	Wed, 20 Oct 2021 19:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634776870;
	bh=OGv9Nqdzb5vXIyiQJ/Zi6zJHgXfJxUtTaRtCwKtlt6g=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Mf+EXoT2s9YsFOn6k8MBEpe4NMyQl2+eQLhMjgwfLHuHp1r/1hY7KGnIDpoquIALi
	 asM+ifrGcY+EfTRkxzp2smmZ+VmF/y3X01RufxQyW1FRxaY2qQO6+hOlIzr6pSAs+X
	 IsPhwb0INUkHGOdpI+N0FwoTPbdXLlENlIuktoxY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19L0fAr5038991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Oct 2021 19:41:10 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Oct 2021 19:41:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 19:41:09 -0500
Received: from [10.250.234.228] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19L0f7JQ033334;
	Wed, 20 Oct 2021 19:41:07 -0500
Subject: Re: [dunfell-next PATCH v2] prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for AM65x SR2.0
To: "Siraswar, Yogesh" <yogeshs@ti.com>
CC: <denis@denix.org>, <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I
	<kishon@ti.com>
References: <20211020090522.17590-1-vigneshr@ti.com>
 <55e21713-6ade-280d-ab11-b79f580b2f9b@ti.com>
From: "Vignesh Raghavendra" <vigneshr@ti.com>
Message-ID: <4b4356bc-e567-8cdf-55bc-60683ee8981a@ti.com>
Date: Thu, 21 Oct 2021 06:11:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <55e21713-6ade-280d-ab11-b79f580b2f9b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 19L0fAip040256
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 10/20/21 3:44 PM, Siraswar, Yogesh wrote:
>=20
>=20
> On 10/20/2021 4:05 AM, Vignesh Raghavendra wrote:
>> From: Vignesh Raghavedra <vigneshr@ti.com>
>>
>> Add AM65x SR2.0 ICSSG Switch firmware. Base version is 02.02.09.06
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>> v2:
>>
>> Drop DUAL EMAC firmware recipe update as its now auto rev'd
>>
>> =C2=A0 .../prusw-fw/prusw-fw-am65x-sr2_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 34 +++++++++++++++++++
>> =C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
>> =C2=A0 2 files changed, 35 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.=
bb
>>
>> diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>> b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>> new file mode 100644
>> index 000000000000..8cb450acc2b6
>> --- /dev/null
>> +++ b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>> @@ -0,0 +1,34 @@
>> +SUMMARY =3D "PRU Ethernet Switch firmware for AM65xx SR2.0"
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +PV =3D "${PRUETH_FW_AM65X_SR2_VERSION}"
>=20
> Will the PRUSW FW version always be same as PRUETH FW?
>=20

That's correct. Both firmwares are built from same source currently.


Regards
Vignesh

[...]
