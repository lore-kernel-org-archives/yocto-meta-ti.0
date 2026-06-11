Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A20CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 18:29:32 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53489.1781202565280381693
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 11:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JUe65dZT;
 spf=pass (domain: ti.com, ip: 40.107.200.59, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiNMkt/8s6Ut1y+lmRZNiNatBSbL83AXCcU9v0+qKAyYY0rRD+asbw9/34bUoRJszhxqLoriGkCUZnItr+bzka3+AQgrPLCalcbaZIt/8g0V7smNL72DoECBiedXALuawqSiMDRLuWLsFIvp1on0qV2CGV4vxAty2njoj7nnvpf9xhVsyyoycqqYzRvYAxA9ipt8UXtada4fm+eH21LOOh3jZ9GrOuwHy2AP7xqi1oohfH9v/dYOksRqPFgPq5sCh2u2GNf3aPKaEApsf5Q4tWl+GBmV0MajL61zaw3YpsGu5YiomEv9Lgr5QVAAmfJGYfAHBu2EWaTyJNp7Gh/eLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyFzyg8V40XbW2sCLt3v4fmuBmPVNkMx7UaIhkkI1nQ=;
 b=D5v+sUhaM1BPIGpiefP7GYC/EP0IWHhbqJN4Nzr11q3N9vTOMDWjQfNiNc3wH+4o7U1h82PaPTbAxACPvP0fcE+ZuiS+lHRMTz42uQht06tHnzt05T+HdjAnG6oC/y9SHjX2c7WrL9jqMrM0oB411RLIDSaeCu6+nO9T/BJOPZs+yMwINfTzOVGZTlrgX6/P5uQ8P7/H/rzAdbMZvaWNvGfsdywR6RoKT2Xen3cts8Ttb25GUrAzS5W9YT/WNo47Gvp8UKXc0PfQNy54PsSNs30Uy5mOJM4scrRcdWZd3AFv3q40v//8ZqKrq1Akk1MaE6wp623yLKTuVEiBwdeLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyFzyg8V40XbW2sCLt3v4fmuBmPVNkMx7UaIhkkI1nQ=;
 b=JUe65dZTlACWfzqRkXhP0WmTzi5d2/W2cdbnOo7HGmHYCtw7aVFk+h1fKz7ZDPJ09q+Ka3EQHyP1YSYF0gr5LHdMGH8ZdXbZW+bvu8C13NwVe0oFZherbMLKsouotlRt2u2ktUEGamAnv/cx0ntuQPjuWlmUY5Ux7XtuTkq+49Y=
Received: from PH7PR17CA0036.namprd17.prod.outlook.com (2603:10b6:510:323::20)
 by IA1PR10MB7358.namprd10.prod.outlook.com (2603:10b6:208:3fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 18:29:22 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:323:cafe::78) by PH7PR17CA0036.outlook.office365.com
 (2603:10b6:510:323::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Thu,
 11 Jun 2026 18:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Thu, 11 Jun 2026 18:29:20 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 13:29:19 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 13:29:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 13:29:19 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65BITJ252425280;
	Thu, 11 Jun 2026 13:29:19 -0500
Message-ID: <d8d45aba-0b65-4ebe-ae7f-c9c0a1b7c5e4@ti.com>
Date: Thu, 11 Jun 2026 13:29:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
 <20260611132320.GM23325@denix.org>
 <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
 <20260611165057.GR23325@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260611165057.GR23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|IA1PR10MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 813e8fbe-0378-46b3-4617-08dec7e75ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	SmeNEcTTLnJHqyQlK6CZ/NhZBKIVZbUUSDVh5W6TUxl+thJUnqTrGK44JviJAySBxfZ9fa3xTo84KzxNRZeLpT8sRjY2HfBnq+2lEcQXoQRbQp68SoYJfmSSsbQE3EMMF07+VmKxm+L5vcmZ8A0h8I4jEweXtHktyw7RsXY6fBnhSlM/kA2+sjnMMgwlCnfMRpcLXrf4BU9/NcyqXt4BhJAuLPPNzWTLwDPbFsMJci3AZBU86zR1V1SCXQiLcc/6E3ALKOaRnG+ft5CBql/ZpRFBXn6rsaJTH8O8G0EB+6j0IWqQB6GpKMo0JXlgyvLQmG9kQN1PuF7fpgzrQgycmayu287WB7UHKfVLOjpEfPBmmTOqLeALLTT+Uab5orFCdM+mKTnrCP1+OINJjSwKR6G18dvYbkrmia1Va/7JnVDjjS8GvML6s2Z/Ut4U7Cw6E052wckL3AvZ9LGZKfUJi4ARJdSzBB/SJZFAWGtRKBcgFrqy9fpBPYCAm4WPws8deM+Gum9jwB/HTWhfnnj+tcGOZDVN6aozywz8n2ng637dE056mThBjSeisXf0XvoJOkLk+O/rMoF4fODF09udSDuBM502ob9BVZvraFUsMRP3QI8nyxKXSvXeDR8BBpwolSaClv2XBqHQp/W+OOpsO9qREHdR0ulen2jmbq2JFJ1k0pW5GeYdjK0fqbW+ueUIOdxkapXeCTEMGMDidORnRnIaEaMCr68CVYd1tDxMk4U=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dMcwJMkEpFAA9t0IkJW52kZFdMNgZgOMucFzMsuUbHjtRYeoCyOo9S1SWZ78AN0Yv2HjpD3BBvFzzkyxA4B4jlJtVIrGKMZki5pvaPbECwRW2wJZoFYKiUp/YEKOuG/eH9KLrkrqmShXBq3ysIxd+XDdmubzKepS6IjVR5AJ/HNoq/F3i5PENj7b/HNgyPqO6vJxtAYb1l02RhqhhfWcM2aH6oCgUHCS91rkUV0etEIeG9CEaDOSHm8diRRHLYBUbOIjCQid09QVNCExA0JD/pTq9jChR51Ou42DeuK6qINBl8wjWxYQ2PqM1nh7d3cUdfQZwnyELE6jw2zi28GJ8yBGCrmvg0kCcP+uinp+t/jw2jlcIQi0cv1rmzZjSqXlmgv2G0lq11OscTljmOXALkHF+PrgW7Uwu0VbZELw6I4KKOshnQFwmDTcXH7tTTeB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:29:20.5722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 813e8fbe-0378-46b3-4617-08dec7e75ac0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7358
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 18:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20033


On 6/11/26 11:50 AM, Denys Dmytriyenko wrote:
> On Thu, Jun 11, 2026 at 11:30:42AM -0500, Antonios Christidis via lists.y=
octoproject.org wrote:
>> On 6/11/26 8:23 AM, Denys Dmytriyenko wrote:
>>> On Wed, Jun 10, 2026 at 09:17:37PM -0500, Ryan Eatmon via lists.yoctopr=
oject.org wrote:
>>>> On 6/10/2026 5:58 PM, Antonios Christidis wrote:
>>>>> Dear Ryan Denys,
>>>>>
>>>>>
>>>>> Let me know your thoughts on the overall patch. I am particularly
>>>>> interested on your opinions on the following change:
>>>>>
>>>>> On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wr=
ote:
>>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>>>> So... I think what this does is establish the pattern for which
>>>> version it will match to.  And then from that pattern it will pick
>>>> the highest version.
>>>>
>>>> So for ALL 6_18 builds it will probably choose 25 and never 24.
>>>> Which is not what you want.
>>>>
>>>> ... I think ...
>>>>
>>>> We have never tried to mix versions like this in the past, so I'm
>>>> not 100% sure what the best course is.
>>>>
>>>> Likely a mixture of the override based on machine needs to be in
>>>> there. And for that I'm thinking you might need an extra variable.
>>>>
>>>> BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
>>>> BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
>>>> BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
>>>> etc...
>>>>
>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18}"
>>>>
>>>>
>>>> Something along those lines?  That would be the most clear for
>>>> people to follow as well.
>>> It was done differently in this patch:
>>>
>>> mesa-pvr 24 was maked compatible only with SGX platforms, while mesa-pv=
r 25
>>> was marked compatible with the rest of the platforms. Also not ideal th=
ough.
>>>
>> I think Ryan's idea is easier to follow, compared to the flow I have
>> included in this series.
>>
>> Another way of going about this (I'm not saying this is easier
>> and/or a better method) would be to create 2 MACHINEOVERIDES.=C2=A0On a
>> per platform level (ex: am62pxx.inc) to add ```MACHINEOVERRIDES =3D.
>> "rogue-core:"```, then within ti-bsp
>> ```BSP_MESA_PVR_VERSION:bsp-ti-6_18:rogue-core =3D "25%"``` picking
>> the right version when paired against a sgx-core override.
>>
>> An added benefit to this, the new overrides would cut down on the
>> need for duplicate variables tracking Rogue vs SGX (examples:
>> BSP_SGX_DRIVER_VERSION, BSP_ROGUE_DRIVER_VERSION).
>>
>> A downside to this flow, tracking what is currently included
>> within=C2=A0MACHINEOVERRIDES , describing what architecture of GPU core
>> doesn't really fit well with pre-existing overrides.
>>
>>
>> Let me know what you think?
> FWIW, we used to have separate "sgx" and "rogue" flags in MACHINE_FEATURE=
S
> years ago. Not exactly MACHINEOVERRIDES, but still easy to do conditional=
s.
>
> But complaints were that all this needs to be unified and, first, both of
> those flags were merged into "gpu" MACHINE_FEATURES and eventually comple=
tely
> removed.
>
> So, I'd argue if you do want to bump mesa-pvr version, it has to be done =
for
> all the platforms regardless of the graphics core, SGX or Rogue. We've al=
ready
> went through a lengthy period in kirkstone (2022 era) where SGX was compl=
etely
> broken and customers were sent back to use dunfell (2020 era) just to get=
 SGX
> working at all...
>
I see, if the desired way is to migrate both cores=C2=A0 at the same time,=
=20
then this would cause a big delay. Since migration for SGX cores from=20
v24 to v26 is substantially more effort and can take weeks (as IMG=20
provides no support). That being said, I have already planned for such=20
effort, but that is later down the year when a legacy SDK release could=20
happen.

I think its still worth the effort to migrate for mesa only for Rogue,=20
especially when mesa-pvr v24 is staying around and can be used by SGX=20
devices. Also worth a note, SGX devices are legacy and have not received=20
a official 12.x release - so if any customer wants to use the latest=20
SDKs for such devices they would have to go back to Scarthgap 11.x SDKs.=20
So if this series or some different revision does get merged, the latest=20
official SDK for such devices will not be changed.

Regarding the point of SGX and Rogue being unified, this might also be a=20
good point to start making distinctions and branching the two cores, as=20
the overall drivers and supporting software like Mesa are drastically=20
different for the two stacks.

>>>>> I wish there was a way to use syntax like
>>>>> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
>>>>> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logic ?
>>>>>
>>>>> Also already aware of the extra ":" post-pended to the variable, I
>>>>> can send a v3 if that's all the feedback.
>>>>>
>>>>>
>>>>> Kind Regards,
>>>>>
>>>>> Antonios
>>>>>

