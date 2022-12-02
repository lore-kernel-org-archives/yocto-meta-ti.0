Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001CFC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 20:10:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.86427.1670011840879541984
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 12:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ai1HQGKq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B2KAakB073583;
	Fri, 2 Dec 2022 14:10:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670011836;
	bh=Cptou3z1FBDwCGcijYYarnnk47Ic/uD9IvEqKnYNkkA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ai1HQGKqTjCi3H0SHnno+tdqSX/Qk+tgbQF6Fyx2hbKlLeqZxtadgQk6IhbnWCZ4m
	 9Ke0/NNnMzOxzkLx6UFnHEAHzmeAKl7EVZcAC8MGjUk3+1XdZxXBHYIjaEzJ0g30Yj
	 iSEJYKYiCuFvcZujptGeEDsm3/HSsHxN26ePcNsk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B2KAaGL080387
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Dec 2022 14:10:36 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 2
 Dec 2022 14:10:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 2 Dec 2022 14:10:35 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B2KAZTm005692;
	Fri, 2 Dec 2022 14:10:35 -0600
Message-ID: <488655ee-9187-e157-a3f4-975ccdb36df6@ti.com>
Date: Fri, 2 Dec 2022 14:10:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][master][PATCH] u-boot: Add lzop dependency
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221202145817.28581-1-reatmon@ti.com>
 <20221202161051.GU22689@denix.org>
 <172D078D53F719C6.27320@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <172D078D53F719C6.27320@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 2B2KAakB073583
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 20:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15392



On 12/2/2022 10:42, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 12/2/2022 10:10, Denys Dmytriyenko wrote:
>> On Fri, Dec 02, 2022 at 08:58:17AM -0600, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> It turns out we do need lzop for building dra7 and am57 in u-boot,
>>> so add the dependency back in and add a layer dependency on
>>> meta-oe(openembedded-layer).
>>
>> Oh, no, please don't do that! This is a heavy dependency and meta-ti=20
>> BSP has
>> stayed away from it since the beginning of times.
>>
>> It would be better to figure out why lzop is used for those platforms =
and
>> change that, as LZOP is pretty much deprecated these days...
>=20
> Ok.=C2=A0 I'll back this one out.=C2=A0 And look for an alternative sol=
ution.


Ok.  Adding lzop to HOSTTOOLS in our build script and adding lzop to our=20
build environment fixes this issue.


>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>>> =C2=A0 2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.con=
f
>>> index 39e7f9eb..8bafa854 100644
>>> --- a/meta-ti-bsp/conf/layer.conf
>>> +++ b/meta-ti-bsp/conf/layer.conf
>>> @@ -15,6 +15,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>> =C2=A0 LAYERDEPENDS_meta-ti-bsp =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 core \
>>> +=C2=A0=C2=A0=C2=A0 openembedded-layer \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-arm \
>>> =C2=A0 "
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index d87dcbe1..5127e137 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -23,7 +23,7 @@ SRC_URI =3D=20
>>> "${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PROTOCOL};branch=3D${BRANCH}=
"
>>> =C2=A0 PV:append =3D "+git${SRCPV}"
>>> =C2=A0 # u-boot needs devtree compiler to parse dts files
>>> -DEPENDS +=3D "dtc-native bc-native flex-native bison-native=20
>>> python3-setuptools-native"
>>> +DEPENDS +=3D "dtc-native bc-native lzop-native flex-native=20
>>> bison-native python3-setuptools-native"
>>> =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>> --=20
>>> 2.17.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15389): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15389
> Mute This Topic: https://lists.yoctoproject.org/mt/95407408/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

