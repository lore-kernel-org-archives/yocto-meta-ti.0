Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5613BCD4853
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 22:03:23 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9775.1762984999661250117
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 14:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MyWte2tc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.64, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxTZCsKdSt14Z7uPKFCszXKuXwSr9THsOgWbvQM7IGNvKZZP0/ymnjUS45Uoc4QHgLiYKpXOpt+F3SOsggiWPT/YqOfSwbHdnwd/DgYL9nlICIRzBLDn1zWyrwu1IvKaTfLsweNEOE+tfGgLNpXaC0hSFWB9viEwa+fIT0bb4rUyiF3ncHuKjn9e/MDVhX5QRwNjT2FTz83FemAuVD3ogAq8lAr2nIWwmq6NLOytcfEncN5fUzgMtICFWUd28nLPhpOhPLjNZCCZOUhesp/faXRNXqucYUvfwyoI4EOP1PlUGVUC/7OeliSVkuFzf5mqGK4Vq9OwphTpBLuN3cOlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQT2Op+w9oVLqb8iiOt+pLA0sG+kWiJHKMnczZJ8Qdo=;
 b=Vq4vUQOOkT31Ji1sHBCD2YuVHwWLJ6BMpEiehLYsOfnlF5RGFxlPP5lUiFCywhpC5G8KuSafbqh1+Re+N+W7yXk2JnlFYqgMHXZ9sf4lFLvIzAf/v4aY5NqLs93nGnyrl6m+pphawI+T+vy1mvEuxN43WWN/sSmWPJAOPCF0Gb3RbuOepzQLQnFq2DCK7O+yNdlKTMPOflpVrqog8WHFci85q6TdlufgAFrSJLTZW4npcu4PraxlAGTiE9tZKwEW2Jxsfx9MfjKlMy+xQ4kCF7/3o+nOzwCOhXGglFc5NEKCoZ6Xxw0uUNspWHem6W2395prfMFy1fOlFPSpwwr6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQT2Op+w9oVLqb8iiOt+pLA0sG+kWiJHKMnczZJ8Qdo=;
 b=MyWte2tcb4sZAUvZ0dhlnb2ZJgabfIWr/BW6bga3DC8uu+fzbuoCWJLwuQYR5sv16OEI4AOyghPNx/8PCXowBKA4raz7M0Ndoy28dOxV7VxH+qf9X+6lAfxmB8Zk9HOdwV4M26a+Qlz1g2Jk+MdeATjPwMCxEn5AgA8pqdoqjNs=
