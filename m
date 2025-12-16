Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95987D609A2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:05:46 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24674.1765897536516986260
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 07:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CKHxSOJB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.9, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQUVfJ+FACJLOhY//CPCAaAuC3wwZId2R6L1aJLgEhRM/AvvD3tSMPuifdE8jcI3aT7vaUZbcwdWf88dwfhQT8ykFtDcPg+bD7KEzv6iz0wJ3ZZ4LOQ/cSU6o/jmTSCuQQy4vSI9QabKVEiFzycvZk2zH6B5jodJqf78MOltQvcX85Ajyq4YVVbsUXdM/em8MfCnLyA0/Xh+18mvKjPvnkJj+vNDyiuubRELUn32d32QWo7GYgIsuC4fRX+qKf/yRpTHJtSW1RrD7Lsd3UCop8PSA/iz0WBTkYgkAqH+aZlMAiu5vZkingnKmN7SKN5odz4RXNmLkGWJIGxM76fZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpzMMrF19EZS4T0gCRbT6vUrVRG2YdaUfnC5hLtFiZU=;
 b=mfOeg4kDxGM09xU2yxE8mzZ8LPcohvNT7yeGwOs47aVVqfMeug5KQ87phVjFL3Xwy8zdqZbctn1PCWqrxEaQXvP4QJuPUDAK3JJkamx/vNc99F0PikDndj/irru+MtBg9ELiY+3d7muOLS8YpmS+/q9xNxqFoFrxVUlkbXWax20p5dUZuQimJ2xQUnVX+Vw/FIZQjo5zVm4XFkXna/WpLp4/ovIO7F8jcAJiMwXHfh0PFkseGeqv1laNtse0/8kPpsEJZGaOPpJ2CzI40ntJDJNx/EQA1VWByNdcOVQgu+xQsShc/Fc92YJ8ugcHNnQqAV0LlegB/g9dgKZj6kpp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpzMMrF19EZS4T0gCRbT6vUrVRG2YdaUfnC5hLtFiZU=;
 b=CKHxSOJBEtLJWBWLbNI/4FPglADlA+EfGapZ+9nrPEek+QN9e3LPBaJwXKlCxnaPnqROMIyVS4eu/AdfZF2QFN3yGKdxE9Zsqmrw2njXMPrmiUqNzpmf+nOkPPErbWUN91c07CPqI5Tlz1Buon8Cdrt9SFf7nItTFUXwFmXuovk=
