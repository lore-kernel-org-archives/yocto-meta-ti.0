Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96FEE9B37E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 17:06:56 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165579.1772471211938333408
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 09:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=H/WwtgVV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.57, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJKAVjAu0bl+uhbNZxW5m6m0w7TcsyV6abKW0wBYG6Fm0yay6UKvZEMh7KqcFfHVLmsv/30X5GN1j0l+VMnM0xuI6QSvgQ7NToqymaoarLofkeQeD5wkpKDJwvJ9dEtHfztmvVscX2DNnCZPQSlSSOiE/XJZKPPU8Qmdpliz8VnrrMSRLQCdhHF8kdh8l3WB6edDNXlOkqpktdVpOiQPSO88CDqFkqQyeUwoStdinfwxM5weroYqNyQRsubxGbgyvQP7O7zrs3Ml0ZZMj3HLbv0hctwNjSpX0iMldk+GF/AL85RuAwfl0OBA7wloV662mfae98ukRZdWxGn/yLmAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E8pk11eslbI/gC7jtGpVnWExw9gquw1EZ5G7wEm0oo=;
 b=ZOLeHDkOc0pYNXvaf1AFMfY/APppvPWscVWyRhOF2iFSLxdt23wqZsPdkzqlaj+cBLzobr9IPTiKutyMGU+uZE8FF3had0pm7bKluY+iPtHHLH13dqwFzzeboAfwnGpZ45ntL90esU/cwJlF1GO+ZNpdhquMFS6NMfPDc+bq6B0Oa6I3IeVbjuTV/zXBscGpty9tSfW3YBs5PbUfkUZwuOPnsCw59f2UouJ3iXedxZ3MuP3O9TNYozqVJLox9E3aGF7Bgv0fC7yzu1xEYhCsg9QLh4ObwvfNOAHeLX0ENHxsVe8HR78S3QnWlWFQ6LMSM6pol57nb0PaIAIEn4RycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E8pk11eslbI/gC7jtGpVnWExw9gquw1EZ5G7wEm0oo=;
 b=H/WwtgVVSaLWwR7vzSXW6zvyxoihh2lf+mNaNoiRIgzKFgCBlHB7YyGK/OxuP0QvwSMfHduJGBwK5F44pSP4uXUFE/MEHRtFfq+E0at2ets05aKBiTBtTgukApUeGi5ehNHIjvasDDz21ElWetX+9IpzSnmgK+QRmRdf4hv1onU=
Received: from SA1PR02CA0010.namprd02.prod.outlook.com (2603:10b6:806:2cf::16)
 by DM4PR10MB6837.namprd10.prod.outlook.com (2603:10b6:8:107::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 17:06:45 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::20) by SA1PR02CA0010.outlook.office365.com
 (2603:10b6:806:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 17:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 17:06:45 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 11:06:39 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 11:06:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 11:06:38 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622H6cZj1142786;
	Mon, 2 Mar 2026 11:06:38 -0600
Message-ID: <96d49646-3f67-4a85-93cb-5632ee2747ce@ti.com>
Date: Mon, 2 Mar 2026 11:06:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/3] linux-ti-staging: Add LUKS
 encryption config
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
 <20260302144647.1705408-2-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260302144647.1705408-2-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DM4PR10MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8647d5-b2ae-4fac-69c4-08de787e1540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	BPq6Vpn/M0GjRrIRylDnq6VCWQuBhhvMCMoDRWaywscYtfCmTVi9CQl6XnTosy4u1GD35HHbYVR6U1DQ2xbvWloPAiiAukOHVXPOtLqBXj0iK6ZcBv8gTvTqOQTfAy+0S9a/Pe4wxOGm0rMB/uZNVRP5XGaem1v/38IFX/DNt9pfxpSx3vbirHOoqNM5xgFHFdaajXZ2oCgW3lDc6gXGTfpiDDBkmBm9hQTpQ232YtDPj8qeJLItFjiuyQ2IJ8JhmhyGVnVgTixwArWqVxynzadlMRrFuAADO2fmyaQPVCb/KJfUFYKWA4tBJ9GR7pkHaLDIPf4NtQRDlUNwSX9GxzRTLiy8kN8nrO9Q48tnPYzArPO87w4IbRWnT6WOf0NhhVGbl7S2f5NkZxqZ60Dr+f4WOs+lY3VzjUhcD73yQCCMPJoO3g1gmYgzVC4mvuuHrALotYkTUGErqKLfIQJyBrdEHvOj9RMXZIUyHRUgXEgej1YYcf7kjEyW4bNKETR+uq6AsL8Z4myttsPIObexElR0CbhUPBY9M89thCrZVgK0X95nGeKSVy7cpPPJ+3d7/JGtc8BQE73NqevZ1ME0wEp5SdcF+qJr3qjdIr6rRjDR8pJcuvAX1SpLgQ4N7TaxnzcpaEAwLd7VacduPSqQSL20usiKEZipiVHJeHVTNhAPwyktd4hk1xS5bFLhSCvBRhwDNM4TNGPsyNkhpwWMXEDPpfpcGyjO4eOFg0JAutbR1kkZYnRv/RIWlAgeO3lyZeq0167cZpSpNwIr8kWMv0b1+YJhCDS2HAhl6b9SfgpX+GwGfvBUBhViHxhFpgqSf1L7GbiLUL5eNIrmt4K0DA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Hh5OgWXvQ4Elu3S2uy55Jlxt7CDtcW4xzmaHSbdtX9q4I+zv8P1Jc7vnSnTQVwILJFcVEo/xsRcNBfEYPuXCELbDyONNX+pY1WsPFR0Iu7n+XZ2MrBwq7lfts4/SPUx2tMFzBnk8mWwrs2iNUdO1HoNV5kDkgxAYr4z58LceXJBd4weQyVbX4WgKFPUK3/bOCahguIeMnYc4kOWFfTG8e2eqV9fzKX9q4ypgFvIBHRvDfvxMnK8l5luR5cVCxG2p6n7LvQ9ZuOz3/p50wMo3xydrrkoJNRnCqBMFJ2w306Gom+0mR7iwxGMjy9HkjWB6pWV82X3vHndBA/WYiD5BN3Pq4JRQfIqzuX9d3hefpuo/f3VJCTBCSzR7QclpglznBbELKcvuIKaHYeWNoYVIB2YFmG0ie6WPisbcRzPHsamoJbBemVf/Tg+oZzX0RgiI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:06:45.0636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8647d5-b2ae-4fac-69c4-08de787e1540
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6837
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 17:06:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19624



On 3/2/2026 8:46 AM, Shiva Tripathi wrote:
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
> index 8e4ccd7d..572149bc 100644
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
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${WORKDIR}/luks-ftpm.cfg', '', d)} \
> +"

This should be UNPACKDIR and not WORKDIR.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

