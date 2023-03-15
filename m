Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B5AC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 18:53:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2029.1678906392604138622
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 11:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=dW8VUhLU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32FIr7Vp061622;
	Wed, 15 Mar 2023 13:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678906387;
	bh=it+xxj8Xo/BKNshiROId1sYU9ZBQLglXxW53TYcNcvY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dW8VUhLUTCkjMw4lodDSe8UQvaPXkOS1hinqTAS425azzT3Nh9rx5bfPYt+JAHbtT
	 oB+/W0Ce8jpw6cBYZJ/si4lKd/zGyAqCI700qJDwXGupf/C25igLuwDmM343KwKROY
	 nB8oVyiDH84arUfGRbLahHRjacMgJtTzD45MhBck=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32FIr6dY022325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Mar 2023 13:53:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Mar 2023 13:53:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Mar 2023 13:53:06 -0500
Received: from [128.247.81.25] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32FIr6vc035632;
	Wed, 15 Mar 2023 13:53:06 -0500
Message-ID: <caa03558-a31d-8d51-63d2-6d07c73aba01@ti.com>
Date: Wed, 15 Mar 2023 13:53:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] linux-ti-staging: Add 6.1
 recipe
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230314162027.28974-1-afd@ti.com>
 <f744c42c-7678-a43a-4dd7-c7323ec3236d@ti.com>
 <5a346fe0-c71a-155f-3d60-fe28d05d9929@ti.com>
 <20230314195250.GA18050@denix.org>
 <0f39908e-65a8-2fe2-48ad-5c873a0cf6e0@ti.com>
 <aa3e1d9a-ec06-fdd3-8d10-654b087b0068@ti.com>
From: Praneeth Bajjuri <praneeth@ti.com>
In-Reply-To: <aa3e1d9a-ec06-fdd3-8d10-654b087b0068@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 32FIr7Vp061622
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Mar 2023 18:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15984


On 3/15/23 13:28, Ryan Eatmon wrote:
>
>
> On 3/15/2023 12:55, Andrew Davis wrote:
>> On 3/14/23 2:52 PM, Denys Dmytriyenko wrote:
>>> On Tue, Mar 14, 2023 at 11:46:23AM -0500, Bajjuri, Praneeth wrote:
>>>> On 3/14/2023 11:37 AM, Ryan Eatmon wrote:
>>>>>
>>>>> Is there a better way of adding 6.1 without destroying the 5.10
>>>>> support?=C2=A0 =C2=A0Because until we have 6.1 up and working it wo=
uld be
>>>>> nice to have a working kirkstone for anyone using it...
>>>>
>>>> Want to hear from denys as well based on past migration history.
>>>>
>>>> IMO, there was a window during early migration at 5.10 phase where
>>>> we limited features to get the initial baseline ready and added
>>>> overlays over the time when kernel added the same.
>>>
>>> Yes, this will be a major regression for existing customers using=20
>>> meta-ti
>>> on Kirkstone!
>>>
>>
>> Kirkstone is not productized yet, I know it is late but that is the
>> reality, customers should see Kirkstone as a preview until then.
>
>
> While in principle I agree that we have not claimed that kirkstone is=20
> ready, it has not stopped some people from looking ahead into=20
> kirkstone and even master.
>
>
>>> In the past, Yocto migration was better aligned with the BSP=20
>>> migration and
>>> both would happen at about the same time every year. So, the new BSP=20
>>> would
>>> be available in the new Yocto branch and there was a choice of using=20
>>> an old
>>> branch with stable and feature-complete BSP, or a new, but unstable a=
nd
>>> initially incomplete branch. That provided extra freedom and=20
>>> flexibility
>>> to start completely from scratch in the new branch...
>>>
>>> That has changed a bit recently with 5.4 -> 5.10 migration happening =
in
>>> Dunfell couple of years ago. And this time around 5.10 -> 6.1 in=20
>>> Kirkstone.
>>> Both branches are Yocto LTS with many active users having some=20
>>> expectation
>>> of stability.
>>>
>>
>> Dunfell should use 5.10, Kirkstone should use the newer kernel, I don'=
t
>> see the need to support both kernels on Kirkstone, especially if it=20
>> will just
>> be temporary anyway. The juggling of both kernels during the=20
>> migration will
>> slow us down, better to move fast here to get Kirkstone users back up=20
>> and
>> running on the latest kernel.
>
> As we continue to keep master more in mind and up to date with things=20
> going forward, this topic will continue to come up.=C2=A0 We cannot jus=
t=20
> nuke what is working to get something new going.=C2=A0 I think the best=
=20
> approach would be to not break the previous kernel in favor of the new=20
> kernel. We need to figure out a way to support both during the=20
> transition.


