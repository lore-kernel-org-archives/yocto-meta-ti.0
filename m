Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.17486.1616993100353904250
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Mar 2021 21:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xat+UqGa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12T4ixDD005675
	for <meta-ti@lists.yoctoproject.org>; Sun, 28 Mar 2021 23:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616993099;
	bh=Y8D+FVZjVZ5oZCwwgjQ4QSJKGubKotxqrczw4HOU7BQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=xat+UqGalgGv8rGlCBmMiwujqrKVrVQYWqzHUU3l2H3KH0KlAIl2Ry6pEq85CtnL5
	 /4UeQDrWJEov22W4M3hM/H4tgewRtm2QoReDJQAfTaBKW+lrCE6qi8KU7Az7eQKPAy
	 z7cTv+fWBOWPND+Ds/gt74iex2kNpWsKDsSmXUH8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12T4ixDQ106764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 28 Mar 2021 23:44:59 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 28
 Mar 2021 23:44:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 28 Mar 2021 23:44:59 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12T4ixIw087979;
	Sun, 28 Mar 2021 23:44:59 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
To: Shiju Sivasankaran <shiju@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210329041149.26461-1-shiju@ti.com>
 <1670B67B8187941F.5213@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <6844b825-d64a-97bc-4668-c92cb037f4c5@ti.com>
Date: Sun, 28 Mar 2021 23:44:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1670B67B8187941F.5213@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 12T4ixDD005675
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/28/2021 11:41 PM, praneeth via lists.yoctoproject.org wrote:
>=20
>=20
> On 3/28/2021 11:11 PM, Shiju Sivasankaran wrote:
>> updated rtos firmware
>> am64xx: 07.03.00.13
>>
>> rtos fw of am64x build and upload from mcu-plus-sdk repo.
>> rtos fw of am65x, j7 and j7200 build and upload from pdk repo.
>=20
> This patch is not doing anything on non AM64x device.
>=20
> so this message about am65,j7* is redundant on what this patch is=20
> actually trying to address.
>=20

updating the commit message and pulling to dunfell-next to start the=20
build job.

>=20
>>
>> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
>> ---
>>
>> v3 - The way this system was designed is to be used with nightly builds
>> where commit is AUTOREV-ed (from next branch) and should work the same=
=20
>> with
>> master branch as well, hence TI_RTOS_METADATA_SRCREV_am64xx is removed
>> from previous patch
>>
>> =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
>> =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 2 +-
>> =C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb=20
>> b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> index e85948b2..fe020aa3 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY =3D "jacinto"
>> =C2=A0 DEFAULT_RTOS_VERSION =3D "07_03_00_21"
>> =C2=A0 DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.21"
>> -DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
>> -DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
>> +DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_13"
>> +DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.13"
>> =C2=A0 DEFAULT_RTOS_VERSION_am65xx =3D "07_03_00_22"
>> =C2=A0 DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.03.00.22"
>> @@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
>> =C2=A0 DEFAULT_FIRMWARE_SHA256SUM_j7 =3D=20
>> "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
>> =C2=A0 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D=20
>> "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
>> =C2=A0 DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D=20
>> "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
>> -DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D=20
>> "bc2d3d603ad30006ea3fefa3e777c26c19b95ee6d6f5a630259009f2f5a4996b"
>> +DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D=20
>> "0c43cea6ccaf45b3d7c48996f1c561e814a6e409a330da5d45877c82ce7a299a"
>> =C2=A0 # Use weak assignment for CORESDK_RTOS_* variables to use defaul=
ts=20
>> if not yet set
>> =C2=A0 CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb=20
>> b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> index 83e0e901..d7f22a1a 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> @@ -18,7 +18,7 @@ PLAT_SFX_am64xx =3D "/am64x"
>> =C2=A0 # Use weak assignment to set defaults to TI_RTOS_METADATA_* vari=
ables
>> =C2=A0 TI_RTOS_METADATA_URI ?=3D=20
>> "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
>> =C2=A0 TI_RTOS_METADATA_PROTOCOL ?=3D "git"
>> -TI_RTOS_METADATA_SRCREV ?=3D "3cda650c9e22eb4fd4eb5797ad998991a6124243=
"
>> +TI_RTOS_METADATA_SRCREV ?=3D "051de801b539f4acc6e7630684f9993e34332dde=
"
>> =C2=A0 TI_RTOS_METADATA_BRANCH ?=3D "master"
>> =C2=A0 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
>> =C2=A0 TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata=
.inc"
>>
>=20
>=20
>=20
>=20
