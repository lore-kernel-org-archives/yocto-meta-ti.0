Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C76C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 18:59:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.8823.1655319570558976725
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 11:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=uQuSFCxc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25FIxS9U039549;
	Wed, 15 Jun 2022 13:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655319568;
	bh=uku8B8spP9txYohimOUrRCjIHwBow9cE00TUoDGC6zQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uQuSFCxcyxlAaWB41XNjqsbUfMjhXSxUPZKgL9WAmTyXdbAWLu4MkiT39SHFeRnlm
	 +lmaiXgjc12UJV/uUazQp1V7bUrzF4TWAby20UnakjtmnwW71ND4ZMO6Id1+8ToMt0
	 xgBRqoGQnzw1g9ZdPQF0JkirRomhtVQ51N5+UCms=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25FIxSYl026331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 13:59:28 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 13:59:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 13:59:27 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25FIxRVc015740;
	Wed, 15 Jun 2022 13:59:27 -0500
Message-ID: <a12ae538-e17b-6320-64b0-7eeec3078d54@ti.com>
Date: Wed, 15 Jun 2022 13:59:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        Manorit
 Chawdhry <m-chawdhry@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220609145909.15483-1-afd@ti.com>
 <20220614082059.jjouefku4pf3f3jn@ula0497581>
 <a2a8081b-9028-b1b7-8d46-7328587e13d8@ti.com>
 <c2d5e4e9-68c2-9ae0-8aef-51fda15cb66d@ti.com>
 <592ecbde-98a8-3fcc-812d-f7262307843a@ti.com>
 <42f74f2e-0ed9-1e6c-4c07-3b89c20c9e59@ti.com>
 <0f274601-f86c-6854-94ef-40dc45f718c2@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <0f274601-f86c-6854-94ef-40dc45f718c2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 25FIxS9U039549
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jun 2022 18:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14825



On 6/15/2022 13:58, Andrew Davis wrote:
> On 6/15/22 1:55 PM, Ryan Eatmon wrote:
>>
>>
>> On 6/15/2022 10:57, Jayesh Choudhary wrote:
>>>
>>>
>>> On 15/06/22 20:41, Andrew Davis wrote:
>>>> On 6/15/22 9:52 AM, Ryan Eatmon wrote:
>>>>>
>>>>>
>>>>> On 6/14/2022 3:20, Manorit Chawdhry wrote:
>>>>>> On 09:59-20220609, Andrew Davis wrote:
>>>>>>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>>>>>>
>>>>>>> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading =
to
>>>>>>> incomplete binaries in /boot and the naming of the binaries were =
not
>>>>>>> correct.
>>>>>>>
>>>>>>> Fixes /boot partition for HS devices.
>>>>>>>
>>>>>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>>>>>> [afd: Extended fix to all HS platforms]
>>>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes from v2:
>>>>>>> =C2=A0 - Added UBOOT_SYMLINK to fix missing u-boot.img image
>>>>>>
>>>>>> LGTM.
>>>>>>
>>>>>> Acked-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>>>>
>>>>>
>>>>> I hate to ask this, but I just merged in the patches to add=20
>>>>> j721s2-hs-evm support... do you want to make a V4 and make the same=
=20
>>>>> changes in that file? or do you want to submit another patch to=20
>>>>> clean that up?
>>>>>
>>>>>
>>>>
>>>>
>>>> We can make a delta patch to fixup j721s2 after this goes in.
>>>>
>>
>>
>> Andrew,
>>
>> There was a second patch in V1, but it is missing in V2 and V3.=C2=A0 =
Did=20
>> you mean to drop it?=C2=A0 Or is that coming later?=C2=A0 I just want =
to make=20
>> sure I don't miss something you meant to have patched.
>>
>>
>=20
> 'conf: machine: Make multi-certificate image the default'?
>=20
> I just dropped it for now, it is un-related to the first patch.
> It is still valid and if you would like you can take the v1
> of that patch, it would save me from having to send it
> again as a standalone..
>=20
> Andrew


Thank you.


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

