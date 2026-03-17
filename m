Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2954FD8768
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:14:19 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75652.1773753249342451518
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ScWNSCmF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.12, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2Ih6JE1KRC3IoLGhNMSEUY4U4yBR7kjgMpHKgbH0DNqDt+o3r8AQKwYrq59Rt0b3+Udbbe9AI7hUIiVzw3soEWg+sAl/Cif8dDdFVlJSF+cgihMxmA5L0nkjxJVvxebEvuewm9T8gAoE1Wzso50x6B7u4gHt07wDsvaaUbZjSH+NASfTelHAPNRtDOH67Ru0Sp891/T/bI8DoFEat4ifzqaaBNT2aP2X3dqGXLhtVsHwI5J1gDghurQGfRAi+/dhvH6FzrekE5SEKXe13xhfodddCTrz2zgSuKfaxXJfc+/aU5b9wctR6xMIuB5ZZ5LmLCL87LVsrwFsCzd9dXr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ8uYHI2yJ4OAw3wFNMuB7S4u5zhDIwLsZ7og7dURYA=;
 b=JD7FfL0N+9mP1njkJHjWDSm/eAjPbLPr9CvSjloJuuK4laVgBr8Qa2RQrVWOXVtgEuxx9Ry3iyddNfmgmrE1y1Ncy540ocn1VcITvWUbb9ecM974xxfyVbm93fjmOaToTqkW065ILAULnXh9VmLcYz7H0DRqvnoftOEbctCJmop7UPY+++n35Ech44GTitQ6+lrR3SMTX+M8iIPT/bsfY/l0QlMBbo/1bUNTH6hCIysRguAikxTDc8z9RYRiepnz9xu+LqRvo/Qq50Gu97cICCzx68zJuFDYi/dyloS/GzPKXkBjS1dX2OZMN9cvzZEgVPmSDYJBK0agemDgdNXDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ8uYHI2yJ4OAw3wFNMuB7S4u5zhDIwLsZ7og7dURYA=;
 b=ScWNSCmFPYI2oGNhXTaFbh0gu5ruBnjM0gkaS9Vu519/kWethDE+3DU6LFR8D6CXH/myXqIgaeJv6r6yT8APRi+peD/zZgiAHxbdtfujoeJYk9rVUL1k13EuTZnnwI3ou/2Qg5OKSZwiESx67eRKTTDwta/SCsAX99F1x4KU+6Q=
