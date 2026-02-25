Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F077F55438
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 01:39:48 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36584.1771983586209892612
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 17:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=EktWNLJu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.12, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnIUNrbWFaqkTgDbvgGxt7BocaftcLWgfXZEAK060aOYtBVFF+wmLf8mX6WmIzx8tU1Haj0WiMysAulEPhrl8Oc2JV905xGtUVSDuDT3ErwkKcJastz/j7StgJouBprxt3sNmg1Xjg8NQCGPTpaEiRgsSVrMwDKFcY9Jre7QEvQuIV7Pd3NTCF4JzefQ6g6wcJOjRYvp/BowyBO4FMRARtNT8a8xNThz6g07mjPEVPJPahnClrXQ4kLrYO77R1SF3QO3QD9oHOEyl7QjYgRHQJAtE1ygvTyP3BWnbeBCaXJkxGOWMQHxt1ofGl9Ye457t81ArJ0IGf3WqaKmrQK23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C2z7RdlA1nGM21nXu2NBSNANnCLg2brf35+eocymHM=;
 b=AtMXURK50WFBN+yrxKtecwNIkOCpS5C68kd0FZwW9Fbzj2pXj6u/vGdGh8JOl9zNd+L8QDcnbH8mt0qYK2kLS8QwZLCFSt/MqdjcxYOgBDZofanpJPomGRW0kA/We3GW4yGRPXTnZU+wCYbLzP9rURDXnzy5YDZv2BBFasGIPddlH810wNKhUj6MxMTpRmFA62XO+SDP62DiK6+tgOAuPhHv/KzbsVdm522kb0bMNxEV1pYKVhpL11VaRWtudkPe3CjtU5iYLhyx8Q47JEs9U4AHQNoWDTcqRovuFymnmHz/YV7P6XXhRIj7muFdNiw1hCEkROu0KiNlwBYkzb/GMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2C2z7RdlA1nGM21nXu2NBSNANnCLg2brf35+eocymHM=;
 b=EktWNLJuE2yOKMFMe/m6Mo2BXxbEORL8yTlOMjzEhq4EEcD/tvDKUGXqOwMGz/YTdD38mla47fCayrcwnHhfYKadOvK2cmBvbWahV/SuAPLbuJI6GiLmdpGRZqVMbeXFGcP9mBUDBmOBf8NFB5DpphfozZ3d+yzyHGqDLWVu3nA=
