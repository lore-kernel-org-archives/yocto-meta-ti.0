Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8E9EB28CC
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:57:29 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5419.1770357447784209831
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WEL5ZmtU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.36, mailfrom: m-chawdhry@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocWf1KQPkS7cfbT8VQGOvwPRq0RpCJJBgTdtCoqh+hrgQcbTMABbE/dgBvD86jza5m6DNnywZz47MNp+KcHoz09RTGfun6a3APlhqS5fkAydlXUxN3eCZPCm/8OV+Ui7yO9NxKs7Oj8ZuvZ5o1IggWytRJeozgaILzGkEuQXp+d36T2Vd5tU4cQoB64pAllJSvrz08gR97ruUfKo9I5QcdnXcWD3l4Pu6q5QNaSS7WB4qyRXUtzLEMaGa35oZ1O2iWWlaOnszk90cfFzHXEFj/agdbHdwVCk3paiCABGBllC9fiABQ0kgaMfdEH45cWp6wxFIY9/RgdNk7Pg61FWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdlzeJacnGxg3r1stVuuZnBX0Kh7SF0JVUjyqD8xldI=;
 b=QifvRbhulMC8nVTZ9yFGMKF1nR7kdxURvGf3+brkSfTyKYncEU1aipie1gpJ4Bgmme6mcDaVGoO4gNS91Gd1eOtq7Whpi0641DLtpviYeqwh9lfZukPSjFFNKRUwuunR2S8uZr5ojDpeiFzTbe6ZW54YnnGXXA9C2mkDTsQnujVsdJtoiw8YlAzN1NZeJ2O0O/hJfGqryWr8lr5DVWT+n5uLysHlMKkpLSbnTIZdkVjXE/wGZhd17PIEMXkj/QBHLLXmCEIlOPuRVXzzCUguRpS6O8klVklDftmzW/7NDKFbb4sVC1gzO7IHTk0riM8FdoN58H2S+u8pi8/tdMmMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdlzeJacnGxg3r1stVuuZnBX0Kh7SF0JVUjyqD8xldI=;
 b=WEL5ZmtUycBklKYtbrMxlche5veKhXNds+91LOBTHrN1A5Xe2dbymYS1VfRc5TnNh3qteLxXsKMonP82BEbz1C/8zzi3oFqaQcZHNz62ZIVSlbW6NF5aElONCng/WhVKONKxbKxBAfrcXrvfSuFa7/eEJJdCiA64I/ojZkGB8yE=
