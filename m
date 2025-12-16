Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891D8D609A0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:53:16 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24567.1765896788931272063
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 06:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Gz6ZAV6S;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3/EE8PtosWaDtWgyu/TyYyv9Mqq0AFj1x+cIfbzYN9YwcbBfNoiPS+ip/DxWjnB/uxQPO1XOGAbvIarMvxG4jI3fv4H41gfihnJq616UFtoqzJ4v3Ml3vaBTlM14dG8SWBYYJnQRQrBZLBQaQ+EWQhSzJUSkR2t11Lj8463DttboAIWJNU6anmANWUXyj7MSAa3Lny8Y6M4lcvvayblLj1jsHxpDuFnXg8l7ZrYV88+lVpdFVg+LTY4Qb3JYGvH5DlWqxVpm9m6tDCtF77yO0HRuR8KnxrSw2qohOaeeRM08YL7N1l2DXk1m887iJX1M2PsglZmqFFTic1KwmQntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ER/B1yM5cKxiYtRhdn+c26TeCuZ4UJ3uwZ4qxxUKio=;
 b=h+ZjdME/MSOQ0PVdYuJcxZft47bdhDcGQoJgeoJzQQJSAeTYHBtsZMz0Lm+7RKuCLCCwNQPQNl4Mz//C2twSRJnKOsFg29crRuqAR7e2tt6pYdOofcLbZ7w9OFUBnHcXzVWUHfg8a5/LnMO+8ApvOLwU05+RR2FaXt+LIUrT8KxampA789JH0REUguv3CpJSJZl4HhWvho3rwuK3WT3mYWn3X/tmwVelDRyYaMwIH6NKECbtTZtgjx5sdkVsobMGqWZTdnKe9dRVqlg7PBXRm/RJyYX5zV4IZkK4qLrlw9Yh/HEaUwxw1HbWPaIp2Lj83nB7bKKE8ytmZ7j55wXgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ER/B1yM5cKxiYtRhdn+c26TeCuZ4UJ3uwZ4qxxUKio=;
 b=Gz6ZAV6S2x/ZK6S/qsIJYH8rq/lbFamOYIhXmLo1t4rMgo7pdeCmbPIEnqcXPVKBUgCs4PaUYjo6kubegmhW4H6kqtjKIaQKfpjNfhSrQU8zfTwdSRr+TyUCYH9R+HpKXENn3fwr1WTpQdts5juF8BPHeBIesv0VJgzHfak7l24=
