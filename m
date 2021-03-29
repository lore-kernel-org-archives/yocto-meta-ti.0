Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.16924.1616990400874568519
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Mar 2021 21:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c7lx39LE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: shiju@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12T3xqq4120329;
	Sun, 28 Mar 2021 22:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616990392;
	bh=08x8JnU0BuSlKWL3w0t9N3eQXTv12CfRGI6k3PcOyYg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=c7lx39LEYsjs1E4C02cDgdWR+/txcNtg9EPsP8eQFFBNiix1RDzOIX8wGSNlPt45B
	 yI24ECi7bcwzY/e5qRsNFWziBw8pQ3+7iCEkjAWE23+fSyjzfOt1wVeOvZ+5/NlMOQ
	 +uhrEl5EAYoTNCICqlTp4LJ5rTUdD8PxoyOFRS/Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12T3xqgf107052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 28 Mar 2021 22:59:52 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 28
 Mar 2021 22:59:51 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.009; Sun, 28 Mar 2021 22:59:52 -0500
From: "Shiju Sivasankaran" <shiju@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
Thread-Topic: [EXTERNAL] Re: [meta-ti] [dunfell/master PATCH] ti-rtos: update
 metadata and version of am64x rtos firmware
Thread-Index: AQHXIhAcgrLCPb9rfkGuAaVZtxgfx6qW9IyAgANml6A=
Date: Mon, 29 Mar 2021 03:59:51 +0000
Message-ID: <4fa12dc9801f49328d7221c314648a7d@ti.com>
References: <20210326071732.5268-1-shiju@ti.com>
 <20210326190129.GX18041@denix.org>
In-Reply-To: <20210326190129.GX18041@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.235.243]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>=20
Sent: Saturday, March 27, 2021 12:31 AM
To: Sivasankaran, Shiju <shiju@ti.com>
Cc: meta-ti@lists.yoctoproject.org; Bajjuri, Praneeth <praneeth@ti.com>
Subject: [EXTERNAL] Re: [meta-ti] [dunfell/master PATCH] ti-rtos: update me=
tadata and version of am64x rtos firmware

On Fri, Mar 26, 2021 at 12:47:32PM +0530, Shiju Sivasankaran via lists.yoct=
oproject.org wrote:
> updated rtos firmware
> am64xx: 07.03.00.13
>=20
> rtos fw of am64x build and upload from mcu-plus-sdk repo.
> rtos fw of am65x, j7 and j7200 build and upload from pdk repo.
> a separate TI_RTOS_METADATA_SRCREV_am64xx for pining am64x fw from=20
> mcu-plus-sdk avoids syncing of builds from two different repos.
>=20
> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
> ---

It seems you are using the same external WEBLINK location between coresdk a=
nd mcusdk.

Here's the latest location with mcusdk images:
https://downloads.ti.com/processor-sdk-rtos/esd/AM64X/firmware/07_03_00_13

Here's the latest location with coresdk images:
https://downloads.ti.com/processor-sdk-rtos/esd/AM64X/firmware/07_03_01_06

The difference is in version and mcusdk is lower than coresdk. So, it's ver=
y confusing and you have a chance of clashing eventually.

[Shiju] Mcu-plus-sdk version is controlled by sitara-mcu+ BU, and we do not=
 have any control here

> v2 - typo in the commit-message corrected
>=20
> All the FW are hosted on same repo processor-sdk/coresdk_rtos_releases.=20
> But its only hosting purpose, these FW are builds from PDK (all device=20
> except AM64x) and mcu-plus-sdk (AM64x alone) Similarly metadata.inc will=
=20
> be used to get the version/urls details for all devices except AM64x and=
=20
> mcusdk_metadata.inc is used for AM64x. Same metadata.inc for mcu-plus-sdk=
=20
> is a big risk as any PDK build of AM64x can override this.
>=20
> coresdk_rtos_releases  has 2 branches - master & next. =20
> All metadata files and tags are applied on next and during RC period=20
> coreSDK team merge next to master.  At the same time next-branch also=20
> carry the metadata files from daily build as well.  During this merge=20
> they make sure only release builds of all devices on that tag/commit,=20
> as only release build points the FW url from external location. =20
> If any daily build of any device happens in between the tagging and=20
> as daily build has TI internal url for FW will spoil the purpose. =20
> AM65x, J7 & J7200 builds of PSDK should have happen one after another=20
> without any daily builds in between, this can be controlled as all these=
=20
> are built from same codebase of PDK.  As AM64x builds from mcu-plus-sdk,=
=20
> a different codebase, code-freeze and RC timing rarely match. =20
> Rebuild of all devices and recipe updates will arises if builds from=20
> both repo doesn't happen at same time. Separate TI_RTOS_METADATA_SRCREV_a=
m64xx=20
> is added to avoid this syncing of builds from two different repos.

Not convincing. You use separate metadata.inc files, and even though coresd=
k=20
and mcusdk commits are interspersed, it's quite safe to use one latest comm=
it=20
for both. The way this system was designed is to be used with nightly build=
s=20
where commit is AUTOREV-ed (from next branch) and should work the same with=
=20
master branch as well.

[Shiju] okay, I will revert this change=20

>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
> index e85948b2..fe020aa3 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY =3D "jacinto"
>  DEFAULT_RTOS_VERSION =3D "07_03_00_21"
>  DEFAULT_RTOS_VERSION_DOT =3D "07.03.00.21"
> =20
> -DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_03"
> -DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.03"
> +DEFAULT_RTOS_VERSION_am64xx =3D "07_03_00_13"
> +DEFAULT_RTOS_VERSION_DOT_am64xx =3D "07.03.00.13"
> =20
>  DEFAULT_RTOS_VERSION_am65xx =3D "07_03_00_22"
>  DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.03.00.22"
> @@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
>  DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "fc7805ed3d6c1801efb2b85ac9af99a8657aa=
3a7a9327bc16a1163d566f11c2c"
>  DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "71f282ba6768ad3b603a17d30851cc=
621986c88311c174960a50196bfc79f85c"
>  DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "61e0be08bea8ab1055645bd96504a6a29=
c70318c5b277237dee9981cd94d7f79"
> -DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "bc2d3d603ad30006ea3fefa3e777c26c1=
9b95ee6d6f5a630259009f2f5a4996b"
> +DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "0c43cea6ccaf45b3d7c48996f1c561e81=
4a6e409a330da5d45877c82ce7a299a"
> =20
>  # Use weak assignment for CORESDK_RTOS_* variables to use defaults if no=
t yet set
>  CORESDK_RTOS_FAMILY ?=3D "${DEFAULT_RTOS_FAMILY}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-metadata.bb
> index 83e0e901..f052c627 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -19,6 +19,7 @@ PLAT_SFX_am64xx =3D "/am64x"
>  TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
>  TI_RTOS_METADATA_PROTOCOL ?=3D "git"
>  TI_RTOS_METADATA_SRCREV ?=3D "3cda650c9e22eb4fd4eb5797ad998991a6124243"
> +TI_RTOS_METADATA_SRCREV_am64xx ?=3D "051de801b539f4acc6e7630684f9993e343=
32dde"
>  TI_RTOS_METADATA_BRANCH ?=3D "master"
>  TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
>  TI_RTOS_METADATA_FILE ?=3D "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> --=20
> 2.17.1
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
