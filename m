Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1977.1615437373848661374
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 20:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=JrbGRMVB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12B4aCkY042377
	for <meta-ti@lists.yoctoproject.org>; Wed, 10 Mar 2021 22:36:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615437372;
	bh=3bJ6SVbycO1B8jgpwsD8iq1hP/haE2qtat4sIsQ36I4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JrbGRMVBBEyFYQ5MsTjgwaMluc/D771YPD6CcEtFeXZFtlxhxhV9D4tvQnynjI5Os
	 /3bi3E7AUPFsXB+WhWmEft29baJZP7QI/LG7DUFbh2ARwXmO0g4wikYiS2ikESv419
	 bomOhk0ERLuyF7lrQk+LMDk1H6v4JtEmVn9HXSyE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12B4aCF4059716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 10 Mar 2021 22:36:12 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 10
 Mar 2021 22:36:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 10 Mar 2021 22:36:12 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12B4aChk113909;
	Wed, 10 Mar 2021 22:36:12 -0600
Subject: Re: [dunfell/master PATCH] ti-rtos: update to uisng fw from mcu-plus-sdk for AM64x
To: Shiju Sivasankaran <shiju@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210310061246.12448-1-shiju@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <193c11a7-b856-4a3b-aa70-5bc73b81aa93@ti.com>
Date: Wed, 10 Mar 2021 22:36:12 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310061246.12448-1-shiju@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 12B4aCkY042377
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/10/2021 12:12 AM, Shiju Sivasankaran wrote:
> update ti-rtos-metadata and ti-rtos-firmware recipes of meta-ti to
> pick AM64x rtos firmware from mcu-plus-sdk instead of PDK.
>=20
> Other devices such as AM65x, J7 continue to use fw from PDK.
>=20
> Built and tested both IPC echo test applications - "rpmsg_client_sample=
=E2=80=9D
> & =E2=80=9Crpmsg_char_simple=E2=80=9D. Both tests passed for all remote=
 R5F cores
> on AM64x EVM
>=20
> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 12 ++++++++----
>   recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  3 ++-
>   2 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti=
-rtos-bin/ti-rtos-firmware.bb
> index ed62b876..63b34723 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -11,9 +11,12 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>  =20
>   inherit deploy
>  =20
> +DEFAULT_METADATA_FILE ?=3D "metadata.inc"
> +DEFAULT_METADATA_FILE_am64xx ?=3D "mcusdk_metadata.inc"
> +
>   # First, let's try including metadata.inc that could be fetched and d=
eployed
>   # by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* v=
ariables
> -include ${DEPLOY_DIR_IMAGE}/metadata.inc
> +include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
>  =20
>   # Set some defaults for when metadata.inc is not available
>   DEFAULT_RTOS_FAMILY =3D "jacinto"
> @@ -23,8 +26,8 @@ DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.12"
>   DEFAULT_RTOS_VERSION_j7200 =3D "07_03_00_10"
>   DEFAULT_RTOS_VERSION_DOT_j7200 =3D "07.03.00.10"
>  =20
> -DEFAULT_RTOS_VERSION_am64xx =3D "07_03_01_02"
> -DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.01.02"
> +DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
> +DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"

Please rebase the patch to current dunfell/dunfell-next.

>  =20
>   DEFAULT_RTOS_VERSION_am65xx =3D "07_03_00_10"
>   DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.03.00.10"
> @@ -41,6 +44,7 @@ DEFAULT_RTOS_WEBLINK_am65xx =3D "https://software-dl.=
ti.com/processor-sdk-rtos/esd
>   DEFAULT_RTOS_WEBLINK_am64xx =3D "https://software-dl.ti.com/processor=
-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
>  =20
>   DEFAULT_FIRMWARE_FILE =3D "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK=
_RTOS_VERSION}_firmware.tar.xz"
> +DEFAULT_FIRMWARE_FILE_am64xx =3D "mcu_plus_sdk_${CORESDK_RTOS_SOC}_${C=
ORESDK_RTOS_VERSION}_firmware.tar.xz"
>  =20
>   DEFAULT_FIRMWARE_URL =3D "file://empty"
>   DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWA=
RE_FILE}"
> @@ -49,7 +53,7 @@ DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
>   DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "69cc16c30c895fe813002bd7bdb3d30e6c=
a622d86b008a6bf6e2a24b86550969"
>   DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "a16865d928b2b00bfca64e0c41b=
02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
>   DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "aa121c10d3099dd61ef898717245ec=
ee25b501170607c9a95afd741e05783a5d"
> -DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "9e9efeef0b1dbb101de97e58cfda8bf=
052a697f2ea635fdf6ca5158fffdc212b"
> +DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c26=
c19b95ee6d6f5a630259009f2f5a4996b"
>  =20
>   # Use weak assignment for CORESDK_RTOS_* variables to use defaults if=
 not yet set
>   CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti=
-rtos-bin/ti-rtos-metadata.bb
> index 1bbe5f22..466a22a8 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -18,10 +18,11 @@ PLAT_SFX_am64xx =3D "/am64x"
>   # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
>   TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rto=
s_releases.git"
>   TI_RTOS_METADATA_PROTOCOL ?=3D "git"
> -TI_RTOS_METADATA_SRCREV ?=3D "e15de0d731606abdf112f2910543fd08b781ad64=
"
> +TI_RTOS_METADATA_SRCREV ?=3D "e558080592d910783bf2f9ad46ed3b622f899155=
"
>   TI_RTOS_METADATA_BRANCH ?=3D "master"
>   TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
>   TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> +TI_RTOS_METADATA_FILE_am64xx ?=3D "${S}${TI_RTOS_METADATA_DIR}/mcusdk_=
metadata.inc"
>  =20
>   PV =3D "1.0.0+git${SRCPV}"
>  =20
>=20