Received: from MW4PR03CA0204.namprd03.prod.outlook.com (2603:10b6:303:b8::29)
 by CY5PR10MB6165.namprd10.prod.outlook.com (2603:10b6:930:33::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 05:57:24 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::18) by MW4PR03CA0204.outlook.office365.com
 (2603:10b6:303:b8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 05:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:57:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:57:10 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:57:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:57:10 -0600
Received: from [172.24.27.39] (ltd1nqfk3.dhcp.ti.com [172.24.27.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6165v7a2207503;
	Thu, 5 Feb 2026 23:57:08 -0600
Message-ID: <00e7d88a-944e-4d3d-964c-6016b7c8b258@ti.com>
Date: Fri, 6 Feb 2026 11:27:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
To: PRC Automation <prc@list.ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Aniket
 Limaye" <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Shiva Tripathi
	<s-tripathi1@ti.com>
References: <20260206054157.1848713-1-m-chawdhry@ti.com>
 <20260206054531.686299-1-prc@list.ti.com>
Content-Language: en-US
From: "Chawdhry, Manorit" <m-chawdhry@ti.com>
In-Reply-To: <20260206054531.686299-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|CY5PR10MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5484eaee-af7f-404b-2b7b-08de6544993e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NXVaOEpJdW1LbXFPamFzNFdtckw4M3o5bnQyTE5PaGdHNXVjS2xwbkU5Ni9V?=
 =?utf-8?B?TG9JbWpoTGVJdXNvKzBhNEZERTIvdXp5d0NGMlJzL01VRy9PQXNLYzdzZVZY?=
 =?utf-8?B?VVhVRHJsQ01GZ1A2dGpSQi9zbHE4STlFS21vTGtseHpqbWJsVHFOOGJST3Ax?=
 =?utf-8?B?bXBSS24zWkVHSDdSR2JsY0h0ZHpHemVvMHBGM0d3dTJibjJIOGNsLzJPMDJs?=
 =?utf-8?B?V3pxdUNTY21odjBRQXNyL1N5eWxQZHk0bHJ3TDZRcGN5cnIveG1MSThRVy9v?=
 =?utf-8?B?MUw1aXplRFFWTk94ekFKUnowdUJUbHpFYWtIditBWVp2RTJrajB0TTRlZ3NT?=
 =?utf-8?B?YTV5QXZIdXdMWWdjT3BpMHRWbDZlRTFXeHI5YjhLOWpWcHl6Qk5uMXlMVysy?=
 =?utf-8?B?Ryt3dkdlbGRHZm5ZcHZxZmE5VG10dHhkVFVZaWNvUmNZWkJLNGR6VlhuVjlE?=
 =?utf-8?B?MWFPMktEamgybHhlUHU4YzFqTDU0bGtQZUxPYUlFNkxLaFhoenRCeW42Ni9B?=
 =?utf-8?B?WE5ubjR0eE1WYzY3bmY2elp3SXRSazJESUZMWFlmaHBNeFFTNG8xaDNmY0Z3?=
 =?utf-8?B?Vno5Sm54UmxtSkphdzRRc3ZKSEdpT09QUFhOVkJ1cDRaVFhXTDJiN0szNGRj?=
 =?utf-8?B?WFgwVXVleU8rNkV1VThuakFMRkR6UWpuNGFmMVlqTXVFMVVGNXNrT2xqQ2N3?=
 =?utf-8?B?cks5Y3N4UkRTbmFaL1A3U1M3MWtOd2o5dmxMa1BTSjdyOWIwaU5tVHpTQ3ll?=
 =?utf-8?B?YWpXR0Vkc2YwaHJ6ZDhERzVLUHRsSVdXY1VDNnlkOEtJZ01EUGVra1R2cWpp?=
 =?utf-8?B?STEwcElUZ1FPMUdwcVMxcjBmcm96ZkFXRkR1M0pMSmpnY0pyNUxvSTZkRjJP?=
 =?utf-8?B?aS9LR3hUT2Zxdy9adndKVnorQlkwSS82QTMyV1JPRmZaaXBBUzlsOW1JWEFh?=
 =?utf-8?B?Z1JQcG5PTzRwV1BEUkJYY3RWTWZjdE5lSk9PTFJRamZlZG9pQkRKb3A3cGU1?=
 =?utf-8?B?NktNajMwT1hLMU1ZdXRMeEhrRGxBMmY1eWhDb1h0clFuWFV6Y29SdGtmT3FU?=
 =?utf-8?B?Q2J5b1MwQjgxTWNoa0Q1Qi9tRGErNmkzcVFXRmpxa29JMll6S0szQTBRQkZ5?=
 =?utf-8?B?d3dvdXVlY09OaGhQaFQyWjBMQTA0Zkc3NjBYVVlsWFJGMlRieFd1TDNhK2RF?=
 =?utf-8?B?WlB5WEFob2tFRXpHZjNjbTVWRGcvaEJKYk5JczdDQkc4TmNBY0pSSGRrSnha?=
 =?utf-8?B?ekhuRzRYUTNPOTNFUDhlUE5FY2ZBR0t6c25xcTJ4cHZWdnBsb2dJQ2RQaWlK?=
 =?utf-8?B?RDhVMjZYcXV4MzNLSlhxbkVBSC9uQ0p3ZG90NmlQTWIvQ2p2d3BOdU0yWDQr?=
 =?utf-8?B?UkhlREgzTGtPam9veFNRZ2Y4aXJ0Y0RKdDlYUmRESmg2Z2tqWDdxS1Y1MFpN?=
 =?utf-8?B?TGIvVUNqSFYxZnNTZTFIMGwreGIyK28wbkZITDN2YXlNZ1dhOFIrZWcxZDVK?=
 =?utf-8?B?RUR1OVNTaWkzdHZva09kbjhiUHB4ZHBlQ0tjdE1remRzMGRuN29tQUlMS1BF?=
 =?utf-8?B?c2FJQlVjZnhMNGM1ZFh4dE01VW15V1JnT1pva3JqRC9YNzJpbFNvK3ozcHdF?=
 =?utf-8?B?djhwQTFEY2FGSVI5bHN3WWJuUFBiYkNRL2dVdkhPTzUwYm9PUWtPL24wRTJY?=
 =?utf-8?B?RitKU3FKWW8rVUlVOUdTRk9paXRNaWZuMFR4L0ZjTHNKMWNMcEVrNnZEbVlG?=
 =?utf-8?B?bU9SaEFVTnB2TlBwZE1xbk44TG9yVHlrYSswZEhtZGswenJPSkswUFhxL1oz?=
 =?utf-8?B?VjV3M2xOME1NeEsyTCszeUFaWnkyOVI2Mm0rZ3RWSGNXdGJIZEgyRU5tdWl4?=
 =?utf-8?B?TTNZRGNaSWZjSlNWek5leERGYWZZZFJNeGFOQkRHVGpKVER4TnROTHZWRGR4?=
 =?utf-8?B?RWZYRHZnVUFiUEN6K0xlZFFiQVhLUjRpaWhreGw3cWFNUkZKMnVObHUxUGc0?=
 =?utf-8?B?YkVnV0VCcEVXZGZXSXc2cnd3eDhYKzVqTnY5Q1ptT3pWdkNuSEl5cXRzVHdC?=
 =?utf-8?B?Y053TWFQcnBtZStmYjNLL1ZUdmdqZVNIVmQ0cThNMnhRUEtycGFtZG1PdzRO?=
 =?utf-8?B?eGxZMFdaSHYyTERuQ0k4dFdRN0tUSDh6WGZWODdYdnhubWYyL1FmWXpQY1dR?=
 =?utf-8?B?NVZUUDJLY21WK3dSeXR6SFd3RDhSMXlQZ2xlL3pjRUVmR1pqUUIzdithbSta?=
 =?utf-8?B?cjhXajlKR2hDaHBsN2Y3Ri82b0VnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Xi8bzbwlHh3vkjY4I3TaCMj6pEFWyD1T74mm9SptIfHK92+xRy/kio4uvoKWEJ9xajPhu360Nt//UVRQ3B4ayCe247BPaumGkYxAZZNeXgeDZ7LbSkp14U+CFpNnWyb8klr3RpJFu6aVaxygYYCrk8a3Ka8zji4Jo2B1QkZAmXdeZUi8wHzTnJEcjJnKAU9Mz0FkkHJD4DO4mdZaUZydvJNw9SCVRYnr3lq+A2JkXBMhV1JoBC2mJe8qyGtsEZS7qKstrInQSFkhDtvcbBCXZh9ze+NE5ucxjSvQ/5cIqabI/97oCLttTNHz1fQ69U7dBkAz88WyW7Xx98aIh1KJQbMMpwKSAE9X00q2nW55svsEircyleI9OhBvUQA3MqWKax0CRScHYV0cm6JNb+dnREfju7YiETeNJOqZ2d4Kz/j/kB2g3vsXif05W4av0viw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:57:23.4978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5484eaee-af7f-404b-2b7b-08de6544993e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6165
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:57:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19470



On 2/6/2026 11:15 AM, PRC Automation wrote:
> meta-ti / na / 20260206054157.1848713-1-m-chawdhry
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> All patches passed
> 
> 
> 
> =========================================================
>    apply-yocto-patch: FAIL
> =========================================================
> scarthgap
> =====================
> Summary:
> - Patch Series: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
> - Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
> -From: Prasanth Babu Mantena <p-mantena@ti.com>
> - Date: Date: Fri, 6 Feb 2026 11:11:57 +0530
> -Date: Mon, 3 Nov 2025 12:42:57 +0530
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 4867c4a16703065551b17b5c96f88a0c7091114b
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: scarthgap-wip
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601300920
> - Commit SHA: 5258ee2f903d8f1e0cbcb9d01488d08b57314009
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> master
> =====================
> Summary:
> - Patch Series: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
> - Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
> -From: Prasanth Babu Mantena <p-mantena@ti.com>
> - Date: Date: Fri, 6 Feb 2026 11:11:57 +0530
> -Date: Mon, 3 Nov 2025 12:42:57 +0530
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 4867c4a16703065551b17b5c96f88a0c7091114b
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602051800
> - Commit SHA: c79f7b833ee92e42f5dcfd6a33a47a9399d1c575
> 
> Patches
> ----------------------------------------
> FAIL - [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
>      error: patch failed: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc:1
>      error: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc: patch does not apply
>      error: patch failed: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc:1
>      error: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc: patch does not apply
>      error: patch failed: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc:1
>      error: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc: patch does not apply
>      Applying: optee: Update to 4.9.0 tag
>      Patch failed at 0001 optee: Update to 4.9.0 tag
> 

Ahh, I haven't checked it for master.. thought it would trivially apply 
there, made it on base branch of scarthgap (commit 
5258ee2f903d8f1e0cbcb9d01488d08b57314009)..

Regards,
Manorit
> 
> 


