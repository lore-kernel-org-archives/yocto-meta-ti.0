Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A603FC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 14:09:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.75996.1744121389203233148
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 07:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=XkqBb8rB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538E9ka21232158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 09:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744121386;
	bh=Fg8y/xN450oGwAWhJ7FPP1wR7q2XEFIUkWVic3Dn6PU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XkqBb8rBTMlxuFT7blI3gFnlXV4V0kbKwhzuwsgoADwmUW6hUyli/Ai9KXOAGWY0K
	 nJay1HKruhHq/MtV0rEk4XEWi2CVvkqtp92EXRZUAE6dVf8Ny219lINB4FYyagEF2G
	 /Ff1hofOtByT5CtmhyTQiPuOgY8yp/3ve0G73B7w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538E9kFS023074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 09:09:46 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 09:09:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 09:09:45 -0500
Received: from [10.249.32.251] ([10.249.32.251])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538E9jKk113590;
	Tue, 8 Apr 2025 09:09:45 -0500
Message-ID: <2fa5f338-3db9-4f64-8785-7232decc3bbe@ti.com>
Date: Tue, 8 Apr 2025 09:09:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] optee-client: remove patch that got
 accepted upstream
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250408030807.1978102-1-denis@denix.org>
 <18345B9CD58296A9.21691@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18345B9CD58296A9.21691@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 538E9ka21232158
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Apr 2025 14:09:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18450



On 4/8/2025 8:41 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> I was unsure about doing this...
>=20
> meta-arm added a second optee recipe version.=C2=A0 So both exist:
> optee-client_4.3.0.bb
> optee-client_4.4.0.bb
>=20
> So "theoretically" the build should prefer the newer version, right?
>=20
> But for some reason, our builds keep loading the 4.3.0 recipe and then=20
> our bbappend bumps the version to 4.4.0.=C2=A0 The 4.3.0 recipe has thi=
s=20
> offending patch, but the 4.4.0 version does not.
>=20
> I've been trying to figure out why our builds keep locking into 4.3.0=20
> when the 4.4.0 is sitting right there...
>=20
> I agree that this patch is a good work around, but I'm not 100% sure=20
> it's the final best fix.
>=20

It looks like our setting of PV in our bbappend is what is causing this.=20
  When I comment out that line the correct recipe version from meta-arm=20
is picked.

But when I change it from "4.4.0+git" to just "4.4.0" it still picks the=20
4.3.0 version.

It's like setting that make bitbake think that the 4.3.0 recipe is newer=20
(or as new) as the 4.4.0 recipe.

Setting PV =3D "4.3.9" also does not work.  Looks like setting PV to=20
anything in our .inc file causes this bad behavior.  Thoughts?

>=20
>=20
> On 4/7/2025 10:08 PM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> meta-arm adds a patch that was sent and accepted upstream, remove
>> it since mta-ti pulls a more recent verstion.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>> =C2=A0 .../recipes-security/optee/optee-client-ti-version.inc=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> index 2c8977dd..a628e446 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> @@ -1,2 +1,6 @@
>> =C2=A0 PV =3D "4.4.0+git"
>> =C2=A0 SRCREV =3D "d221676a58b305bddbf97db00395205b3038de8e"
>> +
>> +SRC_URI:remove =3D " \
>> +   =20
>> file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch=
 \
>> +"
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
> View/Reply Online (#18449): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18449
> Mute This Topic: https://lists.yoctoproject.org/mt/112146993/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

