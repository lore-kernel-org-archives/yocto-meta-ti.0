Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A080C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 15:57:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.6614.1655308663752933817
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 08:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=hqRZPsa2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25FFvdZA009713;
	Wed, 15 Jun 2022 10:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655308659;
	bh=cS7kEwpzeeiNUJ2irLTzlvP1YY7Zaa4ttvdK0oaf6HQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hqRZPsa2yqW7sRNVxFDsTd18cKN4r/dqj+V5h1qzGpSdZ1XJekDcTi4KmDucBgXx/
	 pvW0sY//HSeMcv6on53nsnb+9tur0ptLVen1qYVuAPzD56zmuZfOQ46tYtq84komDh
	 iv748t0poSPkuCaFGRZnLmHYnrXAiQtRGrqoBH2c=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25FFvd0o025656
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 10:57:39 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 10:57:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 10:57:39 -0500
Received: from [10.250.235.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25FFva9c099283;
	Wed, 15 Jun 2022 10:57:37 -0500
Message-ID: <592ecbde-98a8-3fcc-812d-f7262307843a@ti.com>
Date: Wed, 15 Jun 2022 21:27:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220609145909.15483-1-afd@ti.com>
 <20220614082059.jjouefku4pf3f3jn@ula0497581>
 <a2a8081b-9028-b1b7-8d46-7328587e13d8@ti.com>
 <c2d5e4e9-68c2-9ae0-8aef-51fda15cb66d@ti.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <c2d5e4e9-68c2-9ae0-8aef-51fda15cb66d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id
 25FFvdZA009713
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jun 2022 15:57:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14822



On 15/06/22 20:41, Andrew Davis wrote:
> On 6/15/22 9:52 AM, Ryan Eatmon wrote:
>>
>>
>> On 6/14/2022 3:20, Manorit Chawdhry wrote:
>>> On 09:59-20220609, Andrew Davis wrote:
>>>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>>>
>>>> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
>>>> incomplete binaries in /boot and the naming of the binaries were not
>>>> correct.
>>>>
>>>> Fixes /boot partition for HS devices.
>>>>
>>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>>> [afd: Extended fix to all HS platforms]
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>
>>>> Changes from v2:
>>>> =C2=A0 - Added UBOOT_SYMLINK to fix missing u-boot.img image
>>>
>>> LGTM.
>>>
>>> Acked-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>
>>
>> I hate to ask this, but I just merged in the patches to add=20
>> j721s2-hs-evm support... do you want to make a V4 and make the same=20
>> changes in that file? or do you want to submit another patch to clean=20
>> that up?
>>
>>
>=20
>=20
> We can make a delta patch to fixup j721s2 after this goes in.
>=20
> Jayesh,
>=20
> Can you take that action, see what we did here for each platform and
> do the same for j721s2-hs and submit a patch.
>=20
> Andrew
>=20
>=20


Okay sure!! I will post the delta patch.

-Jayesh



