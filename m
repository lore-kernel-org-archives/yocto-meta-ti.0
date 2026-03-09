Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335B7F4181C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:08:47 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19836.1773076123412137237
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 10:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=aR7BAl/a;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.52, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICpY0Y2ZiBCGsRFuPdCZfidMdQPS4dahoyWVdkhSKafYqH1HwiT6vaDHO+BaQLXnR15M1IUpzv6aklhey2tZsd4vPCHrFI7LcNmFlsD8y4qVGvCaXG7zgKQpRmHD0Pf1DApzzvr6gZPV1ZUZBMPmei50+dyEuoJQjiJvDMqkYcmc2X05BjAbkCk2sp2MoDnFXjMv1gocTy7C9QskRS8xtH3zzps4b/NRIm1TmsddvO/lh8EcwMsdKstWZnWQfYKfWoE4nqKtOXZAnbd1hSyJ0HwWOi/1s00Y/NIiPWrGrecH6G0V6lSUTClwUqgnmu++7BbNNNfdGtraKwvc0JSqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4YM0OdlL3i5oO56ThOH/SwtIM12paZZJm5pE0+d6OY=;
 b=wjiOEisiG9Xv2PFR6YHZ5Cou/P6TCZ3bUWAX8aRivZRrEyZh0y1ocmdrUqvBQzylhlEMudB2TRe8WkOdmYop+kds2yVQSpSQ0mxbsGB5Z86mNhtzePL8u255AMICNP/RfLfGB40uC5WK9iGlFU9EcJpYIf9tPxe4UWKYRgB31OyTA4NB9vF24/0LY91XM+5W2TPTefSOMzirervx4wMkj7Ww3aVYaiOgwryiUMRnDOSiiKCG4VYDCYpkn9QdXiuUfeSHDYK0BUlHnPsZ+nM43p+3cURcj8HL8+JBuNFhASS4SkRKXWCNZFqU80UINNnbx35xxyU9uo6EOu4T+dNOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4YM0OdlL3i5oO56ThOH/SwtIM12paZZJm5pE0+d6OY=;
 b=aR7BAl/a+Y8IGRYTJFXrmBnUzC3o5xOuJribsbTcEz+fG448/FwOdNuFXA9AY6Z84JSukUmGWuNib5vSS2GQLoVN6BSSgibwbB9IexYoKitptImOSn3VUF/EH6y/fIpaVKAnPzoBejmL1wWJxLH9pF+GhbmewF+JOG3/s/zbGGU=
Received: from BN9P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::31)
 by SJ0PR10MB4797.namprd10.prod.outlook.com (2603:10b6:a03:2d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:08:40 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::30) by BN9P220CA0026.outlook.office365.com
 (2603:10b6:408:13e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 17:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:08:37 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:08:37 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:08:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 12:08:37 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629H8bJP1498131;
	Mon, 9 Mar 2026 12:08:37 -0500
Message-ID: <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com>
Date: Mon, 9 Mar 2026 12:08:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA warning
To: Mahammed Sadik Shaik <s-sadik@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Prudhvi Veeramachaneni <prudhvi@ti.com>
References: <20260309170134.2779295-1-s-sadik@ti.com>
 <20260309170134.2779295-4-s-sadik@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260309170134.2779295-4-s-sadik@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SJ0PR10MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d882cc-1af8-48ff-c74f-08de7dfe8176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	yDaLrjNBfSkXd4VRLs6tJTszZpeNCEp4z4NEMBzH22hpzsslxhgSbPyoLLHMVQhHVWBPpuM9all/jMYTayyvs6rqAFU/110pHZ5lczHAJPPfyjPsbGvXUICdzgY0fjuBm1tR17E+gyXOnwKvgkza7EFW5yzsjLKizFIAHsz/x1iYWWV6mNLJqT5tNS5QImL8e3o2KK8Ao8yc0vjRvUHDhJeGFWbq5oqJwg03RFWb0UQGI4inucK7dTTJmLASJ9DVg/O9jf34srL4aZB4JVbplvmsbIUxa4shXZSXnrYjI0Lq+3HBzNuQD1DpiPBa9rsfJdZQmJzfzYAwNoI1C9WU0Gk4Y0oDot2gHwbJ03dc493+/1+W1faTTXYm/4LWm9EeXrzApRTDIATJCYH5AVKUyC8NxxFhk41r5JZy+c+/jiG8H0ejcuHAh9yJ30+U9l8o8bFlQZ0xWpx929d+tgx+H9SLkOrxWV8aswP4DhapjvhGZE51qrJzOaA+mvxbUfK4PsVj3j7/iB0KLCotgA4erIk7YU6iOdQmErutjL4Pi0V86xDW7UZjUN/D0fQO9wxuJMeohXmGOylxKbBOnuwQIHFdx1HyvjT9yrO6tdsUO2icriIR3BwBL5mm6CXTibTtGc+E47sJx6kv98udLAvvJTKYCPkqmijuOI6vWKjRrFuJER4IbL1omvOER/VI2BQP2EFNmaccg76e9C8UF/xXNPvp7BFSTLh9TKeIqfmbGAczOvV2Q+Aj2DGbwSacU/t4YYDfiyhpLrI981jbfmdiOg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pP2G4Nj6lJlRcngFwujldze/GxKBM8J9lBX9IDgFUgrCB8xN3e7k2ueCY3cpfP3laz0Ega2wHDHsJB0WnVq86lfBXRSaZZh2e0xVFVHdICOLSdSZwSqz5EEjqYyk92Vsz1a8LYAWoWbChRmrzsrFW8QmLQGBY9lKRfnQI9dDMX7WQK5pSHWe+3a6HbJAHu59/XxNtIUBIsWl/V5wMnO4DAWRNyz8JdzO5RSOWr47YCENqfxp9HAxpK2v5/WqZIPeT9KvU7SabO71jhVoDZcFkb/f11ZhstNRQyBEb/iyiGzhAWMtqsB0rgYdtdXjWTWDNe7hn3s84bj7KztS4CyaKFn7Vp/+A/PCUimWqWakm4tjH/WCjg2qDaEonzJOBL+QTL5ob0gyoFuA2ROTxIHchJZOrUt3ATMcClFxibk2CZY3EmyEk2ZTDRp1RG/O0404
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:08:37.9259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d882cc-1af8-48ff-c74f-08de7dfe8176
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4797
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 17:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19682



On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
> Add -ffile-prefix-map flags to KCFLAGS to remove build path
> references from kernel module compilation, ensuring reproducible
> builds and preventing absolute path leakage in binaries.
> 
> This resolves buildpaths QA warnings during packaging.
> 
> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> ---
>   meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> index 91076c9e..8308f0e5 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> @@ -80,8 +80,8 @@ USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
>   
>   TOOLS_SRC_DIR = "${S}/tools"
>   
> -EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
> -
> +EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR} \
> +    KCFLAGS='-ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}/= -ffile-prefix-map=${STAGING_KERNEL_DIR}/='"
>   do_compile() {
>           oe_runmake V=1
>   }

Thank you.  I was going to comment on the v1 to not disable buildpaths.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

