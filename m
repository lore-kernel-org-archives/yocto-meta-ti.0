Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED594CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 23:23:13 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3795.1763421781240028633
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 15:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=sGtCI4AW;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.46.7, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgWOJKNsAh4rNfNYXUdXjBYtAz344yY5ZwfqQZwgzM8Km89NxbbGsG+B1/wSGINK2Ltqxfe4qbeHrnNfPeh3ozg4F5qDXMpBY81rlvwIfF6kzJpKJ0r2F9GpuE7wHQ1KN1YeUGANMp/Fz+kTY8bLkRqz0+f8DDtTBQAL5EUcfFh9v/n/e57y31inNKSbem3DcH2IihmRi9V4QUdjRe0n3u3KOXQQNouaV/SY385DMul8io7b/MxPP/PVeeR+8dTQQg4Tn0kz05DvxBEzh9pPs/JTDAqWb3hAf9hF0ulIyWfziuQjo9zZA535sXNPwn8jPdPx+F/eD7JCW5BEhct9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJz/UNdV1n+/f3uDsO0ZVB7BFhvabNk255eVxZz9wBA=;
 b=qRepyfaNaNHZ6WpJ5izWREIpM3aEYw4HChweles6aPmLLNDguqvYCrblB1nrludZBzKrJqAYMpn1RNqoutmJJNwJ5dF9c4pHxDinIfgyen33QUfcAlucJEmQnKfPPg9gNEzG5JC9iHxbq3UKCW5czZ9M68nkrhFgRs6LvFb2pV2mFc7ZGPmZcfEWCL515xAQzuEvZBkwVxhJcfmgVG03WW7zWayuNbbnxkk3QKFIOS+wLwsX/NS/IbXzUwWttmxdNBod17BD2Ule3PeAtJ3kbOi/dNFa97zgwcJTqG8OSovrLbLo6W3UZuIbLIlXMw15EiNQEP8xfgSEDnpbA1av6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJz/UNdV1n+/f3uDsO0ZVB7BFhvabNk255eVxZz9wBA=;
 b=sGtCI4AW6XV/q/1ZQHusPoyyT1ve2saIMN7jfZ8gNdn1SQycgdtZrzvgb1ye/mMRPdWHqW+kgb78zzgInK4Wq45+Z9WhpD/V4bCgU/9GZrkrzgeeE/hw8gBPkFXXwvhANed51BJaGDgsmN3LOjFBLQJ8ieKHh6QlRSC+soIJl78=
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by BN0PR10MB5047.namprd10.prod.outlook.com (2603:10b6:408:12a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 23:22:58 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::19) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 23:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 23:22:57 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 17:22:54 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 17:22:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 17:22:53 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHNMrDN3268364;
	Mon, 17 Nov 2025 17:22:53 -0600
Message-ID: <3165a1de-6525-4f7a-9795-dd00ffeccdab@ti.com>
Date: Mon, 17 Nov 2025 17:22:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver
 version 24.2 -> 25.2
