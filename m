Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE9910854C9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:34 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18028.1773849985666212890
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 09:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=eHk6LZaI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.49, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFiyM+qeq0GXONzxVLNcqz/ulNTipby0VQb3OARvQLLrqUzOjq/vmquxfWix0oCSwaH3Ac8qiLRqYp99ekzjQMxvnU7fqSp/RFPMS34qNYErIQ4jGeVHuAvy4Xrboanvi+LihVWHX4MC46jI3XBfQFXYm7278eJpaYbYzSIDeX3ifSXpIytsEa+AtOW3ize6nf/hAO+oZCbexhZUmgv1XgJ3e+ZOeKsn+QOO/nnDLyQ0Iktw0KaAM+gZW0iG3QzsJ1cxh7/T36Xg5MoZpaj4ffPfUjFbTs4E8GRzZIrHZu5OLNwu5xQFuQLTQHYRhKTbBE/fp98wbJO6+4HJfG8KSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzGEsWqcT7UjJBtxGmqr7GjdqMH+BcWK1QBPNrzHs/E=;
 b=VFzicVJ4mIwO9W6eTrmqEHdeTci1o0aJH8DaDdQ4/jooBOBOyAlMBLNPCK6fRSfLXBZ8/oHNtYKvl6Iiir0dfBkWEoL9L7dWR64f8RuiVtMhVpdjw2K1bHoLWBy3+nfl2UoL/y00ExpYSrmYKQMLBCvi9U0jGQdCurg9GRxMdQal4N5m2tWw3Z7bhHpH3FPVazlWb4segEf7ff4TvxzMV7SkxDeQg0aKc1NoSvXiZu6XhY3oMoiJDbpnkzW79eabfnaXT8xD9fXr3+N094myuYakz92ytGU6Sx/N05L1tdgubh1+EOF3iExbKIKfHk6HDBaK+M7yWoJS9PwNbmEfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzGEsWqcT7UjJBtxGmqr7GjdqMH+BcWK1QBPNrzHs/E=;
 b=eHk6LZaIVMAZPmqR6k6O6KkJN34goGQ1C6DQ1Vvwa9X7O16aUbF+CKEULLuxdmwb0TmNmQ6er0VX4SL4c217Fx/kTEO6Z+N1Wi+ZkEXTTS+cyKxN3Z2IbQQFq5sfSnU4heKK/TrbQbvfYGuIO+kJthWJJS3xa7eUQYxhwkcbEus=
Received: from CYZPR10CA0022.namprd10.prod.outlook.com (2603:10b6:930:8a::26)
 by CYYPR10MB7675.namprd10.prod.outlook.com (2603:10b6:930:b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:06:15 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:8a:cafe::d6) by CYZPR10CA0022.outlook.office365.com
 (2603:10b6:930:8a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 16:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 16:06:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 11:06:09 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 11:06:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 11:06:08 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IG681j617932;
	Wed, 18 Mar 2026 11:06:08 -0500
Message-ID: <e8f8acc4-1165-446b-af83-f455a70fdf5e@ti.com>
Date: Wed, 18 Mar 2026 11:06:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v6 3/3] conf: Enable dynamic security
 layer for LUKS
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
 <20260318145732.2115521-4-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260318145732.2115521-4-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|CYYPR10MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b20c50-988e-4363-6a17-08de8508473a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	B6kh/xJFTqFYGv0Q2WxV1482jXJUe8rsTMyGA8lTUiyiEBECkhtrWmlD1eWa10sjyHwayxqG1urYHXWZVQKRa/1pK2puTy3hnLY0IinH8V5K2eGovFClzQPIe0Adykab1APV5Kn5oWDZL2F8P7oqzqoSddrC80i5mxhBb1g/L6Unyc/rpnh9L3fkBoEZu2IING3EW1+Nq+TP/sNIQrnX5EU6CbreBHQQe6Ht3Pzid1gkmYtgYYMAigc4CemlUNaNYwSSxHd7EmPBQo4NFCV5btUceU4u/TInFgt9VEW2lFvkEKr7eH/eH32t0quUaiUMex3tBJUXOuRQwYQ9yc9cg8OhZoeWLnmkY6o6mS9tzmm46xERDJ9xI/rTB2EBOb8NPDccN81RtTbD8SXrLrh8gKRBB09q91dlkvuBASny2EpREiQAFqwxpxbWRuM1MYQso3I8aCIGbxRdvTmN8/jMK7LjzXdzVb0/tdRWMtZSRabAG5yXQg9rn+C8box+zL1weUEbuTv8KActVIKOMdW4+dxvbIYVqVo4NcwYetVucXCB0K1UkY8WHRzyBeoqZVv75JoFFaHJMQMTXnwRbLrmZ2hJhGkVjv6f/PHO43q9Vk2LUytTDbkSkRtP+OUhgoUYwGg32rCVjjO4cFMxj572yMMEaPK4bqE0iPjTBaQzLlBZtjFrakPy6d7ikZC6RZ3V1Ur8s5MNxLTnzeSM6s5rJXFRny0fcGbYKadoOs4dPrZ86NQQlxoZb3IFV6Vl1JObd4gvqiwR2NLdd5oLeXVRNQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	axq50a9Zyfr6KTyfRfDJFzbFEXSmZ/2O5ak14k9jj6toZBmu46Frveu220u71bbyjupfA7gD2TB8znd6zm7ZSH+ibZ2OM/uoO7BE87i4rh9lGlv9SSgq+jkODHJxwbnL5+xMI+p/q+KxzOOge+vjoJv8rdAQWbyoQ0/nJBq8WlErcHZIB/WV14LPHIR21Wpw2JiBayTKyDp+Ujq+BZfvXASHAaXNqsdaTyeQXmp7WTutxme6SKdFo+z9L1nUOBxIkqAuJK1wc7r05usGwkmR6tb3TZThRYr0Fxu8HQZo+cnTRxudwf3Uem+NvtZzZ2D+H1kPAe1ZdVXLXehwuao9m24eKpfLlAEAt2G1M7zciAPKzub/pTnmWX/KueH/VaQOy3u/z2JEvXLDiMOSXRXWKDuHByksjHjUctMT6H4O7qxSMasQAS7Io2Teun4SSe+w
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:06:13.3608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b20c50-988e-4363-6a17-08de8508473a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7675
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 16:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19764



On 3/18/2026 9:57 AM, Shiva Tripathi wrote:
> Register dynamic-layers/security in layer.conf to conditionally
> build LUKS encryption support when meta-security layer is present.
> 
> Update ti-core-initramfs.inc to auto-enable initramfs generation
> when DISTRO_FEATURES contains 'luks'.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   meta-ti-bsp/conf/layer.conf                            | 2 ++
>   meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index f78da573..ce2883ac 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -24,6 +24,8 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
>   
>   BBFILES_DYNAMIC += " \
>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
>   "
>  

You should also update the LAYERRECOMMENDS to include meta-security.

And you should also submit an oe-layersetup change to include 
meta-security in the arago-master builds, commented out of course and 
add a new arago-master-security-config.xml that adds in the new layer.



>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> index 9d3cc612..15c05e04 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> @@ -5,7 +5,7 @@
>   #   TI_CORE_INITRAMFS_ENABLED = "0"
>   #
>   #------------------------------------------------------------------------------
> -TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
>   
>   TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>   TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

