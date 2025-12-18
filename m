Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F9DD6D235
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 15:20:35 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44579.1766071225896950143
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 07:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IdtPo3Y3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.44, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+9TPvnpRNqA7otK8FhjBmnmhmCWdObL9fgbuJD/l9nUGj6nNniyAHWvhVGhgM2CEaBeu0UM881+kIctnpxoe/ih9MncZfqGT51DQUGVpEZ0yNdNzcZLzxLlNauQ3+aI4x1QLFp9sdj/fO2Z7jyw7e84Brf8TJujnWAK155wi8zoKdAGVASGribQ5/GzdE8Q1YM38VtU+CpXL8caaQIhPnBnK6kE4PjF3Fa79Tv3pESPPRj1STSovFx3jKoU3Lw1x7JiiTd60A1ANUkwqVlxEsprI00kF4sfUzuK/PsCNiFmjmzG79DZ/JGSWU+0GU6i/V/hXZEoe4ERzfBBOr8z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6o/Mp+/PlIxt40IIu+8K3RXF2BtaRYh70wrH80vkII=;
 b=y7Q2QPKe/cx5GQ436ivoBxqek5A3UWsUOSIImwu4E9IBEFrpxk3boupu5kep8zDfSz0xvHAZSXZpvasT+GWRWg0aFJElcX6csBp366Cq/MxGwcKlWoZ6kWaDMVVPlW3/jl0ge+IzgXFNVTp7uY7kirkl/ENyLavhjqw4kdx6iCINyVOaX+Sj1BMonuSWdJq4rMYVV+KyEnKW5Y9R27lx5O6h35k+zR2e+Ww30/4DaIgUaGID7qrcld9ZjBby7/lJwO4lQFW7iekYIkMDTRY9hk7RzqgvMpVtJdp5jUARQg5Tx9vwNetVnjjqDIJU20uczI6ViGUnQbKV//3/bTqGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6o/Mp+/PlIxt40IIu+8K3RXF2BtaRYh70wrH80vkII=;
 b=IdtPo3Y3YpDSOE7SqluKbhHIZ+lrqlPMPjxcse3ZgV1hYKqynudJ9ueW8kJzWdGc8XHJneMZxPqp24vxhWbu7l3W2gvcv2+BlvzjF0KcHsGqgOnCy14Mhgg6F2MiUMl7i1IQGIG7H+b5dbom6O8xE9017Y1+JT7gqcY1tOnB/CA=
Received: from BN0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:141::27)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 15:20:21 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::44) by BN0PR07CA0028.outlook.office365.com
 (2603:10b6:408:141::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 15:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 15:20:19 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 09:20:19 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 09:20:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 09:20:18 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIFKIuE3566523;
	Thu, 18 Dec 2025 09:20:18 -0600
Message-ID: <3f0f54a5-3b70-4ce0-bf80-668f698d33d9@ti.com>
Date: Thu, 18 Dec 2025 09:20:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/2] Add support for BeagleBadge
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denis@denix.org>,
	Andrew Davis <afd@ti.com>, PRC Automation <prc@list.ti.com>
