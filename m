Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDE4EEC296
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:51:45 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6483.1771883498811166417
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 13:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=g4p/Q8n+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.24, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x252C+2Cc6nEry9YAzKO+xEuEcLHxMC/utenKfngZhn1BguR09VVXA7hE9eMFcZJvL5bXe4Tst4v9341+J4AW22+e/gU4ZuQZqXdtlFafRGRQqPnigbykciCHnkAHxWpbd5SN3EUkdABuq7FmTNU05iQXhqDOJtRcpG6Mm0LcOcKv9Oam7+HKg2/REakGOHYOcovyzRcpgLjfrB+GqaBVahhNLcZF5ltG7d9XWXicbJ9LfUsetugwNS/89zZ3TjHjMpDgbXS5Y9+G9QmbqlUM34fIBRc+p1Gj8sj4A81HYOWnqKhxiBIrxWw343AG8nAhb30NirsvWOU96rrmtqakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfaMsWRxx7hDRxl8pKz/Q40n7pSIjCDD1aBk5Gvnvrw=;
 b=xBgwsxY3FlPeXEGB30IKG0VctFHKjoCKU8x29MbZZDRW5jsUKiEkXcYgoR5iCVBP9VP55s+XJcFsY/su2r3MyonAt+O7vCO7sm6kDZeeJ7RNtZRnh1Y3DnRGB/0RxqwUy3dmmDQTex4/zPDf6q/NeFtFNliYhQHRWRaMtOZ8E8nIJMpoLxCfcKMIm6NWiMETMUoOVKkG5OBndVUtsLwoFWMOrMm3gyDglst7DSXmF2BLtHD3DFis+r/FekHaehMzGY5wpfwCQkzcxVJD9LKfPvrb1z4YRm9nY9vi9lqVoRIWmK1BZFEcQibShmtTxLQ3xfPa7FxKXsLXLukJicxovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfaMsWRxx7hDRxl8pKz/Q40n7pSIjCDD1aBk5Gvnvrw=;
 b=g4p/Q8n+EHZml9OGj062xCY9oJCH5Y/u/tMzxMwnfCLKr2r04NDpdD993HHVwl/USrz0QnlF0IIV8N4klnHWYylikZOr3ffpEaj0grAfbOaniTYBJSsMbrtwUVlDBGqHcAnkKC8v4+Yw0qqtJ8bg9zjg79pmii7uMn/XGv/WOXo=
