Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D642EF0702
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 16:14:55 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23334.1770740085326295913
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 08:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HPWqd2ey;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.44, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NarSdoBSok4xqz/88kiBFd+pLgUaK4zLXMKaGAYl52NT+NHVMcVs0xZP/BOuQnFwfZARFKEMiDbiLvNGYmgy3m9aMW7RYPZp2/joTx06ut0bcx9foEj4oO0ccDYXy8DbhpbLfB0ZDgdf2nhgzEmZ3af9AaTGB953Upv4sq8/7NwLVOIiNUOpEld22vOTtN7NO8ulF8TfvdL4Twl/unG9j+iTURHSbN5AGuqcopOMHmlXbs/DgRGi8IbPWzvxSXdlg+gBIhiKpvvaYOCxtvOFf69GhoOxUV/mZV0b07OsNwVKbivZyxoEmn78rjy6hmdIKZg/QkY6xwwcPEvr+YuZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ+fSINpxqCR6tv47/fAaCT+v9XgioKypph022NHTM0=;
 b=QYHY330hwQVCbNbrgerenv4v6kPkqaz+rP/SP0Oj2QUhnSgSrJ2XwNsHhIcAk4fYymey4FwmjM6eIxZVHlPH86Hu/39JQ5bufynQuEPhBNWQrTFTQ+ZvSYSBNoU+2K5hXDtzge89WWnr3uyrG+AzcWIeKJ1fJ+34HtJwse+ZzFPR4b5fxU+T2jCzc003/khwDQvkpzATb0PBeSRYTinqGK3/8eKn2AdaRxsQ+IWMD5xlKuVXugAOVRolEZ6TgcDcINDKqtma+NKfJxM+YfSd/+Ku1ZzZReU7GaptV+utpPKjlifWHlCqPv/Rs8m7r7ikvif8Rf6Jlj+LHoxslaL6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ+fSINpxqCR6tv47/fAaCT+v9XgioKypph022NHTM0=;
 b=HPWqd2eyH7Y1Ng3qUihCx31zRbl7iFrDSYD5y3sTPIUbZnvoTev+NerUA+fK2HiNckMFCswI3dnDiVJb8M/e1VXrWXxf83cPTx2KQRSMeXV9LrdHlKhtymeuLQmIaDf+8uuUTzQLHU1r2DGisgA3IK/RYklcCpVG23EuwUU9UOE=
