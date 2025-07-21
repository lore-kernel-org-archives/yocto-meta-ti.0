Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E7BC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:49:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.46228.1753116584232246790
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 09:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qMlcaBA6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LGndi11301129;
	Mon, 21 Jul 2025 11:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753116579;
	bh=0xlXZUVshkGzxD2TdEw8beEisNzrzcfRKQzpKn2OUI8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qMlcaBA6r3iXUCOFhaKvF51ORQjIGvQOCu3Xbww/w7tZkBHdI7D7SHg1hkmpwEvvS
	 bcmjkF6l0wbImaVVtDvZdgK9+1LI/7AtXSubAWXimj/1JqUdLHn/1W4qpLOqwOCpWy
	 0p1U8TRAKYj0V/By3R2EsdlCOKF286oT7epu6LwA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LGndN11495712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 11:49:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 11:49:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 11:49:39 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LGndoB3846736;
	Mon, 21 Jul 2025 11:49:39 -0500
Message-ID: <7a83e336-ff22-4703-9464-1b0c1c1b5def@ti.com>
Date: Mon, 21 Jul 2025 11:49:39 -0500
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
 <9ed58363-7e88-4772-9cb5-d4310b6e693c@ti.com>
 <9909bf1a-d068-4511-b68a-6caeedf19f98@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9909bf1a-d068-4511-b68a-6caeedf19f98@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 56LGndi11301129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Jul 2025 16:49:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18804



On 7/18/2025 10:48 AM, Miguel Gazquez wrote:
>=20
>=20
> Le 18/07/2025 =C3=A0 16:35, Ryan Eatmon a =C3=A9crit=C2=A0:
>>
>>
>> On 7/18/2025 4:54 AM, Miguel Gazquez wrote:
>>>
>>>
>>> Le 17/07/2025 =C3=A0 20:01, Ryan Eatmon a =C3=A9crit=C2=A0:
>>>>
>>>>
>>>> On 7/17/2025 12:55 PM, Miguel Gazquez wrote:
>>>>>
>>>>>
>>>>> Le 15/07/2025 =C3=A0 15:52, Ryan Eatmon a =C3=A9crit=C2=A0:
>>>>>>
>>>>>>
>>>>>> On 7/15/2025 6:34 AM, Miguel Gazquez wrote:
>>>>>>> Add am335x-bonegreen-eco devicetree to KERNEL_DEVICETREE in=20
>>>>>>> ti33x.inc
>>>>>>>
>>>>>>> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
>>>>>>> ---
>>>>>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
>>>>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc=20
>>>>>>> b/meta-ti- bsp/ conf/machine/include/ti33x.inc
>>>>>>> index=20
>>>>>>> 7e9eb48c52737e74750565e639956334162432e2..0a0730eae104371d6554858=
8b3333839857a3a50 100644
>>>>>>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>>>>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>>>>> @@ -28,6 +28,7 @@ KERNEL_DEVICETREE =3D " \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-boneblack.dtb \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-boneblue.dtb \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen-wireless.=
dtb \
>>>>>>> +=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen-eco.dtb \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen.dtb \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-chiliboard.dtb \
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-cm-t335.dtb \
>>>>>>
>>>>>> NAK.=C2=A0 As has been mentioned several times on this list, we do=
 not=20
