Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0C3CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:06:06 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80710.1781013958002103532
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 07:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HUuZ/N0J;
 spf=pass (domain: ti.com, ip: 40.107.200.11, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFbuY1u1ArWTDcfLbVSn8S02l+bhtY7fte2WwTkLBhYnhMBoTIXjW721HWY9oQEin3y3kMtTwPysNhdrjllWHuKsgdMqOqEGNutk1P/zvLoaBk7blN8OsaoVrfTXQf+pUzInBmKFBFZAQCU4DVc/drzmI4aqiiFz9LfFMj9ebq8fWG7M+afw69RiF8Vab68a8GfQ40Nh3cGJdRGbzHjV+CK1d36i1upp2yRIRim3i2P2bV7jqn4HL85p7eeMDORRB5coKOPITefomzCt+XtzCBQZ0vOC4mxFV/+4fHSMTQAf8SgstwQEMHdYDcNnJkTXVFifdJqeV0zuABgzTDe37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28xgdUJ68fn1sW3rPZM0tTmi1ZpsmkhHuAMp6bum1E4=;
 b=yEjyr9r3a3eVm8kwMtbVnZ/og4urDYKVSS1WuNvX5A0L7998kVtKr2mwtXm9WLIbNnu04to7fHLWLZijkAqTTSxFW+xkGqpLXLQKfDg022cESwnJyRCHCTJPJZFKJl9Y6Fwkl7j1pDrWlk+9go3/sm6zkAqkAldJ2Z/orlOu/wzf0JMW5q4zvzS6btGRLBC5+1tov0L/aL3zu8c4nzsGJ85cCimQXZJkjjSlpK+fJFD9G8C4XNZEFmbN2zPdWN2bGi5vw4l0NMZr2B+V9CPgc608Q0TBdhtKv55Nk6ixa8gSWDGIbmNicFkGONbIjFQL3vP6nkV2ysPj3O7X56XcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28xgdUJ68fn1sW3rPZM0tTmi1ZpsmkhHuAMp6bum1E4=;
 b=HUuZ/N0JkNWYApw3/RoB88sGxfMmWocfOH+6nu+7iQTPpANyUc37Gb4bEp08ReYNoCyCdOSrv0SeSbHiixh2BKz0ftka/UMhZNSy93/h5aieWRwHFw3sJwJ9Ko0F9e6ShNRx1D3waTKJOcUD8TMAaz1eF7e2dX8YYcvHdUd/n2I=
Received: from SN7P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::29)
 by BY5PR10MB4259.namprd10.prod.outlook.com (2603:10b6:a03:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 9 Jun 2026
 14:05:53 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::a2) by SN7P222CA0015.outlook.office365.com
 (2603:10b6:806:124::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 14:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 14:05:52 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 09:05:26 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 09:05:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 09:05:26 -0500
Received: from [10.249.64.82] ([10.249.64.82])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659E5PXf1227564;
	Tue, 9 Jun 2026 09:05:25 -0500
Message-ID: <c6c07667-08a3-4b22-88ad-9ae5542a4d14@ti.com>
Date: Tue, 9 Jun 2026 09:05:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubifs and
 ubi for beaglebadge by default
To: Yogesh Hegde <y-hegde@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>
References: <20260609103052.2451227-1-y-hegde@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260609103052.2451227-1-y-hegde@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|BY5PR10MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ffdd971-aa8b-498b-714d-08dec6303743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	siPfnXwRIyPExW0LZ5iCEzUZm8M8tKZif3EBQm6TKby0OZvcCYBXY/uRVDVRwLDbNvmv2OYiEpe7JQZaOv1isfdX6bashQo47R3pY+gtOYO2dmNEth2R2+iER/JSsWA7rG/3qBCEm5KQb7x8oyFBUfe3jBcwJZTxEogTajeQ9lFILOewvsRh4ALbxRfrrKqN4mCxkklnkyDLg5SWsEi1VOlZErHVsQNO+RbcA909bVnEEos7O0z0DmviKYpfAbjgzyVqPAFw+oTj7hQYsCLt6c1H+T7eaJRycA+GZ55O4wR1zQ396Gei9Z2mskeYzDSjzsB3H/o/Fzp/QXnre7xpWSaxmXVRt8La9EWQfHWQy8yVq+iArhiSFrzUJWGRwDZ72fxFmEG/rX1EUtDnLgEjRg7sSWMALaG2KG5u6279XN1Rf5bus4GAVvL+W95iz64eena+0nhtqSjEmXA3hiEH1+CXcKQXuYdkKUBlz0sfV1X/xUsAIxIipPGK2rQPYU06dz/7oX4tM+GRwwUN44DFXfgnuWqzQEor8msGk1NAMVEnLRVUZv9yzbHN3k0kvwAzpIUcKHxsYKQWwfUqzQ7BEOXTi05cjlU6q0ykT5AdEz1uODdxemOgo5iSaz2SeYqYd4jJ6eTYWO5OhhN9k96MqB4C2U6CFW1nT0AgA1eYnFzHy/Ci6DM/8zkSqEe8gHjny4EBPd6cuASN3NoRFf0feI2G9sXPqqeiXZ8QEKoDdS4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mCFEwBbU3FkPhpCNlxHV6520V2vBmZ0kDEhGt1zynoCrDB7sqTK0Jmgo//aGZhOew7Y8h/ahmDIFfWmiWr6vP7oqeVHQD2Ev9ng/8M24Snz9wYlZ/qnjbEATdPGJ+TAIzV6TjGApOMB8UapHpE9a1Y6PWLR6whRmMRAGqx5gBXCud00hSWZVNsK7kTpZ2JWi3XDxRHrTvyz4OyqLnr43lHAy9KtrLsRYfAC1Hhfmjxd/QrzeBaYfAWco3qhwbpemxPQzEEKSDn5hbwOUpCXn05F1P16xdA5yFsHA+Y1pl0RhHDDEpzVghXGNRAn6uAQQqYdtJMMGltrfpWPoZIxoW+pRX9VXxyn4UEBLbNpTVbVAkC8qxcnatudWAafB0yLuAvBhOT3r8jxVI9FpwkSXiwFFuNCOQz2Xe+BCKciYkaJqM5pql+tE2dfNxvUaiptC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:05:52.0359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ffdd971-aa8b-498b-714d-08dec6303743
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4259
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 14:06:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19988



On 6/9/2026 5:30 AM, Yogesh Hegde wrote:
> Beaglebadge has only 256Mb OSPI flash and except for
> arago-bootstrap-base-image and arago-tiny-image other arago images
> doesn't fit into OSPI flash. Hence remove ubifs and ubi from
> IMAGE_FSTYPES to prevent unnecessary image generation and build
> failures when adding packages to the arago-default-image.
> 
> Those who want to run arago-bootstrap-base-image and arago-tiny-image
> on OSPI can enable UBIFS in local.conf .
> 
> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> ---
>   meta-beagle/conf/machine/beaglebadge-ti.conf | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
> index 78525030..5295296d 100644
> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
> @@ -4,8 +4,6 @@
>   
>   require conf/machine/include/am62lxx.inc
>   
> -IMAGE_FSTYPES += "ubifs ubi"
> -

If you are going to remove that then shouldn't ALL of the UBI settings 
(below) also be removed as it does not make sense to configure something 
we are not building?


>   MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
>   
>   UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

