Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.960.1615849560103481823
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 16:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=H4C/e31R;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FN5tUg032212;
	Mon, 15 Mar 2021 18:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615849555;
	bh=GMuictF3RR/YPlSfrefcV7X6gfG4wkQ6RUJsxtgIjtk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=H4C/e31RYpgSBlJ7bX39albFQlcWiZWvXwKdhZFbAB+Jydm+nxPr5e7P3yXN71rKy
	 dyf0ZdQGsWySjMplcydkqypNvXS21Jp1dF3AwUiD7pIdaN4qqksjhm6sXgwYTIKbYO
	 qDKgxVKtFXn1w1jT3rKrR1xxqUPYGXRumKcBEjtI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FN5ts9063562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 18:05:55 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 18:05:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 18:05:55 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FN5sTp111234;
	Mon, 15 Mar 2021 18:05:54 -0500
Subject: Re: [meta-ti] [dunfell/next v2 PATCH] ti-rtos: update to uisng fw from mcu-plus-sdk for AM64x
To: "Sivasankaran, Shiju" <shiju@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Sivasankaran, Shiju" <shiju@ti.com>
References: <20210311102430.26263-1-shiju@ti.com>
 <20210312230730.GD4892@denix.org>
 <ed0c8702-1661-685e-5562-f6522b61a074@ti.com>
 <e54e9f57f827460e95d57d36533866b8@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <e8619eef-3334-d611-64ac-3ccbcf722a1e@ti.com>
Date: Mon, 15 Mar 2021 18:05:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e54e9f57f827460e95d57d36533866b8@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 12FN5tUg032212
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/15/2021 1:27 AM, Sivasankaran, Shiju wrote:
> Praneeth
> To pick AM64x mcu-plus-sdk FW, we have pinned coresdk-rtos-releases rep=
o to a latest commit - "e558080592d910783bf2f9ad46ed3b622f899155"
> There was one latest build happened for AM65x under coresdk-rtos-releas=
es repo commit - "e558080592d910783bf2f9ad46ed3b622f899155"and hence the =
DEFAULT_FIRMWARE_SHA256SUM_am65xx got updated.
> For J7 and j7200-evm, no new release builds triggered by PDK and hence =
no changes in respective SHA256SUM

There is a FW update planned for J7, J7200, AM65 . Please check with=20
ankur/shiju. What i am saying is any update related to AM65x doesnt=20
belong in the patch you pointed for AM64x.

All your patch should include is
TI_RTOS_METADATA_SRCREV for pointing the commitsha after the AM64x=20
specific tag is merged ,ie. e558080592d910783bf2f9ad46ed3b622f899155

and SHA256SUM of AM64x of _firmware tar from
https://git.ti.com/gitweb?p=3Dprocessor-sdk/coresdk_rtos_releases.git;a=3D=
blob;f=3Dam64x/mcusdk_metadata.inc;h=3D643dc3ebb56e7d895d750a7885e4265d65=
9953d5;hb=3De558080592d910783bf2f9ad46ed3b622f899155

ie.: bc2d3d603ad30006ea3fefa3e777c26c19b95ee6d6f5a630259009f2f5a4996b

>=20
> Regards, Shiju
>=20
>=20
> -----Original Message-----
> From: Bajjuri, Praneeth
> Sent: Saturday, March 13, 2021 8:11 AM
> To: Denys Dmytriyenko <denis@denix.org>; Sivasankaran, Shiju <shiju@ti.=
com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti] [dunfell/next v2 PATCH] ti-rtos: update to uisng=
 fw from mcu-plus-sdk for AM64x