Received: from CH3P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::8)
 by DS7PR10MB7345.namprd10.prod.outlook.com (2603:10b6:8:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 14:53:06 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::bc) by CH3P220CA0015.outlook.office365.com
 (2603:10b6:610:1e8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 14:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 14:53:04 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 08:52:52 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 08:52:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 08:52:51 -0600
Received: from [10.249.41.140] ([10.249.41.140])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGEqpk5060302;
	Tue, 16 Dec 2025 08:52:51 -0600
Message-ID: <c4acdd6e-892e-46f0-8bf6-c613652d195b@ti.com>
Date: Tue, 16 Dec 2025 08:52:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add support for
 beaglebadge
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>
References: <20251216003229.2229848-1-jm@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251216003229.2229848-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS7PR10MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2481b1-e531-41a1-1c57-08de3cb2d16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VzkzQW95Zk9YTUs3RDM2b085RXFBQmpoR2pRVnk3OFBxa053aU5pZk5RYldO?=
 =?utf-8?B?WU1QZEp5ajBDOHZOOHRPd1U1c0xwdHZJS2dWQTZjOUUxN0tlcWw3SnU1MldC?=
 =?utf-8?B?QzVJeW5NSjhvUE80SktrMTFESFJ1cm5jUDNDU1lhU0N5RHBVUU1xekVHWFVH?=
 =?utf-8?B?d2FwQnR5bjFVY2lpeEtyNnBiaHlQYWhETWk1OTNodjlMdTBDQnNzTEUxZEVU?=
 =?utf-8?B?TkVKUzhlRDlaaDFKSkpTVDNlRUdFMUozK2pURTl6d3dnRXpQRGpKYk8wdUdL?=
 =?utf-8?B?MmptQ3I5TUhNTnhCQktLbDJBNXBDWlp6VmVubE91MnNmN05Mb0p4UVk0UGcv?=
 =?utf-8?B?LzFQeEphM1FwU3UzU2d3NTJpd0NYMzU4MkMzNCtWVG9WWnRjTkpod3p6NXdV?=
 =?utf-8?B?bWY2MzcrVzBteU1kN0FpSEpDbVJLaTRLSEFUNzYza3pJZk9JejVmTXJiZWJ5?=
 =?utf-8?B?dm83WU0zbGpHRWtYb0NWQ2pOYVBnRkJneGpyWGV5dFIwdjBreVZlS1dxK0V6?=
 =?utf-8?B?QVBsZFpidTBnZ0NjcmtxWGQyckcva2dhRzJ6VTVjTCttSnF5cDlkMmxXQmFp?=
 =?utf-8?B?b3ZBYUw1cGsxbDhhYk8vZStqYlFieUJjSFU0bE9lcTc2SlpPY1dUeE4ydjNE?=
 =?utf-8?B?V0d0MG1xeUhESmNGVlZyaExlM3V4L3E5dzFLc1o5RnVYZElyaTQyNGhpT054?=
 =?utf-8?B?NWE4cUQzN1NELzd4ZlBIb2d5aGVwSE9PUlNFcWdoS29PUXJyKzR0M3B3VVA5?=
 =?utf-8?B?T3QwVnJsd2lWNzM3OExPN1JuNjNXOE9PY3laY1ZaaUdGNEk5bFRjTHJOc1Q3?=
 =?utf-8?B?R1hPeE04alI2OXRSRkR3WlhFUElGOFhQRUw5TGhPdklUTlNXancxam54MTA4?=
 =?utf-8?B?ZWdSZG1pTjM3ajhDOG5rTTdPYkY0UXBFUTFmRXc5TG5BLzFTN2M1UFExZ0Z5?=
 =?utf-8?B?Uk5uYmwzTkk3VTl6TktTeHM1R095c05zUE5RYU5Kcy9yZkROUTJ2dXFCdjBH?=
 =?utf-8?B?cHJFVTNpM1JnQXVhZCtKZWg1S0Vpb0dEeHhRY3dtdGtsRkRXZlY3T2grR0hP?=
 =?utf-8?B?YTRmL2FXZDZ2cGZIOFprMDkwVzJJU2Fsb09PREh4dUlPUlVGdFcrdGtTUnY0?=
 =?utf-8?B?L1lNbUp2NE5ZRWxnWkVWR1FZYTlYdU9nSjh3VTE1OXMvTG01LzlJdElRNkRm?=
 =?utf-8?B?ZlNnNTdyU2JwRzl1akFRSHNxd2RQNWdvcUN2L3lJd0EvRnJLN2NjTitlU09y?=
 =?utf-8?B?MUNLTG5yb2E5N3Rnbkp5eHBDdzh5aDhhTk96VlM3N1JTMlV4dHQzUEVQR3ov?=
 =?utf-8?B?N2U2TkhRTlluaGhkcTlRQ1poWHNvb2hYZ2Vyd2grZGVSVUJXaDdRVzRxU2N5?=
 =?utf-8?B?MW5VUjZvZ2FEanovUWtpWXFEQ0Y1eVZ3ZDBXN010SFd5MExDdVl5ZjB4eXE1?=
 =?utf-8?B?SW5SZFBtV1F6QjVWdCtWbE9vRzZOdHJGWUVvUjMzc3M1allUYnFzaHc3RFVi?=
 =?utf-8?B?d2VkdjZnUWFYN2ppbW45TUVyOG04WUdkajhKd0wxQ1AxcmxHdWY4TnpCQ0Ex?=
 =?utf-8?B?eEtpMEUxdTM5THlQQm9YSStJVnJsMUpxUlVHSzB4ci80YjgzODNrRDJiL0FZ?=
 =?utf-8?B?S3pWVXlrb2xHYUswZzluNTlPK2ZWNVhnUVVTQkhRQ05xQnphd1VYL2pTWHBJ?=
 =?utf-8?B?Y2pjUWhuV3QzVk9JWDAvMVprR0R2R0lURmxkMEdQRGtrcUo1cDloTDJNZ2lW?=
 =?utf-8?B?dmZTc2tFTk9QUExCeUhXR1BRc1NMZ0RucytTZzJGaFROUWVGcmFnREhObG0z?=
 =?utf-8?B?OWZ2T1pvQjFud1hVUlpGL0E1U05GWHJGa2VYbmdWci8zM3hUU25Pa0loZzRs?=
 =?utf-8?B?dDB1MStmd1UzZjRYWDFRMnlLeDFkTnl4SWNBdzBUMjVpc3pmWnQzMDc1V2ov?=
 =?utf-8?B?ZXFtcXRTdXpLKzFuR3dlVmxHRHRQeXI3M2I3dlpwLzZadEU1dVg0NEluS0ZY?=
 =?utf-8?B?K0FkRk1LWVlua3lMcnpXL0g2MHY4cW9sY1hURDNoaElvVTJiU3l4RGlBZ0hW?=
 =?utf-8?B?eDYwNU9KY25TSjJGc0Qva2RxQUtQMmRuSUl0Nk41ZDBRUERGR3VrdTRIU0dk?=
 =?utf-8?Q?uMcw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:53:04.8026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2481b1-e531-41a1-1c57-08de3cb2d16e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7345
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 14:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19360



On 12/15/2025 6:32 PM, Judith Mendez wrote:
> Add support for the beaglebadge which is an am62l
> based device that requires new build configration
> for u-boot and TF-A sources.
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
> +
> +OPTEEMACHINE = "k3-am62lx"


You should be able to simplify this file down by just having:

require conf/machine/include/am62lxx.inc

TFA_BOARD = "am62l-badge"


Only if we majorly change what goes in this file should we then 
duplicate the entries.


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

This file is confusing.  Since beaglebadge-ti adds am62lxx to the 
SOC_FAMILY *it is an am62lxx*.  So I don't think you need any of the 
changes in this file at all.

The only real difference is the SRCREV_tfa, but I'm thinking you are 
just trying to pick a newer commit that has support for it, so you 
should change the SRCREV_tfa:am62lxx and not create a new override.


Does the new board really need a different SRCREV?  Or is just a newer 
one that picks up support for it?

>   SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
>   
>   COMPATIBLE_MACHINE = "k3"
> @@ -24,6 +26,7 @@ TFA_SPD = "opteed"
>   
>   # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
>   TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
> +TFA_INSTALL_TARGET:beaglebadge-ti = "bl31 bl1"
>   
>   EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>   EXTRA_OEMAKE += "${@ 'BL32_BASE=' + d.getVar('TFA_K3_BL32_BASE') if d.getVar('TFA_K3_BL32_BASE') else ''}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