Received: from MW4PR04CA0223.namprd04.prod.outlook.com (2603:10b6:303:87::18)
 by CH2PR10MB4293.namprd10.prod.outlook.com (2603:10b6:610:7f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:14:42 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::18) by MW4PR04CA0223.outlook.office365.com
 (2603:10b6:303:87::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 16:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 16:14:35 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 10:14:35 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 10:14:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 10:14:34 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AGEYAR065842;
	Tue, 10 Feb 2026 10:14:34 -0600
Message-ID: <59e2acdb-b42a-4fa5-91a3-4b1d6b48bafd@ti.com>
Date: Tue, 10 Feb 2026 10:14:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Shiva
 Tripathi <s-tripathi1@ti.com>
References: <20260206054157.1848713-1-m-chawdhry@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260206054157.1848713-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|CH2PR10MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 78387ce0-e4fb-49a9-4d7b-08de68bf7bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1RBQWFmSGV6aE1SbzVBZkVJcmhMb05SQy8vY0JBbnhHTDh2Rm1YNmtWdDJP?=
 =?utf-8?B?Q3FtdjBPcE5JSDdoeWtDNndRVXpIU1o5SlRuMVNydW1OTXE1U1djN1Rnek5O?=
 =?utf-8?B?aGVhYzQwUWV4Q3ZRL0Q1ZWY4SUhZejZvZUhWeGxCbmVrdmFnS2JtSzhObWRD?=
 =?utf-8?B?QW5tbkRWTmowbFRkbFlaR1U2STk2VGpnWnBZYUo5NFduT0ZaQlErNFdtaXla?=
 =?utf-8?B?ZytaVXBQazI2WFQ2NkkyT1RQWmhjV2dEN1NyT1M2NC9rd0dWaG5hT05CdUNO?=
 =?utf-8?B?cmxtcWlNdUMzTUJ1ajhtZWJTOU1ZYzlOOG4yTjZ6WkNmc1Aza2x5QnRrbDNB?=
 =?utf-8?B?YmpzVVJiOWltZ1Q4SmJzTjhxMWRmSmIxWVFodUJpKy8rOFI4dHZ4c1R0OUJM?=
 =?utf-8?B?Q3dmL1dxMjk2UmJQRFBVdXFXSzQrRzRuS0ZtUlkwODMyWDFyanJhS3BmY3dV?=
 =?utf-8?B?Si9ndnM5ZE01YTJLN0pha1VzWE5MSkdEcWlEUlI5cHFFQVVDTys1VUhiOXFM?=
 =?utf-8?B?M2hPZ3BTZlozV0EvRldDbjducStVWlVtMkprNkM3MVBtdktQNGZQWTVuYU1R?=
 =?utf-8?B?azVQTDBmcU5xSWhnRlJ2Vko5NlVqWkRIakFNL1UyaEhKaWpSY1dFalJMKzFh?=
 =?utf-8?B?cVRtU0NSdmVHSzVORTNSMXBzMVJENS9aRVZHenR2b1NKTHZDK0lWM0NQRXFi?=
 =?utf-8?B?V2Q0VFpGMTB1T1RSTjQxbnRvczM0ZFZZQVdaQktTWWJBUGNNajBJNTQxeVRE?=
 =?utf-8?B?WWZQZUwvU2xqTm1KdVFNd3BnS2UvVXpJNEkyb3E4ekYwWklMeWNQUEJUN0xi?=
 =?utf-8?B?RlljOVNiRG4vdXFOREJvbU1jaUFWbDcrYVU0MkdRLzhjN2oxcjh4OGMzTVYx?=
 =?utf-8?B?bW04VDhMNGduTjk5NlFXTmJScDNmZDF6Y3ZnQW9xM2ZoclRjbnhXQm5BdUNU?=
 =?utf-8?B?Nyt2Qi93L0s4UXpvMEk3dkFTaFg5RGlZZWYwT05SVWNTZnpkZ0QvTWN3S1h3?=
 =?utf-8?B?Ujk0K3VadUkxV3NtYVAyM3BMSHMvZlNEREhaMEFPVmREZ2pPazREY04rQlRa?=
 =?utf-8?B?VGV3RWhMV3lNUUZKcFVMaExtNWVmNDdDeGFXQlVMSEZhRlNCR0pvdVgxbVQ2?=
 =?utf-8?B?aEFOdXpBMHlaQVNzQnplWmFyVjZ2RjhCRzRSU1o4VnBITUNLeUVTNkE5c2Zv?=
 =?utf-8?B?QTZXc1dPT2tZQmtiVnhOK2Q4YjlaWkNkVzhYZzZaOUhUSndNSVZLeXlDa3Nt?=
 =?utf-8?B?eDA2RGJrU1pOMmN2azBnMGlvSXNReERwRWxtNG1XVGJpSUNDWXEyWnl4ZTdv?=
 =?utf-8?B?dlFIbWtDczJFaU5PSW5VNjBJMmZvMFMzelFEV2FZMGdqUjVZbG5hSHVTRFp3?=
 =?utf-8?B?c3BXZVdlek1NdUVQck40cld4SzJ6ZXNwbFJlRG5weW1qdlJETW13YU9LTisw?=
 =?utf-8?B?cVBGL1dUTGpVb2E3ZWM0UWkzOHRGUzlOZjVpTi9Va3pMNlVLSmlaT0pLaExF?=
 =?utf-8?B?V2UwdFYwemZTMGRKWmxUR1N5NGlSNWlrTEpnendTL0dEU1FlTHNnVXBQNHRG?=
 =?utf-8?B?MVk4R3FMb1RnTGp3aDJMbUtTSDZ1Mzl5eWZKMlc5UTFlZ09MdkdEdStRLy9u?=
 =?utf-8?B?K3RKMERsRW5wcjlZNGNWOHgvQ2xlQy8zVmhGZU55N1I0cDcrZVZpdXJ0RDlO?=
 =?utf-8?B?SytjVnliUzJlZkVTMWpLbWNXajh0VXRUQ1dZbHl0OC9wVHBnQ3orRit1Skl1?=
 =?utf-8?B?c3RtQWlhb1B5T2xFU0NpcmJsWG9zN29PQldTVktSeHRGS29WOFROaXVhdGdv?=
 =?utf-8?B?RGhobXNVYjdiTll4NzlhZFFyeE4vUzhyL01wR0Y3dDBWVGRVYXdXaUswcXNi?=
 =?utf-8?B?QjdzekdTMmZ2VW9tdlFqbXlESGI4NTNYU3dENHZOUEJhbmRCL2RBTXN6VEJa?=
 =?utf-8?B?UDNRNkd2Znc3RThYakxodTJweHhnYm0xQ255UDIzRy9pRGUxYUVpdzhXY0Ix?=
 =?utf-8?B?a0NnRVduSlhnZHJhM1pNWjg0bmI2WHY2SmJhNnYyQ1RSR0NEdW5hWXFIMHBo?=
 =?utf-8?B?QTZXYUZ4dEtJUEpyT1d3dlROTVk0ZU1yMW9IUUlWQk1VNUMwTVFKdUNpZ3l3?=
 =?utf-8?B?UjB6SmY3clRTUmhUVklRUEkrUlZDNGFqSTJPNDJVNjZja1ppL0dNS0R2NUd4?=
 =?utf-8?B?NE14QzlQY0dqZ0JaeU0yLzlDVUZENnd5T0M0SjJOUmVUc0JhQm1wY05QSmg4?=
 =?utf-8?B?Y2liZFBYZEhCM0V0b2lQamJGekNBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T4ZuAWMH6CUmxrIJIvSnQ9tjZMXAHgZ1FHV2e8fOBQSC7Scn5tT2U1AWyk/f7J5HJq2xYpXA5FLmxLTsHMjDmeUNAQeyHehcLAFxt4m5sbj7eIi/LrAf8hTRhHkfZ8oFiodlHyw1C+K1StIkNZKFqXePvouy/JbvaqhgyEBaqZmkipFDZDbT4TIt8iPX+IHs1oZZliTAX9hStJKYyTr4pY235mDMLSvhEnGAgdAtp9LcvJwO9fdKmKoksMgQsLNR72JCrnkFRc89H/qr+GNQ2f/Rm/U3h0j3m5X+K4cHLKW9ZGmt6A+fiMz3SENz+eJjY1+35ZnET5NeJpSN9jdm4WgjlT8PpRUVIRZoffh9fyMA6O8hwtPE35AcKUvWyVjkj8OnrNxzyLgJMeyMkyhSzO0cpqi6tUhBIFWVK1N8ynjoj6xpD8JnPd5PAKo4wiKB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:14:35.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78387ce0-e4fb-49a9-4d7b-08de68bf7bcb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4293
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Feb 2026 16:14:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19478


This fails to build for scarthgap.  Did you do a test build?

It looks like the SHA for optee-test is not right.

There is a single letter wrong.  Not sure how that happened.



On 2/5/2026 11:41 PM, Manorit Chawdhry wrote:
> Update optee_os, optee_client, optee_examples and optee_test to the
> newer 4.9.0 tag.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   .../optee/optee-client-ti-version.inc         |  4 +-
>   .../optee/optee-examples-ti-version.inc       |  4 +-
>   .../optee/optee-os-ti-overrides.inc           |  9 ----
>   .../optee/optee-os-ti-version.inc             |  4 +-
>   ...Open-TRNG-firewall-for-TIFS-on-all-k.patch | 45 -------------------
>   .../optee/optee-test-ti-version.inc           |  4 +-
>   6 files changed, 8 insertions(+), 62 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 289ca5b500cd..68b6b262a448 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
> +PV = "4.9.0+git"
> +SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 91dd5e60ca67..6ec2a83db8ce 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
> +PV = "4.9.0+git"
> +SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index d636ae006216..b5cc9ddb7d95 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -78,12 +78,3 @@ RDEPENDS:${PN} += "${PN}-ta"
>   
>   # This is needed for bl32.elf
>   INSANE_SKIP:${PN}:append:k3 = " textrel"
> -
> -# LPM support patch for Jacinto platforms (J7200, J742S2, J784S4)
> -OPTEE_JACINTO_LPM_PATCHES = " \
> -    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch \
> -"
> -
> -SRC_URI:append:j7200 = " ${OPTEE_JACINTO_LPM_PATCHES}"
> -SRC_URI:append:j742s2 = " ${OPTEE_JACINTO_LPM_PATCHES}"
> -SRC_URI:append:j784s4 = " ${OPTEE_JACINTO_LPM_PATCHES}"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 0f040e6e7ae4..7284e49f1057 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,5 +1,5 @@
> -PV = "4.7.0+git"
> -SRCREV = "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
> +PV = "4.9.0+git"
> +SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
>   SRC_URI:remove = " \
>       file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
>       file://0001-arm64.h-fix-compile-error-with-Clang.patch \
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch b/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch
> deleted file mode 100644
> index 59d7a7955d18..000000000000
> --- a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 00f74ba2ab00088d51e6da3c0eefe50599ef5c82 Mon Sep 17 00:00:00 2001
> -From: Prasanth Babu Mantena <p-mantena@ti.com>
> -Date: Mon, 3 Nov 2025 12:42:57 +0530
> -Subject: [PATCH] plat-k3: drivers: Open TRNG firewall for TIFS on all k3 devs
> -
> -On k3 devices, TRNG is firewalled to be accessed only by OPTEE.
> -
> -TIFS needs this for the encryption and decryption services to support
> -different low power modes. So, open firewall to TIFS as well.
> -
> -There is no concurrent usage of TRNG, as TIFS uses TRNG only at suspend
> -when OPTEE is down and resume, when firewalls are restored but OPTEE is
> -not up yet.
> -
> -As this is a firewall that required to be shared along with TIFS on all
> -devices, making this a common change and open on all devs.
> -
> -Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7582]
> -
> -Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> -Reviewed-by: Manorit Chawdhry <m-chawdhry@ti.com>
> -Reviewed-by: Andrew Davis <afd@ti.com>
> ----
> - core/arch/arm/plat-k3/drivers/sa2ul.c | 5 -----
> - 1 file changed, 5 deletions(-)
> -
> -diff --git a/core/arch/arm/plat-k3/drivers/sa2ul.c b/core/arch/arm/plat-k3/drivers/sa2ul.c
> -index c50757b2c..e10bde131 100644
> ---- a/core/arch/arm/plat-k3/drivers/sa2ul.c
> -+++ b/core/arch/arm/plat-k3/drivers/sa2ul.c
> -@@ -121,12 +121,7 @@ static TEE_Result sa2ul_init(void)
> -	start_address = RNG_BASE;
> -	end_address = RNG_BASE + RNG_REG_SIZE - 1;
> -	permissions[num_perm++] = (FW_BIG_ARM_PRIVID << 16) | FW_SECURE_ONLY;
> --#if defined(PLATFORM_FLAVOR_am62x) || \
> --	defined(PLATFORM_FLAVOR_am62ax) || \
> --	defined(PLATFORM_FLAVOR_am62px)
> --
> -	permissions[num_perm++] = (FW_TIFS_PRIVID << 16) | FW_NON_SECURE;
> --#endif
> -	ret = ti_sci_set_fwl_region(fwl_id, rng_region, num_perm,
> -				    control, permissions,
> -				    start_address, end_address);
> ---
> -2.34.1
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index d2593cb8de94..b8afbd3ef22b 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,7 +1,7 @@
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
>   
> -PV = "4.7.0+git"
> -SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
> +PV = "4.9.0+git"
> +SRCREV = "b27648ea8472cceceb8dfa368a965c709066f7aa"
>   
>   SRC_URI:remove = " \
>       file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