>=20
>=20
>=20
> On 3/12/2021 5:07 PM, Denys Dmytriyenko wrote:
>> On Thu, Mar 11, 2021 at 03:54:30PM +0530, Shiju Sivasankaran via lists=
.yoctoproject.org wrote:
>>> update ti-rtos-metadata and ti-rtos-firmware recipes of meta-ti to
>>> pick AM64x rtos firmware from mcu-plus-sdk instead of PDK.
>>>
>>> Other devices such as AM65x, J7 continue to use fw from PDK.
>>>
>>> Built and tested both IPC echo test applications - "rpmsg_client_samp=
le=E2=80=9D
>>> & =E2=80=9Crpmsg_char_simple=E2=80=9D. Both tests passed for all remo=
te R5F cores on
>>> AM64x EVM
>>>
>>> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
>>> ---
>>> v2: rebased to dunfell-next
>>> DEFAULT_FIRMWARE_SHA256SUM_am65xx updated
>>
>> Why are you updating am65xx when you said only am64xx is being
>> switched from PDK to mcu-plus-sdk?
>>
>> Also, can you explain what is it and why it has to be the default for =
am64x?
>> Shouldn't CoreSDK Linux pick CoreSDK RTOS (i.e. PDK) components by def=
ault?
>>
>> Thanks.
>>
>>
>>>    recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 14 +++++++++-----
>>>    recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  3 ++-
>>>    2 files changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> index 507d0000..c70fc50d 100644
>>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> @@ -11,17 +11,20 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>>>   =20
>>>    inherit deploy
>>>   =20
>>> +DEFAULT_METADATA_FILE ?=3D "metadata.inc"
>>> +DEFAULT_METADATA_FILE_am64xx ?=3D "mcusdk_metadata.inc"
>>> +
>>>    # First, let's try including metadata.inc that could be fetched an=
d deployed
>>>    # by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_=
*
>>> variables -include ${DEPLOY_DIR_IMAGE}/metadata.inc
>>> +include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
>>>   =20
>>>    # Set some defaults for when metadata.inc is not available
>>>    DEFAULT_RTOS_FAMILY =3D "jacinto"
>>>    DEFAULT_RTOS_VERSION =3D "07_03_00_16"
>>>    DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.16"
>>>   =20
>>> -DEFAULT_RTOS_VERSION_am64xx =3D "07_03_01_06"
>>> -DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.01.06"
>>> +DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
>>> +DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
>>>   =20
>>>    DEFAULT_RTOS_SOC =3D "undefined"
>>>    DEFAULT_RTOS_SOC_j7 =3D "j721e"
>>> @@ -36,6 +39,7 @@ DEFAULT_RTOS_WEBLINK_am65xx =3D "https://software-d=
l.ti.com/processor-sdk-rtos/esd
>>>    DEFAULT_RTOS_WEBLINK_am64xx =3D "https://software-dl.ti.com/proces=
sor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
>>>   =20
>>>    DEFAULT_FIRMWARE_FILE =3D "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORE=
SDK_RTOS_VERSION}_firmware.tar.xz"
>>> +DEFAULT_FIRMWARE_FILE_am64xx =3D "mcu_plus_sdk_${CORESDK_RTOS_SOC}_$=
{CORESDK_RTOS_VERSION}_firmware.tar.xz"
>>>   =20
>>>    DEFAULT_FIRMWARE_URL =3D "file://empty"
>>>    DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIR=
MWARE_FILE}"
>>> @@ -43,8 +47,8 @@ DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK=
}/${DEFAULT_FIRMWARE_FILE}"
>>>    DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
>>>    DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "78f3ab929a0f3c6e2907538061de82e=
16d8aff7ffb2fac0c3c4d56df8abec3b0"
>>>    DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "5bae696d35e206bbcd9b26ab=
6508af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
>>> -DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "7bd854dbf96c25683d684ac731fde=
3edd7fb8a65f8727f7aae3802a2e9a9cab6"
>>> -DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "450bf23d659756695d62168fe06ee=
be4641522293d89692a9eea837426bac0f9"
>>> +DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "d3cffd472fdd17b000afcee806318=
344e6033ac271ab3a6fa9ca8f432e8420c9"
>=20
> Shiju, Fix this ,
>=20
> AM65xx update doesnt make sense in this patch.
>=20
>=20
>>> +DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c=
26c19b95ee6d6f5a630259009f2f5a4996b"
>>>   =20
>>>    # Use weak assignment for CORESDK_RTOS_* variables to use defaults=
 if not yet set
>>>    CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
>>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>>> b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>>> index 9bb0d3c5..466a22a8 100644
>>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>>> @@ -18,10 +18,11 @@ PLAT_SFX_am64xx =3D "/am64x"
>>>    # Use weak assignment to set defaults to TI_RTOS_METADATA_* variab=
les
>>>    TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_=
rtos_releases.git"
>>>    TI_RTOS_METADATA_PROTOCOL ?=3D "git"
>>> -TI_RTOS_METADATA_SRCREV ?=3D "ba81dc5a9342fc35435920092a0df2cb2ab342=
ef"
>>> +TI_RTOS_METADATA_SRCREV ?=3D "e558080592d910783bf2f9ad46ed3b622f8991=
55"
>>>    TI_RTOS_METADATA_BRANCH ?=3D "master"
>>>    TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
>>>    TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.i=
nc"
>>> +TI_RTOS_METADATA_FILE_am64xx ?=3D "${S}${TI_RTOS_METADATA_DIR}/mcusd=
k_metadata.inc"
>>>   =20
>>>    PV =3D "1.0.0+git${SRCPV}"
>>>   =20
>>> --
>>> 2.17.1
>>>
>>
