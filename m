Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8060FD877E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:20:00 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77118.1773757190210587416
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 07:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AN2l3v23;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.64, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/Yt3DQk3JWGCj90jSe0SVKvkfxZ4Vc7SdDYK4BoZxrJPIa1LWkp+Wq5zuJYsxwdkll4CXMC/YFLFFbjhJkFp83wqjKr6UPp21gZ7ITKbc3En88hvQqE7Vu+BSWPar0PA/KsZ6jmLHKk2dBZgHvikKgpyVlz3hRnMriowK9eItek6xfeK3LGebL65zQjnp91dZPtIxDdReg86IkvQIllvh+M1Gs/Q8ljoZkZ6tRU4d097Akc0eS+cIOGE1ITS77KF7hVkln8dW2pdVxa3+vT3W2mmI2QHydIiBTcd3a9Dfy3iimsC30V4ZsWQI6FkG1wQOMM500cP7pcexB6GMdbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHVjMTtPleg3G2KzZi0oGHxrQ/5ykI7RNgtNmdKCKJE=;
 b=dnlJWVPXrPmJ5U0zepsG9Eysjz2zpVUJfr99gpRNwZcEHBg0sc1JAk8cX09iFceP6uvvovBRX3UOMzooZbsBwnBXduP6fxYDTeSdne5PqDkMmkrjBi3g8i74yCWr9PoB//16c7qkT1UOZNnue3ahHWgO01ePt3QkbX16Su1uoWe43V2i4V3wDjCZUhSnCOVL4/KkCc6dn4pPMRcDgzT0xk5oiqJ4B+pNveQovlWBXGh+JzypTS8X+OTbQ0LLTyf1toTYJAXs8/LUl2oypxuXwsXXJR4sPzNQAcT/h1+JIrq2pbFu9HOd/52VXP0niQ/ZBbwM+9hHWw5GC3emk26tXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHVjMTtPleg3G2KzZi0oGHxrQ/5ykI7RNgtNmdKCKJE=;
 b=AN2l3v23Kgq5jNwyiLJGCYPTMtRywk5D3PhTI3T0AxAjqH0PnJj/+5Ay8ngto0FX+ucCLQSvcHxsIE/ryioYRCPuSKTmwQkb01hZQYh+GJ00ZxzY2GzOb2vnHXmwHA4Cn5LFSPWk6CHXMGYskRqE62lfgjNHCfzW8nLUUBIcByE=
Received: from SJ0PR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:332::29)
 by IA1PR10MB5900.namprd10.prod.outlook.com (2603:10b6:208:3d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 14:19:47 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:332:cafe::a6) by SJ0PR05CA0084.outlook.office365.com
 (2603:10b6:a03:332::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Tue,
 17 Mar 2026 14:19:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Tue, 17 Mar 2026 14:19:46 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 09:19:44 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 09:19:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 09:19:44 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HEJikV2820686;
	Tue, 17 Mar 2026 09:19:44 -0500
Message-ID: <fb3b990a-85bf-4097-b921-9fc204871b61@ti.com>
Date: Tue, 17 Mar 2026 09:19:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer
 for PocketBeagle
To: Leon Anavi <leon.anavi@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260317133743.419092-1-leon.anavi@konsulko.com>
 <f15d818c-96cc-4b3e-bcde-bd618c7890b6@ti.com>
 <26f999c5-22b7-438e-b59b-294b3141915b@konsulko.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <26f999c5-22b7-438e-b59b-294b3141915b@konsulko.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|IA1PR10MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: d859551c-b5b5-4a9e-9fe7-08de84303deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QV9e8zdskBe0Fbokt+b3ojXZdxi92bE1afwyJMncg5mzee+5V11D1H7nPnTrl+C15ZMmFzhcn6/+l2z6Lbu1t6sxH3PlXalBwzscnmcDc8T8y1U06WSGNWvaHTSlsd769x6Qrtj0u2C4S6iKRbmI0lduBC0ouJnHx8A31urLnlcVFUNiGbU/7J8mJ9ADbToTpJOUCN8HdBhURpMkBiPReuAFeUOSL2sublrsVz596JZacRpPwYQ6Mv7qjP/d7Xktr9Ov2Pmg3+QtUFnp+O5R9z0Kjnux2kjJlHZm6F2UNSZF1buox66EpgaMimy+JhVeKjRCRjE5x1jYDDJNaLRSHYcnniPoB9RCEi/nis2l1PCRVVwEkAwERK/DfBl+7OcVIBuFvaRn3L0kMzR3dYubtvMvtGZcaWePjjCWJt2JNFSLtcUOoYewiHk5K0FsdRGtArc/By4XjDqApXaL7nkAuoXIaWlR5AeNEpORYx1sLkRyAeMIiuzuYKnf7YxAdq+Dbxa7ID8N8PvTgU59gYqpCdCWtqdCDC8oIJkTkyHl5DdsJp/F79otuuor2usIE6gtdL4D56hBkUgfcU3zQ7Al0oc41iIjxNtHG9CAszIteL7aN5xDi9JVnmuaLdPqj1OwScyLi5gmmJdnUN+tInQ9AH82KY2cedxjJTX2TX/if71xYFZ181lA1SrAsBPxbyTeV5ljldscO3u5QzmYc5d1e+/AVAoEXUnW39ck3aRNCio=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6cemOUB5Txe/lPa9+vrYqQnWrUNY/OimZZ4W8TRRyWkP//G8voLy7KHkHxwERYVIWVtkhdtQdmKhN+7muFpwoe2XetLtA1NhQsMzwe99R2UVIkDVK04F7O4YldFuHm2K2vy330ktFElKHhCHzCATC+bS5vX59VB/cywJIXvWoF0WUMX1P4W3wo8l4OEtyn+XHiLsQmbtBdAyQQiYFtY9ZFyLfsmOHOec/ETq/6qop/fzGttpQLRGZpTbx7PzDWgpkX2aRMB+6m4sJalN28umyqjlGKET+Yc89r1OPL6Ee+JHWCwER9YXPxfA1X3VxQzTjid/XNK4IW96kpmX8p5TzCT3xmdJWOVXJchyWMafGCVVjokCNREzrzaIIBi0mna4zq+tIMyA3ZOau3DMrgGKrPbs4kZdSYYDuJrFtE3hS68l0XlGplLKo1nDpmoTueLT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 14:19:46.4061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d859551c-b5b5-4a9e-9fe7-08de84303deb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5900
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 14:20:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19742



On 3/17/2026 9:16 AM, Leon Anavi wrote:
> Hi Ryan,
> 
> On 3/17/26 16:05, Ryan Eatmon wrote:
>> Is this for beaglebone or pocketbeagle?
> 
> This U-Boot patch is required to successfully boot PocketBeagle (version 
> 1). There is no separate machine in meta-ti/meta-beagle for it so as far 
> as I know we should use beaglebone because the configurations contain 
> appropriate Linux kernel device tree variant for PocketBeagle (version 1):
> https://git.yoctoproject.org/meta-ti/tree/meta-beagle/conf/machine/beaglebone.conf#n53

Gotcha.


> Best regards, Leon
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

