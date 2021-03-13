Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1471.1615603284194567120
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 18:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=CE6jfcog;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12D2fJRn062857;
	Fri, 12 Mar 2021 20:41:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615603279;
	bh=WWIauu/SNEWAlG8qRuwn1gz7ySYqip3BShlQAwusVRA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CE6jfcognG/j/qp1Y3ZpgUXcjuIud6Hq2H1EAE4jUHDQqC2DOgvPlHF0IJe/4YwpV
	 7jkQ+r3tKsvkWHtRkcwUmJn3/4zxlbJ7H+uiLoI5Pp+U/THzFfdPC1XNZ+R5eVlt1r
	 CSm6zOEjtA3c1GNYEjf+9ArPmuNM3eiGkb3DGLgM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12D2fIMr069873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Mar 2021 20:41:18 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 12
 Mar 2021 20:41:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 12 Mar 2021 20:41:18 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12D2fIC0010787;
	Fri, 12 Mar 2021 20:41:18 -0600
Subject: Re: [meta-ti] [dunfell/next v2 PATCH] ti-rtos: update to uisng fw from mcu-plus-sdk for AM64x
To: Denys Dmytriyenko <denis@denix.org>, <shiju@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210311102430.26263-1-shiju@ti.com>
 <20210312230730.GD4892@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <ed0c8702-1661-685e-5562-f6522b61a074@ti.com>
Date: Fri, 12 Mar 2021 20:41:18 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312230730.GD4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 12D2fJRn062857
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/12/2021 5:07 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 11, 2021 at 03:54:30PM +0530, Shiju Sivasankaran via lists.=
yoctoproject.org wrote:
>> update ti-rtos-metadata and ti-rtos-firmware recipes of meta-ti to
>> pick AM64x rtos firmware from mcu-plus-sdk instead of PDK.
>>
>> Other devices such as AM65x, J7 continue to use fw from PDK.
>>
>> Built and tested both IPC echo test applications - "rpmsg_client_sampl=
e=E2=80=9D
>> & =E2=80=9Crpmsg_char_simple=E2=80=9D. Both tests passed for all remot=
e R5F cores
>> on AM64x EVM
>>
>> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
>> ---
>> v2: rebased to dunfell-next
>> DEFAULT_FIRMWARE_SHA256SUM_am65xx updated
>=20
> Why are you updating am65xx when you said only am64xx is being switched=
 from
> PDK to mcu-plus-sdk?
>=20
> Also, can you explain what is it and why it has to be the default for a=
m64x?
> Shouldn't CoreSDK Linux pick CoreSDK RTOS (i.e. PDK) components by defa=
ult?
>=20
> Thanks.
>=20
>=20
>>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 14 +++++++++-----
>>   recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  3 ++-
>>   2 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/t=
i-rtos-bin/ti-rtos-firmware.bb
>> index 507d0000..c70fc50d 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -11,17 +11,20 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>>  =20
>>   inherit deploy
>>  =20
>> +DEFAULT_METADATA_FILE ?=3D "metadata.inc"
>> +DEFAULT_METADATA_FILE_am64xx ?=3D "mcusdk_metadata.inc"
>> +
>>   # First, let's try including metadata.inc that could be fetched and =
deployed
>>   # by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* =
variables
>> -include ${DEPLOY_DIR_IMAGE}/metadata.inc
>> +include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
>>  =20
>>   # Set some defaults for when metadata.inc is not available
>>   DEFAULT_RTOS_FAMILY =3D "jacinto"
>>   DEFAULT_RTOS_VERSION =3D "07_03_00_16"
>>   DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.16"
>>  =20
>> -DEFAULT_RTOS_VERSION_am64xx =3D "07_03_01_06"
>> -DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.01.06"
>> +DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
>> +DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
>>  =20
>>   DEFAULT_RTOS_SOC =3D "undefined"
>>   DEFAULT_RTOS_SOC_j7 =3D "j721e"
>> @@ -36,6 +39,7 @@ DEFAULT_RTOS_WEBLINK_am65xx =3D "https://software-dl=
.ti.com/processor-sdk-rtos/esd
>>   DEFAULT_RTOS_WEBLINK_am64xx =3D "https://software-dl.ti.com/processo=
r-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
>>  =20
>>   DEFAULT_FIRMWARE_FILE =3D "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESD=
K_RTOS_VERSION}_firmware.tar.xz"
>> +DEFAULT_FIRMWARE_FILE_am64xx =3D "mcu_plus_sdk_${CORESDK_RTOS_SOC}_${=
CORESDK_RTOS_VERSION}_firmware.tar.xz"
>>  =20
>>   DEFAULT_FIRMWARE_URL =3D "file://empty"
>>   DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMW=
ARE_FILE}"
>> @@ -43,8 +47,8 @@ DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}=
/${DEFAULT_FIRMWARE_FILE}"
>>   DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
>>   DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "78f3ab929a0f3c6e2907538061de82e16=
d8aff7ffb2fac0c3c4d56df8abec3b0"
>>   DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "5bae696d35e206bbcd9b26ab65=
08af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
>> -DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "7bd854dbf96c25683d684ac731fde3=
edd7fb8a65f8727f7aae3802a2e9a9cab6"
>> -DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "450bf23d659756695d62168fe06eeb=
e4641522293d89692a9eea837426bac0f9"
>> +DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "d3cffd472fdd17b000afcee8063183=
44e6033ac271ab3a6fa9ca8f432e8420c9"

Shiju, Fix this ,

AM65xx update doesnt make sense in this patch.


>> +DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c2=
6c19b95ee6d6f5a630259009f2f5a4996b"
>>  =20
>>   # Use weak assignment for CORESDK_RTOS_* variables to use defaults i=
f not yet set
>>   CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/t=
i-rtos-bin/ti-rtos-metadata.bb
>> index 9bb0d3c5..466a22a8 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> @@ -18,10 +18,11 @@ PLAT_SFX_am64xx =3D "/am64x"
>>   # Use weak assignment to set defaults to TI_RTOS_METADATA_* variable=
s
>>   TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rt=
os_releases.git"
>>   TI_RTOS_METADATA_PROTOCOL ?=3D "git"
>> -TI_RTOS_METADATA_SRCREV ?=3D "ba81dc5a9342fc35435920092a0df2cb2ab342e=
f"
>> +TI_RTOS_METADATA_SRCREV ?=3D "e558080592d910783bf2f9ad46ed3b622f89915=
5"
>>   TI_RTOS_METADATA_BRANCH ?=3D "master"
>>   TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
>>   TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc=
"
>> +TI_RTOS_METADATA_FILE_am64xx ?=3D "${S}${TI_RTOS_METADATA_DIR}/mcusdk=
_metadata.inc"
>>  =20
>>   PV =3D "1.0.0+git${SRCPV}"
>>  =20
>> --=20
>> 2.17.1
>>
>=20
