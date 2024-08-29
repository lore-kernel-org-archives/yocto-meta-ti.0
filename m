Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F08C87FCE
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 18:13:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.27803.1724955224401595106
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 11:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ndIwvNU+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47TIDdes129466;
	Thu, 29 Aug 2024 13:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724955219;
	bh=owBgbUq77VLnMe5PH7fMmj1O+mZg18yOwE0Xkv+81/w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ndIwvNU+ponIY8o6rSBBlJchHEebGWW/dz+2Xud+aCTziyHyeKYkJ1Ef7MsruHa1E
	 6Ze4a/MMgU8Lw0wHurFx6bMH3oXWudxFIedzDlppkcxPotcHF98OzAmuzov1G+6Yb3
	 0b8BjkG7UZcxUpyVEOBgKFNxM41gof+XdI9QmHHo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47TIDdJ8076930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Aug 2024 13:13:39 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Aug 2024 13:13:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Aug 2024 13:13:39 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47TIDdPs074105;
	Thu, 29 Aug 2024 13:13:39 -0500
Message-ID: <4cb5144a-7a44-419f-ba73-daa9e3c30a60@ti.com>
Date: Thu, 29 Aug 2024 13:13:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a: Update
 to v2.11 release tag
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240816185307.15808-1-reatmon@ti.com>
 <20240827193849.GC17572@denix.org>
 <17EFB549A3D1C7CA.5649@lists.yoctoproject.org>
 <5fb77bdf-2bd2-4373-9aac-1aac5ac2e60e@ti.com>
 <20240828160618.GD17572@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240828160618.GD17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 47TIDdes129466
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Aug 2024 18:13:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17957



On 8/28/2024 11:06 AM, Denys Dmytriyenko wrote:
> On Tue, Aug 27, 2024 at 05:14:07PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 8/27/2024 5:08 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 8/27/2024 2:38 PM, Denys Dmytriyenko wrote:
>>>> On Fri, Aug 16, 2024 at 01:53:07PM -0500, Ryan Eatmon via
>>>> lists.yoctoproject.org wrote:
>>>>> From: Kamlesh Gurudasani <kamlesh@ti.com>
>>>>>
>>>>> Update to latest release tag, i.e. v2.11.
>>>>>
>>>>> Also update the LIC_FILES_CHKSUM since the license file changed sin=
ce
>>>>> the last SRCREV change.
>>>>
>>>> Changed in what way? It is recommended to briefly describe
>>>> license changes in
>>>> the commit log - it forces one to review the changes to ensure
>>>> there are no
>>>> license incompatibilities or even in the worst case complete
>>>> re-licensing of
>>>> the product.
>>>
>>> The license file for that project is a little goofy.=C2=A0 It has a b=
ig
>>> overall license, but then breaks out some specific features/blocks
>>> of code and lists additional license for those sections.=C2=A0 And
>>> that's what they changed.=C2=A0 They added some new items to that lis=
t.
>>>
>>> I thought about pushing back on the project and using the
>>> begins/ends concept to selectively extract the main license, but
>>> then I thought about it realized that was not a good idea.
>>>
>>> I'm open to suggestions about how to word a commit to handle this
>>> kind of thing in the future.
>>>
>>> Here is the license file:
>>>
>>> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware=
-a/+/refs/tags/v2.11/docs/license.rst
>>>
>>> And here is the change that impacts this patch:
>>>
>>> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware=
-a/+/584052c7f80b406666b9597447eeccef4d6deca4%5E%21/docs/license.rst
>>
>> The license file above lists these licenses:
>>
>> BSD-3-Clause
>>    plus
>> _FreeBSD: http://www.freebsd.org
>> _Linux MIT license: https://raw.githubusercontent.com/torvalds/linux/m=
aster/LICENSES/preferred/MIT
>> _SCC: http://www.simple-cc.org/
>> _Open Profile for DICE: https://pigweed.googlesource.com/open-dice/
>> _Apache License 2.0: https://www.apache.org/licenses/LICENSE-2.0.txt
>>
>>
>>
>> But the recipe[1][2] only lists this:
>>
>> LICENSE =3D "BSD-3-Clause & MIT"
>>
>> Does that mean the base recipe is also "not compliant" and should be
>> updated?
>>
>> [1] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/tr=
usted-firmware-a/trusted-firmware-a.inc
>> [2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/tr=
usted-firmware-a/trusted-firmware-a_2.11.0.bb
>>
>>
>>>
>>>> In this case the changes were not too bad, but apparently the
>>>> list of licenses
>>>> did change - see this discussion:
>>>>
>>>> https://lists.yoctoproject.org/g/meta-arm/topic/106488067#msg6004
>=20
> Have you looked at our upstream meta-arm discussion I linked here?
>=20

Nope.  I had not seen that.  In the future if this occurs again, I will=20
be sure to update all of the various license variables and note what the=20
change was in the commit message.



>=20
>>>>> Commit:
>>>>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebcc=
f5173f74c0458736ec526276106097e
>>>>>
>>>>> Tag:
>>>>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags=
/v2.11
>>>>>
>>>>> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
>>>>> Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>> ---
>>>>>  =C2=A0 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.in=
c | 5 +++--
>>>>>  =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-ti.inc
>>>>> index 291259c0..157bdbc5 100644
>>>>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-ti.inc
>>>>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-ti.inc
>>>>> @@ -1,5 +1,6 @@
>>>>> -PV:k3 =3D "2.10+git"
>>>>> -SRCREV_tfa:k3 =3D "00f1ec6b8740ccd403e641131e294aabacf2a48b"
>>>>> +PV:k3 =3D "2.11+git"
>>>>> +SRCREV_tfa:k3 =3D "f2735ebccf5173f74c0458736ec526276106097e"
>>>>> +LIC_FILES_CHKSUM:k3 =3D
>>>>> "file://docs/license.rst;md5=3Db5fbfdeb6855162dded31fadcd5d4dc5"
>>>>>  =C2=A0 SRC_URI:k3 =3D "git://git.trustedfirmware.org/TF-A/trusted-=
firmware-a.git;protocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
>>>>>  =C2=A0 COMPATIBLE_MACHINE:k3 =3D "k3"
>>>>>  =C2=A0 TFA_BUILD_TARGET:k3 =3D "all"
>>>>> --=20
>>>>> 2.17.1

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

