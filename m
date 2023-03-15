Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC4C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 18:28:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1212.1678904932810775254
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 11:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=B5zh0Hy1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32FISlKk126030;
	Wed, 15 Mar 2023 13:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678904927;
	bh=o1hNvnIoS5SqSuTGjsygUYrQjpeOBS1pnEJHghQlYzM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B5zh0Hy1xBggR0TcBUNHReTJC0wsQywkdA3XV5MCJrUhyIczBx6bgYb9a91OheVlo
	 NpDZQizsOn5yfiueG3BF+ddJQdDsX9hpNnCs7AmE75NlzpaqO13R6TZ1pC0hRscpAA
	 JIEJPt1ibOo/3eG42AqqgHIOb9TnddOFqsbC3Bdw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32FISlR7032733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Mar 2023 13:28:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Mar 2023 13:28:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Mar 2023 13:28:47 -0500
Received: from [10.249.35.0] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32FISkFk087611;
	Wed, 15 Mar 2023 13:28:46 -0500
Message-ID: <aa3e1d9a-ec06-fdd3-8d10-654b087b0068@ti.com>
Date: Wed, 15 Mar 2023 13:28:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] linux-ti-staging: Add 6.1
 recipe
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230314162027.28974-1-afd@ti.com>
 <f744c42c-7678-a43a-4dd7-c7323ec3236d@ti.com>
 <5a346fe0-c71a-155f-3d60-fe28d05d9929@ti.com>
 <20230314195250.GA18050@denix.org>
 <0f39908e-65a8-2fe2-48ad-5c873a0cf6e0@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <0f39908e-65a8-2fe2-48ad-5c873a0cf6e0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 32FISlKk126030
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Mar 2023 18:28:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15983



On 3/15/2023 12:55, Andrew Davis wrote:
> On 3/14/23 2:52 PM, Denys Dmytriyenko wrote:
>> On Tue, Mar 14, 2023 at 11:46:23AM -0500, Bajjuri, Praneeth wrote:
>>> On 3/14/2023 11:37 AM, Ryan Eatmon wrote:
>>>>
>>>> Is there a better way of adding 6.1 without destroying the 5.10
>>>> support?=C2=A0 =C2=A0Because until we have 6.1 up and working it wou=
ld be
>>>> nice to have a working kirkstone for anyone using it...
>>>
>>> Want to hear from denys as well based on past migration history.
>>>
>>> IMO, there was a window during early migration at 5.10 phase where
>>> we limited features to get the initial baseline ready and added
>>> overlays over the time when kernel added the same.
>>
>> Yes, this will be a major regression for existing customers using meta=
-ti
>> on Kirkstone!
>>
>=20
> Kirkstone is not productized yet, I know it is late but that is the
> reality, customers should see Kirkstone as a preview until then.


While in principle I agree that we have not claimed that kirkstone is=20
ready, it has not stopped some people from looking ahead into kirkstone=20
and even master.


>> In the past, Yocto migration was better aligned with the BSP migration=
=20
>> and
>> both would happen at about the same time every year. So, the new BSP=20
>> would
>> be available in the new Yocto branch and there was a choice of using=20
>> an old
>> branch with stable and feature-complete BSP, or a new, but unstable an=
d
>> initially incomplete branch. That provided extra freedom and flexibili=
ty
>> to start completely from scratch in the new branch...
>>
>> That has changed a bit recently with 5.4 -> 5.10 migration happening i=
n
>> Dunfell couple of years ago. And this time around 5.10 -> 6.1 in=20
>> Kirkstone.
>> Both branches are Yocto LTS with many active users having some=20
>> expectation
>> of stability.
>>
>=20
> Dunfell should use 5.10, Kirkstone should use the newer kernel, I don't
> see the need to support both kernels on Kirkstone, especially if it wil=
l=20
> just
> be temporary anyway. The juggling of both kernels during the migration =
will
> slow us down, better to move fast here to get Kirkstone users back up a=
nd
> running on the latest kernel.

As we continue to keep master more in mind and up to date with things=20
going forward, this topic will continue to come up.  We cannot just nuke=20
what is working to get something new going.  I think the best approach=20
would be to not break the previous kernel in favor of the new kernel.=20
We need to figure out a way to support both during the transition.


>> In Dunfell, initial 5.10 recipe was added in mid-January 2021:
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D874ff0d7f9f31703e0a7=
1a9f5d968051b77c2df0
>>
>> It broke things for many people and I suggested marking it to not be u=
sed
>> as the default:
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D6496a0edeb8a84bfb1b9=
e13ec58814ea5babcde7
>>
>> Three months later, by mid-April 2021 the change was reverted and 5.10=
=20
>> got
>> promoted to the default:
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D7793303e6c1543e5058b=
f1a7e83ea72f3a45c079
>>
>> Although I'd argue it was a bit too soon, as lots of DTBs/DTBOs still=20
>> had to
>> be removed from machine configs:
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D8b206b32ec181624b929=
aa7f998f26ed99e140a7
>> https://git.yoctoproject.org/meta-ti/commit/?id=3Dfb0a0ddd25d4308152ce=
8243e00b444cbb5d565d
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D9ea50db095f91bad7c9b=
2f643347dc25be6e10dd
>> https://git.yoctoproject.org/meta-ti/commit/?id=3Dad28c5878171ef5b364f=
6bc9d8a5de514731964b
>> https://git.yoctoproject.org/meta-ti/commit/?id=3Dba0ddc5ae9ebf9777d31=
283f272e4ed518e1f514
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D43bf0f36a3ac62cc3378=
688358ba704a27b501ce
>> https://git.yoctoproject.org/meta-ti/commit/?id=3D8bdfe1413c00e0c55132=
989dafcf8d91827999c3
>>
>>
>>> Remove all non-upstream Device Tree Overlays. We could have filtered=20
>>> them
>>> out like as done in mainline and next testing. The issue would be as=20
>>> they
>>> are added back to 6.1 and upstream we would need to conditionally
>>> re-enable each. Easier to get a clean start.
>>
>> I'd say we set DEFAULT_PREFERENCE =3D "-1" and, indeed, use automatic=20
>> filtering
>> of DT files similar to mainline/next recipes, until 6.1 mostly catches=
=20
>> up and
>> have majority of them integrated...
>>
>=20
> Automatic filtering will not work, there are also DTBs that are not=20
> overlays
> that are not upstream either. In other cases DTB names have changed. We=
=20
> would
> need to maintain a list for each 5.10, 6.1, mainline, and next kernels.=
=20
> That
> multiplied by each MACHINE.
>=20
> Populating KERNEL_DEVICETREE based on what the kernel actually builds s=
eems
> like the only reasonable solution today.
>=20
> Andrew

The problem is that yocto supports the idea of multiple kernels, but has=20
only a single KERNEL_DEVICETREE for a given platform.  And in addition=20
to that issue, the KERNEL_DEVICETREE is used in a few recipes and so we=20
cannot just move where this is defined into the kernel where it make=20
sense.  We might need to think of a new way of handling this that can=20
solve the issue in the most flexible manner.


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

