Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D801C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:15:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.987.1665692122494548494
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=DsbrLulc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DKFJsn056264;
	Thu, 13 Oct 2022 15:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665692119;
	bh=BPtoIl34nUj2DRtJh2PUNJvTW92wDyu9aIr+ZAQnrGo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DsbrLulc66KSickva9F1kTbFIWh6JxnX4k34ql9H3maCO8vs86WrKZxbjvPOsJMa1
	 T6xTxOumL6lQ9X8CoxqHPF99ChMFkr2slTYgarIucdcHAkeJlBYDKrfrKOdkayRwNU
	 XbO1Mu4je3an3CzBG0CzC3Blwv+b7W0Q/J1nBCSE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DKFJDm011133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 15:15:19 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 15:15:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 15:15:19 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DKFJ1R025030;
	Thu, 13 Oct 2022 15:15:19 -0500
Message-ID: <ac31ed0c-499d-8a2a-6717-6710f408f0ed@ti.com>
Date: Thu, 13 Oct 2022 15:15:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti][master][PATCH v2] u-boot: Change depends from lzop to
 lzo
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20221013182602.9318-1-reatmon@ti.com>
 <20221013192440.GJ22689@denix.org>
 <334f2a4e-d192-0989-ecc5-ff4b09666c66@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <334f2a4e-d192-0989-ecc5-ff4b09666c66@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 29DKFJsn056264
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:15:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15168



On 10/13/2022 3:10 PM, Andrew Davis wrote:
> On 10/13/22 2:24 PM, Denys Dmytriyenko wrote:
>> On Thu, Oct 13, 2022 at 01:26:02PM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> lzop has disappeared from upstream master, but lzo is there.
>>
>> lzop is actually a compression tool, while lzo is just a library.
>> so, I don't believe this change is correct/complete.
>>
>=20
> Do we use this? Might be better to just drop the DEPENDS.

I was wondering the same thing.  lzop is clearly gone from master=20
upstream.  So we either need to find a replacement, or we need to remove =
it.


Here is the commit that removed it:

commit dea5e8863792dc7bb3324b543e04da4c94a060aa
Author: Ross Burton <ross.burton@arm.com>
Date:   Tue May 24 16:23:58 2022 +0100

     lzop: remove recipe from oe-core

     There are no users of lzop in oe-core, and there hasn't been a=20
release of
     lzop since 2017.

     Signed-off-by: Ross Burton <ross.burton@arm.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


Denys, as the person who added the lzop-native requirement in u-boot in=20
the first place, can you think of anything?


> Andrew
>=20
>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> v2: Fixed typo lzpo -> lzop
>>>
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index d29c80cf..88018541 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -23,7 +23,7 @@ SRC_URI =3D=20
>>> "${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PROTOCOL};branch=3D${BRANCH}=
"
>>> =C2=A0 PV:append =3D "+git${SRCPV}"
>>> =C2=A0 # u-boot needs devtree compiler to parse dts files
>>> -DEPENDS +=3D "dtc-native bc-native lzop-native flex-native=20
>>> bison-native python3-setuptools-native"
>>> +DEPENDS +=3D "dtc-native bc-native lzo-native flex-native bison-nati=
ve=20
>>> python3-setuptools-native"
>>> =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>> --=20
>>> 2.17.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#15164):=20
>>> https://lists.yoctoproject.org/g/meta-ti/message/15164
>>> Mute This Topic: https://lists.yoctoproject.org/mt/94310494/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.c=
om]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

