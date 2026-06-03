Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFFECD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:39 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27731.1780512576529789728
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 11:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=YtFRCf56;
 spf=pass (domain: ti.com, ip: 40.107.209.40, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vd2ESMZ0qbggENQbSJ6MUhYo0PSB/NU0vZGklQrArt364jLY2wmDeWrErVRstU7+QeEmBBXkXwjMRqEhW66QYsHCf/f+J8J2Y2ibnyN0Ol6K82rUGQuSJDEUNbWrHhfb8yAnMnHSPy1VPEuyg2TMswbdJqCh0G5ETr6ss/wKMwZ1Tp/IOIVEPrE/oFqXlSVS3YS/ie6nMafUO4HDaPAhWOoEOYikYmTuda38dxaUeTB4YuVq0XlQKA3QaBX93Xpc6a7zAAiznMPCd8eEpeRZ+0OzalLTxRASCYZTO4lrWFUNOeXwwJOP7Zzpc5cbXkK+FSvILkfjajfCz69CN18cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51QadkT/NwtC+QC0ylRSvNEid0HbaAdKVaY9/xfX+AI=;
 b=JeDiuFQMwKEZtWtbpQMNIjuYssbKkQUgcrcwQSxs/et5bYy1SaOK5+Lh1WxCFy5o1KAiTybqm/ZMwflhPYAoL1Toxn3pJ4TVR96Yh6QvL7boSUFv+9jeB5/rtmIeaOa0AU5PeIy6SI2sIKJO5gMdtv0/BRziD5XSTaJrN+AefiFGJW8wVIEky3suHPnE2x+D1TxgnKSnSnjCDywk5z19qxHKC2082xXRWph80ry2uFnJAGINep6JX6yNQtwKNXiKZUyhrc+XVlZqifN1uZLlFjqCMFDfyIDk/BaCu/O3oAoOJr9hvgv2OuLo/2OYyOh9JvIoWJQbZbsCFT4h4pnrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51QadkT/NwtC+QC0ylRSvNEid0HbaAdKVaY9/xfX+AI=;
 b=YtFRCf56CCzycJhRR5N+CfDu65k7/a3Zm+vQoLpSyyE5DW25fRt/ttq81h5ZWauhynv6ig6N48M/e68+MmHyLf5A8nydetoFxHo2hHDopjgK8aEOhPc8OvEBI8sPvjTrtdByYfCB9T6nnqt7Kpry04fVCx//zpBmvtVHcqvWRO4=
Received: from CH0PR03CA0413.namprd03.prod.outlook.com (2603:10b6:610:11b::11)
 by DS4PPF66324196D.namprd10.prod.outlook.com (2603:10b6:f:fc00::d22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:49:29 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::37) by CH0PR03CA0413.outlook.office365.com
 (2603:10b6:610:11b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 18:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 18:49:28 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 13:48:53 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 13:48:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 13:48:53 -0500
Received: from [10.249.64.7] ([10.249.64.7])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653Imr0i2323460;
	Wed, 3 Jun 2026 13:48:53 -0500
Message-ID: <441af4e9-461d-4567-8ddd-9f5387cb35f6@ti.com>
Date: Wed, 3 Jun 2026 13:48:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v3] ti-img-rogue-*: Migrate GPU
 driver version 25.3 -> 26.1
To: <a-christidis@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260603165354.3073981-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260603165354.3073981-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS4PPF66324196D:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b15cd7a-f8d2-4a5f-4869-08dec1a0d741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9LiJjF4ZJndb0H32xQnDiJ20ri5ejo/775XabBHM0rODk7tEFzIZHTLBVpV7akptImcbST0BQZ944aXw0cALY/0GUblN69IsGo3kINJf2ATHJlNgTsHaj+WbvjrxQTjfMOD2NYGWDAVmkSK2mc/kRoHEYbz9NJzICsFlS6i8b5Yf52SZ82JdQF7ioHKtuHoGchODmiJmInaKZNe51gKuTox50o5cVXeqSPXfAIqe1quBEHNXtmyCo2itjYEMHvqsiJMrXcS8DmvLQaFPAhVFyEldiOAsM06j8iTXsHkp5QsvbAZz+Bu/mjmtXwHV8p6P+GtDOucoCYfeXDD7qnB+UNOKKiz+Z3GDg4FLPqvMYaQ8aiz4UQrAXrZj4zE7fztTZzqI74RKP63BUPr70hRiSIVKuTYt13UM9BPxkszitgLodCoECmjPnZPr9BHNYFSL+6oC9JI9bikeuJ9fnJ2skbqGPiPDVTqj5Ygb7/M3JsqumU5e9vZeraUv/PX8jzKtwD5mFzumQEsrXrcp2MmU1E1aPxw2FOyYDc01crslKMO/Aejr1eWbsqo9yHcPFvQtRJG3xt3Cwe9M0guqYw+NoEZ3r6RuwVGCUv1PVKY/l2m5I7TTYsdlzXYgvIvaaf4O7yuk6r1PSm8r8hQ/klHhS199hyNHHb3Dhg5IlzJS6ONukaEE6BWL9swKiXQIxNEOsGNKyZuin5GAAM4oYwCQNRO6Xm6D69tKjG2HzV9pkzA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HEN+umawOQqGsH28bi6SZpdpIrMBo4KyWRZxWcSG/NEx0pcgoQBTTRXZ336GnCNzC/DDU5NN63qKkjcyasV1g81/1BmwyO8hJneEISXBk+88HWwQ9Q/rcXg0caAw1/xbqgFn0cuJdvbHQQv5VRLmclhmCgvWxoeayysMOrxAA9scWE2A4bP5SqDTBlOf5kVIloz69ME1EiFITXoxRSsm6NfHgJLKOqqgkXnFU+3rw3ioA5GDTvQfoTUQzVY3PQA5cDu+FjnXKit9TAVsGyV7dKAUwQ24SSxfOIDKDhNHplwrs5QFeVDfJsSV9ql6sz01C6cu/oGHFT4P4Q4Os42rAP344EW8ilJV3bnaYG0aWilepGABUZ2ZGI1lQ5s9agYCXyxtC1d1/n+tQzg3liHLzRdqm5T3SVc1ZHUKQwBUf4y3KJLPak3vP6iPvwKZoHXU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:49:28.2549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b15cd7a-f8d2-4a5f-4869-08dec1a0d741
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF66324196D
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 18:49:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19969


NAK.  This is back to removing the existing recipes.  The v2 was more 
correct.  Not sure how this occured.



On 6/3/2026 11:53 AM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> New recipes for GPU DDK 26.1. Update BSP configuration files with new
> preferred recipe versions.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v3:
> - Use git format-patch -C option to make the patch more legible.
> v2:
> - No need to delete the old 25.3 DDK recipes as that would break
>    compatibility with previous LTS kernels (6.6, 6.12).
> 
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 2 +-
>   ...er_25.3.6908880.bb => ti-img-rogue-driver_26.1.6967606.bb} | 4 ++--
>   ...bs_25.3.6908880.bb => ti-img-rogue-umlibs_26.1.6967606.bb} | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_25.3.6908880.bb => ti-img-rogue-driver_26.1.6967606.bb} (93%)
>   rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_25.3.6908880.bb => ti-img-rogue-umlibs_26.1.6967606.bb} (98%)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index f7e2710c..a48c4f07 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -43,7 +43,7 @@ BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
>   
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "25%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "24%"
>   
>   # ==========
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> similarity index 93%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> index 190417ca..876c3e50 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> @@ -13,11 +13,11 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>   
>   DEPENDS = "virtual/kernel"
>   
> -BRANCH = "linuxws/scarthgap/k6.18/${PV}"
> +BRANCH = "linuxws/wrynose/k6.18/${PV}"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>   
> -SRCREV = "d241b0d5df404c60b80233bb5116b596039062e6"
> +SRCREV = "50e14e425cbac240b2da93fac0cfcc987a4959c3"
>   
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> similarity index 98%
> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> index 5246f588..ff631c2d 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>   
> -BRANCH = "linuxws/scarthgap/k6.18/${PV}"
> +BRANCH = "linuxws/wrynose/k6.18/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "2ecc98c61aedd931d8acf6fb4a1150ebf57fb178"
> +SRCREV = "a59e0e6b92dfee7aad046b839cf6ae644355b89d"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

