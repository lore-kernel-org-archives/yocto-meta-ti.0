Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD662F47CCB
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:13:57 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53618.1772741628412907386
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 12:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=BYgv/Oq0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.59, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja5rWB1j1y5Hvuwyrb/vnwYpMROoQW1XLkUvgLZMOSNdyQ+/ArnlRIHrB+k4yvO47IpJbTppjf7i3OUPxui9WDMy1o7pCi9VVWdeywd8j3Sli/51Cdb8OAy9WlLOFb7LhyWkuGVqM5AX5cGHpYt+eIpLFb6/iWSEYwxJl7phI7MFP9KGDZY4EgMS2ETNQDO8WGRPS+WW75z0sPzN1392X4epo5hBZSHG+kn4Oudzp/xiOSDVyGpN1TrLk/kkUJB7iyDdiXABQ497+Pf4ll0b1EmA+decax+pe07eF4X+DtRfDcOeNwrgJ/GbPmf2fiokaTuJ2f7mIVx0u0hB9uw4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpezCHn5sO2Ta53DrjEcGIq+wul3iKALQH6xxF+WeaY=;
 b=gJF5Quq0v02tLL8fu+54N+6/rg+0VIiot5vloNb7/tW4rI6NR5I9XkC7ckC839he5LKc7mr7TY0Mqz+SSLL19nbe2LerYufV+ka9yXu20XOrZPXdMN9ZbC+D3YheICFaH0+Jp+sH/mbDgu0cjXfMdQWQUHrb7MDE376Qjcq7/cxsl8nkkil1IRiJFrN9KkwyNtYIfUIIVNhJ6jnqzbQ1KKtw1wENtxqbf8Fudb7Q641nUSnKe8mhIDW3ecIWIFx3Ulghuz0kTvR72oCFyfTY0WhIDbGapYDjcScTvdLGnG2N6hEJWlFu6rZl+tqKRvt+mmRHNVOllq7U6z7Hb3lWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpezCHn5sO2Ta53DrjEcGIq+wul3iKALQH6xxF+WeaY=;
 b=BYgv/Oq0IVcQE4k+Eq1yAkv55YWjToKU8QseZne7GXyoIXRNELZMFPmrSpvgcCQ7KHU1OPRby/jmapj33e6ndaXWjLmNYnLmN9y6XeAJ6b/PcXR0WFY/7+AkL2cF4fot98k04/B2gLLs4lahMi8/w+vr1DInt9C7rt/GlD7+u7Q=
