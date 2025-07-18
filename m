Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D358FC83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 14:35:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22410.1752849310237922544
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 07:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jgJMLT5q;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56IEZ4DE730260;
	Fri, 18 Jul 2025 09:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752849304;
	bh=WlOeWL0zRM/TwcMAK69N8ZSk4H8zYypkiPmbt9cUUgk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jgJMLT5qOO0HD9um2WAX1qnVeZ+Jv2n6vmA1qV+dq/r87T1J70Vi4DMAU7Lt+b8wN
	 Boqq+w2puXtU0jMNk+U2032IFEu1fBNRc2rctriSOOnbMd+Qj1+9hHR/d8DWO+jDiA
	 TYBK0H/lqaGNKzPrKsYpIR+kHN3c1FNdJa65xzlI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56IEZ4Cr3560625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 18 Jul 2025 09:35:04 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 18
 Jul 2025 09:35:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 18 Jul 2025 09:35:04 -0500
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56IEZ4oK3655110;
	Fri, 18 Jul 2025 09:35:04 -0500
Message-ID: <9ed58363-7e88-4772-9cb5-d4310b6e693c@ti.com>
Date: Fri, 18 Jul 2025 09:35:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] conf: machine: add BeagleBone Green Eco to
 KERNEL_DEVICETREE
To: Miguel Gazquez <miguel.gazquez@bootlin.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <thomas.petazzoni@bootlin.com>, <praneeth@ti.com>,
        <romain.gantois@bootlin.com>, <kory.maincent@bootlin.com>,
        <thomas.bonnefille@bootlin.com>, <denys@konsulko.com>,
        <robertcnelson@gmail.com>
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
 <20250715-bbg_eco_machine-v1-1-6d1581129203@bootlin.com>
 <40c291ff-c3ee-4d9f-a45a-3affb088cf7e@ti.com>
 <53308664-c3e5-4442-9eca-3c4bce84395e@bootlin.com>
 <51b4f094-3a20-4b4b-8b37-2eba3e2e3fc2@ti.com>
 <e7e1e822-5f2e-42d2-ac40-4d210c9f769d@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <e7e1e822-5f2e-42d2-ac40-4d210c9f769d@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 56IEZ4DE730260
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Jul 2025 14:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18800



On 7/18/2025 4:54 AM, Miguel Gazquez wrote:
>=20
>=20
> Le 17/07/2025 =C3=A0 20:01, Ryan Eatmon a =C3=A9crit=C2=A0:
>>
>>
>> On 7/17/2025 12:55 PM, Miguel Gazquez wrote:
>>>
>>>
>>> Le 15/07/2025 =C3=A0 15:52, Ryan Eatmon a =C3=A9crit=C2=A0:
>>>>
>>>>
>>>> On 7/15/2025 6:34 AM, Miguel Gazquez wrote:
>>>>> Add am335x-bonegreen-eco devicetree to KERNEL_DEVICETREE in ti33x.i=
nc
>>>>>
>>>>> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
>>>>> ---
>>>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
>>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-=20
>>>>> bsp/ conf/machine/include/ti33x.inc
>>>>> index=20
>>>>> 7e9eb48c52737e74750565e639956334162432e2..0a0730eae104371d65548588b=
3333839857a3a50 100644
>>>>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>>> @@ -28,6 +28,7 @@ KERNEL_DEVICETREE =3D " \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-boneblack.dtb \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-boneblue.dtb \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen-wireless.dt=
b \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen-eco.dtb \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen.dtb \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-chiliboard.dtb \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-cm-t335.dtb \
>>>>
>>>> NAK.=C2=A0 As has been mentioned several times on this list, we do n=
ot=20
>>>> update KERNEL_DEVICETREE directly.=C2=A0 As we support multiple kern=
el=20
>>>> versions with each branch, we cannot have a single KERNEL_DEVICETREE=
=20
>>>> that works for all kernel versions.
>>>>
>>>> To that end we setup the KERNEL_DEVICETREE_PREFIX variable that will=
=20
>>>> pattern match and change the value for KERNEL_DEVICETREE based on=20
>>>> the available matching DTBs in the given kernel.=C2=A0 The only kern=
el=20
>>>> version that uses KERNEL_DEVICETREE is the mainline (aka latest=20
>>>> stable) kernel. And the value for this variable is automatically=20
>>>> updated to include all of the available DTBs in the mainline kernel=20
>>>> at the time we update the recipe to that version.
>>>>
>>>> As the KERNEL_DEVICETREE_PREFIX already has an entry that will pick=20
>>>> up this new DTB when it is available, this change is not needed.
>>>
>>> When building for the am335x_evm without this patch, the devicetree=20
>>> for the beaglebone green eco is not included in the wic image, so the=
=20
>>> kernel can't boot.
>>>
>>> As you said, in the linux-ti-staging recipe, KERNEL_DEVICETREE does=20
>>> contains the dtb for the bbg eco.
>>>
>>> But core-image-minimal (which create the wic image) uses the value of=
=20
>>> KERNEL_DEVICETREE from ti33x.inc, and not the one generated from=20
>>> KERNEL_DEVICETREE_PREFIX, so it doesn't contains the devicetree for=20
>>> the bbge. This can be checked with `bitbake-getvar -r core-image-=20
>>> minimal KERNEL_DEVICETREE`.
>>>
>>> It probably works for others boards because, apart from the bbge,=20
>>> there isn't any board supported in ti-linux-6.12.y but not in mainlin=
e.
>>>
>>> If we can't modify KERNEL_DEVICETREE here, what should I do to=20
>>> include the devicetree into the final image ?
>>
>> Are you talking about a poky build with a poky kernel?=C2=A0 Or a poky=
=20
>> build with the TI kernel?
>>
>> If you are talking about the TI kernel, then the mainline recipe does=20
>> not point to a kernel that has this DTB.=C2=A0 So are you trying to us=
e the=20
>> mainline recipe but change the SRCREV to point a commit that does=20
>> contain this new DTB file?
>=20
> I'm using a poky build with the TI kernel, which by default uses the=20
> branch "ti-linux-6.12.y", with the SRCREV equal to=20
> "78e6abff322081d53c5a685d927476086c9b2846" (on the scarthgap branch, I=20
> forgot to mention it). And on this branch there is the commit=20
> "ab7f0d695e9a3268deb760dcd0fa58812a614cd8" adding the devicetree for th=
e=20
> beaglebone green eco.

If you are on scarthgap and using linux-ti-staging_6.12, then you should=20
just need to point to the appropriate SRCREV for the patch you want and=20
build am335x-evm.  That should build the deploy the dtb you are looking=20
for.  It is in our nightly builds.

In fact, we just promoted our CICD and I can see the file of interest in=20
our build.  So you should not even need to change the SRCREV if you use=20
the latest scarthgap.

>=20
>>>>
>>>> Right now this new DTB is only available on linux-next and has not=20
>>>> made it into any released kernels.
>>>>
>>>>
>>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