Received: from BN0PR04CA0158.namprd04.prod.outlook.com (2603:10b6:408:eb::13)
 by DS7PR10MB7190.namprd10.prod.outlook.com (2603:10b6:8:db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 22:03:15 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::7c) by BN0PR04CA0158.outlook.office365.com
 (2603:10b6:408:eb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 22:03:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 22:03:15 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 16:03:12 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 16:03:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 16:03:11 -0600
Received: from [10.249.34.12] ([10.249.34.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACM3BEo3411893;
	Wed, 12 Nov 2025 16:03:11 -0600
Message-ID: <c947ea12-c5a0-4c4a-a08e-0e6f169640ff@ti.com>
Date: Wed, 12 Nov 2025 16:03:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU driver
 version 24.2 -> 25.2
To: <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>
References: <20251112202652.3718660-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251112202652.3718660-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DS7PR10MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 571e6e0e-3281-4ec1-da5e-08de22374789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QnJCYW5xRnRJY3J6ZmZTMWZMbzlxQUw2d1hLRFZ4RGt4TUNiYkd1YkErUzUr?=
 =?utf-8?B?Z3cyRDVWWmY3WlNpbTk5TlZ3eGc5QVloM0pIaS83VEhBbis1dk42Qm1kVWRn?=
 =?utf-8?B?UU5vZUZqbVhlbDJvcC8xNEVWVFhRRXZxNThzWkpwYkhxdmsxL1N2UmtFQnRN?=
 =?utf-8?B?QURLQm5KaDZpb2hzRkFtYktKZnN3WnVZSThOeTJpTERnOHRhcmk2TW1NK3cz?=
 =?utf-8?B?MHBGbXMzN0VwMFUyZWtrdzJnMHNLcnFkbHd4ZTBwakVNK0JoR2ZXUVdZMlgv?=
 =?utf-8?B?T1QzM09GUkE2d0VsSXFVQy9scndSajJQcTZZWGlhcGdzOWRiWWQweEw0bjI3?=
 =?utf-8?B?Zy9nOWs0djJVRExHeFFuY1RtQjFZRDhzaEhCQUMxNnA2WW5WNmQ1SGVCS2lq?=
 =?utf-8?B?Z09RSTlRMnM5NXVsWVJzV0h5VmR3OFhyaTRIT054U3dBS1lPWHRKSDROdTNa?=
 =?utf-8?B?VHdVbmRMWm5JanRaTXYrTU9aZzdMRGw2dkJBWlF0S0srYkVVekhsNFhaOUht?=
 =?utf-8?B?SlhmbHF4T2RCNEsrUW5rU2U0dUdtL282S0ZIVG91ZXJtZkFWQ1dINE45K0ZI?=
 =?utf-8?B?OERqQjlpZ2JkT2MzQ01QMzJoRGh4anY4ZjQzTTA5aE14bzRieElibTMzQjJ4?=
 =?utf-8?B?OGcvcmFoR1FGU1VsSUh0UVQzbzBKSStzeEd3TWkyV1RxVjU5RHhpaGtTNWhY?=
 =?utf-8?B?Z2J3UjBWVUtXcGpkdDJLZDJ5NVdpWFJnWDF0SDBlVk8vMDVjWkZqMFpEOFpu?=
 =?utf-8?B?SktXdUFOYTNoQjFDVE9oNmQwWEJvVHgwYVU3YjlEWlpBcWxnQy83NXZwNnBo?=
 =?utf-8?B?akFXc1hpV0preHFvYndManRpaXdwY3oxYzFDSXY4V1Rlb2RvU1JJWUlHVUl4?=
 =?utf-8?B?bVN5K01RNmJ4bmNSUEFMeVppZjVIV1ZidFN1d1hKUUJWY0gvSGFJdjZBMEFD?=
 =?utf-8?B?K3hJQ29jV3NKcitxZkFtUGhzYXFZS0tsSWNjTW5ScFpHVTZPUzd3WmpWeDFP?=
 =?utf-8?B?d0JmaDhHeEJxeTBnM3BXNE43WUJQVVhObDBtS0M3WHJLdEQ0cnhjY1I1SGgr?=
 =?utf-8?B?eVFVa2ZUM3hQby90YWE0WkxWSUNOMExkb0hwZllTV2FRYTFvdlNHQ05FSlBD?=
 =?utf-8?B?a2FzN0RZMkNCMXdkUm9jVFpPV1FkK2F2RnBHZUpwNkd6bE5yN0tyV2M3aGZD?=
 =?utf-8?B?SldwMHBnaWR6VnRPRFBLVTl6VGZadGM3OWpRWThFMWwvOXF1TnR5bk5YK1ZI?=
 =?utf-8?B?ZmM5MCtKUmp0UStuNnRrYXRTVzJZRnc5QkZHZzFWak40QUduYmkrdGVwMUNa?=
 =?utf-8?B?N2F5bmh3TW1kRXBDcytPaU8xTnBMYmxWTTlobTM1VUtJOXU0cDlXeFV2QUlJ?=
 =?utf-8?B?VmhVdS82T05BTE5OMXFWRGF6K0MzK2xLejhlbDF5Zm9oZ0YxNHRKNlJtdVB0?=
 =?utf-8?B?NFpUVXVhMWFnZGVKSFp2WWlJOFZuQnF5R3MxdFZZOGkrdlZla2g0KzJwQVhN?=
 =?utf-8?B?SnRkaUVrbzN2QXJIZEJiVTVhNmFVbnlITThjNllBaU9vV2g4Qy9qVjl1WVpl?=
 =?utf-8?B?WVBpT1RiTTNrQVl6anYxRWZqckZSeGJVWDRzYlE2Sk84Y1NUczl5UVFqWXRF?=
 =?utf-8?B?NXFHYU9XWWt3Y3dtamk5Q1VFdVQ4YmVGNDJpend6SGQxdXJiZm1DWXpsYVB6?=
 =?utf-8?B?TGZSaVNIZ01EcjltUnFPbit1UnpxemhSRWo4Y0lQdzR2eXU2UTVNOHlHZHlY?=
 =?utf-8?B?VDJ4MDcvSUhiT3VsY0pyZWNYdmRuS2tqSUR5ZXZub2pZQ2k0Y3NIR05uOXJE?=
 =?utf-8?B?dFUvWVQyZndhcm9tWC8yTFZiVWw3L21xVU91LytMOFpweHl1NWtKL25PVTA5?=
 =?utf-8?B?Qjl6WENMcWtkc21YTXFlbWxmMHV4UFF4c1hRaU45eFNQUmJKS2VpWEJKOFpr?=
 =?utf-8?B?WE5xa0lTSWphZHJoQWdEMEwxL0k1SnUycE1jQVFzZnp6akIyV0Ztam4rNlpC?=
 =?utf-8?B?T2pwYW1scWRjbWU5YWd4a2w0U3hoclRNeTZyM2kxU3lhczhoUkZrRFgyNnN1?=
 =?utf-8?B?c1dRaFlEcjNpdkU1Mml2T1g0NzFQWnFoK1JyaDF0UGF0czZQSVBzTkV4QlpB?=
 =?utf-8?Q?tVuk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 22:03:15.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571e6e0e-3281-4ec1-da5e-08de22374789
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7190
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 22:03:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19263


Where is the master series for this?


On 11/12/2025 2:26 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> New recipes for GPU DDK 25.2. Update BSP configuration files with new
> preferred recipe versions.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v2:
> - Removed recipes for 24.2
> - Update ti/beagle bsp config files to build 25.2 for kenrel 6.6
>   
> v3:
> - Forgot to update commit message. DDK 24.2 recipes will no longer
>    be present. DDK 25.2 also supports Linux kernel 6.6
> 
> v4:
> - Remove explicitly setting of PR variable, as it defaults to 0
> - Fix spelling mistake (DSP & dsp -> BSP & bsp)
> 
>   meta-beagle/conf/machine/include/beagle-bsp.inc               | 4 ++--
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++--
>   ...er_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} | 2 +-
>   ...bs_24.2.6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} | 4 +---
>   4 files changed, 6 insertions(+), 8 deletions(-)
>   rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} (96%)
>   rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.2.6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
> 
> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
> index 448e2086..5060e286 100644
> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> @@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
>   BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "25%"
>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
> @@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
>   BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "25%"
>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index dc0473de..5dc2e19e 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
>   BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "25%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
>   
>   # ==========
> @@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>   BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "25%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in 6.6
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> similarity index 96%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> index 513429bd..0f50026a 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
> +SRCREV = "a838ac0074db640ebd1b64be6364417b1bbca3cd"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> similarity index 98%
> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> index 57f48fec..38a8e68a 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> @@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de52
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>   
> -PR = "r4"
> -
>   BRANCH = "linuxws/scarthgap/k6.12/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
> +SRCREV = "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
>   S = "${WORKDIR}/git"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