>>>>>> update KERNEL_DEVICETREE directly.=C2=A0 As we support multiple ke=
rnel=20
>>>>>> versions with each branch, we cannot have a single=20
>>>>>> KERNEL_DEVICETREE that works for all kernel versions.
>>>>>>
>>>>>> To that end we setup the KERNEL_DEVICETREE_PREFIX variable that=20
>>>>>> will pattern match and change the value for KERNEL_DEVICETREE=20
>>>>>> based on the available matching DTBs in the given kernel.=C2=A0 Th=
e=20
>>>>>> only kernel version that uses KERNEL_DEVICETREE is the mainline=20
>>>>>> (aka latest stable) kernel. And the value for this variable is=20
>>>>>> automatically updated to include all of the available DTBs in the=20
>>>>>> mainline kernel at the time we update the recipe to that version.
>>>>>>
>>>>>> As the KERNEL_DEVICETREE_PREFIX already has an entry that will=20
>>>>>> pick up this new DTB when it is available, this change is not need=
ed.
>>>>>
>>>>> When building for the am335x_evm without this patch, the devicetree=
=20
>>>>> for the beaglebone green eco is not included in the wic image, so=20
>>>>> the kernel can't boot.
>>>>>
>>>>> As you said, in the linux-ti-staging recipe, KERNEL_DEVICETREE does=
=20
>>>>> contains the dtb for the bbg eco.
>>>>>
>>>>> But core-image-minimal (which create the wic image) uses the value=20
>>>>> of KERNEL_DEVICETREE from ti33x.inc, and not the one generated from=
=20
>>>>> KERNEL_DEVICETREE_PREFIX, so it doesn't contains the devicetree for=
=20
>>>>> the bbge. This can be checked with `bitbake-getvar -r core-image-=20
>>>>> minimal KERNEL_DEVICETREE`.
>>>>>
>>>>> It probably works for others boards because, apart from the bbge,=20
>>>>> there isn't any board supported in ti-linux-6.12.y but not in=20
>>>>> mainline.
>>>>>
>>>>> If we can't modify KERNEL_DEVICETREE here, what should I do to=20
>>>>> include the devicetree into the final image ?
>>>>
>>>> Are you talking about a poky build with a poky kernel?=C2=A0 Or a po=
ky=20
>>>> build with the TI kernel?
>>>>
>>>> If you are talking about the TI kernel, then the mainline recipe=20
>>>> does not point to a kernel that has this DTB.=C2=A0 So are you tryin=
g to=20
>>>> use the mainline recipe but change the SRCREV to point a commit that=
=20
>>>> does contain this new DTB file?
>>>
>>> I'm using a poky build with the TI kernel, which by default uses the=20
>>> branch "ti-linux-6.12.y", with the SRCREV equal to=20
>>> "78e6abff322081d53c5a685d927476086c9b2846" (on the scarthgap branch,=20
>>> I forgot to mention it). And on this branch there is the commit=20
>>> "ab7f0d695e9a3268deb760dcd0fa58812a614cd8" adding the devicetree for=20
>>> the beaglebone green eco.
>>
>> If you are on scarthgap and using linux-ti-staging_6.12, then you=20
>> should just need to point to the appropriate SRCREV for the patch you=20
>> want and build am335x-evm.=C2=A0 That should build the deploy the dtb =
you=20
>> are looking for.=C2=A0 It is in our nightly builds.
>>
>> In fact, we just promoted our CICD and I can see the file of interest=20
>> in our build.=C2=A0 So you should not even need to change the SRCREV i=
f you=20
>> use the latest scarthgap.
>=20
> Indeed, the dtb is build and deployed in the kernel workdir. However,=20
> it's not present in the final wic image.
> I checked the image from your CICD [0], and the dtb doesn't seem to be=20
> there either.
>=20
> IIUC, the list of dtbs deployed into the final image depends on=20
> KERNEL_DEVICETREE, and it seems like the recipe building the wic file=20
> uses the value hardcoded in ti33x.inc.


Good point.  We don't do any automated nightly testing with the wic=20
image at the moment.  Most of our testing is done over the UART.

I sent two patches to the meta-ti mailing list and on scarthgap-wip that=20
correctly handle setting KERNEL_DEVICETREE for the Poky and Arago images=20
so that the .wic files have the correct files in the boot partition.

We will work on getting this patch through our CICD, but in the meantime=20
you can point to the scarthgap-wip branch for your testing.  I'll send=20
reply to this thread once this is on on scarthgap proper.

>=20
> [0]=20
> https://software-dl.ti.com/cicd-report/linux/index.html?section=3Dsnaps=
hot&platform=3Dam335x&snapshot=3Dcicd.scarthgap.202507051251
>>>>>>
>>>>>> Right now this new DTB is only available on linux-next and has not=
=20
>>>>>> made it into any released kernels.
>>>>>>
>=20
> Please let me know what you think,
>=20
> Thanks,
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

