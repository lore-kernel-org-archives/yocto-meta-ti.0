Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B68C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 21:33:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3738.1693258405974507599
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 14:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LMmT0lNX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SLXM90001825;
	Mon, 28 Aug 2023 16:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693258402;
	bh=EGQU10dB5oOmpA7dIKQhsOFUURLPuofHDfbxEeodA6k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LMmT0lNXZxtJRfwIpfGHRx3RBr+ztHwaWWiexwK6ocf5sAoFp9WDNwIZteJrBREqM
	 QTBKUXnRqcbBmQAeQFkllPzmv0xK4i5Iemix3+uFBcTLg9I/OloT5CodSvPV0dRPBW
	 jJxE2X8ZkvHEtdMCfmo66GlDHS2D6ndObdL7g6fU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SLXMtp109073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 16:33:22 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 16:33:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 16:33:21 -0500
Received: from [10.249.36.124] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SLXLmY106024;
	Mon, 28 Aug 2023 16:33:21 -0500
Message-ID: <5688e75b-c861-b9d1-a007-f72eafca2e07@ti.com>
Date: Mon, 28 Aug 2023 16:33:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-umlibs: Add DEPENDS on
 BASE_DEFAULT_DEPS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230828202211.22475-1-reatmon@ti.com>
 <20230828203915.GQ3359@denix.org>
 <177FA6F1CCEC185E.29216@lists.yoctoproject.org>
 <177FA87BB4E479BB.5772@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <177FA87BB4E479BB.5772@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 37SLXM90001825
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 21:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16899



On 8/28/2023 4:13 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 8/28/2023 3:45 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 8/28/2023 3:39 PM, Denys Dmytriyenko wrote:
>>> On Mon, Aug 28, 2023 at 03:22:11PM -0500, Ryan Eatmon via=20
>>> lists.yoctoproject.org wrote:
>>>> A recent change to oe-core [1], has caused a pile of QA errors durin=
g
>>>> packaging for this binary package.=C2=A0 The effect of the change in=
 oe-core
>>>> was to remove the dependency on the compiler and other compiler=20
>>>> adjacent
>>>> libraries.=C2=A0 But the binary packages need some of the compiler t=
ools as
>>>> part of the packaging flow (ie. objdump).
>>>>
>>>> Until the above gets reverted, this patch will fix the issue and can=
 be
>>>> reverted itself once oe-core is fixed.
>>>>
>>>> [1]=20
>>>> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster&id=
=3Dd1d09bd4d7be88f0e341d5fccbfbefeb98d4b727
>>>
>>> Why not simply reset INHIBIT_DEFAULT_DEPS in the recipe?
>>
>> Good question.=C2=A0 Let me try that.=C2=A0 It should work, but I want=
 to be sure.
>=20
> huh...=C2=A0 It didn't work...
>=20
>=20
> inherit bin_package
>=20
> INHIBIT_DEFAULT_DEPS =3D "0"

If I set it to "" then it works.  Let me test that further and post a v2=20
tomorrow.

>=20
> That gave the same build errors....
>=20
>=20
> Here is code that is using the variable:
>=20
> def get_base_dep(d):
>  =C2=A0=C2=A0=C2=A0 if d.getVar('INHIBIT_DEFAULT_DEPS', False):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ""
>  =C2=A0=C2=A0=C2=A0 return "${BASE_DEFAULT_DEPS}"
>=20
>=20
>=20
>=20
>>
>>
>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>> =C2=A0 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
>>>> 2 ++
>>>> =C2=A0 1 file changed, 2 insertions(+)
>>>>
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23=
.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-=
umlibs_23.1.6404501.bb
>>>> index f748bd0f..73de93e5 100644
>>>> ---=20
>>>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23=
.1.6404501.bb
>>>> +++=20
>>>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23=
.1.6404501.bb
>>>> @@ -37,6 +37,8 @@ PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
>>>> =C2=A0 PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
>>>> =C2=A0 PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
>>>> +DEPENDS:prepend =3D "${BASE_DEFAULT_DEPS} "
>>>> +
>>>> =C2=A0 def get_file_list(package_list_var, d):
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file_list =3D []
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_list =3D d.getVar(package_lis=
t_var)
>>>> --=20
>>>> 2.17.1
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
> View/Reply Online (#16898): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16898
> Mute This Topic: https://lists.yoctoproject.org/mt/101018238/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

