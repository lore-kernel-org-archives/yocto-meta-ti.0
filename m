Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD97DEFCE4A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 20:44:50 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28609.1772657085221130146
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 12:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NLD9pRhG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.56, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGVn9IoshP8msbjkJUN7H/qXHfWZo782EZoI/CwIqRr6J9mWPKDqlUN/520B0WYRebcE9BnELbZKSug9+q8N9/7joMGNQk3au0Z2kNOikhAx9eg+VWWLzklt7UPKtbtmYMNiyny0g2g661TH+ZeZ3NwBgHRyy2cnSh6NWJt4SEvU5EH9vgZ9ULxOpGKDgW9B4r0HUXh6mH7bDcynISXdzZRcirsdDn52akSWerAJUELyvEFk6NMMySYPCil/q7YVkdWcS63yRPq1xTrPnYWlKCVB0PtblydBOf2EEeeg7lhCh9/99xQY5BGypFVSjUlQt/POHFh/4R1QkUPoNrBUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Un4AeINTYyn8JR/UquCs9KbnlAyVouj1LSN0GbNPe0=;
 b=UTtRYVpxTeVVmm9MGZr0PFgclqInI3GwdYxiMYbeKdG+ZBbaqjyyTh7rD8qHHMAjoWaKkp9uCoeABoukVplGY70dDM/MvJmYUlvmx2ARDePZP0HrCpvvDQtEUvPc9RgdgfcHifpDv3RzeXGoQOKPmPb6kT/BlMGVnrtc9UNKN5G/bFpFKsEoFfzEaBlYmzPjusiLtrJ/E/mJj1/RVL0/BcjUm0T6Dz2KhkC1ND53G2Xz0hYOP0uq/DharyY4j4O/4Q9gixLVMEdfcR6EziAkDDvBTp9AANMuKmI2rwekHMRq4s4UiCmmND01lgjoTMLtRuSfGIkTr4VOLJxMqLzqDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Un4AeINTYyn8JR/UquCs9KbnlAyVouj1LSN0GbNPe0=;
 b=NLD9pRhGqnEdkG/rD/ZG6tFTLTX9G53w8CiLsq1RBmHOS3tMKK8QFHMlhZBbj22DCxobs8Ad4iHM4O56Q/7/VdkZm7KmKI3bPyRAn62APpaIOG66P+VZMD//KYSzIc6Cjo8XNq1HWdOl2B/ZGLIg72MPBi9ivqItAkLWzurKUxc=
Received: from DS7PR03CA0332.namprd03.prod.outlook.com (2603:10b6:8:55::19) by
 MN2PR10MB4335.namprd10.prod.outlook.com (2603:10b6:208:19a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Wed, 4 Mar 2026 20:44:42 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::6c) by DS7PR03CA0332.outlook.office365.com
 (2603:10b6:8:55::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 20:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 20:44:41 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 14:44:41 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 14:44:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 14:44:40 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624Kieg81042921;
	Wed, 4 Mar 2026 14:44:40 -0600
Message-ID: <818eb2a5-f0b7-4af8-9eb6-98f88da62488@ti.com>
Date: Wed, 4 Mar 2026 14:44:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v3 3/3] machine: Add encrypted boot
 configuration
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
 <20260304193824.2495898-4-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260304193824.2495898-4-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|MN2PR10MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc93794-edbd-4267-43ab-08de7a2edc3a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|34020700016;