This is transitory phase, I am not aware of any customer needing 5.10=20
and kirkstone.

Dont see any strong reason to keep this combination continued .

Till the transition completes including all features/overlays added ,

developers can still continue their work on pre merged commitsha and=20
start staging their work/posting them.



>
>>> In Dunfell, initial 5.10 recipe was added in mid-January 2021:
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D874ff0d7f9f31703e0a=
71a9f5d968051b77c2df0=20
>>>
>>>
>>> It broke things for many people and I suggested marking it to not be=20
>>> used
>>> as the default:
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D6496a0edeb8a84bfb1b=
9e13ec58814ea5babcde7=20
>>>
>>>
>>> Three months later, by mid-April 2021 the change was reverted and=20
>>> 5.10 got
>>> promoted to the default:
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D7793303e6c1543e5058=
bf1a7e83ea72f3a45c079=20
>>>
>>>
>>> Although I'd argue it was a bit too soon, as lots of DTBs/DTBOs=20
>>> still had to
>>> be removed from machine configs:
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D8b206b32ec181624b92=
9aa7f998f26ed99e140a7=20
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3Dfb0a0ddd25d4308152c=
e8243e00b444cbb5d565d=20
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D9ea50db095f91bad7c9=
b2f643347dc25be6e10dd=20
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3Dad28c5878171ef5b364=
f6bc9d8a5de514731964b=20
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3Dba0ddc5ae9ebf9777d3=
1283f272e4ed518e1f514=20
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D43bf0f36a3ac62cc337=
8688358ba704a27b501ce=20
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?id=3D8bdfe1413c00e0c5513=
2989dafcf8d91827999c3=20
>>>
>>>
>>>
>>>> Remove all non-upstream Device Tree Overlays. We could have=20
>>>> filtered them
>>>> out like as done in mainline and next testing. The issue would be=20
>>>> as they
>>>> are added back to 6.1 and upstream we would need to conditionally
>>>> re-enable each. Easier to get a clean start.
>>>
>>> I'd say we set DEFAULT_PREFERENCE =3D "-1" and, indeed, use automatic=
=20
>>> filtering
>>> of DT files similar to mainline/next recipes, until 6.1 mostly=20
>>> catches up and
>>> have majority of them integrated...
>>>
>>
>> Automatic filtering will not work, there are also DTBs that are not=20
>> overlays
>> that are not upstream either. In other cases DTB names have changed.=20
>> We would
>> need to maintain a list for each 5.10, 6.1, mainline, and next=20
>> kernels. That
>> multiplied by each MACHINE.
>>
>> Populating KERNEL_DEVICETREE based on what the kernel actually builds=20
>> seems
>> like the only reasonable solution today.
>>
>> Andrew
>
> The problem is that yocto supports the idea of multiple kernels, but=20
> has only a single KERNEL_DEVICETREE for a given platform.=C2=A0 And in=20
> addition to that issue, the KERNEL_DEVICETREE is used in a few recipes=20
> and so we cannot just move where this is defined into the kernel where=20
> it make sense.=C2=A0 We might need to think of a new way of handling th=
is=20
> that can solve the issue in the most flexible manner.
>
>

