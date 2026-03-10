Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A04BFD2D90
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:41:18 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40223.1773150071454249115
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 06:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fBDBqI6L;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRtIDiwPWkEgCOJF436gpl13QYLDtmv02PUYD6JT5+H6nXyRRDWFJiKGjM448+fM1GgDFJz17d0c56mgbMBl2PXUFhTx7Rr4BL4zGmc+4zoQXMzetkQ8tbCLuC410JlEACfZ58dGn4jrQ3sHIsUSOs4NismRYTbVs32k7oVo1En8mSiwWmiYliRyuMjnZQpsN533+OURP2XWNASBwxYDOH7328LwbyCLIB0xVwvvmw0uLRVjlnr1mHKscJbLrw8QSRmQmTwQ32qaY5TBvzU0phcx6p7ZOWndaJuAirJeMVt8wRaAWw7tTv1dyZji5hTXaM4OZ4OgXVbQJ+9qBD4vmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b36JhB19P+H7mK865oACiM9w6lSSYQ2yKlueVwtV3TY=;
 b=jjjLwg/PaATurTEeJY5YxuCvz5mtI9BHgDSoEWKvjALV8zilR+kjV5CSbINK8QETH1bQWoLkIYw3YeDh1O4ohSun/S690rqisxgxeEwYsd/1xWrnvCI+mJpLH5TE8L+iksy/1H69Jeejwrqa7P2+nSTBfjgGcGkP/RZcz2qqvkwQ2nOWui78Ehlo/oCx8ruzP/Clb7+tZZTZzlYrBS1kfbRXL9YfUgm/sorLaN2Y2y7sxwa+U++hZKXw1ZO4OZ4EDb/EKRiAMkfif1AhgvMUB5REfBkoBaYzte5/RhkJYpssIyCgvEVLGe/eUUlgdwd0a1YkSFAZF9Zd6v8yL6kwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b36JhB19P+H7mK865oACiM9w6lSSYQ2yKlueVwtV3TY=;
 b=fBDBqI6LZLYwHTa8d2jetjzS+tORWo//LjHObEdraHMKti5t3M5EypBfzzjCR++HeZ3JbDEBIZ6XpCG9beO5SkmwuEdEQNlOeComzzonqp6Fm9GlgcClh4wojzb+3gTMCpvS5MDaUiRnjRzRZSAJzVByfWjEQrEsi1SroW+t5H0=
Received: from CH0PR03CA0316.namprd03.prod.outlook.com (2603:10b6:610:118::23)
 by LV3PR10MB7820.namprd10.prod.outlook.com (2603:10b6:408:1b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 13:41:09 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::58) by CH0PR03CA0316.outlook.office365.com
 (2603:10b6:610:118::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 13:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 13:41:08 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 08:41:04 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 08:41:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 08:41:04 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ADf4v12644911;
	Tue, 10 Mar 2026 08:41:04 -0500
Message-ID: <369c91a0-3bb5-44c8-b47b-1943a4bce01d@ti.com>
Date: Tue, 10 Mar 2026 08:41:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid
 TMPDIR in debug paths
To: Wadim Egorov <w.egorov@phytec.de>, <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>
References: <1894FF9E1031E4F3.219417@lists.yoctoproject.org>
 <3bd1e7cb-f438-4aa9-99cf-52430b758eea@phytec.de>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <3bd1e7cb-f438-4aa9-99cf-52430b758eea@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|LV3PR10MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 70aabc93-bc93-4953-e604-08de7eaaaf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099002;
X-Microsoft-Antispam-Message-Info: 
	gjGjTLmXbWDgwrjDT+BPC/5gHDSpak7j1PYIyodMvqgOLe/HNJZGdNOLd24Cmt8v51n1exnF3+zVfskbeUWMu6c8Rv0ees3pCyCrF4DxZLQmTGf/QB3pM80VEjL8B8p4Ml3uCJjPr2w1n6VIcq1/Hy03NsY+/uISNcVTSX4+OIMpI3caqXlECcIVS/krm3TAGM70eI+rlF+YvKTXPIaL+gdOkA45Y/EWcMcn56rD6rCPPKr3lr+HbDaQYi/MpTTDGwAc6M1ctSod7+twdYEM49ZE666GAitZ7vq7ZZm9OFUTFo6ecosNhAWwWCJ8b/UFlABhAbIdxFspfXJy0rXJfPsT85Tek+kUiv9MsX29NF3xmg5Nu/i9IdgRxSVrh8ThQxdAiFNR4045JmfIo0l/TjWIn6v5hmHnp0u1mT7o/y2zYeAFD3OpESR2EwLeKckQ0jACaP2whyvuaOYJ4IitOQjcHCw5e4U2YZHBqtH8zQwHUIdSYUWDYWyb0NF/IW6e0sM3f+AXbA0n1WTldcbka/a+/Um8tFFl2Xn5Mj6JjHW/7A7YmfduOW8r371IHZNPDXMHBxPs0E6JKwYm+l1Gk3ZLFzWRnFY5e3bg1jVEmJPoArhYVplOwOyB4s/ykEHnnoEMiUzfTy/+9LMxN3X5saVxblsix8SMpWV36TgN5Urdf4+6NrAmYOsRTDCMGtw7JgwSZoWrlNUoTbWIE0IsBj2nXcf/NnfpwxzTLFTHBnf3N8RLNwvqhpTGkOyvolpRwrmUUReB90VqCCJadlE8zQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MtGanorKGI1Z80vdZDyuCS9QoNnq5esclLItvi2wdcUUlzFRcjO+eTb8wnCSkxbq/Wgn/iE66sZosh3ICz9uRFTylvWFX3FRFMWzfdBAK+SV0VAdSVQ7m1bKpGa1JiG6SWB80k0TM/BDA5BpWBOgE0DKJkNJbElqrA5YwWw0YK7Her8/i7h/+YOApTOc1cPkTSMEsAf9TpQENQrdBl/swdAAbHA8E/quMVGdzkKaO7OXqFT9xesqTwc4ClpSXNid+fsbkbGZI3cM+80wplteqqOcGRSX+SJgnUivZ/IojXrI1tcQ2VP7LxO9R/1CDp0lvTQzMxR5Izyv8Og5+3MFbeY4e4cw5wgWGhXRbq4EYbTaze92lvH3YyzWWPbQpEiTpM/54SgyneNI25ZHmWZUGPwgsSLfcLt1MF+jJHpNhHx8e4z2xFmzx9r8aQ8yhz8x
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:41:08.8004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70aabc93-bc93-4953-e604-08de7eaaaf9c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7820
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 13:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19689



On 3/10/2026 4:49 AM, Wadim Egorov wrote:
> 
> 
> On 2/17/26 10:46 AM, Wadim Egorov via lists.yoctoproject.org wrote:
>> Build module with KBUILD_OUTPUT to avoid TMPDIR in debug info
>> (buildpaths QA). Also bump SRCREV to include upstream path/prefix-map fixes.
>>
>> Fixes the following warning:
>>
>> WARNING: ti-img-rogue-driver-25.2.6850647-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.12.57-g7af20799-g7af207992070/updates/.debug/pvrsrvkm.ko in package ti-img-rogue-driver-dbg contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> 
> 
> Anything missing for this patch to be applied on scarthgap?

Sorry.  We have been hyper focused on master since it is set to become 
wrynose in a couple of months and the basis for our releases going 
forward.  I'll get this tested and released today.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

