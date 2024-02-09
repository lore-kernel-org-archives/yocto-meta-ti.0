Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DD5C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 03:16:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3244.1707448601843587355
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 19:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Wm4at/cG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4193GekH059960;
	Thu, 8 Feb 2024 21:16:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707448600;
	bh=WU+IeCo6ivVqIwIw9KI6a4Uvln1B7SQBA+gi0I4OqVA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wm4at/cGsLvARZpwZOlEvVuZDhHQYP5ebJzFTUnnlPMzDpPnx0jgkc511GJsZ0Dw1
	 Gt+8x14iiCScTy4hadIKu1o0BXIoxBVgoIlPWaYdxlvyqmAYh87qxmQGveIX9vXmIJ
	 mtWF13S1ZRfWz0g8T4dEgGuspWEMLCrou2r2y/pI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4193GeAe035168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 21:16:40 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 21:16:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 21:16:39 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4193GdeR049446;
	Thu, 8 Feb 2024 21:16:39 -0600
Message-ID: <10776d12-3741-4c16-970b-88a6738d03e3@ti.com>
Date: Thu, 8 Feb 2024 21:16:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/2] ti-img-rogue-*: switch branches to
 new lts
Content-Language: en-US
To: <rs@ti.com>, <detheridge@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240208233722.2565237-1-rs@ti.com>
 <20240208233722.2565237-2-rs@ti.com>
 <17B213457AB20D5B.15017@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17B213457AB20D5B.15017@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 4193GekH059960
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Feb 2024 03:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17463



On 2/8/2024 9:13 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/8/2024 5:37 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Switch the branches to the new LTS names. These are still experimental=
,
>> hence the isolation from kirkstone. The upstream branch is now carryin=
g
>> the equivalent to the kbuild patch so we're dropping it here.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 ++----
>> =C2=A0 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 2 files changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.651=
2818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.=
3.6512818.bb
>> index 0e894534..02ec9fe9 100644
>> ---=20
>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.651=
2818.bb
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.651=
2818.bb
>> @@ -16,15 +16,13 @@ COMPATIBLE_MACHINE =3D=20
>> "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>> =C2=A0 DEPENDS =3D "virtual/kernel"
>> -BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
>> +BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttp=
s;branch=3D${BRANCH}"
>> -SRC_URI:append =3D "=20
>> file://0001-build-kbuild-Makefile.template-use-SECONDARY.patch"
>> -
>=20
> NAK.=C2=A0 Your previous patch for bumping the version to 23.3.6512818 =
did=20
> not build on master because of this patch.=C2=A0 So I went ahead and re=
moved=20
> it and "fixed up" your patch with the removal.=C2=A0 I like to have as =
atomic=20
> commits as possible.

Sent that without rereading it...  I was referring to the=20
0001-build-kbuild-Makefile.template-use-SECONDARY.patch patch file...  I=20
already removed that and deleted it as part of your previous patch when=20
I applied it to master.


> I should have said something at that time, but I know you are busy.
>=20
> Please rebase on master-wip and resubmit this patch.
>=20
>=20
>> =C2=A0 S =3D "${WORKDIR}/git"
>> -SRCREV =3D "41a494accb30aa2f247e6a4e123a4954982f2a88"
>> +SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
>> =C2=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
>> =C2=A0 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>> diff --git=20
>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3=
.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_23.3.6512818.bb
>> index 288eb52b..a0a9a295 100644
>> ---=20
>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3=
.6512818.bb
>> +++=20
>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3=
.6512818.bb
>> @@ -12,7 +12,7 @@ COMPATIBLE_MACHINE =3D=20
>> "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>> =C2=A0 PR =3D "r3"
>> -BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
>> +BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttp=
s;branch=3D${BRANCH}"
>> =C2=A0 SRCREV =3D "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
>> =C2=A0 S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PV=
R_BUILD}"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17462): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17462
> Mute This Topic: https://lists.yoctoproject.org/mt/104250019/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

