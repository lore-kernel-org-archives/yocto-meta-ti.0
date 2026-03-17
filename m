Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3022FD877B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:06:00 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76817.1773756357387273772
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 07:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mH8kdl2k;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.57, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXs8jJu3Bny0rWEdPJslXc291hwegHMcgNP5XY2ZFLSc7df38BjBLUmGrJija9gJqTgnktipsteM/OC2QVMcCr5r52V/JUxmikgnIeP/BqT8zyt0s/cLMr7S2mxa0NdE7ajJp9eUl7zpDlRh3ql9445/TYsOPSzAxIRBgYj/WIQjaP3QyqgIbln/DksaCDRGttdp8swxaGg2eTHuMZtMTN8CDPNX2ZSBSRROhT0tV7vLwdh/FOP0F2UPiT4vtQ1EmGv+EwCl8Ux5OhGPHTxKj6C26hg4TIkYstw//R56gpgZvb20WxbsWIYS61o2e6tBObI/zaD2NaFmGN/A50U7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNvKbjVAmBW+mr9sN7qzX5sVkCxnUWZd9VT92YiIepI=;
 b=waRIo0VdG3I1oIWPssb4mER/CerPOOg+qpy55EztL6kGRlpKObv0RT830OS2iUTAHLIuDS8i6OcJVP6OC0DMK3CFJQ6ArMWdtHgGM/XT06R1lELzyfaUVnsK31+vBitS/P3Nl7oAq3rFahLZLyKZjvTa1aRi6lTqX9JE5Z/Xg2Z44j93FRg7sJCi41v8Qd9bTu47WlVZAyTHiO1IA1tAEN/+4JlgLphFbiGaWBk51kW1X/h/lcKqL4B692okU3GUvqur16al71aVYKfoWTvIwT0cpWgBLGycI835gAMeRcYfNYx0iYXNkO97pxwz5WhH2NWeYMeZ6ep1ZmI5BlCT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNvKbjVAmBW+mr9sN7qzX5sVkCxnUWZd9VT92YiIepI=;
 b=mH8kdl2kgYTuWu9dj01sVwUbuFP1lAx9+AXMa7MM5rGAnzAnhgdPYBpdXXipVhzOVGeF1tkW1fdgatpJalM+zre2339KMRfNNoicejP1M8029tc2wdJ6lPQ33ihmtOAp+CSQtbIHHF25PRrZSyaL7hS2lAmdVBB+3EaYSBK82Fs=
Received: from BN9PR03CA0598.namprd03.prod.outlook.com (2603:10b6:408:10d::33)
 by SA2PR10MB4473.namprd10.prod.outlook.com (2603:10b6:806:11f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 14:05:54 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::1) by BN9PR03CA0598.outlook.office365.com
 (2603:10b6:408:10d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 14:05:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 14:05:54 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 09:05:54 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 09:05:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 09:05:53 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HE5r8O2802904;
	Tue, 17 Mar 2026 09:05:53 -0500
Message-ID: <f15d818c-96cc-4b3e-bcde-bd618c7890b6@ti.com>
Date: Tue, 17 Mar 2026 09:05:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer
 for PocketBeagle
To: <leon.anavi@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260317133743.419092-1-leon.anavi@konsulko.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260317133743.419092-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SA2PR10MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: a62f71be-d3c6-4d85-baa6-08de842e4e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|4022899009|36860700016|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	+4fuITpr/HC4T2t2VuVSccN6soV6nPmkBYsDlivF0JLBr99SlO9pBXMfAXZ3QcZyj7Yy9iSkKmkfotXHK9JVeQdeVvTbdDy2DomN5KXywi2ewYwV49ByV8Wn/IxCdqmieSS3AXLd94BCegLQPrzJLx4tTKLcAcAv0viiMXveA1avRNSGjB/Y5w2HcxpwY6CwlK9L9juye5buUty+OtM5oLDUjW7BAiCiq/ifXRKIVp5vyX1NWMef45ymfySTwIqog/nNuUtF6v/VIUNhsFEwXa3IsZRekUziTOI7HJVoMo3Y5PmpqaamvDXxMP6O6D4t5chkb2aDw4SaNXaRlKAS9kgOOfdSKzvOuy/ty/yCfksLIEldH5zyfJv5+lhtuxiQvGadqsahKFPTmO+TlWATN+ll/SHcVfq64Bq46ujwF1dNrji7rQk2dzdhZwVe8WJCEtAY6cpDYUFpo21LQOgr6B0nA75yaUS+DM2vy2D2N+ggNF9KtKrQusgTohDAY0/6+FqeQu5RqXXkxq0PcuqIz3Nvz6Z0kOwkB7QwhQlMxsJVdS4b+5SsIG2CWY8NxKrgrtmIsu5HX+gjCwuQNmfxlj9wmXbwzSTwPZamY3TcoenFXPBDh+NaMFE/adX8ro63KYGmfkbWidC84mmu9skT2ub+VSGu8yjrpSnssaM1s/OjzBcT3F0vAeR5eQ/V21JaCHyvgzkyp/tBznknjXgwhA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(4022899009)(36860700016)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oONSm9J2Z0/G6G5H9xXrWH42XoZyyG1M6PNGVvrIToSUeKFv5xmn+6To6mbtEkQKRef6KdTlkyMHqwyqRWH3P0uFRDYOnXSDb4O1YpxAYafCUvM4mzrEn0H1b9ackySS8GU6yap8ULdEtUyqMM67AcXuB2IQWJVpy69tyls2EZ0S7bCnQDA5Ns7qBjXq+vfCRJqKPt6b6jtj/UdldEZsFu3fxBcH5Hj08dFlLMyiopvywWm3KDQVV+Rg9kai/+NqnDJRZV/J2NfqXY0DbLrYXPdkVDYGsRU2JK5I88/+Ec5+e17QI7jrwfiMQg+2+uJ00nJtY27nNpGTpf1AYWEVVrTZy3Yt1beCkOWema8HIcxi/HLn4/OP30Y7bcUNcWwJ4cFCW8h4lVwHjzmFVjAL1zHF+9Bl3R9sFY6nc9pLprssd+0lHEw98FQddrT9aiQe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 14:05:54.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a62f71be-d3c6-4d85-baa6-08de842e4e13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4473
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 14:06:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19739



On 3/17/2026 8:37 AM, Leon Anavi via lists.yoctoproject.org wrote:
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
>   .../u-boot/u-boot-bb.org_2025.10.bb           |  1 +
>   2 files changed, 30 insertions(+)
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
> diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
> index 5a8abec0..1c4f0691 100644
> --- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
> +++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
> @@ -17,3 +17,4 @@ SRCREV:pocketbeagle2 = "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
>   SRCREV:pocketbeagle2-k3r5 = "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
>   
>   SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
> +SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"

Is this for beaglebone or pocketbeagle?


> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19736): https://lists.yoctoproject.org/g/meta-ti/message/19736
> Mute This Topic: https://lists.yoctoproject.org/mt/118364069/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

