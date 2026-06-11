Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D611CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:07 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50389.1781195459006243114
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 09:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tdMt74gi;
 spf=pass (domain: ti.com, ip: 52.101.85.6, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4hyG56qDjJxR66orqk2EtZ/sgRRgf7LNNLU8PZZNhJTGzh6ZDzaJuqeyBq0v//9QC3dxNAkQ7bEsX0YjWEpoNtrVsCN73d3fYXgTuehSaEZ76NYXQDa9RXAOLMeL/KDc7rjy6Gc4yGTawwoepUg3P+va6mEjgdvA7RX5PIXc9/blLzw61yP5ni5FEaXLh61+1i/bqNikNcW+xafD2Cyv72MCItFxbrtdMss9KcnVa9/TKPE2KWqOlr5VLyE9o9AT76WbwIRI7764qGcAlQVUIhl7YZtPHzg/XKspxhzvVbbp00Hx/YHU+Np+6BLVh4IWFHx9I39CmHwbnOcdxuzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TAwCDbMe9xkd3pkjnit1mSm6E9goPHTjvnsmwP3cLU=;
 b=oOQFOWelFx0jPWs879/j5wdrmK+3UnsiEdU8709tPQ5DuroFhYk/hSidpCMs95wKerb3d2rkfXvrvVAZt2lKVSU4kt44fp0am2Mg/nQYOxH3SLvAlaYpQASicp89bY7b1IFWeL6qh+If+a5RL6hvzpTjMgOsTbk3QD6LAgIrWMT/VRBryVWamlKf4jtNoRf2qPkjZr35VZ27bjxEZmoIjVlogUU02YfX9P/Q/dIoqXQrDugQXS3zfDKTcLr7VYPuVzUxF0TOLRnbs5NBKeDhbZBNkcTAbLFQ5hWhR7Ieax6W9yfSsuPk8H21fbZgAqnl/zIbBxOmS/rZQAOxd6T7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TAwCDbMe9xkd3pkjnit1mSm6E9goPHTjvnsmwP3cLU=;
 b=tdMt74giUNAjTx7tC+Y9O5Ymhzrl+BNQdyiL4RQvkw6NMW95oMCET9kmFAP55qy6CtMXmyY5zbWZpgPP7g7lBZUy/Fg2vjVPp0XRe2uunaqR+SrDw5eS1USObERek8CK+8ikjc/llCh+rLLS83rMJULdWR2aVo+WPG8eLRjZ2vQ=
Received: from MN2PR20CA0059.namprd20.prod.outlook.com (2603:10b6:208:235::28)
 by IA1PR10MB5945.namprd10.prod.outlook.com (2603:10b6:208:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 16:30:56 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::1a) by MN2PR20CA0059.outlook.office365.com
 (2603:10b6:208:235::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 16:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 16:30:55 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 11:30:43 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 11:30:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 11:30:42 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65BGUg6Q1684956;
	Thu, 11 Jun 2026 11:30:42 -0500
Message-ID: <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
Date: Thu, 11 Jun 2026 11:30:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
 <20260611132320.GM23325@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260611132320.GM23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA1PR10MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b1fc81-3912-45f3-a918-08dec7d6cf88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|22082099003|18002099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	GcYCRQB1uXdw4a+f3zp7vxiv91veoqv8QnQ9cDrMzkXv0fsMo3IQ0GeMP+A9IgXAkMTFZcXT0VNojiuL702FiAQmQAYwkKrBIA1dZEr7MpgT0OfgDJS+TcDTV3Ua+dbNTEtWRfoZCusMn1fhw2M6SeohsMObHU0DmOCdIO0bYKs661YXNuGOkrEbQn7RR0iFFXBMv8W5aLbJOuLveNaD9q2fvMAc1ZfmnC+xxbhJSSJrcGXzlLaa7ViDDGGyex0/IvHCnfnaIT4WQFlJsyjUbyV0NiJzioj+qMvtll8UMUld596vYgM/jhekMvc/eYzKKsfHxwBmPH1av4SGZJamMDBpb00BsURMFO6RuzfqUfSPT61FrAI5rCl48cI5KqZMZC23/XJIXdUq2qWmd5fitlnexm08mUOCvmCIH3C9zSUnXLNe7OJX/GdfPGPMfuLF/8OVPbUnbDGuuhgxRtkEyvDiX8sY5DwS3jnTJQoO2xuKj+nf8fgF0Nu7ejTPKMMV5Im/GMRRsskAKiXY/wuDgW7ccmqvMtSY+SSusQTHg7+jm5gbbDpvEY03rpIYIdr5145UsqwBqDD6R1l45280hgci4ZupBr/HyEqKfWZr2zDEgsCqmlm6DC8hMJwHZuMxQwdYzvSeGRSS+hkhcEKrhNFksXyRkgoK7fvbYgrguvwyxl+FtC8IkVK+yKC5FRwzCP+gGbr2qqKmZB+Qkvyq7CdWdQWu908UXFAelDLHdUU=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bQmewiOd8dOAVQP57nrSW+J7Ogvt6R6w3MjivImvhpodbrkvLl8oyMaW55Xe8xoZZVyv7tAjp1X/mTxWC2UFSb0tIqyvHKXrPfnxtssos8ilASIgMAC7wAWj6zRVLerWyv8gF+nOWDpOA7/wmN8/xV6ugc7q1z7NGWzwjw8nlFEy3qiA2VgZl7QoH0HqDsVETm9h2KYtegTY8B/ZyErQQzT/+h8eqhWGjLWJWE1vULLywGPyz3OucdG3/OG6fZPFjcPFiP6d2XjqGmtoJ3ru6h2n/2luSP2zEMqk+9ggWc6Fha59tZhps4DHSktgB5aXqWklPpNQrsvS/wYIisGWeNOQrO7JUi2B4tu4UDxDGznMQjLtvLXOpTNUsdVkWEA3/Nxo+MFgj+rVO9f4F40+ZlbVTH3OogtpSIYFlaL/ctuSUcqY1CFi2ETVQRQFWens
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:30:55.0693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b1fc81-3912-45f3-a918-08dec7d6cf88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5945
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 16:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20031


On 6/11/26 8:23 AM, Denys Dmytriyenko wrote:
> On Wed, Jun 10, 2026 at 09:17:37PM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>>
>> On 6/10/2026 5:58 PM, Antonios Christidis wrote:
>>> Dear Ryan Denys,
>>>
>>>
>>> Let me know your thoughts on the overall patch. I am particularly
>>> interested on your opinions on the following change:
>>>
>>> On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wrot=
e:
>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>> So... I think what this does is establish the pattern for which
>> version it will match to.  And then from that pattern it will pick
>> the highest version.
>>
>> So for ALL 6_18 builds it will probably choose 25 and never 24.
>> Which is not what you want.
>>
>> ... I think ...
>>
>> We have never tried to mix versions like this in the past, so I'm
>> not 100% sure what the best course is.
>>
>> Likely a mixture of the override based on machine needs to be in
>> there. And for that I'm thinking you might need an extra variable.
>>
>> BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
>> BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
>> BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
>> etc...
>>
>> BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18}"
>>
>>
>> Something along those lines?  That would be the most clear for
>> people to follow as well.
> It was done differently in this patch:
>
> mesa-pvr 24 was maked compatible only with SGX platforms, while mesa-pvr =
25
> was marked compatible with the rest of the platforms. Also not ideal thou=
gh.
>
I think Ryan's idea is easier to follow, compared to the flow I have=20
included in this series.

Another way of going about this (I'm not saying this is easier and/or a=20
better method) would be to create 2 MACHINEOVERIDES.=C2=A0On a per platform=
=20
level (ex: am62pxx.inc) to add ```MACHINEOVERRIDES =3D. "rogue-core:"```,=20
then within ti-bsp ```BSP_MESA_PVR_VERSION:bsp-ti-6_18:rogue-core =3D=20
"25%"``` picking the right version when paired against a sgx-core override.

An added benefit to this, the new overrides would cut down on the need=20
for duplicate variables tracking Rogue vs SGX (examples:=20
BSP_SGX_DRIVER_VERSION, BSP_ROGUE_DRIVER_VERSION).

A downside to this flow, tracking what is currently included=20
within=C2=A0MACHINEOVERRIDES , describing what architecture of GPU core=20
doesn't really fit well with pre-existing overrides.


Let me know what you think?

>>> I wish there was a way to use syntax like
>>> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
>>> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logic ?
>>>
>>> Also already aware of the extra ":" post-pended to the variable, I
>>> can send a v3 if that's all the feedback.
>>>
>>>
>>> Kind Regards,
>>>
>>> Antonios
>>>

