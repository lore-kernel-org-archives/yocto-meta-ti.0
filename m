Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E906C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 18:02:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2224.1752775324414142001
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 11:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=oJZR0XDj;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HI1lL0533718;
	Thu, 17 Jul 2025 13:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752775307;
	bh=Dddjldh0LWhVnhvzduYO/ozrkVr0p/ia5cQ6jcwM4Lc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oJZR0XDj+n1AkVmsofecr/2v1KMbBn1ry4wd14171CkAPlx00qvEXtlv6tpsTJIzu
	 zvssy3tlsBuGRcpbw8YjM4J683EBpJrPwnecfurMcZyRk/ZNqRN8AtUYwch9kG/Ln6
	 xY1T0gCA6YqFFIo1KlktsSIsI4hZw1WLFNCJUImc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HI1lPw1809295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 13:01:47 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 13:01:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 13:01:46 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HI1kel2575118;
	Thu, 17 Jul 2025 13:01:46 -0500
Message-ID: <51b4f094-3a20-4b4b-8b37-2eba3e2e3fc2@ti.com>
Date: Thu, 17 Jul 2025 13:01:46 -0500
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
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <53308664-c3e5-4442-9eca-3c4bce84395e@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 56HI1lL0533718
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Jul 2025 18:02:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18796



On 7/17/2025 12:55 PM, Miguel Gazquez wrote:
>=20
>=20
> Le 15/07/2025 =C3=A0 15:52, Ryan Eatmon a =C3=A9crit=C2=A0:
>>
>>
>> On 7/15/2025 6:34 AM, Miguel Gazquez wrote:
>>> Add am335x-bonegreen-eco devicetree to KERNEL_DEVICETREE in ti33x.inc
>>>
>>> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc=20
>>> b/meta-ti-bsp/ conf/machine/include/ti33x.inc
>>> index=20
>>> 7e9eb48c52737e74750565e639956334162432e2..0a0730eae104371d65548588b33=
33839857a3a50 100644
>>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>>> @@ -28,6 +28,7 @@ KERNEL_DEVICETREE =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-boneblack.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-boneblue.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen-wireless.dtb =
\
>>> +=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen-eco.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-bonegreen.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-chiliboard.dtb \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/omap/am335x-cm-t335.dtb \
>>
>> NAK.=C2=A0 As has been mentioned several times on this list, we do not=
=20
>> update KERNEL_DEVICETREE directly.=C2=A0 As we support multiple kernel=
=20
>> versions with each branch, we cannot have a single KERNEL_DEVICETREE=20
>> that works for all kernel versions.
>>
>> To that end we setup the KERNEL_DEVICETREE_PREFIX variable that will=20
>> pattern match and change the value for KERNEL_DEVICETREE based on the=20
>> available matching DTBs in the given kernel.=C2=A0 The only kernel ver=
sion=20
>> that uses KERNEL_DEVICETREE is the mainline (aka latest stable)=20
>> kernel. And the value for this variable is automatically updated to=20
>> include all of the available DTBs in the mainline kernel at the time=20
>> we update the recipe to that version.
>>
>> As the KERNEL_DEVICETREE_PREFIX already has an entry that will pick up=
=20
>> this new DTB when it is available, this change is not needed.
>=20
> When building for the am335x_evm without this patch, the devicetree for=
=20
> the beaglebone green eco is not included in the wic image, so the kerne=
l=20
> can't boot.
>=20
> As you said, in the linux-ti-staging recipe, KERNEL_DEVICETREE does=20
> contains the dtb for the bbg eco.
>=20
> But core-image-minimal (which create the wic image) uses the value of=20
> KERNEL_DEVICETREE from ti33x.inc, and not the one generated from=20
> KERNEL_DEVICETREE_PREFIX, so it doesn't contains the devicetree for the=
=20
> bbge. This can be checked with `bitbake-getvar -r core-image-minimal=20
> KERNEL_DEVICETREE`.
>=20
> It probably works for others boards because, apart from the bbge, there=
=20
> isn't any board supported in ti-linux-6.12.y but not in mainline.
>=20
> If we can't modify KERNEL_DEVICETREE here, what should I do to include=20
> the devicetree into the final image ?

Are you talking about a poky build with a poky kernel?  Or a poky build=20
with the TI kernel?

If you are talking about the TI kernel, then the mainline recipe does=20
not point to a kernel that has this DTB.  So are you trying to use the=20
mainline recipe but change the SRCREV to point a commit that does=20
contain this new DTB file?

>>
>> Right now this new DTB is only available on linux-next and has not=20
>> made it into any released kernels.
>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

