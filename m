Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BFFCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 14:11:30 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21311.1780495889246708361
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 07:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=O5iPVtnP;
 spf=pass (domain: ti.com, ip: 52.101.56.59, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZnHQ46BOSdCCEjY6Pqc2yCYNqKsyb88nG9XcU/ATc0pjjdT3nMuxQEMXdFtgXX/T7Yz0LQi/HQbqJAvc6kKIO5gXKhhXIAOjFHR6lP1xZ6BXiY/dZKgOVBcvmb87aMPfwx/7hznUzN7YaCoqlyRYHm5R2O6o6G1mUJCkx1j378uCiIIpR/a2HmFnsU+Hwr1Sx+hJLUolHH7lhoEGMKo7L5ufMfzTEiZx4kzGZYOVH48AUfbr1YHYdxztQ2O0pia3u2z8JKNmnikVTYfFciOgKphWcDGI+fkmF+1QgHC06FLCVWGZ2VSdK59AII5ICbNY1ENFzRlEDbevr97iwocMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRL9cTquP4I8IfNGstn6B7HCFCPiIvtBEDifT3ffmY4=;
 b=h88h6cDLf3nl5j3g2xXCDItK6N2MWKPTrE4V5vOFy4/1KNLMaeV1Tpl0Xl8Mdq/tkOtdAJzMwZLewhhGTrfTqJNEqDT+aawKLo7CyrhQJpqOO+oh5Rg+gDgGPhtDjyNu4vfzPeZRmtCYfr3BGgvNHMgeM0l66H7iAC95ZSXWm4Rzo7yLkO8LtQrz1BmM9RWZ4X6kGpmcdqByFzOwzrL9354n5GW2M+v6mVSWiO0Q0rtwnmicyOCtLO1Vwg3+jdv5dKD3h8r/e8Yl0nm4jqnUJJ443j+k1T00TdW3Sx5B2jbh+22SXfW6fiQ1jfCujVaHnHW4vWl9IFKr7Y6FjV4wtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRL9cTquP4I8IfNGstn6B7HCFCPiIvtBEDifT3ffmY4=;
 b=O5iPVtnPgR35LXavn8oupA7ssVEjurYZ1tY7ky12Igm1bGhGqluTyyLoScQlNohAa8MPwBWlqTrzCjFEjlnXxKLictM4cWYFjnglc7SI+Hg804EVCGMg82z+uxWtXiVTifwLKnn0wJJtuBsWNhjJj/aUdGE6pkNWY0sa8daFmg4=
Received: from BN0PR04CA0122.namprd04.prod.outlook.com (2603:10b6:408:ed::7)
 by DS0PR10MB7175.namprd10.prod.outlook.com (2603:10b6:8:dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:11:24 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:ed:cafe::38) by BN0PR04CA0122.outlook.office365.com
 (2603:10b6:408:ed::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 3 Jun 2026 14:11:24 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 09:11:18 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 09:11:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 09:11:18 -0500
Received: from [10.249.32.125] ([10.249.32.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653EBI601881573;
	Wed, 3 Jun 2026 09:11:18 -0500
Message-ID: <46b7b803-7966-4e62-9861-310d19a2d0fd@ti.com>
Date: Wed, 3 Jun 2026 09:11:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-img-rogue-*: Migrate GPU
 driver version 25.3 -> 26.1
To: <a-christidis@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260602223250.3054197-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260602223250.3054197-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|DS0PR10MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b2b8bf-9f55-4d55-7e7e-08dec179fed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fHZ1XlJmDohIYs89bYiwUZVWFaqi5g6RJuXYa88fmr1JGMC5hzx5XKFwk8tJyAEqhgOkzhxjJo6pI3yMYQlrWzih18voJBv4nZYdNWRZC8u7dnIfc5qubzuNy3ZyENgF4Xnrp+NupOjlMi7uzMKs3QZj9AS1visKUkaDoLY1DuMHctm8qkWSvW3eRKVPY4S5IQNzgJxX7FdymtNSdblyhs5onqP6uqhmohT0JdBJxVadwvf5ACMr33Lq21DbQg4+C3ZzS7b6HTq9d3qChpIf/uUwgzLDI8ad18U+ABYKxyZcraUQPpkqpRzOkH05dDYe+HH9hwQpKTL+u4uqb2Djjs1EYEJSZTgTUPOEwP8zBiiI3/S3gkXtLU7Im0GRk0NNJFRIgpTAlD8sjKntCiRFtXfEXwD1CYMj1SSuZk3WJD0LKeowcxO5H+pOECDy46MW4sgXrDnFYbJvmBrCAeYq7XE7NnLj/V761mzp/zLZWxe6M7USQzonwwvysPXMauH9qhCJgHfayd+0EYOOATe+c8eSUD6V5SJcxIsprq9MvK9LIhuGyZ8Ky6vtFnz2P6bL6ukGxPag1Z+ELu0Bt9ON5rtXe/ng0KiIUFYJdSyCgdSbAqTLOl1kC6M0Z1RozHdGxTNj3MYg0NKA4FiHJhmsIY5QJSv+sNRK2R/op+y0DhrmjN+fUBZC4cJakYbDBTxZy/s/dzktgWEgouS0IHJ3vz+VHrBDcBXgij7bez48tIE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Kr1ZJjS5uA1YMJr4MRfh3iUseldm3DbTWhlIVOLTC8c21ttFIJiCEQb2l32Bf23CrS3cP0hIlgYTjXz+WttKpMMlLt/7LMv72hgO/UE/DdKssz8MaEebx9WXz3PKM397OnBSLFObMrss3IKDzIqlqJJ8RtRRhu30JagEHr/fEhyPh6pAg41zqM/uIHGzK5B11Qfe96ze6jRPMNkERORYHTM5TH0ZalxpJAjvwsl6BwI6weQT+0VF4euSQGo1jqtPUpzvW6Z1b7637b7/mgR5a82bu0PSjcrawr5bGSQvfopxycS3xbbNe5qkujSfjnSwBm92lbNsx3c1HRbk2pdQ0DTgSFE2HZygYOFOEk5ed9qMg5PNP8ztADZ1ChGgY+BGpxgrPwaOn+9LH5dkmTS0rJ/oDCy8xSTLpleQH8lo6ph99o8/S9d5UAcTQ6dGChfx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:11:24.2402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b2b8bf-9f55-4d55-7e7e-08dec179fed1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7175
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 14:11:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19962


NAK.

If I'm reading this correctly, you are removing the previous driver 
versions.  But that will break the BSP system we have and break the 
6.12/6.6 support.

I think you just need to add the new recipe versions and not rename them.


On 6/2/2026 5:32 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> New recipes for GPU DDK 26.1. Update BSP configuration files with new
> preferred recipe versions.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
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

