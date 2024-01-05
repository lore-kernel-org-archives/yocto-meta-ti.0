Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23488C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 16:17:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.27312.1704471470109417925
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 08:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=NPoag/2O;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 405GHnFk041635
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 10:17:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704471469;
	bh=Wtk66JFAhARIk2NW9nX9rX/CFvuNiPi03a7GL2UpbfM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NPoag/2Owp2+zyzMqhvAtQDGzr6JTODhU+iT/X0H8JBsy6FMH+Q6XyX4X3AK30EWj
	 1S4O9aLNrEJWP8GvSQ2+0winZElPOhGIZ0DDAKpK3L5Udz4u/m9f9TqZQTHKlGu51+
	 t9zzACpZ1nOZmzrgve1TkmHEH9I+e3u9TaOrDf/c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 405GHn65041313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 10:17:49 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 10:17:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 10:17:48 -0600
Received: from [10.249.38.142] ([10.249.38.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 405GHmYX045322;
	Fri, 5 Jan 2024 10:17:48 -0600
Message-ID: <37525a92-f58c-4370-8201-401eb60b244b@ti.com>
Date: Fri, 5 Jan 2024 10:17:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 1/2] meta-ti: powervr: add j722s
 support
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <a-nandan@ti.com>, Darren Etheridge <detheridge@ti.com>
References: <20240105082844.879372-1-a-limaye@ti.com>
 <20240105082844.879372-2-a-limaye@ti.com>
 <17A77F90672E7247.25044@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17A77F90672E7247.25044@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 405GHnFk041635
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17386



On 1/5/2024 10:14 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> Can we split this change into two?=C2=A0 One patch that explicitly chan=
ges=20
> the SRCREV and a second commit that adds support for j722s.=C2=A0 I kno=
w=20
> that's not how it was during wakeup, but that's what I would prefer for=
=20
> the long term record.

And the same for the master commits.


>=20
> On 1/5/2024 2:28 AM, Aniket Limaye wrote:
>> From: Darren Etheridge <detheridge@ti.com>
>>
>> Bump srcrev to include j722s support for PowerVR components
>>
>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>> =C2=A0 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
>> =C2=A0 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
>> =C2=A0 2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.646=
0340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.=
2.6460340.bb
>> index a74cc7b8..9cc44673 100644
>> ---=20
>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.646=
0340.bb
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.646=
0340.bb
>> @@ -12,7 +12,7 @@ PR =3D "${MACHINE_KERNEL_PR}"
>> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> -COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx"
>> +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>> =C2=A0 DEPENDS =3D "virtual/kernel"
>> @@ -22,13 +22,14 @@ SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttp=
s;
>> =C2=A0 S =3D "${WORKDIR}/git"
>> -SRCREV =3D "778aa5d1e104f36c7f7c1f50e99f8499cbbdadbb"
>> +SRCREV =3D "64d1cac11363888b7a071b62d71b563568d483f1"
>> =C2=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
>> =C2=A0 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>> =C2=A0 TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
>> =C2=A0 TARGET_PRODUCT:am62xx =3D "am62_linux"
>> =C2=A0 TARGET_PRODUCT:am62pxx =3D "am62p_linux"
>> +TARGET_PRODUCT:j722s =3D "j722s_linux"
>> =C2=A0 PVR_BUILD =3D "release"
>> =C2=A0 PVR_WS =3D "lws-generic"
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2=
.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_23.2.6460340.bb
>> index 447812d3..5a5abdc2 100644
>> ---=20
>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2=
.6460340.bb
>> +++=20
>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2=
.6460340.bb
>> @@ -6,13 +6,13 @@ LIC_FILES_CHKSUM =3D=20
>> "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f99e3baa03de52
>> =C2=A0 inherit bin_package
>> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> -COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx"
>> +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>> =C2=A0 PR =3D "r2"
>> =C2=A0 BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttp=
s;branch=3D${BRANCH}"
>> -SRCREV =3D "d0543929cc6fe53959a64c60285896e2c14ed314"
>> +SRCREV =3D "7c853b0c75b7c5c4fa30ded608588850d429f306"
>> =C2=A0 S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PV=
R_BUILD}"
>> =C2=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
>> @@ -20,6 +20,7 @@ TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>> =C2=A0 TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
>> =C2=A0 TARGET_PRODUCT:am62xx =3D "am62_linux"
>> =C2=A0 TARGET_PRODUCT:am62pxx =3D "am62p_linux"
>> +TARGET_PRODUCT:j722s =3D "j722s_linux"
>> =C2=A0 PVR_BUILD =3D "release"
>> =C2=A0 PVR_WS =3D "lws-generic"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17385): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17385
> Mute This Topic: https://lists.yoctoproject.org/mt/103539508/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

