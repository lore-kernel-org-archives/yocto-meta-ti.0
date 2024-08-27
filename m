Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2226AC5473A
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 22:14:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.326.1724796853173791960
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Aug 2024 15:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=gAW8uMoA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47RME80H069690;
	Tue, 27 Aug 2024 17:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724796848;
	bh=uI/WU6jwlBUvo36TLYz/0ieR6miTacTa5PUKbcb1KP0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gAW8uMoA+YXWhX4YHWHdYYPzPaQG6WyxwSEZUuKcrSlkfaiP1LAc+yQ9xkI6fG66t
	 ssRM1iT5MqlXsGIrctstd7HpiEiSLY3ATR9NybOPW1XnGKHWM5zRto8Uxp7V7U1yi1
	 bvIbC8yNmZ4OAHBUI+djks6xHjmL35irPW14ug48=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47RME8cx022194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 17:14:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 17:14:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 17:14:07 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47RME7m6072613;
	Tue, 27 Aug 2024 17:14:07 -0500
Message-ID: <5fb77bdf-2bd2-4373-9aac-1aac5ac2e60e@ti.com>
Date: Tue, 27 Aug 2024 17:14:07 -0500
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
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17EFB549A3D1C7CA.5649@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 47RME80H069690
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Aug 2024 22:14:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17955



On 8/27/2024 5:08 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 8/27/2024 2:38 PM, Denys Dmytriyenko wrote:
>> On Fri, Aug 16, 2024 at 01:53:07PM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> From: Kamlesh Gurudasani <kamlesh@ti.com>
>>>
>>> Update to latest release tag, i.e. v2.11.
>>>
>>> Also update the LIC_FILES_CHKSUM since the license file changed since
>>> the last SRCREV change.
>>
>> Changed in what way? It is recommended to briefly describe license=20
>> changes in
>> the commit log - it forces one to review the changes to ensure there=20
>> are no
>> license incompatibilities or even in the worst case complete=20
>> re-licensing of
>> the product.
>=20
> The license file for that project is a little goofy.=C2=A0 It has a big=
=20
> overall license, but then breaks out some specific features/blocks of=20
> code and lists additional license for those sections.=C2=A0 And that's =
what=20
> they changed.=C2=A0 They added some new items to that list.
>=20
> I thought about pushing back on the project and using the begins/ends=20
> concept to selectively extract the main license, but then I thought=20
> about it realized that was not a good idea.
>=20
> I'm open to suggestions about how to word a commit to handle this kind=20
> of thing in the future.
>=20
> Here is the license file:
>=20
> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a=
/+/refs/tags/v2.11/docs/license.rst
>=20
> And here is the change that impacts this patch:
>=20
> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a=
/+/584052c7f80b406666b9597447eeccef4d6deca4%5E%21/docs/license.rst

The license file above lists these licenses:

BSD-3-Clause
   plus
_FreeBSD: http://www.freebsd.org
_Linux MIT license:=20
https://raw.githubusercontent.com/torvalds/linux/master/LICENSES/preferre=
d/MIT
_SCC: http://www.simple-cc.org/
_Open Profile for DICE: https://pigweed.googlesource.com/open-dice/
_Apache License 2.0: https://www.apache.org/licenses/LICENSE-2.0.txt



But the recipe[1][2] only lists this:

LICENSE =3D "BSD-3-Clause & MIT"

Does that mean the base recipe is also "not compliant" and should be=20
updated?

[1]=20
https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/trusted-f=
irmware-a/trusted-firmware-a.inc
[2]=20
https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/trusted-f=
irmware-a/trusted-firmware-a_2.11.0.bb


>=20
>> In this case the changes were not too bad, but apparently the list of=20
>> licenses
>> did change - see this discussion:
>>
>> https://lists.yoctoproject.org/g/meta-arm/topic/106488067#msg6004
>>
>>
>>> Commit:
>>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf5=
173f74c0458736ec526276106097e
>>>
>>> Tag:
>>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/v=
2.11
>>>
>>> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
>>> Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc |=
 5 +++--
>>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.in=
c b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>>> index 291259c0..157bdbc5 100644
>>> ---=20
>>> a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.in=
c
>>> +++=20
>>> b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.in=
c
>>> @@ -1,5 +1,6 @@
>>> -PV:k3 =3D "2.10+git"
>>> -SRCREV_tfa:k3 =3D "00f1ec6b8740ccd403e641131e294aabacf2a48b"
>>> +PV:k3 =3D "2.11+git"
>>> +SRCREV_tfa:k3 =3D "f2735ebccf5173f74c0458736ec526276106097e"
>>> +LIC_FILES_CHKSUM:k3 =3D=20
>>> "file://docs/license.rst;md5=3Db5fbfdeb6855162dded31fadcd5d4dc5"
>>> =C2=A0 SRC_URI:k3 =3D=20
>>> "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=3D=
https;name=3Dtfa;branch=3Dmaster"
>>> =C2=A0 COMPATIBLE_MACHINE:k3 =3D "k3"
>>> =C2=A0 TFA_BUILD_TARGET:k3 =3D "all"
>>> --=20
>>> 2.17.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17954): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17954
> Mute This Topic: https://lists.yoctoproject.org/mt/107937926/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

