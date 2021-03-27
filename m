Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.771.1616866732821067677
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 27 Mar 2021 10:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=L6r4NT1T;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BF13738C06B9
	for <meta-ti@yoctoproject.org>; Sat, 27 Mar 2021 17:38:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12RHcl6x012228;
	Sat, 27 Mar 2021 12:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616866727;
	bh=5eaAEuVifCWPDHZDtZM61OugmONsKvFe8jLh17QdL0Q=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=L6r4NT1TWRsXs5/cFkgnwU7Z6TGXAr1jSUXhv7OkjFtQTlumc2MT9z0xYIzzXUF/6
	 7Siq8Puf5bJ09wvVYf0jLQbxGIxGA4ZMqksiFWfcXCFEfjWssmfTUIVltvC80iYODx
	 FXIdIYR73wlUeF8tQMeLhBnKBS1gEo0FV9SilboM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12RHcllZ035686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 27 Mar 2021 12:38:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 27
 Mar 2021 12:38:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 27 Mar 2021 12:38:47 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12RHckBe094082;
	Sat, 27 Mar 2021 12:38:47 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-img-rogue-umlibs: Update to pick rpath fixes
To: Denys Dmytriyenko <denis@denix.org>
CC: "Tammana, Gowtham" <g-tammana@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>,
        "denys@konsulko.com" <denys@konsulko.com>
References: <20210323230709.9607-1-g-tammana@ti.com>
 <20210327055342.GZ18041@denix.org>
 <1670216A3CA6D032.28225@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <86fd3e0e-5edf-b0f0-43e0-bd9af3b11a3a@ti.com>
Date: Sat, 27 Mar 2021 12:38:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1670216A3CA6D032.28225@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/27/2021 2:09 AM, praneeth via lists.yoctoproject.org wrote:
> In dunfell-next,
> Will pick to Dunfell and master in a day.
>=20
> On Mar 27, 2021 12:53 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Mar 23, 2021 at 06:07:09PM -0500, Gowtham Tammana via=20
> lists.yoctoproject.org wrote:
>> Update srcrev to pick the rpath warning fixes.
>>=20
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>=20
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Praneeth,
>=20
> Has this been picked up yet? Especially needed for the master, where=20
> it's no
> longer a warning, but an error.

Pulled to master and dunfell now.

>=20
>=20
>> ---
>>=A0 recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb | 4 ++-=
-
>>=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.=
bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
>> index d8fae3dd..dafb9dd8 100644
>> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
>> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
>> @@ -10,13 +10,13 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
>>=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>=A0 COMPATIBLE_MACHINE =3D "j7"
>>  
>> -PR =3D "r1"
>> +PR =3D "r2"
>>  
>>=A0 BRANCH =3D "linuxws/dunfell/k5.4/${PV}"
>>  
>>=A0 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branc=
h=3D${BRANCH}"
>>  
>> -SRCREV =3D "3c4cabc8df10a066569e5f959cbbd4c0ce9961cd"
>> +SRCREV =3D "5ef38353c38d921a65ea6df75c7b6ce710b66034"
>>  
>>=A0 PVR_SOC ?=3D "j721e_linux"
>>=A0 PVR_BUILD ?=3D "release"
>> --=20
>> 2.31.0
>>=20
>=20
>=20
>=20
>=20
