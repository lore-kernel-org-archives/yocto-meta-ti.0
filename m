Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21238C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 21:48:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2792.1648590530045766002
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 14:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=Aubx649d;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TLmimj025834;
	Tue, 29 Mar 2022 16:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648590524;
	bh=88rpfAPO/DvbC/RLndED7sAtwxbtesKJEZ3NPCXiWA4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Aubx649d7GHDTQPV4goDK7zkW+g+5PioEHRENCzfgOmFrMYJ2geIXvNMqW/ypvJ38
	 8vfHSXlAP4gGmDtw9oeLzjuFH6rKDR9ZdRSryvf724awoRnhwHjgbuISJX371L3Ng8
	 QxnS0kJ3zbutU1ephmD0XeXAs4a7UC6suB068Bv8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TLmiJG008583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 16:48:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 16:48:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 16:48:44 -0500
Received: from [128.247.81.152] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TLmiMH094819;
	Tue, 29 Mar 2022 16:48:44 -0500
Message-ID: <f3526050-3e0a-fc75-446a-023e7bbc005a@ti.com>
Date: Tue, 29 Mar 2022 16:48:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move all
 platforms to ddk 1.15
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
 <20220325213849.GI23554@denix.org>
 <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
 <20220325220609.GJ23554@denix.org>
 <16DFC054FC61A9B3.21339@lists.yoctoproject.org>
 <29965fda-5ada-3a75-e142-ed84e7dbf524@ti.com>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <29965fda-5ada-3a75-e142-ed84e7dbf524@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id
 22TLmimj025834
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 21:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14579

On 3/25/2022 5:36 PM, Andrew Davis wrote:
> On 3/25/22 5:30 PM, Andrew F. Davis via lists.yoctoproject.org wrote:
>> On 3/25/22 5:06 PM, Denys Dmytriyenko wrote:
>>> On Fri, Mar 25, 2022 at 04:54:56PM -0500, Andrew F. Davis via=20
>>> lists.yoctoproject.org wrote:
>>>> On 3/25/22 4:38 PM, Denys Dmytriyenko wrote:
>>>>> On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
>>>>>> On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
>>>>>>> On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
>>>>>>>> Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
>>>>>>>>
>>>>>>>> Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
>>>>>>>
>>>>>>> Overall looks good, please see inline below.
>>>>>>>
>>>>>>>
>>>>>>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> rename from=20
>>>>>>>> recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>>>>>>>> rename to=20
>>>>>>>> recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
>>>>>>>> index a05de0f2..fbff6c51 100644
>>>>>>>> ---=20
>>>>>>>> a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.b=
b
>>>>>>>> +++=20
>>>>>>>> b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.b=
b
>>>>>>>> @@ -7,17 +7,17 @@ inherit module features_check
>>>>>>>> =C2=A0 REQUIRED_MACHINE_FEATURES =3D "gpu"
>>>>>>>> -MACHINE_KERNEL_PR_append =3D "b"
>>>>>>>> +MACHINE_KERNEL_PR_append =3D "a"
>>>>>>>> =C2=A0 PR =3D "${MACHINE_KERNEL_PR}"
>>>>>>>> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>>>>> -COMPATIBLE_MACHINE =3D "j7"
>>>>>>>> +COMPATIBLE_MACHINE =3D "j7-evm|j721s2-evm|am62xx"
>>>>>>>> =C2=A0 DEPENDS =3D "virtual/kernel"
>>>>>>>> =C2=A0 PROVIDES =3D "virtual/gpudriver"
>>>>>>>> -BRANCH =3D "1.13-5776728/linux-k5.10"
>>>>>>>> +BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
>>>>>>>> =C2=A0 SRC_URI =3D " \
>>>>>>>>      =20
>>>>>>>> git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D${BRA=
NCH}=20
>>>>>>>> \
>>>>>>>> @@ -26,15 +26,19 @@ SRC_URI =3D " \
>>>>>>>> =C2=A0 S =3D "${WORKDIR}/git"
>>>>>>>> -SRCREV =3D "35a25875ae8738f82c7cabc6b077ef992b0cca84"
>>>>>>>> +SRCREV =3D "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
>>>>>>>> -PVR_SOC =3D "j721e_linux"
>>>>>>>
>>>>>>> I was actually thinking of keeping PVR_SOC variable and moving it=
 to
