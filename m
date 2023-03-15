Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18DBC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 17:55:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.293.1678902920655079032
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 10:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xM7cm4FO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32FHtGPk059111;
	Wed, 15 Mar 2023 12:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678902916;
	bh=p1+KJUu/JTfSb9IHnlpH3FMiuRb6EFsjE6NfXwNnclo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xM7cm4FOIXP+7MSu3IxCHQCZv4l0nx5rV/j/xyadZCDGb8Z7rYJ8YJV7elJaAsEca
	 FD88J6IMoHsxbgLlpFzV4w/NmXaTBFPaHjJVG0JSNQg+EQ9i5q0H+iORBHaOR8KfdV
	 b2kr691Z9RLuaDRBzxeQD9omHX+DrMvDjPjR5UEE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32FHtGdL120451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Mar 2023 12:55:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Mar 2023 12:55:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Mar 2023 12:55:16 -0500
Received: from [10.249.34.133] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32FHtFii004335;
	Wed, 15 Mar 2023 12:55:16 -0500
Message-ID: <0f39908e-65a8-2fe2-48ad-5c873a0cf6e0@ti.com>
Date: Wed, 15 Mar 2023 12:55:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] linux-ti-staging: Add 6.1
 recipe
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, "Bajjuri, Praneeth" <praneeth@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230314162027.28974-1-afd@ti.com>
 <f744c42c-7678-a43a-4dd7-c7323ec3236d@ti.com>
 <5a346fe0-c71a-155f-3d60-fe28d05d9929@ti.com>
 <20230314195250.GA18050@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230314195250.GA18050@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 32FHtGPk059111
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Mar 2023 17:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15982

On 3/14/23 2:52 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 14, 2023 at 11:46:23AM -0500, Bajjuri, Praneeth wrote:
>> On 3/14/2023 11:37 AM, Ryan Eatmon wrote:
>>>
>>> Is there a better way of adding 6.1 without destroying the 5.10
>>> support?  =C2=A0Because until we have 6.1 up and working it would be
>>> nice to have a working kirkstone for anyone using it...
>>
>> Want to hear from denys as well based on past migration history.
>>
>> IMO, there was a window during early migration at 5.10 phase where
>> we limited features to get the initial baseline ready and added
>> overlays over the time when kernel added the same.
>=20
> Yes, this will be a major regression for existing customers using meta-=
ti
> on Kirkstone!
>=20

Kirkstone is not productized yet, I know it is late but that is the
reality, customers should see Kirkstone as a preview until then.

> In the past, Yocto migration was better aligned with the BSP migration =
and
> both would happen at about the same time every year. So, the new BSP wo=
uld
> be available in the new Yocto branch and there was a choice of using an=
 old
> branch with stable and feature-complete BSP, or a new, but unstable and
> initially incomplete branch. That provided extra freedom and flexibilit=
y
> to start completely from scratch in the new branch...
>=20
> That has changed a bit recently with 5.4 -> 5.10 migration happening in
> Dunfell couple of years ago. And this time around 5.10 -> 6.1 in Kirkst=
one.
> Both branches are Yocto LTS with many active users having some expectat=
ion
> of stability.
>=20

Dunfell should use 5.10, Kirkstone should use the newer kernel, I don't
see the need to support both kernels on Kirkstone, especially if it will =
just
be temporary anyway. The juggling of both kernels during the migration wi=
ll
slow us down, better to move fast here to get Kirkstone users back up and
running on the latest kernel.

> In Dunfell, initial 5.10 recipe was added in mid-January 2021:
> https://git.yoctoproject.org/meta-ti/commit/?id=3D874ff0d7f9f31703e0a71=
a9f5d968051b77c2df0
>=20
> It broke things for many people and I suggested marking it to not be us=
ed
> as the default:
> https://git.yoctoproject.org/meta-ti/commit/?id=3D6496a0edeb8a84bfb1b9e=
13ec58814ea5babcde7
>=20
> Three months later, by mid-April 2021 the change was reverted and 5.10 =
got
> promoted to the default:
> https://git.yoctoproject.org/meta-ti/commit/?id=3D7793303e6c1543e5058bf=
1a7e83ea72f3a45c079
>=20
> Although I'd argue it was a bit too soon, as lots of DTBs/DTBOs still h=
ad to
> be removed from machine configs:
> https://git.yoctoproject.org/meta-ti/commit/?id=3D8b206b32ec181624b929a=
a7f998f26ed99e140a7
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dfb0a0ddd25d4308152ce8=
243e00b444cbb5d565d
> https://git.yoctoproject.org/meta-ti/commit/?id=3D9ea50db095f91bad7c9b2=
f643347dc25be6e10dd
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dad28c5878171ef5b364f6=
bc9d8a5de514731964b
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dba0ddc5ae9ebf9777d312=
83f272e4ed518e1f514
> https://git.yoctoproject.org/meta-ti/commit/?id=3D43bf0f36a3ac62cc33786=
88358ba704a27b501ce
> https://git.yoctoproject.org/meta-ti/commit/?id=3D8bdfe1413c00e0c551329=
89dafcf8d91827999c3
>=20
>=20
>> Remove all non-upstream Device Tree Overlays. We could have filtered t=
hem
>> out like as done in mainline and next testing. The issue would be as t=
hey
>> are added back to 6.1 and upstream we would need to conditionally
>> re-enable each. Easier to get a clean start.
>=20
> I'd say we set DEFAULT_PREFERENCE =3D "-1" and, indeed, use automatic f=
iltering
> of DT files similar to mainline/next recipes, until 6.1 mostly catches =
up and
> have majority of them integrated...
>=20

Automatic filtering will not work, there are also DTBs that are not overl=
ays
that are not upstream either. In other cases DTB names have changed. We w=
ould
need to maintain a list for each 5.10, 6.1, mainline, and next kernels. T=
hat
multiplied by each MACHINE.

Populating KERNEL_DEVICETREE based on what the kernel actually builds see=
ms
like the only reasonable solution today.

Andrew

