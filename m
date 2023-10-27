Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43ADC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:13:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.11049.1698423232160916506
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 09:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=k8ZvQTlA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RGDoqc107208;
	Fri, 27 Oct 2023 11:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698423230;
	bh=buve+6CvHXJ11EYk0KDnK9u+F6zKXJrNADOIMzxfMj4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k8ZvQTlAo+vmsq6DR4VLX7TbjzYHB1fP6VrLvGpQyt12FmL+8pmLkmUrNZK+w5Imm
	 +GemLAFH522GRaelrgiKOzhwU9EaGrvMBhl1mHm3BXbPi5UVMFlpdGKDQaI74geUaF
	 kPZ6a1HL+V+m+LsbA3VvvyBSKLCqLM5tiypUDiCM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RGDopu026554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 11:13:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 11:13:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 11:13:49 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RGDntC107208;
	Fri, 27 Oct 2023 11:13:49 -0500
Message-ID: <8c21a5fd-85d9-482f-be7b-51404473a690@ti.com>
Date: Fri, 27 Oct 2023 11:13:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH] optee: Update to upstream 4.0.0
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231026132915.1441-1-reatmon@ti.com>
 <20231027053102.7mfjuvkavx72c4zv@ula0497581>
 <1791F82CAFF871B0.3183@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1791F82CAFF871B0.3183@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 39RGDoqc107208
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 16:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17210



On 10/27/2023 7:56 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 10/27/2023 12:31 AM, Manorit Chawdhry wrote:
>> Hi Ryan,
>>
>> On 08:29-20231026, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> Update all of the optee components to the upstream 4.0.0 version.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc=C2=A0=C2=
=A0=C2=A0 | 4 ++--
>>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc=C2=A0=
 | 4 ++--
>>> =C2=A0 .../recipes-security/optee/optee-os-tadevkit-ti.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
>>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 8 ++++++--
>>> =C2=A0 5 files changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>>> index fef87d30..f64a90c3 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>>> @@ -1,5 +1,5 @@
>>> -PV =3D "3.20.0+git${SRCPV}"
>>> -SRCREV =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
>>> +PV =3D "4.0.0+git${SRCPV}"
>>> +SRCREV =3D "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
>>> =C2=A0 inherit pkgconfig
>>> =C2=A0 DEPENDS +=3D "util-linux"
>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc=
=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>>> index 7d119f0d..7a733f53 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>>> @@ -1,3 +1,3 @@
>>> -PV =3D "3.20.0+git${SRCPV}"
>>> -SRCREV =3D "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
>>> +PV =3D "4.0.0+git${SRCPV}"
>>> +SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
>>> =C2=A0 SRC_URI:remove =3D=20
>>> "file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>>> index 18820af1..c1354539 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>>> @@ -1,2 +1,3 @@
>>> -PV =3D "3.20.0+git${SRCPV}"
>>> -SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
>>> +PV =3D "4.0.0+git${SRCPV}"
>>> +SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
>>
>> If possible, can we pick the same SHA of optee-os itself for this
>> through some include file? I don't think it makes sense to update the
>> same SHA at two places for this tadevkit that I see always being in sy=
nc
>> with optee-os only. Ig this had been the missing piece in my testing
>> that I had missed updating that led to crashed for me. Upto you but ju=
st
>> a suggestion.
>=20
> I noticed that too.=C2=A0 Let me look into that.=C2=A0 I may go ahead a=
nd do the=20
> 4.0.0 update and clean that up in a later patch.

I think we can do this. This is what I'm thinking...  For those .inc=20
files that have both SRCREV and other changes, split them into two .inc=20
files.

optee-os-ti.inc - changes to the recipe
optee-os-ti-src.inc - changes to SRCREV and SRC_URI (for patches)

For those that just change SRCDEV, rename them to the *-ti-src.inc for=20
consistency.

Then we can include the *-ti-src.inc changes from multiple places=20
without also including the recipe changes.

Denys, thoughts on this idea?


>=20
>> Regards,
>> Manorit
>>> +
>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>>> index 19386295..763dd1d5 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>>> @@ -1,5 +1,5 @@
>>> -PV =3D "3.20.0+git${SRCPV}"
>>> -SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
>>> +PV =3D "4.0.0+git${SRCPV}"
>>> +SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
>>> =C2=A0 # Use TI SECDEV for signing
>>> =C2=A0 inherit ti-secdev
>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>>> index 43e0172d..b68caf0c 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>>> @@ -1,2 +1,6 @@
>>> -PV =3D "3.19.0+git${SRCPV}"
>>> -SRCREV =3D "ab9863cc187724e54c032b738c28bd6e9460a4db"
>>> +PV =3D "4.0.0+git${SRCPV}"
>>> +SRCREV =3D "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
>>> +
>>> +EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
>>> +DEPENDS:append =3D " openssl"
>>> +
>>> --=20
>>> 2.17.1
>>>
>>
>>>
>>>
>>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17208): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17208
> Mute This Topic: https://lists.yoctoproject.org/mt/102199608/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