>>>>>>> corresponding machine configs.
>>>>>>>
>>>>>>
>>>>>>
>>>>>> PVR_SOC is a bit of a legacy name, especially since PVR is now IMG.
>>>>>
>>>>> PVR or PowerVR name is still used as an overall umbrella for all of
>>>>> Imagination's graphics, vision and AI chips, including SGX and=20
>>>>> Rogue/RGX:
>>>>> https://en.wikipedia.org/wiki/PowerVR
>>>>>
>>>>
>>>>
>>>> On the wiki page:
>>>>
>>>>> These GPUs are no longer called PowerVR, they are called IMG.[58]
>>>>
>>>> For their next gen GPUs they are distancing themselves from the PVR=20
>>>> name,
>>>> the GPU in AM62xx is one such next gen GPU, so it's already not=20
>>>> correct here
>>>> as is.
>>>
>>> So, then why AM62xx is being added to Rogue driver/DDK? Should there=20
>>> be a
>>> separate Albiorix driver and DDK then?
>>>
>>
>>
>> We asked IMG very nicely to not fork the DDK for each new gen of=20
>> device (like
>> what happened with SGX -> Rogue), so now we have he same driver code b=
ase
>> supporting multiple generations of GPU. The name "Rogue" just stuck=20
>> around.
>> We should probably rename some of this stuff to also be more generic.
>>
>>
>>>
>>>>>> Thinking on this, the mapping between SoC family and the internal=20
>>>>>> names
>>>>>> like "RGX_BVNC" and "TARGET_PRODUCT" are specific to the version=20
>>>>>> of this
>>>>>> driver. For instance in the next DDK I may want the target name to
>>>>>> go from "am62_linux" to "axb_128_linux", I would have to
>>>>>> change things here (update the SRCREV) AND in the machine config.
>>>>>
>>>>> 1. I totally agree that "axb_128_linux" makes more sense than=20
>>>>> "am62_linux".
>>>>> 2. Changes like that happen very rarely.
>>>>> 3. You can call it PVR_MODEL or PVR_PRODUCT if you want, instead of=
=20
>>>>> PVR_SOC.
>>>>>
>>>>>
>>>>>> Mapping here feels like the right spot to me. I'd even argue the s=
ame
>>>>>> for OPTEEMACHINE and the like, should go in the optee.bbappends=20
>>>>>> with the
>>>>>> rest of our platform specific recipe fixups, etc.
>>>>>
>>>>> The number of overrides in the recipe will keep on growing, as each=
=20
>>>>> new
>>>>> platform will need to add own config. That's the whole point of the=
=20
>>>>> machine
>>>>> configuration file to have those defined centrally.
>>>>>
>>>>> The goal is to have a recipe as machine-agnostic and clean, as=20
>>>>> possible. Do
>>>>> not overwhelm it with tons of conditionals like that - any=20
>>>>> machine-specific
>>>>> configuration should be set in the machine config file.
>>>>>
>>>>
>>>>
>>>> Having all the fixups related to a package inside that package's=20
>>>> definition sounds
>>>> more central to me, and easier to reason about. But I can see the=20
>>>> argument both
>>>> ways.
>>>>
>>>> Maybe the better solution would be to splitup this(and the SGX)=20
>>>> recipe. So we
>>>> get a package per GPU type. It's already how the bins are=20
>>>> organized/shipped. Then
>>>> we just pick the right GPU package for our SoC in arago-prefs.inc.=20
>>>> (again like
>>>> we already do to select between SGX/RGX)
>>>
>>> Yeah, I think keeping each series of GPU (SGX, Rogue, Albiorix) in=20
>>> their own
>>> separate recipes would be fine. Or are you suggesting splitting even=20
>>> further
>>> into separate recipes for SGX530 vs SGX540, etc?
>>>
>>
>>
>> I'm suggesting even further. The driver/package for SGX530 is not=20
>> compatible
>> and conflicts with the driver package for SGX540. So lets not have a=20
>> single named
>> package (ti-sgx-ddk-um) that can have very different contents, that's=20
>> just confusing.
>>
>=20
>=20
> Oh, and not separate recipes, separate packages, they can all be provid=
ed
> by the same one or two recipes.
>=20
> ti-sgx-530-um
> ti-sgx-544-um
> ti-axe1-16m-um
> etc..
>=20
> Then:
>=20
> PREFERRED_PROVIDER_virtual/libgles2:am62xx =3D "ti-axe1-16m-um"
> ...
>=20
> Andrew

Can we merge for Dunfell and then improve significantly for Kirkstone,=20
or do I still need to make changes here for Dunfell?

>=20
>=20
>> Andrew
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14562):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/14562
>> Mute This Topic: https://lists.yoctoproject.org/mt/89983769/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

