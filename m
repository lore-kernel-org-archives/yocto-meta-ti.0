Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4D1C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 22:36:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.526.1648247812909292175
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 15:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=humRbDWU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PMamuV118235;
	Fri, 25 Mar 2022 17:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648247808;
	bh=vKOi+r9FtRRBSiY8AxKHdM8O2ZSNLd4XI30pVc9CQjk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=humRbDWUdc4FO+DxoT9NItbSVYVWo+jCrCCOZVoVoRFKgBCz7r9hwKEWmS/LfP6ul
	 1NcJqJFsnVki0djeBf/T9KQ2HuH0fR3yhAK5WLfkk7iC+UOb+832XFiOyO64/6sr/n
	 gjFwhYDkl2I1IGc1q3O2+FgLNkCRHw9MuOxuJenU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PMamZs024806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 17:36:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 17:36:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 17:36:48 -0500
Received: from [10.250.33.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PMalva042161;
	Fri, 25 Mar 2022 17:36:48 -0500
Message-ID: <29965fda-5ada-3a75-e142-ed84e7dbf524@ti.com>
Date: Fri, 25 Mar 2022 17:36:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move all
 platforms to ddk 1.15
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
 <20220325213849.GI23554@denix.org>
 <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
 <20220325220609.GJ23554@denix.org>
 <16DFC054FC61A9B3.21339@lists.yoctoproject.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <16DFC054FC61A9B3.21339@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 22PMamuV118235
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 22:36:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14563

On 3/25/22 5:30 PM, Andrew F. Davis via lists.yoctoproject.org wrote:
> On 3/25/22 5:06 PM, Denys Dmytriyenko wrote:
>> On Fri, Mar 25, 2022 at 04:54:56PM -0500, Andrew F. Davis via lists.yo=
ctoproject.org wrote:
>>> On 3/25/22 4:38 PM, Denys Dmytriyenko wrote:
>>>> On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
>>>>> On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
>>>>>> On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
>>>>>>> Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
>>>>>>>
>>>>>>> Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
>>>>>>
>>>>>> Overall looks good, please see inline below.
>>>>>>
>>>>>>
>>>>>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>>>>>> ---
>>>>>>>
>>>>>>> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.=
5776728.bb
>>>>>>> rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
>>>>>>> index a05de0f2..fbff6c51 100644
>>>>>>> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.577672=
8.bb
>>>>>>> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.613310=
9.bb
>>>>>>> @@ -7,17 +7,17 @@ inherit module features_check
>>>>>>> =C2=A0 REQUIRED_MACHINE_FEATURES =3D "gpu"
>>>>>>> -MACHINE_KERNEL_PR_append =3D "b"
>>>>>>> +MACHINE_KERNEL_PR_append =3D "a"
>>>>>>> =C2=A0 PR =3D "${MACHINE_KERNEL_PR}"
>>>>>>> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>>>> -COMPATIBLE_MACHINE =3D "j7"
>>>>>>> +COMPATIBLE_MACHINE =3D "j7-evm|j721s2-evm|am62xx"
>>>>>>> =C2=A0 DEPENDS =3D "virtual/kernel"
>>>>>>> =C2=A0 PROVIDES =3D "virtual/gpudriver"
>>>>>>> -BRANCH =3D "1.13-5776728/linux-k5.10"
>>>>>>> +BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
>>>>>>> =C2=A0 SRC_URI =3D " \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://git.ti.com/graphics/ti-img-r=
ogue-driver.git;branch=3D${BRANCH} \
>>>>>>> @@ -26,15 +26,19 @@ SRC_URI =3D " \
>>>>>>> =C2=A0 S =3D "${WORKDIR}/git"
>>>>>>> -SRCREV =3D "35a25875ae8738f82c7cabc6b077ef992b0cca84"
>>>>>>> +SRCREV =3D "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
>>>>>>> -PVR_SOC =3D "j721e_linux"
>>>>>>
>>>>>> I was actually thinking of keeping PVR_SOC variable and moving it =
to
>>>>>> corresponding machine configs.
>>>>>>
>>>>>
>>>>>
>>>>> PVR_SOC is a bit of a legacy name, especially since PVR is now IMG.
>>>>
>>>> PVR or PowerVR name is still used as an overall umbrella for all of
>>>> Imagination's graphics, vision and AI chips, including SGX and Rogue=
/RGX:
>>>> https://en.wikipedia.org/wiki/PowerVR
>>>>
>>>
>>>
>>> On the wiki page:
>>>
>>>> These GPUs are no longer called PowerVR, they are called IMG.[58]
>>>
>>> For their next gen GPUs they are distancing themselves from the PVR n=
ame,
>>> the GPU in AM62xx is one such next gen GPU, so it's already not corre=
ct here
>>> as is.
>>
>> So, then why AM62xx is being added to Rogue driver/DDK? Should there b=
e a
>> separate Albiorix driver and DDK then?
>>
>=20
>=20
> We asked IMG very nicely to not fork the DDK for each new gen of device=
 (like
> what happened with SGX -> Rogue), so now we have he same driver code ba=
se
> supporting multiple generations of GPU. The name "Rogue" just stuck aro=
und.
> We should probably rename some of this stuff to also be more generic.
>=20
>=20
>>
>>>>> Thinking on this, the mapping between SoC family and the internal n=
ames
>>>>> like "RGX_BVNC" and "TARGET_PRODUCT" are specific to the version of=
 this
>>>>> driver. For instance in the next DDK I may want the target name to
>>>>> go from "am62_linux" to "axb_128_linux", I would have to
>>>>> change things here (update the SRCREV) AND in the machine config.
>>>>
>>>> 1. I totally agree that "axb_128_linux" makes more sense than "am62_=
linux".
>>>> 2. Changes like that happen very rarely.
>>>> 3. You can call it PVR_MODEL or PVR_PRODUCT if you want, instead of =
PVR_SOC.
>>>>
>>>>
>>>>> Mapping here feels like the right spot to me. I'd even argue the sa=
me
>>>>> for OPTEEMACHINE and the like, should go in the optee.bbappends wit=
h the
>>>>> rest of our platform specific recipe fixups, etc.
>>>>
>>>> The number of overrides in the recipe will keep on growing, as each =
new
>>>> platform will need to add own config. That's the whole point of the =
machine
>>>> configuration file to have those defined centrally.
>>>>
>>>> The goal is to have a recipe as machine-agnostic and clean, as possi=
ble. Do
>>>> not overwhelm it with tons of conditionals like that - any machine-s=
pecific
>>>> configuration should be set in the machine config file.
>>>>
>>>
>>>
>>> Having all the fixups related to a package inside that package's defi=
nition sounds
>>> more central to me, and easier to reason about. But I can see the arg=
ument both
>>> ways.
>>>
>>> Maybe the better solution would be to splitup this(and the SGX) recip=
e. So we
>>> get a package per GPU type. It's already how the bins are organized/s=
hipped. Then
>>> we just pick the right GPU package for our SoC in arago-prefs.inc. (a=
gain like
>>> we already do to select between SGX/RGX)
>>
>> Yeah, I think keeping each series of GPU (SGX, Rogue, Albiorix) in the=
ir own
>> separate recipes would be fine. Or are you suggesting splitting even f=
urther
>> into separate recipes for SGX530 vs SGX540, etc?
>>
>=20
>=20
> I'm suggesting even further. The driver/package for SGX530 is not compa=
tible
> and conflicts with the driver package for SGX540. So lets not have a si=
ngle named
> package (ti-sgx-ddk-um) that can have very different contents, that's j=
ust confusing.
>=20


Oh, and not separate recipes, separate packages, they can all be provided
by the same one or two recipes.

ti-sgx-530-um
ti-sgx-544-um
ti-axe1-16m-um
etc..

Then:

PREFERRED_PROVIDER_virtual/libgles2:am62xx =3D "ti-axe1-16m-um"
...

Andrew


> Andrew
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14562): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/14562
> Mute This Topic: https://lists.yoctoproject.org/mt/89983769/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