Received: from SA0PR12CA0021.namprd12.prod.outlook.com (2603:10b6:806:6f::26)
 by DM6PR10MB4251.namprd10.prod.outlook.com (2603:10b6:5:21d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 01:39:43 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::a8) by SA0PR12CA0021.outlook.office365.com
 (2603:10b6:806:6f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 01:39:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 01:39:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 19:39:43 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 19:39:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 19:39:42 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P1dg7O3255610;
	Tue, 24 Feb 2026 19:39:42 -0600
Message-ID: <932791ba-b02d-4adc-9ee9-094569e827db@ti.com>
Date: Tue, 24 Feb 2026 19:39:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-rpmsg-char: Set DISABLE_STATIC = ""
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18975113A70B0526.558139@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18975113A70B0526.558139@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DM6PR10MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: e6579801-edae-49f3-0c8e-08de740ec027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|82310400026|1800799024|34070700014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGp5S2ZocFNGc0Z2NnBYbGd3UjRlUzNVQkVURzY4QlpwNWdSMm5aQlBtVmxn?=
 =?utf-8?B?VmJvRWw1L1d2b0FxLzcvYWJuMC9uQTZvakFDd0FkYTI4TXUremV5dkFLdWdO?=
 =?utf-8?B?YWgzUXlwRWtpRnA5T3FUMTRORXdoTmRodU81SHowWnhiL2RhMkRIYmxrSWdQ?=
 =?utf-8?B?Sy9BQnVLckVkNURtK0tIcjFJT0NKbFJlbDV2QWVPMnprUkNoTzZQdmY1UGJp?=
 =?utf-8?B?bGdLT2FtcXY5ZWc0RkFmZ0RoeUpoZ3VlYTQ2WXRyWmhrcFUvMEI0VUdmV0VJ?=
 =?utf-8?B?ZlRHYnk0cGJHM2FUL2paYzVxNEU0UEpLR3F1NG5Ed0FoSlpweW5xY2VqcVNX?=
 =?utf-8?B?OFl4UEZFcGpXMzQ4WHR5ZGNLdzdrLzR5WTlILzV2Q01yOWtwOVEvaGoxNHhj?=
 =?utf-8?B?WWVyVFp0bnNVNHZmSzBPZVlPd2NTZEtENHBVYWlZWVE4QnIrcVBaSEJsdFoz?=
 =?utf-8?B?a3FMS3V0RVZPSDloSGNvMThxTnVkQmhZMVJmdnA1NlJRZ0FVai9BZ1p6KzRB?=
 =?utf-8?B?Z0JmQ2hCdkp1ZzU1eWpVcFhGRzU1VmZjTDF5NWc3aWsrWW5aTEJ2NlNiSlZ3?=
 =?utf-8?B?cFlId3RwL2ZMYlJJaEVwc3pwTCtXK3R2eHBpczRTVzhxOUE5Unp5cy9iWm1h?=
 =?utf-8?B?eDFnVGxlR2piSU1FYzNiRFZQYUZWaWZSdEtPd0JTV24zRy9MMGxXYWlUUnN3?=
 =?utf-8?B?b1k5Ly8wMzIrSm1GaTJQSm9qNHhVWWI0NjdxY3loaE5jV3Bxd2xOVVo3Q2Vx?=
 =?utf-8?B?L2tza0lCRnJnblZMRmtDb2pEN0U0WjJpTjJ3VGRaOFNTdlFLVHB6WVdrdlZD?=
 =?utf-8?B?SHhQMlN1ekdqUFZCMDVISUN1QXJlZ2pFNE16L2hiVVNUNDNRUzZmRHNJZXoy?=
 =?utf-8?B?c1ZzcGVMOWp6K2JBLys2MkxXWDRIVm01REdaSittWGo5WkFmeDlVUUtTUC9a?=
 =?utf-8?B?YWYzU0l1a0huNVZnTmx1YmszbkdyaC9hZTc0VjZlQzR5M1dhS1J4V2REb0Fm?=
 =?utf-8?B?UFlaNTRzOVBIYmNQR1QxOGc5eWtkYVRpd0ZRa0ZxUmJnZC9wWnkvREFLdWZI?=
 =?utf-8?B?THlDSzZ0a3Azc1BuVHlHdzVRVnZJMHp0c0J0WmkrM29yMG5wZ2tCVEs5MlM5?=
 =?utf-8?B?V0RBZ3BlTHNJa0JUL3pBRzF2cG9Nam4vZEtJVSs0ZU9TV1BmallLQkVlSDh4?=
 =?utf-8?B?MG1GYVpzbVRSWC9JYkRwV2Jxek9NOG40bWtiWWdOekpsNWlqckZCTXBDMDd2?=
 =?utf-8?B?N256VTBQZ0pveWVFNnhFWkdpRm9JeU9jSkVHVDNmRzIwT081WWJ0RjUvbUJS?=
 =?utf-8?B?REhJWDR6NCtQTWZWcWpudW9ldVFDOWRuZWtrZjhVT0l4OUN5MFNhakV5OElN?=
 =?utf-8?B?QmpqZ1RGYkQ1R05ISXcwMDEveHlaQmMrVlllcmcvVkR3Snc1N0phanV0UGpL?=
 =?utf-8?B?aUNaNUxkREFJWmxPM0wrUHRZaUFQUENVYmdlT2pEeEhJSkVkYU0rY2NXQ0FC?=
 =?utf-8?B?YXJickNBNHpDNWtRYUtIQTBRd2NsbEdFUzBFRjcweitvUUtTY1MyM044cEJJ?=
 =?utf-8?B?VXZyeVRFeVIwWjVldTY2UEJVM1pqck1tSnB5M2t5MG8xMlIzTTIyZEFzTE1H?=
 =?utf-8?B?Nk5acEZJWkdTVTN4c3pPb1FOVjVYSndrK3drWU5WUThtWTZrTlgxckxqM3dj?=
 =?utf-8?B?OVkxb052Y3RZTFgrYUxKVUVvRy9oZ3lIcWwrYlp2MjM2L3JFeTNPNmhVUFV6?=
 =?utf-8?B?bVNZRHhoNmhaQXZXaWFvRndSbmw3NHIreGNYZklEVTY4ODNIY20wT0haZG9P?=
 =?utf-8?B?SVBxSk5vbTZZREEvb3N4UUpoTGRRUE1SV2dONVVUYnhkanJoN0JCTWMyRmtW?=
 =?utf-8?B?RmhGZTV0WHB0cDNEM1ZKR1IyR1ZUL1dhRXI5cG53MTZEL25udVF3WHJsc0dv?=
 =?utf-8?B?Uyt3ZzJrWWM5SEdCMVMyVmR1TmMrbjR5SHQremlrUExJM01Dd3ZlMHBlVE1p?=
 =?utf-8?B?ZU1GUUtIc283NTY3cGxhWVVBYkRZT2Q2ckxlYitmNm91RGF5YnZpb245emhJ?=
 =?utf-8?B?aTlZbXFCbFFCN2ZpU3BjU1BPcHJ2ZTNtYjBNZlB5WXJDbVpFQVR1VkZaL05u?=
 =?utf-8?B?eSt6UEZBejFaMjRzcEpiUVRsM2pkUjRleGp2VTFWRlljY2Yza2gwTDdKakxM?=
 =?utf-8?B?Ly93U3c3eGdsem1maG04WEJOUmJkZnkyUzA5MDJ5RE01ajBCdjJibnJMWGlM?=
 =?utf-8?B?Ykw3SFpCY3cyQUljNmRDcHlpNU1BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(4022899009)(82310400026)(1800799024)(34070700014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LzMcdT6wKeXHRu3gWReKD4NZRI/5thKPtyj1QmGQu/ZrWrAVNjlc+HNjwOLlcWNFju8g86pDYiUuMRker3ZwPjsN3eKsrHqRZfMaMBGDdmYzYYaDRGcmEN/6WRnMRb/cnqE2JXUagT9eXRjPX+JHkHAMz2uyXINNWh2vCz9i/tsDMauCbAXbAzi/qxcjPJYXZ0CnOA2RwH6/LsJRButoG01U+lKFa8xaS4BRmUpTAqai0VNX7AwfRAKRoh+S6Gh6NQd9vCR4Xa7zAV98qeQYd5eI6OSs4zAKTMw9sMU0XCP9IpPgKQ/Vl2W5rk2RqHTvhmjrnXj6gtxiW8G30IlVaEbGbSN/HLoCWN0NkOPke1yKHnnWBGWRqEBPzyPxFPgpGE7q+hiCYnA3YLOeMd3YvUSOogC0QrL7e1OvncSxQN/BSZDgstcI/qXeZv4ucJ6m
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 01:39:43.4579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6579801-edae-49f3-0c8e-08de740ec027
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4251
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 01:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19594


I'm moving this over to a distro setting in Arago and not here.


On 2/24/2026 5:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> As of [1], static libs are disabled by default.  But this package relies
> on static libs, so we need to allow for building them.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=03fc931bfe9ea3fa9f33553e6020cbc067b24291
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> index f9fb0f25..f8b9adcf 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -13,3 +13,5 @@ SRCREV = "dd4783422bf4fbed1015bfaa51054e40057b4f04"
>   PV = "0.6.11+git"
>   
>   COMPATIBLE_MACHINE = "^(k3)$"
> +
> +DISABLE_STATIC = ""
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19592): https://lists.yoctoproject.org/g/meta-ti/message/19592
> Mute This Topic: https://lists.yoctoproject.org/mt/117985797/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

