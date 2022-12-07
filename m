Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DC1C63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 22:43:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.870.1670452974656814661
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 14:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Yui/gv+k;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7MgomW012829;
	Wed, 7 Dec 2022 16:42:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670452970;
	bh=+ZnN6gfOdkTwbJhTlalqAmeKL53Es3AqlC/bx/OwcgM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Yui/gv+ky+Ov33a1LUXKpEBK9eObjuKubkiHP8mW7QW3pGcv7sOo2mwZ1RXpOqYwp
	 UMXh//UUljx6AzGACcoXvWuTppTMWcCSaeilL1PkKYbE9y1BsDZchys2+WjaV3JW8n
	 SkoKNIZVWT0/8LZG59KTckMWVZ6Sing/gGI6Kewo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7MgoSp058401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 16:42:50 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 16:42:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 16:42:50 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7MgnLS050183;
	Wed, 7 Dec 2022 16:42:49 -0600
Message-ID: <fa914b1d-0108-4311-ea6e-10314c856954@ti.com>
Date: Wed, 7 Dec 2022 16:42:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency on
 meta-ti-extras soft
To: =?UTF-8?Q?Daniel_D=c3=adaz?= <mrchapp@gmail.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
 <20221207222351.GB22689@denix.org>
 <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
 <CAELJN2kY3gjcamCXPC=7n7ss961KH3OJkRFEXc9Ai0bEVeiX+w@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAELJN2kY3gjcamCXPC=7n7ss961KH3OJkRFEXc9Ai0bEVeiX+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 2B7MgomW012829
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 22:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15432


The test builds for this are running right now.  I would expect that I=20
can merge it over to kirkstone tomorrow morning sometime.


On 12/7/2022 4:39 PM, Daniel D=C3=ADaz wrote:
> Hello!
>=20
> On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via lists.yoctoproject.org
> <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>> I literally merged this out to master about 30mins ago.
>=20
> We can this be expected to land on Kirkstone?
>=20
> Thanks and greetings!
>=20
> Daniel D=C3=ADaz
> yosoy@danieldiaz.org
>=20
>=20
>=20
>> On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:
>>> Ping?
>>>
>>>
>>> On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>
>>>> Replace "require" with "include" to load ti-paths.inc and not break
>>>> parsing when meta-ti-extras is not in the BBLAYERS list.
>>>>
>>>> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
>>>> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
>>>> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
>>>> the soft dependency will still work fine and give a build error
>>>> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
>>>>
>>>> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
>>>> d.getVar() to access it ensuring it doesn't break the condition.
>>>>
>>>> Reported-by: Daniel D=C3=ADaz <mrchapp@gmail.com>
>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>>> ---
>>>>    meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/me=
ta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> index e89a6855..c99cd660 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>>> @@ -1,5 +1,5 @@
>>>>    require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> -require recipes-ti/includes/ti-paths.inc
>>>> +include recipes-ti/includes/ti-paths.inc
>>>>
>>>>    DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virt=
ual/bootloader"
>>>>    DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
>>>> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
>>>>
>>>>    PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>
>>>> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${T=
I_K3_SECDEV_INSTALL_DIR}' }"
>>>> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.ge=
tVar('TI_K3_SECDEV_INSTALL_DIR') }"
>>>>    export TI_SECURE_DEV_PKG
>>>>
>>>>    SYSFW_SOC ?=3D "unknown"
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>>
>>>>
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15430): https://lists.yoctoproject.org/g/meta-ti/m=
essage/15430
>> Mute This Topic: https://lists.yoctoproject.org/mt/95121729/1051867
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [mrchapp@g=
mail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

