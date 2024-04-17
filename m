Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D99C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:36:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.21946.1713378990923414610
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JaxySZUO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43HIaRBr104764;
	Wed, 17 Apr 2024 13:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713378987;
	bh=pM6IDUtbKXpsABFfxn0yiVxF3lh03r49jVxCMqY1oM4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JaxySZUONxvlMAzTQlCn9gP8VqDRWPgUYlLWA2CB35+/1sVAuGWa2vcdmHpnkAjcA
	 mFosWKY29qlghlu1hPTedBbqXAiWzbtGaGRiLp+RU07D08K7t8YcoV/QMMw8zrEBLG
	 +sApqNAekreAlsUheAe/ia17Mvg1oJATax1obuMk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43HIaRHh014746
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 13:36:27 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 13:36:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 13:36:27 -0500
Received: from [10.249.33.251] ([10.249.33.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43HIaQ0r068898;
	Wed, 17 Apr 2024 13:36:27 -0500
Message-ID: <1894266a-5f44-4e3d-a32f-a3ef41f9a979@ti.com>
Date: Wed, 17 Apr 2024 13:36:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 3/3] conf/layer.conf: Update
 LAYERSERIES_COMPAT
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240417161129.9697-1-reatmon@ti.com>
 <20240417161129.9697-4-reatmon@ti.com> <20240417163012.GM28791@denix.org>
 <17C7250D24373378.20815@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17C7250D24373378.20815@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 43HIaRBr104764
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17582



On 4/17/2024 1:35 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 4/17/2024 11:30 AM, Denys Dmytriyenko wrote:
>> On Wed, Apr 17, 2024 at 11:11:29AM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> Update LAYERSERIES_COMPAT to remove EOL branches and add future styhe=
ad.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 meta-ti-extras/conf/layer.conf | 2 +-
>>> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.con=
f
>>> index 502e355f..03cbd7ea 100644
>>> --- a/meta-ti-bsp/conf/layer.conf
>>> +++ b/meta-ti-bsp/conf/layer.conf
>>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
>>> =C2=A0 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
>>> =C2=A0 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
>>> -LAYERSERIES_COMPAT_meta-ti-bsp =3D "kirkstone langdale mickledore=20
>>> nanbield scarthgap"
>>> +LAYERSERIES_COMPAT_meta-ti-bsp =3D "nanbield scarthgap styhead"
>>> =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>> diff --git a/meta-ti-extras/conf/layer.conf=20
>>> b/meta-ti-extras/conf/layer.conf
>>> index a05dbe5f..a8c68343 100644
>>> --- a/meta-ti-extras/conf/layer.conf
>>> +++ b/meta-ti-extras/conf/layer.conf
>>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
>>> =C2=A0 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
>>> =C2=A0 BBFILE_PRIORITY_meta-ti-extras =3D "6"
>>> -LAYERSERIES_COMPAT_meta-ti-extras =3D "kirkstone langdale mickledore=
=20
>>> nanbield scarthgap"
>>> +LAYERSERIES_COMPAT_meta-ti-extras =3D "scarthgap styhead"
>>
>> nanbield is missing here?
>=20
> Yes it is... but I swear it wasn't...=C2=A0 I did make the change...=C2=
=A0 I'll=20
> send a v2.

Ah crud.  I did one of the files and not both of them.  Good catch.

>=20
>>
>>> =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>> --=20
>>> 2.17.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17581): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17581
> Mute This Topic: https://lists.yoctoproject.org/mt/105580623/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