X-Microsoft-Antispam-Message-Info: 
	d9Q4VUSetIWHxm2QmCR3O1xUQx5ybqa1sbqsz555VIfVxoQ2uXho+2OGXyMbUxuXnofWywN6HiWAlhhMMS3zalCLMMhXFpZ+iRn8cAvEJjpxCOyDG3E3BtoLi3xeTsngO0DRlRbphzyw6pq+3lUwhYYhA4Lx/snIJGIRxLVnKWH3+6+hVjAnXkYMDoYaYeap6cVcBV1hnk35h7D4xk5TzHc4m8wiTSHbYaCABoGjtdwfx6fhBKJTICW72Re3NDzavf3dHEMoKE5fz2PL4VAxO9sIQwJIrE3d20dTIqHJxhZH16DIWKc7jDCJkYYH73a4uPJWVtTKDvixqxMAMEcZlEw+8MN28S+NETBGLqQWrIIwfYPYXXRYd8d9edf4TG8AI4oYlP70XAIoy6MPtCXS5+BMB6n2Du8tKDD6O3rnufF2O5zLSsQYTgEihYiiUgxba+P80tRNc+9rUv6kZrBo5YQg2ddXc7B2Nz+ryX3OshWcMyLR/OSgckgE3NpjoTNqAWZM6ZsgA6OV37bzCpvLfW5F2VcOQZU/Mpr3g7O++wBkMbq4VhQS0Rt1w+ZdkzCOozzNCuvEoQvRfoqdDti5MlUilpFuv25UfzMdqPYjoO+LJyl2MJz8g+dVyDN18ZyN9IfghF8nFIVI+mCvNZSVGsUwmVTDnjHk07oZr7B7kKSFPQHDWqoQNU7yz/qzBFeTmHxcvOSyH4iPhMGftwiHrM5YzjHvOKpTdIqSwOKQr7sDCoLBfDazkcwsz5HmjGkH+z9kA1Mej0nQ+51yVR2Wzg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3cQmKnKE2AWbQ2jU+nJeBHHWqqvMU1GPKySp2VvAJy09gJFevS9w2MRcPaX5xI4/Sh9ve9kZYeyp7raGGuHFpYiC3UghDoZgwv1y2mTxwOBq+acw6xs+nDBg7DFB7tsxZ+gVD+NWIqWg+7x7jHpkRhaiamP89pGK/rvTvvMflGK2PY2e+iinqmGadLfgIS3dEE/JFz6msQAnysSg5sfDg51NHkx+bI35dHkC56Q5ScnnoOr9x7H4nXV1h280OPW4UmYzSVaCUOfy/SavFZwaH8UFnk8+/N4NqZrh+Zzcsj1S8USAqyLNPbMlXBAKddvX9wJMfzUSkRM15ETlnhMFmCo/8Rqe9vcs3by4WQ7Nn39HrIlhtRZ2eVxD9K6EaHnTBdK3tk+Se/12DfDQwK6yF7K8seFW6yIoE31F1xpMKa7LICgIA2cmyt0dCx3dPBd5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:44:41.4110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc93794-edbd-4267-43ab-08de7a2edc3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4335
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 20:44:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19646



On 3/4/2026 1:38 PM, Shiva Tripathi wrote:
> Add encrypted-boot-common.inc for machines supporting LUKS encryption
> with fTPM. Triggers ti-core-initramfs build and overrides IMAGE_FILE
> to use uncompressed cpio.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   .../machine/include/encrypted-boot-common.inc    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc b/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
> new file mode 100644
> index 00000000..10a5cb86
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
> @@ -0,0 +1,16 @@
> +# Common logic for encrypted boot with TPM-sealed LUKS keys
> +#
> +# This include file enables ti-core-initramfs with LUKS encryption support
> +# via the initramfs-module-luks-ftpm hook module.
> +#
> +# To use this in custom image, add to your image bbappend:
> +#   require conf/machine/include/encrypted-boot-common.inc
> +#
> +# This will activate when MACHINE_FEATURES contains 'luks-encryption'
> +
> +TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', ' ', '', d)}"

This line does absolutely nothing and is not needed.

> +
> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'true', 'false', d) else '0'}"
> +
> +# Override to use uncompressed cpio (U-Boot can't decompress XZ format)
> +TI_CORE_INITRAMFS_IMAGE_FILE = "${TI_CORE_INITRAMFS_IMAGE}.cpio;initramfs.cpio"

You misunderstood.   This file should not exist.  All of this should be 
in the existing conf/machine/include/ti-core-initramfs.inc file.  You 
are just adding a single option to the existing settings for 
TI_CORE_INITRAMFS_ENABLED.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

