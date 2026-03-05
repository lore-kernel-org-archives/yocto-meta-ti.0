Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514B1F47CD2
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:51:58 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54640.1772743915885734554
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 12:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Za5ZmC7U;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.40, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcdzZnvcXQrgG7NfU1OsKT/FJ9pwA7cTeoSb/voZutnzzMU8iracBDR3aqXnTABz963duFPxIfI6j3sV6FSQUpWsGdqHcsApF/7bW5CpRzSg0bm2py68ZAXvq+SIj5OAQvxu6h4I7Cq75RCoUfWGhXqSUhGdj/k3scLtHMn20YfF4rxPU7aRC1TWsw9sh8gfmmoNsu5ahWOcYc8KBzE/95bkz2llfflCeXoeq5xOen3QS2uDToUJrFL49xdQBVPMrCNaVLoMeZu3IH97wsG37eEvPIMvXdQZHP0Nn8eJrzCWTzUyPfoS8dXmORBl8i8JAeLA4HwHkuTa+GW/33ZIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPJPrC2taGFAV6Y7e4jFTDhGrZSp5e2TwutHGCHae5U=;
 b=aXF3UL5w0I7bGcL3z2mtJMMYP7FS19N6kdCtwpjq7+d0SE7JgJ7djQVjRNF5ZAoMEXIKQMk4EHQgMwwUCtK29v0BBf+AyHBXVnCC67DJCAsRJPW43u/328ndrtRG1ud/VVkSVeCMIKrjPPIUPPT0VZBTmbyxd8RRXooPgd3GH59Y77Nbgw68V3zQ8LXyhXafvZheq/fXTr/oG6CmgPGemRUur9oBgol6ZTDbr8B1EyxQy2jFkUSD3Y04R1MXl3b9DVs2xTzd4EYNAVfRf7cYaj8JIdfqdvpdAxv6TCJuj9s2r/VP24zkvVJr3u7Su/TKmXMW4nF1ufsyjId09aqe5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPJPrC2taGFAV6Y7e4jFTDhGrZSp5e2TwutHGCHae5U=;
 b=Za5ZmC7USynaXsOMAWhe3Gg66OII1zaoDqAiQpFWFkRfz3dMl1QlcVAgvgc7FjZy2AoglVrvEMaDuWSnjt3kIdJcI9pI3Xw9s9NGCUikYkDff90h4453dlvRkeDy8nHuYY3iWFm9+tU1HpZuhzatx30WC/3bHETOJ5BQcuR1nHY=
Received: from BY5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:1d0::30)
 by SN7PR10MB6642.namprd10.prod.outlook.com (2603:10b6:806:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 20:51:53 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::b3) by BY5PR04CA0020.outlook.office365.com
 (2603:10b6:a03:1d0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 20:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:51:50 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:51:49 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:51:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:51:48 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625KpiuS3018665;
	Thu, 5 Mar 2026 14:51:48 -0600
Message-ID: <8cc3161c-68bf-46eb-b32a-5c6644889416@ti.com>
Date: Thu, 5 Mar 2026 14:51:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 3/3] ti-core-initramfs: Add
 luks-encryption trigger
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>
References: <20260305172223.3684445-1-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260305172223.3684445-1-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SN7PR10MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 344708cc-d974-4418-8a6b-08de7af9067b
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	3rafcSqSw+oFjFk+AFCthXHl011kGRg7T3ZXYSFyJTYnaDNOova9Ai4EaU5Lfng6BmeFXpyR3insgQ0l/Q3j7XOsZT9lHNgYzl0WDuLq8eJ00IzVKmttCy/01jznihh5WB2cXJDd4Uqr3EVPMQEJueZxp8w8mIvNKL2FgSjUPmHZXToPiMSsxHDMbhtf5lBB9HA2pBbRemjYmou9AKcKpzxWQaOmpBe3VzpX3NRjhSZqC68hLf+1yUlYVosErylvXbCy02sUrWzEhxg909p2DgqUYq94TuwQg0MDvZB1SerXxKj2or0wx7uXJYQYLzPaPkr/vbBnzZYf7GysAMJ5DXEk5AWAP9TqpEvU055QztaNi1f/ikMhzwrdYWyQqH/oD3pPOB+QrXby+Y7RArK3F2IjmBFOpiDm71aD0KwxCLu2Pybib/n2IiXkZ+YaXCThlzqtaBe3kXJpyLv29q1y9G0HPczkOOk0052QA3lrfALGVVwhYmG3bxXvrt3OSggl4ugU8IxmleAEg6L3XrVu4y/ioB5/Tjv8x3lA8jTwpGmUSamG77C5iOeNGeVAnNHTvaPUNrNxoPEe75HFJZC/ucc3pxjq+l7AX86GTSvcmzKgwVb1fiCPPsZLbaUJNvVfWRY0fR33km4Eq+wKrcBAlhhFxlVUtatlOsCE5T6MDtjMf+ddBgH/V6w/0aPmuWFA2oYjoWj/kBIn+YLxAN+3kuF1gOwuyyFVCEc7yCTHxGU5JKRqvW0OCOSyLfBmtQVlZEgo5JQg9HWGPKekcfPJpw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PgOw/xzshqA0rtUErKQojd1HmI2zGxwR4fHB7+mvAHGwE6ijgIrmcNuAHtraQhmEwwZ8aI2j82zaR23mO1gx5GnTWI92d0FhtG5oWj0V1+HGCWs17r15PV0+jbZiEABWqJQoS+YV1so+e1MX3bLgqCBXCJBp0ujcbDjxF8DfdBXcxYUfL7iw9YJ7X7C6L11mLERDWPxA53bH5iWpY7d1xEMisolMtdlMZsh9Wb0kd/JldJjDguLh5gegCw05iRlxiapaTrVKKG9cJef7x9+jOnAfoMPItacn2L1+X7NsvvwhkEPvbbIE277uWHZCLnfENNT4tCtWc/hrKyOkyhsKN4ARgai45msPs3r9zlWeqtY4GrtZ6dTaOoEr0IlHZq8k0aY/2Jtgr3jNP1i/plv5o6AQi60TLpeyrJw45r+CD/gMCtP5qm0/8KF4GSWGuhy8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:51:50.6095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 344708cc-d974-4418-8a6b-08de7af9067b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6642
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 20:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19661


Follow on comments from first patch 1/3.   Start there...


On 3/5/2026 11:22 AM, Shiva Tripathi wrote:
> Add luks-encryption MACHINE_FEATURES check as an additional condition
> to enable ti-core-initramfs generation. This follows the same pattern
> as TI_CORE_INITRAMFS_KERNEL_MODULES and TI_CORE_INITRAMFS_EXTRA_INSTALL,
> allowing LUKS-encrypted rootfs support to trigger initramfs creation
> automatically.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> index 9d3cc612..b874a197 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> @@ -5,7 +5,7 @@
>   #   TI_CORE_INITRAMFS_ENABLED = "0"
>   #
>   #------------------------------------------------------------------------------
> -TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', True, False, d) else '0'}"
>   

TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if 
d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or 
d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or 
bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"



>   TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>   TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

