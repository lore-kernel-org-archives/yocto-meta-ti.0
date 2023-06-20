Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B890EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 20:42:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.883.1687293754039855976
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 13:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=plmhFx5p;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KKgUHi117137;
	Tue, 20 Jun 2023 15:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687293750;
	bh=90MYqjDTh9dLID+iMA5xv03rbpTUBykEG/M1+qaET4Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=plmhFx5pN+sxBXu9ImW9emamdZ9j8E9Rj/Kya0BD3JYRWTm9oN9U1i9txUIDCTNyk
	 yoxM6xtsrSnmiPb2NXcnkliUbJ5KMgZct14+yj+AdUsaPiTaaxV1zyuPgBdVAKgJAy
	 1dbGD5YAlPP9Jl/PI4zkrwIHlMfCE+gcNU07eguY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KKgUB0000880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 15:42:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 15:42:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 15:42:29 -0500
Received: from [10.250.36.99] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KKgTVj090648;
	Tue, 20 Jun 2023 15:42:29 -0500
Message-ID: <545bf734-961c-4386-9cb9-9a316822f4db@ti.com>
Date: Tue, 20 Jun 2023 15:42:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] kernel-rdepends: Add ti-eth-fw
 as an RDEPENDS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230620170925.19023-1-reatmon@ti.com>
 <20230620180537.GJ1518@denix.org>
 <9f070406-bc65-bfa1-b718-4fe935594183@ti.com>
 <68317d6f-8c87-a0db-12ab-232d2b7403c8@ti.com>
 <20230620203929.GK1518@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230620203929.GK1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35KKgUHi117137
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 20:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16750

On 6/20/23 3:39 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 20, 2023 at 03:06:01PM -0500, Andrew Davis wrote:
>> On 6/20/23 2:17 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 6/20/2023 1:05 PM, Denys Dmytriyenko wrote:
>>>> On Tue, Jun 20, 2023 at 12:09:25PM -0500, Ryan Eatmon via lists.yoct=
oproject.org wrote:
>>>>> When the ti-eth-fw recipe was split out from the ti-rtos-firmware r=
ecipe
>>>>> we forgot to add it as a dependency.
>>>>>
>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>> ---
>>>>>  =C2=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ++=
+
>>>>>  =C2=A0 1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b=
/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>> index 18984e80..1f0c1ee8 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>>> @@ -31,3 +31,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e=
 =3D " vxd-dec-fw"
>>>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cn=
m-wave-fw"
>>>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cn=
m-wave-fw"
>>>>>  =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " c=
nm-wave-fw"
>>>>> +
>>>>> +# Add run-time dependency for TI ETH firmware to the rootfs
>>>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k3 =3D " ti-eth-fw"
>>>>
>>>> Though, ETH FW is only enabled on j721e, j7200 and j784s4:
>>>>
>>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D91e5a1ca6541012e3d=
4285479ecf5a9f353307f9
>>>>
>>>> ETH_FW_LIST =3D ""
>>>> ETH_FW_LIST:j721e =3D=C2=A0=C2=A0 "${ETH_FW}"
>>>> ETH_FW_LIST:j7200 =3D=C2=A0=C2=A0 "${ETH_FW}"
>>>> ETH_FW_LIST:j721s2 =3D=C2=A0 ""
>>>> ETH_FW_LIST:j784s4 =3D=C2=A0 "${ETH_FW}"
>>>> ETH_FW_LIST:am65xx =3D=C2=A0 ""
>>>> ETH_FW_LIST:am64xx =3D=C2=A0 ""
>>>> ETH_FW_LIST:am62xx =3D=C2=A0 ""
>>>> ETH_FW_LIST:am62axx =3D ""
>>>>
>>>> Other platforms generate an empty package w/o the binary in it. So I=
 guess for
>>>> simpler dependency pulling it for all K3 platforms is an option? On =
one hand
>>>> it makes kernel dependencies simpler, but executes build/packaging p=
rocess for
>>>> the firmware that ends up being no-op and produce an empty output...
>>>
>>> Andrew and I talked about.=C2=A0 It seems annoying to have to update =
two files to add a platform, BUT doing it this way does mean we execute t=
he recipe when the recipe does nothing...
>>>
>>> This is sort of a holdover from the ti-rtos-firmware way of doing thi=
ngs.
>>>
>>> Let me think about it...
>>>
>>
>> Another thing we may want to do is not have this recipe be device spec=
ific,
>> it is just a small firmware, no good reason to only deploy one per dev=
ice.
>> I'd say we ship all unconditionally in this package, then it won't hav=
e to
>> be re-built for each device either.
>=20
> Is the binary identical between the platforms?
>=20

No, but the binaries are named differently for each platform, so they do =
not conflict.
Same as most other firmware packages, ship all the related firmware in th=
e same package,
and let the kernel pick the firmware it actually needs based on name for =
the platform
currently running.

Andrew

>=20
>> Andrew
>>
>>>> Similar question for DM FW? E.g.:
>>>>
>>>> https://git.yoctoproject.org/meta-ti/commit/?id=3Db21d29d94694ac49b9=
7a1f4ba428c7d8cd6fb64a
>>>>
>>>> DM_FW_LIST =3D ""
>>>> DM_FW_LIST:j721e =3D=C2=A0=C2=A0 "${DM_FIRMWARE}"
>>>> DM_FW_LIST:j7200 =3D=C2=A0=C2=A0 "${DM_FIRMWARE}"
>>>> DM_FW_LIST:j721s2 =3D=C2=A0 "${DM_FIRMWARE}"
>>>> DM_FW_LIST:j784s4 =3D=C2=A0 "${DM_FIRMWARE}"
>>>> DM_FW_LIST:am65xx =3D=C2=A0 ""
>>>> DM_FW_LIST:am64xx =3D=C2=A0 ""
>>>> DM_FW_LIST:am62xx =3D=C2=A0 "${DM_FIRMWARE}"
>>>> DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"