To: <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <rs@ti.com>
References: <20251117211517.785176-1-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251117211517.785176-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|BN0PR10MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcf5187-b826-4808-92dc-08de26303e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHVRb0wwcGxpL2x1Si8wQTNVVW5WVThSNEZWV0pTVTNQeVdSMW9tZFR1THBN?=
 =?utf-8?B?aC9QeGxTRmJtSTRXV3l2aXhmYXFXdWhoREdZdmRsSnBJRlFKNlQ4anBvYjRC?=
 =?utf-8?B?dElQSi9iUmg1NE15cXEzYlIrOGlGWTJaMDlLbkYvL002a2NQSm9KSmh0OHBt?=
 =?utf-8?B?cTI3UlZETjVMQjIyV1V6TEhWWS9FNW54UWhVVkkvanl1cTc3Z2FMR3Q1Y0FL?=
 =?utf-8?B?MUhLcGl5cWpNZm5TcUZ6RkpLcDlpa1l0VkFtMlMzbllsMXlCQXdyTnNHdk9W?=
 =?utf-8?B?UG02L0pqaEpJR2NQUG5iUDNuNkxKVFRDVjIweUdlODRzRy9uT1IwYmlYSU1n?=
 =?utf-8?B?clhuZkdkOWVxZU53aEYyaFVkeXpCZ0REUkgxdkRHa21xU2ZyRUF5TFg4THhO?=
 =?utf-8?B?eE1nSHUxaElEdGJGbXYrZ0YxZVNuSDFkWEk5MENUYnA1L0p6NDBCdkhQUE91?=
 =?utf-8?B?MnZKVzdvZDh5NS9CMktES3VaVE9MMXRzWTg0NFJwMFpwTHVsdnY0bHNZSGN0?=
 =?utf-8?B?YnU1TmVTZ1ZMcXpaOWVhc3FCVXpkbWNyUHdkR2NEUWxiM0NPak1vTjRmY08x?=
 =?utf-8?B?aGVCTlJ2N2FRMXUvK2tCc25vNUI5eEIzcDV6V1VwYmNPaHhxMTlMb2JLS1pK?=
 =?utf-8?B?MHArdzN3dVZTb2x1ZnVnbXJuUnZaeXMzSjVLVXhINTlTVTExeXY2MU5IMFZx?=
 =?utf-8?B?VjlXbnRjOXNweERnOXFQMmF4QUNUK3BkQWxWZzN2UWRlMTZlTDBNUWt1MCtx?=
 =?utf-8?B?SDVpR0pDSGNPc213QTNPZUZKZU41UHpPRDdwWDVNSHpjdXF0RWUzaDBhVjly?=
 =?utf-8?B?RWh5YVhwM3ZxZVp6d2NMNW5OeDV1ZWlhUC9LMkw3VzJOTnRsc0lTUWJsMUJ4?=
 =?utf-8?B?dmkrMVIxeVMySWxzTnc3OWxkNjMyemNIQnNrbjJyWkhFeW1mY05NcDd3Rnls?=
 =?utf-8?B?SHQ3clVob3kybzZwOC8vdmRHckpuNyt2YTcvdlNwbjBnU3kvbnJzN2JVU0gr?=
 =?utf-8?B?UHNPT2pDMjBrblFoTGlJRXg1SEJmY1QxcXZlN0d4a3hpd1JXN3pQVWMzV2pp?=
 =?utf-8?B?TGdlVTdhckxYTXZlTWdHUFQ3YWVqRnI2MjVlb3hDQTV6cDl6b3hDUEg2WWNw?=
 =?utf-8?B?NWdCV1ZOS3JQeENSei9YY2kzSENvZzZ5SVorQlgwUDhwVkNtOVVsUWVNWHZP?=
 =?utf-8?B?eFRMVWJYZW5uUHU3bVpnczZDbXhrdzZtU3d0eFllMHlJYkR0bjAzUWt0TGhQ?=
 =?utf-8?B?Yml2QjdrUXIwUm9TZm1wamVlWlp3S2ZGQWxWQVY2anVBVWFyMzAzZUV0Nzlv?=
 =?utf-8?B?NGNBN1RnR1kzVys5a01UMjYrN1pNOVY2L0lST1ZwczJpSjY3OGVKcE1vNGE4?=
 =?utf-8?B?OWRzUUxnVGhGcWdmZkJaZ1lDci9vcWJ6MUROMTVEYTNodHZGMDhSZ0VzaWtz?=
 =?utf-8?B?RGtRQTJ1WXE2L1dZTE9wRHNOT3REY0hodFpzMnpjY3cwZ1UxZTNLYVpmSDVJ?=
 =?utf-8?B?bzh3bk4za21PQWFoQ1NVeXFPUHF0M05UUnprakt5Y1VwMEYwUk5ZMnZwZjg5?=
 =?utf-8?B?T2J0cE1EN3RQdVBGazIyeE5ZNnVpTVpaMiswSzJmcExEU1J2NENBNFJtb2VE?=
 =?utf-8?B?R1l0dUxncFExb211WUcrZHdodW5qSlBVV3IvZmlsZ3Z2ckRObHUyM1J4eEFW?=
 =?utf-8?B?d0FFOE5XM3Vsekw5NlN1QUUrM1MzUDR6YnF0VDM5alhwL0c3NnNTSGh1YzZ2?=
 =?utf-8?B?SWhkOGJEaitzbnkyUnhIVkVsUHZxVmZxY2R3S3VGNyt3cmJIRHpITVVrUnNh?=
 =?utf-8?B?VlQrbWVxQzVIOW5GSXRoWFAxMkZxWUlSclc0dC9VVHhMa1FTSmlSOHVPV21N?=
 =?utf-8?B?cW8vV001bVN3Y21LQUZZYkxVR3BJUjQzanJLb2taNDdKK0p5c2hKOUh2RnZk?=
 =?utf-8?B?L25xbEQ4Z3AzcnloN2syUlllWmRjRFhTWnpHQVhhR2k4U0ZMZFVta0VtWUor?=
 =?utf-8?B?eDN1cUtYdVZ6N1ZWWDVpYk9OcjRRSzFncmlJSDkyTGJDQ3E2Z0t2c1VzY2dz?=
 =?utf-8?B?WWRxT1JBSDJpM3BUb1FLcy95RDdSNjVsQldTTjZuUG9LR2hYbCsvaGh2WUYy?=
 =?utf-8?Q?6veg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 23:22:57.3151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcf5187-b826-4808-92dc-08de26303e0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 23:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19284

On 11/17/25 3:15 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> New recipes for GPU DDK 25.2. Update BSP configuration files with new
> preferred recipe versions.
> 
> For the driver recipe, specifically unset the CC variable due to yocto
> appending CROSS_COMPILE and CC, resulting in a warning for the
> do_compile task:
> 
> make[1]: aarch64-oe-linux-aarch64-oe-linux-gcc: No such file or directory
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   meta-beagle/conf/machine/include/beagle-bsp.inc        |  4 ++--
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 ++--
>   ....6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} | 10 ++++++++--
>   ....6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} |  4 +---
>   4 files changed, 13 insertions(+), 9 deletions(-)
>   rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} (83%)
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
> index 0ea7bd7b..eaa501c3 100644
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
> similarity index 83%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> index ddb401a5..b2f5e4ea 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> @@ -17,7 +17,8 @@ BRANCH = "linuxws/scarthgap/k6.12/${PV}"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>   
> -SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
> +SRCREV = "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
> +

Extra newline?

>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> @@ -29,7 +30,12 @@ TARGET_PRODUCT:j722s = "j722s_linux"
>   PVR_BUILD = "release"
>   PVR_WS = "lws-generic"
>   
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +EXTRA_OEMAKE += 'KERNELDIR="${KBUILD_OUTPUT}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +
> +do_compile(){
> +    unset CC

This feels like something that could be fixed in the driver's makefile..

Andrew

> +    oe_runmake
> +}
>   
>   do_install() {
>       make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> similarity index 98%
> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> index 949c2d5d..e4b95f8e 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> @@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>   
> -PR = "r4"
> -
>   BRANCH = "linuxws/scarthgap/k6.12/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
> +SRCREV = "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19282): https://lists.yoctoproject.org/g/meta-ti/message/19282
> Mute This Topic: https://lists.yoctoproject.org/mt/116346378/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