References: <20251217235315.1333746-1-jm@ti.com>
 <20251218000247.3077328-1-prc@list.ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20251218000247.3077328-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 63afe8d5-b0e5-492b-2628-08de3e48f4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0dIWTNpTU50MHR0VUJlbDFtRHR3aDBWc0dVV21WS2c1dEhVN2Q1TTZFaEFt?=
 =?utf-8?B?cDRqS3ZFUDFnZ29VV3lpZmF0blUwcXlRUyt0Q0ZhbHN2eENZcHFwY2FqdFNz?=
 =?utf-8?B?WlhlT3QyeENCNk9OVDhKOXc2TTRBdXQ1ampXVGE1YWplWXBuejI2L0pNMmJ5?=
 =?utf-8?B?bzEzNGtvcFB2NFBRY3ZwWWowakdWcllhUE1vMVFjVDdCTXlncXV6amVkdnEz?=
 =?utf-8?B?aWNaVnJYdDNCTG96SmZzMVZnZUYxcHZQQ241YkN3QnBNZEloSytsa25HZnF4?=
 =?utf-8?B?NFFpbXRFclR1QnRGSFgyQUlKU2RSQ1BBbTljS3FCL1JqYURtTzFkbXhRcEVr?=
 =?utf-8?B?OG1FZ2hSSlppd3d0VU5rQklZbTRzbk5XUkFmbXdmekIyeWtYV0YvdnA1TlVJ?=
 =?utf-8?B?ZUJOZENvOU12QkFmNkZtRjNuek9rRmI3R0N4OExFZGtCVWdJcjdIbHV2Qnhs?=
 =?utf-8?B?NDEwZS9pNlFQdGg3T0tBajJ1VFFHSzBRS3BnK2U1ZHVORFZscWpSb2luTDNI?=
 =?utf-8?B?ajBqODZJZnBjUEJmckYxT3o0dDMyeFVnQkpHVEdNZW8vdFMvZy81Rnh2NkRT?=
 =?utf-8?B?cHlhV3F6RlpWRlRXZXE4RVc5aWM5ekZDZWl1UkdEVVc3SkxxZVU2RlpraTVJ?=
 =?utf-8?B?a1NyK0ppeUpZYXoxTGRLSmVuM2tzZTljSGgyUnRPa1dteGYyNlZqeENVZVM3?=
 =?utf-8?B?R1Y5Y1JqWC9oOCtybTZvZ2dva1Bwa2RNOTR2TFBBbUl3NDlsekUxOVR5TFVo?=
 =?utf-8?B?Tmd1N2lsM1VacjBJb0RCaDhSbHlxK3NORERUaFplb0swZVNEV1B1Zm01ZGVF?=
 =?utf-8?B?aHJ6bGlqck5zSUFId3Fvek9KUG12U2U3Z2dlWGN0UDBSajhnWitxRWcrZFNU?=
 =?utf-8?B?OGtkRTVYMWR3V0dKcHFxNytlMUIrLzNidVRneldKUHJQTWlITDBndi9DL0lj?=
 =?utf-8?B?bWxqOWtDM0ZLeVpDdXFXT2NWaitSYjZaSEduVWZjTys3QUU0S2VzZGRFTE5l?=
 =?utf-8?B?QlNhVVRIWHRXd3locFU4QTlXNS8vZk40STYyeUI2MkhGTExMaEt0TkZaV3VQ?=
 =?utf-8?B?Y0o2QWI2UzQxaWxnb0FaZ0JYYjZYSG1UYkx1VVZ4SnZrcFV3dU1NZHJVeDJa?=
 =?utf-8?B?dExiTTFuZ0QvN3lLS1F0alZESEJKKzIxTHUxWEVVanViU1lEZGlkYTFLRGZx?=
 =?utf-8?B?YTNFNDRMRVBaa25RZ0JoK3pZMDZ2cno2aUI4WXVreFlVa2hkUnl2MTVUTDN0?=
 =?utf-8?B?MXBieWhmVmxyTzBZUmZYWlQ1RytXSVpkVFY3cTZBOFQ0Vld1cEw0SUxLWGZw?=
 =?utf-8?B?REJ1VkZVOERoMjVJR2J2SjFqQTEydExUcTRRZHJ6WFo5SG03OXFuZzdaZGpQ?=
 =?utf-8?B?QjRsbzhpMnJmcGsrMnJaOVpLY1lORmJjTlRNTEx5ZHUzRDloVGhzdUQzNXZH?=
 =?utf-8?B?VUpGc3VOUDZVZGRFS1ozbEpQTG9yZWlkejltT1ZiaFNYR0NLVk8rVXJhL0VV?=
 =?utf-8?B?cGRBc3dOc0FQMWI0KzBJQWxNSGZzZ1N3L0huOVdEamVxK1pEaWxZa2dLb2Jp?=
 =?utf-8?B?YmR6dTdzSFR4NCtUN3hGZENNdzZzREc0OVFzUm1VMjNiem1XaFhRUGRaOE5v?=
 =?utf-8?B?WGcrQW9IMjNaaDdnNnY1SStZNzlScVBGKzRHa0x4T1RGQ1p3aUE1Qllma2pB?=
 =?utf-8?B?UkgvalVUWkhrcnMrdE5WcHd4WFF1QkxobThGayt1cHI0WDhJcks5eGZOZWxJ?=
 =?utf-8?B?cFRvdXAyVXplM0wwVWdKQnBjVWIzMGU1N0ZRU2ZFZENCL2ZhS2xKVjV1eXhW?=
 =?utf-8?B?bzBBSnFmdXM1K1NNaDNTanJ2YWRpTG9NRWJnZ1FwQW9vQnBqU1hWUWpJWFlv?=
 =?utf-8?B?UGQrQjQwamJZdnhuR1phM3lPaWVRKzZyVDlmaHhnVGRIMVN5MHVHcWFzT0I2?=
 =?utf-8?B?RXgyZGdwQUljK2lDMVlMN2M3cjNSRFN1UWFhTWQyUkl3SzkrR2x5Y0txd0NT?=
 =?utf-8?B?NFJ2OHBvWjFKajVVTWlLQkh5dE1jVHNqOGlqVWdVSHRaY3luUWVZNUxHeVh5?=
 =?utf-8?B?bG9RZVN4T2UrbmN3aWJBWVBETytUUXRyQiszQUJWQVBkNGJuTHFURWV4dFNT?=
 =?utf-8?Q?3hhw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:20:19.5817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63afe8d5-b0e5-492b-2628-08de3e48f4a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Dec 2025 15:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19373

Ryan,

On 12/17/25 6:02 PM, PRC Automation wrote:
> meta-ti / na / 20251217235315.1333746-1-jm
> 
> PRC Results: PASS
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [meta-ti][scarthgap][PATCH v3 1/2] beaglebadge-ti: Add support for BeagleBadge
>      WARN: Revised patch missing a comment. (REVISION-1)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> WARN - [meta-ti][scarthgap][PATCH v3 2/2] trusted-firmware-a: am62l: Update to latest ti-master
>      WARN: Revised patch missing a comment. (REVISION-1)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> 
> 

? Umm the patches do have diff-stat on them......


> 
> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> scarthgap
> =====================
> Summary:
> - Patch Series: [meta-ti][scarthgap][PATCH v3 0/2] Add support for BeagleBadge
> - Submitter: From: Judith Mendez <jm@ti.com>
> - Date: Date: Wed, 17 Dec 2025 17:53:13 -0600
> - Num Patches: 2
> - Mailing List (public inbox) Commit SHA: 29a40d2044819dea405db491321bf9773491541d
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: scarthgap
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512111451
> - Commit SHA: da65de7886ce6572c9c4fe7224039c40192a6c5e
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>    check-yocto-repo: PASS
> =========================================================
> scarthgap
> =====================
> PASS
> 
> 
> 
> =========================================================
>    yocto-check-layers: PASS
> =========================================================
> scarthgap - PASS
> =====================
> All checks passed
> 
> 
> 


