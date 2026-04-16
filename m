Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B9AF8DFD1
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:05:54 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27651.1776377144927937527
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 15:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=flQYEjiy;
 spf=pass (domain: ti.com, ip: 52.101.57.22, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKiulG1+gKrCtEKgjQ/Fma5dYE2icmSHcyTz75yIACFa/jPzZT7BwzZ4f5QOpVY/Mc5QCLq5LpdySYAQzSjDLHfppDJy3ku5aR9STTb/Qq4/o2jXG13FXPRp0aZdVT5Zaz6dHVhRqHfz+Iaj9+7TCAYplXSFnGwVVvlnMtZmNwpxFfiWlpe9A5BOjY+WL1ZqkugtrTuQCdqwlR6rmjH8NbcIZ/sCeWJ3ArtX9+fJtq5PuO5A55A4DOQb4PDXSXL4N2I+fcWCSRlrrK9Ll+d8W2WSXeorf2eqkwOXxcZtoxbR94Y5pp1IB9PuJ9yby9mhcEgiEWkeV6czlJeOKgII/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8rTSKxLz26H7sx2GLB5rVe08gI1yrmdg2kUF8VaTAY=;
 b=N1WRoCZ3RJsv/L8VxCdAJZsnDKzi7KE8lJ+bubeCLD9OFKqLr0OtEzc6WDxSlm3uekerMTje/QN5eBJatb6ElzEZLnCmYVy1kiN51mFVzPeGBztsq7HidV6HZY9bJPGNja0f3h1+mXEdQSJPOGq7V8hhw55RXsqDLSNvzPCkToocmDEE1Vi52hyAcrJvYDtFo9lDt8z1hUTiDFiXKX80WPsirGYVZsx42gF8RPxGa8EsxgBk8TGyVjBOgmJ7vb/fqrdo7VF0M+e0hR10dcla+u9SJ8TIWYjXTdQrTUlZ5OKjdAvH4IDSa8+Zr+ZnDOec8qz7NG/isi20gFsUVnGN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8rTSKxLz26H7sx2GLB5rVe08gI1yrmdg2kUF8VaTAY=;
 b=flQYEjiyV+hiWfB3WTmk+/SUWRUr8qaiuk+L/kKg1Lyl20XOHu4h48/Zcane4WuT884sZ41UaZi1IVqn+DqDiRsasl28J66Dvz+JMG7EBqE6bizdVcVpPdINR+LAYscfNRinM36QWmUwPm1FRn0tXnn+GptDFcMogyY2Q2Z4GUc=
Received: from SJ0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:a03:333::16)
 by SN7PR10MB7001.namprd10.prod.outlook.com (2603:10b6:806:345::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 16 Apr
 2026 22:05:42 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::13) by SJ0PR03CA0101.outlook.office365.com
 (2603:10b6:a03:333::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Thu,
 16 Apr 2026 22:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 22:05:42 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 17:05:41 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 17:05:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 17:05:41 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GM5f7c771049;
	Thu, 16 Apr 2026 17:05:41 -0500
Message-ID: <eb1611a2-dcd0-4e39-91f1-a8fca66f1cbb@ti.com>
Date: Thu, 16 Apr 2026 17:05:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] k3: use ttyS2 as the primary console
To: <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260416220111.3933721-2-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260416220111.3933721-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SN7PR10MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d48d629-21e1-4b4e-a246-08de9c044d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9S85jsl/14jUUrOVlyWykaCL30kZwBdqQM2IISgOaODkZIPo1t2I4rRlYBp644tZ9QhPCMi+PE8j6TbfWtaNB1LAfgAg50lTDLEQbxNtIJWhzpWU+zK8jy1e2/oiRQHzk9PQT1OFkUmMnjggCpfCrg+1d3M4z4z4bQ7lZuxLhaA0Bo5XnB2OjePs0OKL5sqQYO+33A7rVwsjakAZbaLLoMnksSSLGigtlnQAmDrMqLzyTX86lCVsE5usMk1bFTwpHmhShAJPuoB49qE2vu4DJ9X6NFffqDtUcHG+cRFmOSpjZNtb7h6xC8jufs6BH8rL0o+OQ9xMAbnwIBW2leCY8cOGDFITSEsi/cFCss6d/xNQTzR9ZLpVf5e4UIHD2U6vvW2ensWjMoDcOp62grUuEmSPx5AylNGXFlkDwtKqx6gmZ/sGtrlQpyM3nDAZCBJ97L5W2GX/sliVT5COI/AhvG1xp8e1uTA2YCD2d59ocuaMp7E3nu3HYKGgVW681eUMkHnZfD9rK/SkXonNsThxMvNRALqbY2gkyqjfxeuIgJMc0WZ/hrRojoJB/1TwmBcFIWOLwiJzHBJZepfQCnppvLwkcRpj/aBuJPQznCLWsaY3Ic8Z+cuRG9WUV87dtbIUHnpT19pMVTyYOKOSbhyS5/xLyQ4fnmgz10k9ovaAr4MCDuTz7YtwAjMhqjDT4EH0YAahzx85w7PQouiGAiakgmiDW8ZRCDACJZcElKXCmL5JzCWa3gbP1CGd/IOXmp+9epo17TYCjkLUFxhgTw1dmA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PYtg2jfL+E74/+IiQkmNxqzicC943edy5gD6aConGkvHMWTGnS9UBAaHaXKi+jzSsNB810BRarJtR5znaAUksIBbfM21OF0xqlgZbR+QRKdP/zp1G8wGhKqaL+s1GFRMAGDHf6AK1p53V4A7MvQz7wKG54yMZ5Zs7qo7H6dJqQr+6PY280GGFT21HqtWCqKMMmMra/vojfjlMIJRlxtp0JWtvfr3vcEyNX1FfyTJKQdsPxskr136ifnNmCyShOtX/G71ryhu1h9SRBYBgPKuzhdwjf6c13FJ0EgfnL4/wctPW3iG5QtWDNjtTjFG43NSZDW/fR0D0hXNaS0KeeuQ4MK4fbFa2TgJxwxG8WVyB3YykZ4FOfEqm6xM7gxPl/Yh93gh41uglIeMpWhL/3HnxvviW86Tgl0AW/+gw6eZtc1sifONBGoxZ5J7g2Jkt34a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 22:05:42.3836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d48d629-21e1-4b4e-a246-08de9c044d5f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7001
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 22:05:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19860

On 4/16/26 5:01 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> The ordering of parameters in SERIAL_CONSOLES matters. The first value
> is picked as the KERNEL_CONSOLE and used as the console definition for
> grub as of:
> 
> 9dc647e5 (k3: set console parameter to KERNEL_CONSOLE, 2026-03-18)
> 
> Ideally this will be split out into a separate board configuration
> parameter in the future, as there are already some board specific
> overrides right now.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 3138cf08..6833789c 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -55,7 +55,7 @@ TI_WKS_BOOTLOADER_APPEND ?= "console=${KERNEL_CONSOLE}"
>   
>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>   
> -SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> +SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS0"
>   

Simple enough,

Acked-by: Andrew Davis <afd@ti.com>

>   FALCON_INCLUDE = ""
>   FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"


