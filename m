Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66A6C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:09:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13108.1699369742518159965
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 07:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jGd6xrv+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7F91Z5055142;
	Tue, 7 Nov 2023 09:09:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699369741;
	bh=pzidy2ygxNR+bX8H6pHl7cpiSqZpUKCAKckmaMCyH1g=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jGd6xrv+7JGwa9JNBl4li46wLi6fkAbiwRW6+kudzU/yHtpycq7Ugild1OVXLVY56
	 t/YESmKiyxY9miN7KJIEHo33+7bQ2NQSj1Fe1sLu9BXF3wVkPXdffEjjqx6ng6Pb7e
	 lJyufgBfyOyAGE5n6qcqBRiGBREzTdNcX7HBRIJs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7F90tM085456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 09:09:01 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 09:09:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 09:09:00 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7F90sn107314;
	Tue, 7 Nov 2023 09:09:00 -0600
Message-ID: <6a53fe9a-c453-4855-809c-8d3e39616c0e@ti.com>
Date: Tue, 7 Nov 2023 09:09:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][RFC v2] optee: Rework include files
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <17943C4ECC579846.30622@lists.yoctoproject.org>
 <17943C9A5D16C3D6.3650@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17943C9A5D16C3D6.3650@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 3A7F91Z5055142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 15:09:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17253


Given that this patch has not generated any additional converstaion,=20
I'll send out an offical patch for master and kirkstone with these change=
s.


On 11/3/2023 5:13 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> Forgot that v2 is just renaming the verison file based on prior feedbac=
k.
>=20
>=20
> On 11/3/2023 5:07 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Minor rework of the TI include files used to override both SRCREV and
>> other settings in the optee recipes for TI SOC parts.=C2=A0 The intent=
 is to
>> make it more clear when we are changing SRCREVs versus changing other
>> items, and allow for sharing the SRCREV changes for optee-os-tadevkit
>> which should track the optee-os SRCREV.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 ...ptee-client-ti.inc =3D> optee-client-ti-version.inc} |=C2=A0=
 0
>> =C2=A0 .../recipes-security/optee/optee-client_%.bbappend=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +++---
>> =C2=A0 ...-examples-ti.inc =3D> optee-examples-ti-version.inc} |=C2=A0=
 0
>> =C2=A0 .../recipes-security/optee/optee-examples_%.bbappend=C2=A0 |=C2=
=A0 6 +++---
>> =C2=A0 .../optee/optee-os-tadevkit-ti-overrides.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 .../optee/optee-os-tadevkit_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++=
++++---
>> =C2=A0 .../{optee-os-ti.inc =3D> optee-os-ti-overrides.inc}=C2=A0=C2=A0=
=C2=A0 |=C2=A0 8 --------
>> =C2=A0 ...tee-os-tadevkit-ti.inc =3D> optee-os-ti-version.inc} |=C2=A0=
 2 --
>> =C2=A0 .../recipes-security/optee/optee-os_%.bbappend=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++---
>> =C2=A0 .../{optee-test-ti.inc =3D> optee-test-ti-version.inc}=C2=A0 |=C2=
=A0 0
>> =C2=A0 .../recipes-security/optee/optee-test_%.bbappend=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
>> =C2=A0 11 files changed, 26 insertions(+), 25 deletions(-)
>> =C2=A0 rename meta-ti-bsp/recipes-security/optee/{optee-client-ti.inc =
=3D>=20
>> optee-client-ti-version.inc} (100%)
>> =C2=A0 rename meta-ti-bsp/recipes-security/optee/{optee-examples-ti.in=
c =3D>=20
>> optee-examples-ti-version.inc} (100%)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>> =C2=A0 rename meta-ti-bsp/recipes-security/optee/{optee-os-ti.inc =3D>=
=20
>> optee-os-ti-overrides.inc} (86%)
>> =C2=A0 rename meta-ti-bsp/recipes-security/optee/{optee-os-tadevkit-ti=
.inc=20
>> =3D> optee-os-ti-version.inc} (87%)
>> =C2=A0 rename meta-ti-bsp/recipes-security/optee/{optee-test-ti.inc =3D=
>=20
>> optee-test-ti-version.inc} (100%)
>>
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-client-ti-version.i=
nc
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend=20
>> b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>> index 08c5256b..f193e78b 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>> @@ -1,4 +1,4 @@
>> -OPTEE_TI =3D ""
>> -OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
>> +OPTEE_TI_VERSION =3D ""
>> +OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_VERSION}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>> rename to=20
>> meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=20
>> b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
>> index 08c5256b..f193e78b 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
>> @@ -1,4 +1,4 @@
>> -OPTEE_TI =3D ""
>> -OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
>> +OPTEE_TI_VERSION =3D ""
>> +OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_VERSION}
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.in=
c b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>> new file mode 100644
>> index 00000000..df46e243
>> --- /dev/null
>> +++=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.in=
c
>> @@ -0,0 +1 @@
>> +EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> index 08c5256b..980f7a4b 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> @@ -1,4 +1,9 @@
>> -OPTEE_TI =3D ""
>> -OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
>> +OPTEE_TI_VERSION =3D ""
>> +OPTEE_TI_VERSION:ti-soc =3D "optee-os-ti-version.inc"
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_VERSION}
>> +
>> +OPTEE_TI_OVERRIDES =3D ""
>> +OPTEE_TI_OVERRIDES:ti-soc =3D "${BPN}-ti-overrides.inc"
>> +
>> +require ${OPTEE_TI_OVERRIDES}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> similarity index 86%
>> rename from meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> index 6d192bbe..de13d282 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> @@ -1,11 +1,3 @@
>> -PV =3D "4.0.0+git${SRCPV}"
>> -SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
>> -
>> -# Fixes for pointing to 4.0.0 before upstream meta-arm
>> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-4.0.0:"
>> -SRC_URI:remove =3D=20
>> "file://0002-core-Define-section-attributes-for-clang.patch"
>> -SRC_URI:append =3D "=20
>> file://0002ti-core-Define-section-attributes-for-clang.patch"
>> -
>> =C2=A0 # Use TI SECDEV for signing
>> =C2=A0 inherit ti-secdev
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> similarity index 87%
>> rename from meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.in=
c
>> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> index 55453366..06472e34 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> @@ -5,5 +5,3 @@ SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
>> =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-4.0.0:"
>> =C2=A0 SRC_URI:remove =3D=20
>> "file://0002-core-Define-section-attributes-for-clang.patch"
>> =C2=A0 SRC_URI:append =3D "=20
>> file://0002ti-core-Define-section-attributes-for-clang.patch"
>> -
>> -EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> index 08c5256b..0cee127f 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> @@ -1,4 +1,9 @@
>> -OPTEE_TI =3D ""
>> -OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
>> +OPTEE_TI_VERSION =3D ""
>> +OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_VERSION}
>> +
>> +OPTEE_TI_OVERRIDES =3D ""
>> +OPTEE_TI_OVERRIDES:ti-soc =3D "${BPN}-ti-overrides.inc"
>> +
>> +require ${OPTEE_TI_OVERRIDES}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend=20
>> b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
>> index 08c5256b..f193e78b 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
>> @@ -1,4 +1,4 @@
>> -OPTEE_TI =3D ""
>> -OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
>> +OPTEE_TI_VERSION =3D ""
>> +OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_VERSION}
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
> View/Reply Online (#17241): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17241
> Mute This Topic: https://lists.yoctoproject.org/mt/102374573/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