Received: from BYAPR08CA0062.namprd08.prod.outlook.com (2603:10b6:a03:117::39)
 by IA0PR10MB7643.namprd10.prod.outlook.com (2603:10b6:208:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:51:35 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::85) by BYAPR08CA0062.outlook.office365.com
 (2603:10b6:a03:117::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Mon,
 23 Feb 2026 21:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 21:51:34 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 15:51:33 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 15:51:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 15:51:33 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NLpXuh1546015;
	Mon, 23 Feb 2026 15:51:33 -0600
Message-ID: <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
Date: Mon, 23 Feb 2026 15:51:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
To: <rs@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223202236.3642261-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260223202236.3642261-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|IA0PR10MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e5742b-6b69-4c15-7ecc-08de7325b65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|4022899009|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFJSa0dzcmg1NG5GZ2NZNnNQQzNtQm9jZllFa2JQUEhORDJwMm5RTGcySk1s?=
 =?utf-8?B?QldwL0pOd1FyZWpBWjRoY3VJOVBFajdwZ2NlS1NJKzFuWTV3L3hTNnFQK2xl?=
 =?utf-8?B?Qkd0NVgxU205MllSNm5RRzZRUlU2S0pDTjNKSnlFc255ajRTRkVvMGticDZo?=
 =?utf-8?B?elV4aDZkQzRWZTBjNWl1Qmg3ZTRPYzJjeStrQW1tVkxSOW5Icm9xc3ZQejRI?=
 =?utf-8?B?U3E5dzBQRStxVG9RYWhuRGh6bitnc0dOMTRpYlFaSHFhSVNNZGNMZjNxaW9C?=
 =?utf-8?B?L2xRRGZWdVIwMWdrcjI2SUcvZEI0bWFvcWxVd20yR3RHcmJpYjJ6NUg0bVNB?=
 =?utf-8?B?anZrNnByc3pWOHVjTUFqS1Q4ckFXQW1ScjFFWWdVN2M1Qm5yQ2t0TkREbVBj?=
 =?utf-8?B?VlliTy8zTFRhc0FvbnJ4MThyaXhnY1c1SHYxMmVUZjZYWkQrVUxVclF4NHFB?=
 =?utf-8?B?K21UWEhwSGRCUWF0VTNOWUJWeXl3MkpFVFFwc21RUVU4Nm1jMFAxZzJsOHpV?=
 =?utf-8?B?b080cm8rTEFKV3RFWGNZY2kxZFJYMkdkUytzbGVIMEN0RDFVb3pDZm1QVG1Q?=
 =?utf-8?B?QnAzWlQwaS9EbHFkOWFYa1huMThZK3BaQlNrZkttN1NFMHEzdENxd1c4RHNt?=
 =?utf-8?B?TFhWdTB6b3U0c1VQVVNMcHZJbXlWcHlxVUd4N2swOWxYTi8wQytpS0I1ODhP?=
 =?utf-8?B?T3ZRVWlKeG40aGw0TUkzRUZKQmhNLzRZa01lVkI5b0JmdzZDV1BQQ3R3d0FQ?=
 =?utf-8?B?RFB1NThybFNMcFdMVjBQNit2V2h6MGZhK2JZZDZSdDFyeDZIYllmNlowU0Nn?=
 =?utf-8?B?a0liSEVkRjNUZkJRV1VhMEY4WGRURU5wVlJHM1psaFN5WVFMTlFDWmJNaXVR?=
 =?utf-8?B?aUtQOUFvczIvNVVKMlVOQW5yUkJidksrYjR6SUIzVVlzcEl0R0x4b1V6NGUv?=
 =?utf-8?B?dS80d0t0dnpXemNSSktsRm8rM2JsTjgzK3UrQWU2RlBHOXNDQjdQUTIrRUVm?=
 =?utf-8?B?UndCNUVCRXlOTSsxenpIaEZHN0RFRXNyU2d6b0FxSVlLOFdYdGV0VWg3b1RO?=
 =?utf-8?B?U0VWOTZmemRod2lCS2tTNXBodHZRdmU1aTlPZmVsOC9ySWNwdUJiVmxMZEdm?=
 =?utf-8?B?OEF3VXlnZitXQUtBaVZnUVB1UDhzcndjbFV3SFZ2ckR4a3FKU2QyRVptSklj?=
 =?utf-8?B?dXdoNDd1RjNMNUNMaUxidEpYc0dQUDl4NUIrT0N1WTMwN0lFTEM2MW92dFdn?=
 =?utf-8?B?OTRkUmZwUjlZSFo3VU0vY091MmR0YUg0SGNFZm10RUt0NUE2ZE1CMSs1ZlFV?=
 =?utf-8?B?M0kzbnNkNnFsZWdHNU5Tb2MxRTJiQ05mZVRkanM3b1RWUGM4NmVEcDJPay9x?=
 =?utf-8?B?OC9yYTZiZ1NPT2VFa2RIUk4zSG00cWpVcHNWOGJYVlpUbVVOZGFPeXpKOWdl?=
 =?utf-8?B?Skh1TjZrdkRBUE9xaTliOUl3M202RUxtSW8vZlpFL3hRV1hlY1cva3BzQTl2?=
 =?utf-8?B?MmdUcmdwWkpwaUZ6NzMrOGhpZnNJSTA1TlFCSDBUbHRJQXhoTnBJNzFXYnNx?=
 =?utf-8?B?R0pnYXlSS29PamJnOEhPZzRDZU1Kb1hFb21oenNkMWtBU1h6SDIyTXlHeXlz?=
 =?utf-8?B?dmRnZEtHQlJZU1NTVy8reDloK2hKUSs1TWtHKzBpYndzd3hpRHVtWlAwcitP?=
 =?utf-8?B?OThUUWg1QjBUM01xeVZka0U1aHljRkl1bnVDbCt4akduVWw4elExUzRaLzQ2?=
 =?utf-8?B?dm84eDFGQ1RaYlI4VEdualJ0RFFLeDRZeXBhYnMvZUdleWxUeFlMVjFmalZi?=
 =?utf-8?B?dTFxTFJud3I5WEtzMEFnaVBUS1NSbVN1akVRTlhQbjNHdFZ4RkVYN2E1VjlK?=
 =?utf-8?B?UndUNDE2M2Z1S3JieXBsKzVlaWEvQk5KdUdDV3lheDUwNjNmeDhGUnBoL205?=
 =?utf-8?B?SU4yc0RPcTRuUkRBRzhaZXBSajNrNFplbXVtMm9IYkxhOWNlUkZ0bjE0N0lL?=
 =?utf-8?B?WGV5aWFiN2FwZU1YVWdreFl0amFEV2xRNnNVWEFST0JRWWJLRS9EY2lSbkc1?=
 =?utf-8?B?ZlBoM0Z0bUlKakFJT2d5TjRWZnRpQmRwK3NwaUJWcjRDZ25KTTdqUjYramp3?=
 =?utf-8?B?bW1vbVJGNHc0QjhTdzVuQkVNaEl3c2dDN01iMFhxellkQVVkcEFVZ2ZHVlAw?=
 =?utf-8?B?K2dVeEgvVmdFcnAwTFZWenhkOXRVVHJXVUZBZTF1TXZHTE9KNVQ3eERMWHM4?=
 =?utf-8?B?TUYzZDJSRVNNM1hsRjBmSHl3QlZ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(4022899009)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MqdQNxXrfedLl2h/y0DCF+blpI1D28F72+QHxUMZ7veGo/iHy4BJMqRUjRYskZpkRs3HDLZKmbbEAhnb9N72XXiHi/3WcmSIqrlKSLG0oiaOsrGsLlloQXNhUiZ8p6ta3NproK+sqFWLZTTGe0nVMm9PUzdH7P7vROBNkSddnZltt0A2WSni9S9DRD23F0g+smCRha71K//z/8TyvaVCBlEOKPLzB/TcTYvCjp3DOedLY7rB2DSO7r4cLhTGdGeLafciBuoupI1QrUHyNKzlcPPl66SlZ8S8n5orp7LGCuvJxXH2uBDIwBVUgWHHgomWrGBqkgXCR5BvwYdUvkiRboJvVc3J9bXIWAgpnkIgQn8Gg7HmqqEqbElAWPd4W64QuYDTldyWfoGNqiKu8eM9DwWK9o4qNWnA5y6bPXLFKF8ZFYrt9NBDDZEghqOTJrS0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:51:34.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e5742b-6b69-4c15-7ecc-08de7325b65a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7643
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 21:51:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19567

On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add a TI configuration for the BeagleY-AI development board.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |  7 +++++++
>   meta-ti-bsp/conf/machine/beagley-ai-ti.conf      | 16 ++++++++++++++++
>   2 files changed, 23 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
> new file mode 100644
> index 00000000..88d0888b
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
> @@ -0,0 +1,7 @@
> +#@TYPE: Machine
> +#@NAME: BeagleY-AI (R5F)
> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +UBOOT_MACHINE = "am67a_beagley_ai_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
> new file mode 100644
> index 00000000..088cbd62
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
> @@ -0,0 +1,16 @@
> +#@TYPE: Machine
> +#@NAME: BeagleY-AI (A53)
> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
> +
> +require conf/machine/include/j722s.inc
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am67a \
> +    ti/k3-j722s \
> +"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am67a-beagley-ai.dtb \
> +"
> +
> +UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"

This defconfig doesn't work if you select an older BSP.

Thinking on this, the only difference we should have between this machine
config and the one already in meta-beagle is the default selected BSP
(bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config and
select the BSP with TI_PREFERRED_BSP? We could do that externally
from the build env, or with a branding.

The issue with this patch is we would now have two configs for the same
hardware, and there is no TI produced BeagleY, so having the machine
config for it in this layer just seems wrong. I have the same complaint
for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
them in the same way.

Andrew

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19562): https://lists.yoctoproject.org/g/meta-ti/message/19562
> Mute This Topic: https://lists.yoctoproject.org/mt/117964418/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