Received: from CH5PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:1f1::6)
 by IA0PR10MB7666.namprd10.prod.outlook.com (2603:10b6:208:481::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 20:13:42 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::1a) by CH5PR03CA0004.outlook.office365.com
 (2603:10b6:610:1f1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 20:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:13:40 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:13:39 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:13:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:13:39 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625KDcTa2971373;
	Thu, 5 Mar 2026 14:13:38 -0600
Message-ID: <aa64d1de-e70e-4ebe-a379-79aba4b9f2c5@ti.com>
Date: Thu, 5 Mar 2026 14:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
To: <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260305172148.3684377-1-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|IA0PR10MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: f379bc71-8d8a-46aa-4591-08de7af3b14d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|4022899009|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	cdOHHTh3P3d13mrjfSmwvH+ZPUZw0U8anxq3qn7LR00KkYIYMiSa13HHSc7Xwd2jICNPSvsNCLn3c12vS1XbYEFKTvCKq4zHKpAS9gOmc1kJ0AUfJ6YWeQejer+EiEz10/YdjRSRIkFBPMQzXzhDSrtyJz9m9qEzmso7sefC+dqM+seAjiy3gd3P50GlCMF5hEXSeY6NJj83V3gOW/SJOr7CcvZuHZF2akwRH5ZsF9I4Jtrq3PeXEvoEMPjvBs0CZ11TC54YsBd9bOtyNmSk/I2a9S7VNP+z8fIzrfmHMC8DA4kx3YGzMQFqz1we+79u132ju9eHITxW6qkgDQ1kj7Hjdzsst/JH8k6aM6iZFPug9QakGWCj2dd4aJNzdPRORoK4PqRT9kqFnyLwXjkDmLeLHiVnMVV8N1y9l8qRhsj1ozlbzRNY+OpBa9tJT2IUciS9WqgX2Kz6UPA9Ubm2yYwZDs1BhkzDBjTGFAiGDbxoYuWqUENlZDKue37BjB25w8hzjkmpvRqu23YacxeRgeZqJVL3Af9SL8OWk+PONjyUYFf4K5zOJ8nGEqhBFNJelwnBcEbGJ31w7wYS+BjWAeenG+SWtj3S/xRWQx2Rit54CIG5RSvlsj8qU4C9EqgVxPw8v8ZGzM4tJR4MdjXE4OZ8jjuMeas4NZbFtxmvnlRfpkxsmC8m4fVxXMBMWpj6CwDA5P9KDT3UZOO+wol/8lICaLkpRKI9SdILAttBgoqJbHGaOp2E1Q/MdSBvv06UVmAe1oZvQa9H85gtpJ3CnQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(4022899009)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pHfdYYBKV83eynWlSNKE6iwXbzl5LV1HR3jDuKTFb7mZWk5TiZxYxVQcpN40X5zDc7ulNtiblc+yiaO3tREkf/HCJ0uk6foVDybAhbGdafs4HaSrFvWtnQSo8ONqf+B14vSmLHUg89wGsAnTWsopEEECQs3Zom4qsgYkAUrKluh/vX9k78k/JBLwMTrrxrGxBbIjh/yFXRi+0MLNiOW2x9XDauoyNJU6gpTNOLeps5s+vmM8i9lY2Xv0kSE7bDw0mDdSKg96MqW0FpHNlCNHCQhncZ7iAx3E03VA0ir6X4kXZU+atTKEhT4HEM6je101c5k/g9kjaYql8lBP7D2nvQXLT0q+hZnkvj8GLjRVJBlpE7MZduBfWj2cRaGL6Lr0gZ4rbUuur90gCVWn7vbuO/1IWdMpwXM3qm+cHe7ePJUBMcufhJI+ZZpux6prqS+k
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:13:40.2459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f379bc71-8d8a-46aa-4591-08de7af3b14d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7666
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 20:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19658

On 3/5/26 11:21 AM, Shiva Tripathi via lists.yoctoproject.org wrote:
> Add conditional kernel configuration fragment for LUKS encryption with
> fTPM support. This enables dm-crypt and necessary crypto algorithms
> when MACHINE_FEATURES contains 'luks-encryption'.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
>   .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
>   2 files changed, 37 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> new file mode 100644
> index 00000000..234cc087
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> @@ -0,0 +1,28 @@
> +# Device Mapper support
> +CONFIG_MD=y
> +CONFIG_BLK_DEV_DM=y
> +CONFIG_DM_CRYPT=y
> +
> +# Crypto algorithms for LUKS
> +CONFIG_CRYPTO_XTS=y
> +CONFIG_CRYPTO_AES=y
> +CONFIG_CRYPTO_AES_ARM64=y
> +CONFIG_CRYPTO_AES_ARM64_CE=y
> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
> +CONFIG_CRYPTO_SHA256=y
> +CONFIG_CRYPTO_SHA256_ARM64=y

Tell me more about this symbol, why did you pick it and what does it do.

Andrew

> +CONFIG_CRYPTO_SHA512=y
> +CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_CRYPTO_USER_API_SKCIPHER=y
> +
> +# Additional crypto support for LUKS2
> +CONFIG_CRYPTO_CBC=y
> +CONFIG_CRYPTO_ECB=y
> +CONFIG_CRYPTO_ESSIV=y
> +CONFIG_CRYPTO_LRW=y
> +CONFIG_CRYPTO_PCBC=y
> +
> +# TPM kernel modules needed for initramfs
> +CONFIG_TCG_TIS_CORE=m
> +CONFIG_TCG_CRB=m
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> index 8e4ccd7d..69d6217f 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> @@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>   module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>   module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>   KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> +
> +# LUKS encryption with fTPM kernel configuration
> +SRC_URI:append:k3 = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://luks-ftpm.cfg', '', d)} \
> +"
> +KERNEL_CONFIG_FRAGMENTS:append:k3 = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNPACKDIR}/luks-ftpm.cfg', '', d)} \
> +"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19655): https://lists.yoctoproject.org/g/meta-ti/message/19655
> Mute This Topic: https://lists.yoctoproject.org/mt/118155818/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