Received: from MN2PR15CA0010.namprd15.prod.outlook.com (2603:10b6:208:1b4::23)
 by LV3PR10MB7817.namprd10.prod.outlook.com (2603:10b6:408:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 15:05:31 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::5b) by MN2PR15CA0010.outlook.office365.com
 (2603:10b6:208:1b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 15:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 15:05:29 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 09:05:23 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 09:05:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 09:05:23 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGF5Nfx015154;
	Tue, 16 Dec 2025 09:05:23 -0600
Message-ID: <c9730700-a2c7-4f8e-9d5f-ed603459b36b@ti.com>
Date: Tue, 16 Dec 2025 09:05:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add support for
 beaglebadge
To: <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
References: <20251216003229.2229848-1-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251216003229.2229848-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV3PR10MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8eefb8-a121-4251-e269-08de3cb48d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d25Md3pBeXBhSWROQ3E5dUJRTzZGcEMyYzBidi9VMFVwNzU2R1E0MHhvNjFz?=
 =?utf-8?B?V3pYdGxPN2JXU0dPa1ZoUC9DYzRvUGJnQ3B0ZXZuVzdhWDF5WStKdEIvditl?=
 =?utf-8?B?cDJFMGx3b3BzOFBrdFJoN2kzVGNXVTltSkhCQVlpcmh3a0N6cVNoa2EwYndT?=
 =?utf-8?B?TVZnbGZGYURjV0cwMVZkbEtCVFA0TDc2VFlMT1NFS2VCZE1hTHdQQnZlbXhZ?=
 =?utf-8?B?UlZNNml5TnEwYnRENTY2Ym5TMG96WS9NL3V2N0lFdHpTWm1rcldtZDV4Z1pn?=
 =?utf-8?B?VkNaRldJZ1JISzJwRStlVmNEZTlCSFdWNEJyaGE3ODZvRG1PdW5OMnZGTTha?=
 =?utf-8?B?aWMrWDJQQVcyREs2QmozNVJzVVllTkZ0TjlnZDlHK2ZMaTZkTWV2WkZxWnQ2?=
 =?utf-8?B?STFoc1A0NmNEcDhldHVwMDZFVmx1QkJZVnB5RFV3RXZTYW1YQ3k3SVpMdEVZ?=
 =?utf-8?B?dkowUjRJSzJrQ3hrb3d5OWt3dFRJZ01XZnZOdDRtNXdoa0pzOU4yQ0trM24z?=
 =?utf-8?B?cDN4aDRtMzFnSUlPd3hzY0pUdjB2QnRNemJIYWdoaklhV3drZk5lMjZwMDVn?=
 =?utf-8?B?UnV2M2cxemdjVVVaWjNLZWt4Rk00UFpaS2RQRGQvL3hqL3ErOTh1UWh1UWVT?=
 =?utf-8?B?QmNnREFxQmFYSUNMWFJzNitCaXRMbkh3Tjc2R3VuSGtEaUdiSzNXeFR0VTJT?=
 =?utf-8?B?WWhVdXMvRWhFREMva0xXSzMwVlFZcDd5aTFmRnpDVEFmUEZCN1FNLzRhbm1p?=
 =?utf-8?B?eFV1UTFtSmRwT3RnTjlFa3RUZSt3ekhVVytVNEZvRVdSb0FXQStRUVZlVWlu?=
 =?utf-8?B?Zm1odXBuc0VWaDFVNlY4cHN1cUhUbXZUa2tjWjB6R1Y2dWpJL08xL0UweHU2?=
 =?utf-8?B?VDR1dm9LTllLdUpkMGR6UzNhL1FKc0E0WkUvdCszTVVkeW9UUnZRZUZWUi93?=
 =?utf-8?B?cTI5ck5WbDI2RVUzQmpmelAwYjA2L0FZampaV0g3cVJtK0ErelFVQVk2WjFB?=
 =?utf-8?B?eFdNUVVmRUJxdGhjWVRJcXU4K0Uxd1BmdnlseEQ1cmh0L1hGRDVGTXl1T3I0?=
 =?utf-8?B?M2I5TExnNnMrL1BWbUhtRkpyYmpqM0d1MmwxV1FEei9tM1Y1WVhXa2V6Vjcv?=
 =?utf-8?B?NXFSYWtTZXFoQzhWQjdDZ3BFdFJhL2ZwSnkrTW1IeWFPUDZJTU1rVGtoK2lv?=
 =?utf-8?B?RXA1NXg0aHpXQ1BYemxhTlZuRWVIditTeWwrd2lOb1dRR3RqTnRXZGRTS1Zj?=
 =?utf-8?B?VTQ2a05wVnFwd1htSE1IeWxlNGZLVTcvb0o2czhGalFERWYwSk1wNk1ZaDNB?=
 =?utf-8?B?RWg3SWRTTjdDNjd4Sm43SFJDUkpnQmlBNUNWWHV6QWw5MXBVVlFuQlpwNkkr?=
 =?utf-8?B?WHQvMnhNRFUva0tyaWpvSEFBWXN0eTZvbG5JbUJiS05UMzdTVTIzQmJ5alpk?=
 =?utf-8?B?T1d2MWcrS0ZkTnVwVno5bDJBclE4YjFueWtIVU9OR29Ud3ZFYlpDQzZ2dUtP?=
 =?utf-8?B?ZERkNE5RbncvQWlLN0dXWjhicTUzQjN3R2Rxc0FkRFdsdzFXWTZaZWpGZ2lO?=
 =?utf-8?B?L215L1ExeVdWK284UUFZejlhQys4QmhMdXA2NWtVb1NvcHBFd2t0SnR0UTlN?=
 =?utf-8?B?ckUwY0xyaVZNWFpsMHZSQzhMMDV0QnJLWWduWUFvTTVTaEhSdE1aanZOdGRS?=
 =?utf-8?B?eHJWTkVDR3k4Slo2YXJzMkI4TlFIcU9kbUkwekxXRnl6Qy8wY1hmUjhiUkZT?=
 =?utf-8?B?RTVxYVRyeGFIY1REQjdXdCtLbFpIT3NKOXNwNjFoSHUyNVAxZnBseFlmaVQ5?=
 =?utf-8?B?RlU4d0hKeGFoeFBlckl2bnNCK0cvRVp1ZlJQZUNwOVhMN3AvUmEwTWQyRi9p?=
 =?utf-8?B?NDQwZmcwUWNaWTQ5Q1U0bWNjY0NOZHU3aVQ0cFdnL01zV0ZpZVFKTGh3eTd5?=
 =?utf-8?B?a1BpaUZ1KzR3M0JDVW0rRnNHN2NRcnJqNEZjT3lycUdnL0ZXcGt2M3ZtbFRJ?=
 =?utf-8?B?WU1USEQ3QmpCbHp1TzhGMENMWnlzS0YzQzk0UzE3QmFkVUFTRTNKQ0RSS0ZM?=
 =?utf-8?B?MGVCdFRkcXlZbFhoY0JhZ3pMK2QxLzM4eTUxNDBzUEZlSUIyMFlxeUFmTEJx?=
 =?utf-8?Q?ZWYs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:05:29.3130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8eefb8-a121-4251-e269-08de3cb48d38
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7817
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 15:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19361

On 12/15/25 6:32 PM, Mendez, Judith via lists.yoctoproject.org wrote:
> Add support for the beaglebadge which is an am62l

Are we calling it this now? (meta-ti is a public list so I guess so)
Will probably be capitalized like "BeagleBadge", same for "AM62L".

> based device that requires new build configration

s/configration/configuration

> for u-boot and TF-A sources.

s/u-boot/U-Boot

> ---
>   meta-ti-bsp/conf/machine/beaglebadge-ti.conf  | 19 +++++++++++++++++++
>   .../conf/machine/include/beaglebadge.inc      |  9 +++++++++
>   .../trusted-firmware-a-ti.inc                 |  3 +++
>   3 files changed, 31 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>   create mode 100644 meta-ti-bsp/conf/machine/include/beaglebadge.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
> new file mode 100644
> index 00000000..a9d59823
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
> @@ -0,0 +1,19 @@
> +#@TYPE: Machine
> +#@NAME: AM62L Badge
> +#@DESCRIPTION: Machine configuration for the TI AM62L Badge
> +
> +require conf/machine/include/beaglebadge.inc
> +
> +IMAGE_FSTYPES += "ubifs ubi"
> +
> +MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
> +
> +UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am62l3-badge \
> +"
> +
> +KERNEL_DEVICETREE = ""
> +
> +UBOOT_MACHINE = "am62lx_badge_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/beaglebadge.inc b/meta-ti-bsp/conf/machine/include/beaglebadge.inc
> new file mode 100644
> index 00000000..5700050a
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/beaglebadge.inc
> @@ -0,0 +1,9 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY:append = ":am62lxx"
> +
> +MACHINE_FEATURES += "screen"
> +
> +TFA_BOARD = "am62l-badge"
> +TFA_K3_SYSTEM_SUSPEND = "1"

This line isn't needed.

Also, we probably do not need an include for this when everything
is the same a am62lxx.inc (other than the TFA_BOARD which you can
just override in the .conf file).

> +
> +OPTEEMACHINE = "k3-am62lx"
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index 9e733448..7ef3dfb7 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -14,6 +14,8 @@ SRCREV_tfa:am62lxx = "7252a99fb781075db1987d8ce2c7e37324297427"
>   SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
>   SRCBRANCH:am62lxx = "ti-master"
>   
> +SRCREV_tfa:beaglebadge-ti = "76800058f24e3eb3fcacdb12106a881ae279f8c3"
> +
>   SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
>   
>   COMPATIBLE_MACHINE = "k3"
> @@ -24,6 +26,7 @@ TFA_SPD = "opteed"
>   
>   # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
>   TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
> +TFA_INSTALL_TARGET:beaglebadge-ti = "bl31 bl1"

Line not needed, this board will also match the "am62lxx" line above.

Andrew

>   
>   EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>   EXTRA_OEMAKE += "${@ 'BL32_BASE=' + d.getVar('TFA_K3_BL32_BASE') if d.getVar('TFA_K3_BL32_BASE') else ''}"


