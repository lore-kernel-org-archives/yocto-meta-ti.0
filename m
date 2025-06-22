Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4A1C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 21:03:03 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.5239.1750626183431575259
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 14:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=QAlrgNBd;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55ML320o715308;
	Sun, 22 Jun 2025 16:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750626182;
	bh=AfsNbBtjDfnzMgQ0eSq5FswuMe0QqtbdXjqS6l9oVyw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QAlrgNBdNuQPoDkPY/QOLCARnpnGfp5JkWaGb4nxFnCHKQrXI2GTfk0YLfCHiSD4M
	 ydlPwdQo45TiMlyG6UmxhHCRWPs7DBCwragQAiABShe4J/kGszv1L2AArkYiTMSVAm
	 zTSSG4Dy1JDhRvalXDc3Dzv5vHeO7Zf9FyO6gVSc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55ML32n1132498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 22 Jun 2025 16:03:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 22
 Jun 2025 16:03:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 22 Jun 2025 16:03:01 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55ML31YK2570769;
	Sun, 22 Jun 2025 16:03:01 -0500
Message-ID: <8e688370-e889-4a49-9a15-1c24b6aa1335@ti.com>
Date: Sun, 22 Jun 2025 16:03:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] meta-ti: layer.conf: add compatibility
 with the new whinlatter release
To: <hiagofranco@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Hiago De Franco <hiago.franco@toradex.com>
References: <20250622170731.11233-1-hiagofranco@gmail.com>
 <184B7922D7011456.5850@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <184B7922D7011456.5850@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 55ML320o715308
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 21:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18666


My bad.  I didn't see that you updated all three layers!  I need to read=20
closer.  I'll take a look at this patch right away and get it on master=20
to free up those builds.


On 6/22/2025 4:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> Thank you for the patch.=C2=A0 There is a third layer in meta-ti that i=
s=20
> missing from this patch.=C2=A0 I'll send a more comprehensive version.
>=20
>=20
> On 6/22/2025 12:07 PM, Hiago De Franco via lists.yoctoproject.org wrote=
:
>> From: Hiago De Franco <hiago.franco@toradex.com>
>>
>> Update all layers with the new Yocto release, fixing the current build
>> error:
>>
>> ERROR: Layer meta-ti-bsp is not compatible with the core layer which
>> only supports these series: whinlatter (layer is compatible with styhe=
ad
>> walnascar)
>>
>> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
>> ---
>> =C2=A0 meta-beagle/conf/layer.conf=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 meta-ti-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 meta-ti-extras/conf/layer.conf | 2 +-
>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
>> index b5d3eaaa770c..d036bb08b36a 100644
>> --- a/meta-beagle/conf/layer.conf
>> +++ b/meta-beagle/conf/layer.conf
>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-beagle"
>> =C2=A0 BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
>> =C2=A0 BBFILE_PRIORITY_meta-beagle =3D "6"
>> -LAYERSERIES_COMPAT_meta-beagle =3D "styhead walnascar"
>> +LAYERSERIES_COMPAT_meta-beagle =3D "walnascar whinlatter"
>> =C2=A0 LAYERDEPENDS_meta-beagle =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-ti-bsp \
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index 6d2b0a9a14b0..481daf2cc997 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
>> =C2=A0 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
>> =C2=A0 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
>> -LAYERSERIES_COMPAT_meta-ti-bsp =3D "styhead walnascar"
>> +LAYERSERIES_COMPAT_meta-ti-bsp =3D "walnascar whinlatter"
>> =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>> diff --git a/meta-ti-extras/conf/layer.conf=20
>> b/meta-ti-extras/conf/layer.conf
>> index bd13967322fc..d340c414fc60 100644
>> --- a/meta-ti-extras/conf/layer.conf
>> +++ b/meta-ti-extras/conf/layer.conf
>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
>> =C2=A0 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
>> =C2=A0 BBFILE_PRIORITY_meta-ti-extras =3D "6"
>> -LAYERSERIES_COMPAT_meta-ti-extras =3D "styhead walnascar"
>> +LAYERSERIES_COMPAT_meta-ti-extras =3D "walnascar whinlatter"
>> =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18665): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18665
> Mute This Topic: https://lists.yoctoproject.org/mt/113774522/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