Received: from CH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:610:32::9)
 by DM4PR10MB7449.namprd10.prod.outlook.com (2603:10b6:8:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 13:14:01 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::92) by CH0PR07CA0004.outlook.office365.com
 (2603:10b6:610:32::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 13:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 13:13:59 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 08:13:58 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 08:13:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 08:13:58 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HDDwxR2737838;
	Tue, 17 Mar 2026 08:13:58 -0500
Message-ID: <2eceffc8-71fe-4b1b-b84a-1c27a0c1871d@ti.com>
Date: Tue, 17 Mar 2026 08:13:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer
 for PocketBeagle
To: <leon.anavi@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260317083729.1640948-1-leon.anavi@konsulko.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260317083729.1640948-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|DM4PR10MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 94689305-44fd-40c6-e680-08de84270d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|4022899009|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	f2bYGNgb0LWKOsGyOm/2zAsXJduTfHGN0PH+8oSkAhlMJ3SRC7Az7ZWU4nXKPpImGy7h+zI2PUwu5lblcp7hVfbV0xzN+hHFaOfPKScUsuxJQDX2rFsZXT5xv+jHo/QLthpMgXh8iwSD0AczdadhZABPEITUwRoI/JxVevEtdqGn62gsvvJrB2svq2R8bTUykB/62pDsxGPjW8dkyuk2BQpzsfrS5sfMKFSf7rDmd4r1Uc1dfS+Je9GOIVXJvudCHf5v9yMzjcag+0DribBL2oqpzYGsWu/Jh1TNd+/6mwvddvDrcsJTE9Bzn8kSFVKX77I/2tSLeWWrwcLgdarZI1jlQjy12oOFBCTtvJS5C8YUIUwq3KnRYuTBhvA8g3uvRt86UxiuL9UqFJ34sYkZSRaG9UQBqcaeSfrU1s+2qeYD7rLr/ujT7FqmwMjXvfrVOj8Ct3xn7SzxQeeVmX4ch2NZgarE5IOyoB/Amfe09ATI0q10V1CvTkCCX4Hdj2f/EsAEQnCsqur821RE+7f/txLAkdvp0wLLPtLnryJAS/vuHMc0chHOeGLWPQpV4y+Ge0OyZ4utZIiQUkIc6NImnt0apx+fA6mmZxGanAjcj9YkA37KDa8kTzAfKKvbSwckZxLPz+ga5kEsfAPab03PwMThl+RJ+mBrpbFzIjjPol5/V1AQJJPkMfMsnH2G3R48QyVvb5UTNkCNJicq2Simu0AJcNOUAOYVot+BKr8yNXU=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(4022899009)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BS6lb9+k8git91dwS2bkgWVpnYPyoCZkPGwk0dcjEF8sEw3WboCe5NOARCW93OSJMxJbkIAWgx8P2Zq2Wzu5ehQc85Whzc/euQM4dTA2iOJYgdSCzRdKsLKLIRlPBuZc88kQDxe1FJkAULek9zeHXshbcZb52DG9BxK/HsHzoOIkpwz5Yv6shYnDgpm+Xj54uVefD74u3fUwTqoeWH/UjfQ/I34NK115l02C0wMn67+Rw6t6pYywZOWPj5t8qdVJyFOZ4v47crNmN9Og8fnmIdYBl3mme0rzV53AWQ21f2lbsz6wMuFsmu3NmEp+aD28+hM1RE1pMuqgZmWoP0eXXkTr1tsplNg/rzEfpsqHL7VA4SK5kTzJb+bApfCZYNfZqFcMcJQjKfxsStKKhUefjNYhy14/BAfR3LTi5WIf4yLhIEIXXBMt6Szy/7QSwUUd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:13:59.8048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94689305-44fd-40c6-e680-08de84270d8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7449
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:14:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19734


You need to add the patch to the correct recipe...

u-boot-bb.org-2025.10.bb
------------------------

SRC_URI += "file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"

Just adding the patch to the directory is not enough.



On 3/17/2026 3:37 AM, Leon Anavi via lists.yoctoproject.org wrote:
> Add a chosen tick-timer in version 2025.10 to boot on PocketBeagle.
> 
> Fixes:
> 
> CPU  : AM335X-GP rev 2.1
> Model: TI AM335x PocketBeagle
> DRAM:  512 MiB
> Core:  155 devices, 16 uclasses, devicetree: separate
> Could not initialize timer (err -19)
> 
> The patch is based on the following related discussions:
> 
> - arm: dts: am335x-*-u-boot: Add chosen tick-timer
> https://lists.denx.de/pipermail/u-boot/2026-January/608684.html
> 
> - pocketbeagle stuck in boot loop with timer error
> https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=269124
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   ...s-am335x-pocketbeagle-Add-tick-timer.patch | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
> 
> diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
> new file mode 100644
> index 00000000..424a4bb3
> --- /dev/null
> +++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
> @@ -0,0 +1,29 @@
> +From 55ee5fecd68d0858ba6743137162252adedf2f72 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 16 Mar 2026 18:34:58 +0000
> +Subject: [PATCH] arm: dts: am335x-pocketbeagle: Add tick-timer
> +
> +Add a binding for the tick-timer for PocketBeagle.
> +
> +Upstream-Status: Pending [https://lists.denx.de/pipermail/u-boot/2026-January/608684.html]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + arch/arm/dts/am335x-pocketbeagle.dts | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/arch/arm/dts/am335x-pocketbeagle.dts b/arch/arm/dts/am335x-pocketbeagle.dts
> +index b379e3a5570..02e3aac5606 100644
> +--- a/arch/arm/dts/am335x-pocketbeagle.dts
> ++++ b/arch/arm/dts/am335x-pocketbeagle.dts
> +@@ -15,6 +15,7 @@
> +
> + 	chosen {
> + 		stdout-path = &uart0;
> ++		tick-timer = &timer2;
> + 	};
> +
> + 	leds {
> +--
> +2.53.0
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19732): https://lists.yoctoproject.org/g/meta-ti/message/19732
> Mute This Topic: https://lists.yoctoproject.org/mt/118361098/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

