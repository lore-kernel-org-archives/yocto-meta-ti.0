Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12B9FED9E6
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 15:26:21 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78793.1773761173960234890
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 08:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=RoOqo59y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.33, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJlx8EtYKDiUnV5G1NCR/s0D1q76rwT11/kWRyqudrcmg6aiuJHLjpPkkGHUzKgkO8MYznK7/un8UsK63Zrpcol9cODOQWGpSrC9+p+mPFPGEsl41NJY6uNMXr+7SHXt/yti7XdREYedm9j7KpcV6zhEBDAX8x0q6nABel+LwSc+wp7htfgtd15neDTsw/a4l5Z4Sa4fMo8hx5DXxtnIA2WvNNgax+FoUQT91OVseN+5GZFpAJTJPvHsa6ZrrRGtvoo4akZdsV9wFNKGjwdTogLFRSG462LhVeunCyW3fNIcZqoq9TwXHL5JQZm4eHEwysWeMunLkfyINFl+siDOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1m2/GVNgTHWRtPkjiRu+0163MzOESpZjCFkjuqW1wM=;
 b=gKbC2OPC9qLRTcrtdi3wdGW2mfDkvknc5WoMEAhQnhEWwZGyOdA3PUzBkbfgUUQWca0j8o52xJmZQQKEEi0G79vxRnvpuq4Awd9bNRdjkK0XRZkktixZ3I0z49KnCq8AjvRfqIEVoPU9SV09kCmk3bChHZ4W67jR8kzq2dkLQ1n3zXbppqGaLhePvh6CP8w4fg/6ReEtd3058k2BM1MRyujDCo+8WpUSPtCY07MYvnG9RgLiA6HW1/iBqlX2cGFY7HeP3ytt52T6dq8snvcZK5iTpfh9NzBXa13NQ3QhTWmuaI1SOESrggptrk++BytTe12FjkIkagleQzxabnZ/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1m2/GVNgTHWRtPkjiRu+0163MzOESpZjCFkjuqW1wM=;
 b=RoOqo59yT+RiDGHyaQ5C4SbFVhNzNwehJ2+QAgQryjHhD91XLpU2cZGpBEmbxhCrhF9hJzQ7wnZBxvMlHeEIxp0szNAYIoGJK4oYU28Ped3lDIrdNyv56BP4ygYHq/fNUyQ3UH7+VFnOpVOTfl+28ejkOnBGY902wuOY2FdCOgY=
Received: from PH7PR13CA0001.namprd13.prod.outlook.com (2603:10b6:510:174::7)
 by DS7PR10MB5104.namprd10.prod.outlook.com (2603:10b6:5:3a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 15:26:11 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::d5) by PH7PR13CA0001.outlook.office365.com
 (2603:10b6:510:174::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 15:26:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 15:26:09 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 10:25:44 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 10:25:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 10:25:43 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HFPhgg3404552;
	Tue, 17 Mar 2026 10:25:43 -0500
Message-ID: <695f5ebd-dfb4-46ce-8e48-a9b8f0ebe823@ti.com>
Date: Tue, 17 Mar 2026 10:25:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 0/2] Some overlay updates
To: Judith Mendez <jm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260316221815.2502448-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS7PR10MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd8c97d-b6eb-40a2-83c3-08de84398403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3y1+EZ04l+rZWoSzVgHe5AX0uWrTS27P5UvtXG6o9aK65InhvYcHrKRh/11rRpoAJHqtIHV3P+sFMgFE5uPgdUm/MKD6vHXU0kFyF7qeT3Wbg5PD9lUnvaPle7a5+vQaHAolcZ7SKVukfn2oGTYzEoC2CLakss36ZN2bAouhSI/Nd7pWtBxz2kqBKR8mwaAohiz07tbCW/r+KrG4g+C/GKTPy8YCiWozBtJjb5kZ9hwXSG+ILyK+jV+GAYyO+3mW1uXgmja1dumIzd4ghFAI6TC1bIcSnEQqx12n6/k/upvWtMcd0yGxCD/NaRHi2vn64xVIYuiUjj9sy81tvfWSIAY4VvdSfnHvA9mq6a+zTCoCWoXrzeUEMkjegAnqHyepyzX83xaLc4Ch9vwT2MplYalvLMsZQiKsI+jA02icDnQzQYY32Dq2yw7mMS3kUYOU4O0mLfwbHEIn4enx9ymmt+UtOxMwVZuV/b1n0ETIshO2pdnpXjVnQD2Ntb869hD1E6TWdFqvMLUgPOXghpYILudjE7sIR/sjDDR6IhYEyXSVIGOfIhSdDkVqoUsuSmVRRMSJ9os7Bx16Eov+6d86KOHB+rD12cFDn6rfuA/P7Q+C9A+brsBKhvWszO6PnhtZ0nT+3bK/6Dk13vqK0hPOH0XoHJn16NHlrB87ry3Bty6MZES9xXGZXVluuLFzVRZ8v+j7jSXP02jcR/Is2CeoGi5WFuTpa1QSOzT0i8PYEC1ex+2nJLfThRaQobP1OGm7gFQLeIQCbJEIXTTMdPCf5w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9P25udE6MmpVEQ7jr/pFwtEKDbhCq2h43T8kzCPqa/do25RTZPEbnapNjsAuRgZM0eEB7OIOHRU/nLroNvz/5cJE+zGtmnPNdWTmZstyelmjDX4q+EBYKKV3mQEYzXkhP+eseO3wFRxpQQlXhHs2P1cVyGiBebm6iRMtFCv6aI8zqAvzqaRUOh7m85bJduxIBApyKrAgzF2xupjsPk8Gq2DIYoB8ab5WFpgaWWt7JoEzqXFgjMcGAW1xzy8krvXju331C15+M/f7HnYrNm0KHpPvln3qjmW8gPiNpTOsgm5EIiPYjGLXtxguL/DHnnieVwckqEBB9S16LOL3LHXuEZJtn5vf7tGKJ0mwWw+yw/XhM3VU/sbJD39vLVPdUQkVkBnrNnQWVrjCW3hQu6lmWWDJcr4L+4/f+He7fnKf7V/Vy+UjnTqZhZmn8nLg6L07
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:26:09.4049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd8c97d-b6eb-40a2-83c3-08de84398403
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5104
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 15:26:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19743


I won't make you resend this, but you tagged this as [meta-arago] and 
sent it to the meta-ti list.   What that in the future, please.


On 3/16/2026 5:18 PM, Judith Mendez wrote:
> There have been overlay changes in TI Linux 6.18 branch,
> this patch series updates KERNEL_DEVICETREE_PREFIX for AM62A and
> AM62 LP SK boards appropriately.
> 
> Judith Mendez (2):
>    conf: machine: am62a: Fix overlays in KERNEL_DEVICETREE_PREFIX
>    conf: machine: am62-lp: Package ECAP Capture overlay
> 
>   meta-ti-bsp/conf/machine/am62axx-evm.conf   | 8 +++++++-
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

