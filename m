Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5497C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 14:18:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19607.1721398696398881311
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Abx2Jpxr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JEIEsL002389;
	Fri, 19 Jul 2024 09:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721398694;
	bh=5ggypZDa1k7lgMOA/0YvbmuMeF2Q5JqCkEVkBYUYQq8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Abx2JpxrNIBJj0v096/kNTzGXVKl5KPDBV9yYfY9yEvwtvK5Ip9HdTe10YaDotqy1
	 yfiIq2BKkCVP+qzF1WyUZzfYVmmbGcUYzUu+TKFR4M3WqP90olLJMEvhfTuVzMFTV0
	 nIupJvkgHf8V6GeRB8jzcA0Jh+3WH3dITM7GmTHA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JEIEsT094674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jul 2024 09:18:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 09:18:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 09:18:14 -0500
Received: from [10.249.34.79] ([10.249.34.79])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JEIEPn085233;
	Fri, 19 Jul 2024 09:18:14 -0500
Message-ID: <97d92c14-f0b9-45e0-bfa6-7899c374196e@ti.com>
Date: Fri, 19 Jul 2024 09:18:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] linux: Manage the kernel
 patches using the BSP system
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240718182421.13591-1-reatmon@ti.com>
 <bd14cae5-e473-4542-adea-0b0cd15d9a8c@ti.com>
 <17E3A054E330ED13.19344@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E3A054E330ED13.19344@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 46JEIEsL002389
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 14:18:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17891



On 7/19/2024 8:29 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 7/18/2024 11:27 PM, Chirag Shilwant wrote:
>> Hi Ryan,
>> On 18/07/24 23:54, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> Applying the patches to all kernels is not going to work. Each kernel=
=20
>>> might need different patches to address reproducibility issues.=20
>>> Signed-off-by: Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> ---=20
>>> meta-ti-bsp/recipes-kernel/linux/ti-kernel.=E2=80=8Ainc | 12
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the=20
>>> source of this email and know the content is safe. If you wish to=20
>>> report this message to IT Security, please forward the message as an=20
>>> attachment to phishing@list.ti.com
>>> ZjQcmQRYFpfptBannerEnd
>>> Applying the patches to all kernels is not going to work.=C2=A0 Each =
kernel
>>> might need different patches to address reproducibility issues.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++--=
--
>>> =C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc=20
>>> b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>>> index f24fbe51..8bb30d40 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>>> @@ -13,8 +13,12 @@ EXTRA_DTC_ARGS +=3D "${@get_extra_dtc_args(d)}"
>>> =C2=A0 KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
>>> =C2=A0 KERNEL_DTBVENDORED =3D "1"
>>> -SRC_URI:append =3D " \
>>> -file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch =
\
>>> -file://0001-vt-conmakehash-improve-reproducibility.patch \
>>> -file://0001-pnmtologo-use-relocatable-file-name.patch \
>>> +KERNEL_PATCHES =3D ""
>>> +
>>> +KERNEL_PATCHES:bsp-ti-6.6 =3D " \

This is wrong.  Should be bsp-ti-6_6.  Still not used to the name scheme=20
for this.  I'll send a v2.


>>> + file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch=
 \
>>> +=C2=A0=C2=A0=C2=A0 file://0001-vt-conmakehash-improve-reproducibilit=
y.patch \
>>> +=C2=A0=C2=A0=C2=A0 file://0001-pnmtologo-use-relocatable-file-name.p=
atch \
>>> =C2=A0 "
>>
>>
>>
>> The patch title says [master/scarthgap] but I don't see these patches=20
>> in scarthgap getting applied
>=20
> I'll look into it.=C2=A0 I've been a little preoccupied with master thi=
s=20
> week, but I'll take a look today.
>=20
>=20
>  =C2=A0[1]
>> Additionally the patches itself are missing in scarthgap branch [2]
>> Are they applicable to scarthgap?
>=20
> Yes, they are.
>=20
>=20
>> [1]:=20
>> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes=
-kernel/linux/ti-kernel.inc?h=3Dscarthgap
>>
>> [2]:=20
>> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes=
-kernel/linux/files?h=3Dscarthgap
>>
>>
>>
>>> +
>>> +SRC_URI:append =3D " ${KERNEL_PATCHES} "
>>> --=20
>>> 2.17.1
>>>
>>>
>>>
>>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17890): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17890
> Mute This Topic: https://lists.yoctoproject.org/mt/107421992/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

