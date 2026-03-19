Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81E4109022C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 13:59:40 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11839.1773928770980610863
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 06:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=KnONZQIg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9H6rGfDImbwlmgm/GqKvVkDh0ADVl+/0sLdQUYgfYK6eFufutwDHFwFteF4s5/nRo+dh2rqJ/j5jvzD4iSyBuToTcaCdkfwQ7qMEdGxluPJAFmEusFYHej9lJjkMObaxF81AkczNrt0e/fZe+Qw8xsFcGQyAI6QB01ofsjTD1lNDGGRIJQlOXO0buV5hMkDoMsEuC0OL29ICx0JQbb9cDTQlVltY8yFFBzYMX71015G0Xd1LKnSvhkRuJTbgiNcxo2y64KXQoZ/TMqFHfovsEQwpX6gnD02bsADksuULl+02HwSE2dy019/K70Ytk4AGm889boA1lEs1nAx2Tcpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPUPOcyYkOSbBzjaGip+0LCrDjkS3asI80bpy0IIALM=;
 b=rlHcC5CfhLZT0esT9K+UQV9APWDZ51PwkYH4oZOsF6jHdNhNPBbcwE8+VS8k/lYEvHFme7iguQJ9Fap+Io/LVqyh4UJpsnxBlQGN1cqD9cktPLg00PxlCssFyio6fy6Rb8KomLNQYZCi8G1+s/45ZGfIGjV3xNXscQyOlFPPbGYNVw9o2r54dOiQDYVS3Cvuyj8PydGx+fiuNS5Bw+4Bb2PpET84R1oC6bSo08droBDogICUtU0++l+QdngBd0c1x1kmnIdGZ0Xxu81NYi2ouX9JvcTmmWx1+Uwqn1HCC3r6x6danz8ksb/wYGY/AjR6G5IbPCbsFfKWOKcyC9o2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPUPOcyYkOSbBzjaGip+0LCrDjkS3asI80bpy0IIALM=;
 b=KnONZQIgxWjhT0aY/ie136LGiI4dSI4Rg/PLcVQKmkggoT4yeFysNhHqkHgSeaLhTt6uI881ckOY13Z3kTYWOrIamanQf6tZFb9G0qq8qCJWTWUKnP+KeWiOqWA9D0xu0KiEFPcCSedfKOOTLQl4r6k/lkbtqnzh8JdjB8DeCWQ=
Received: from CH0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:610:b1::26)
 by BLAPR10MB5043.namprd10.prod.outlook.com (2603:10b6:208:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:59:28 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::a3) by CH0PR13CA0021.outlook.office365.com
 (2603:10b6:610:b1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 13:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 13:59:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 08:59:25 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 08:59:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 08:59:25 -0500
Received: from [10.249.32.190] ([10.249.32.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JDxO512652675;
	Thu, 19 Mar 2026 08:59:25 -0500
Message-ID: <d9e195a7-5735-410c-be03-734eff2a7497@ti.com>
Date: Thu, 19 Mar 2026 08:59:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v7 3/3] conf: Enable dynamic security
 layer for LUKS
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
 <20260319103533.2431033-4-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260319103533.2431033-4-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|BLAPR10MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2e936e-a934-41c3-e9a9-08de85bfbb6d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vDDgG3Ee5RFyez6xDIeIcApW21yOq/idKl0KTDoUEhfcWBiX4rCBnBPyWaH6l5g67hddofMJ49U+PXCw/gx/Nw8xT2HlO2Q5KFQvpQKqk2Kp99whc4FrZpTKFiMFZp6MtOwiAJ8ItW6T6NtLNLaCmsfk5v0cqKwq6DiNWQsVn7uLJo651yyWE1ozh5SmjBD0e0TjmdTTz9jpH1QLQzDxVIbmqPXMZtZi9dexEDFQQsj32YYgcykrGD6ZU6Rsta5/0F/9uqm/1XuD4Y9ghVMvifVvjcKLlhX/8qe1hAvZfkfZvfhdbeyaMjrmd62lObkyl+bbQbREJw6ClVlPyf10YRtBhOpM7isSNHtGsSsPDmCDG48xYJPNww4BJpQ0RJiVa2jsrKw2srwxQkGZCPMpX3amZl8FGcR1yafYJzHH7WTaRX8/swJlqkW+3BVFsS8lQ8rUW3zuwU+WkIMbGOtbe5mMett7WzSih7UK38pgKjcCDSJhQqwQNQmIGb4kzivEFswudVa9f6gMtjktjEQTyLKJzc1kYV/ghhE978WKsxt+w498MJMwUJKZQevPWiw/ARjZs4SvBr1RQyeDMEO2qM8N4KgZFnxLFjTz41GChRspDZvfg34YluE2Da464hrfUhFhh2RSkWllW2pZOntryvsgd+1/5/2Wc2HjO7w4m25Fw6+fClDkkFX5WMwzlfD0bDv9sjbWMKC0n58B9nIF9crB/ZJQowx6eqlHZOEGRMRAFcSwopqkCfc/qOCPAwqPPBw9XvQLA+PF2eBep0gpFQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U4Dm7XDwXsmlt0ytCsUcMJSMdkf3S/ZcLHIsGzv8NPIgunnNMR8MOFdK3KfNkFImVCzGAdhj3c8FF7lx+GEoYuKXtFhKMewA3bah2PKUSjpckSIEdrVrD28gPjEc0yTctkZiUjPhhh2XVSjIwBv+viSww0TbAGQb5pj1kAGXk01/gAXaKRmTyn9B4y2ZHtFXWUBOK6omeRI43k41ivvFy4cAZH3kr8NiKOcOHbdyXtwAJbi0ADPsBsQ3q7Q3M9HUu8oMHX1oQqQHesqeXSGRNqkdNUo9I8sk0ULyl6RUQXQawhQXWcS/c78Ms0wr3wi2KBpBKzTeU57CweSogYBBxe7+5ozt9hJLF/zN5Ukbl2iXebHlMnm9FswxAueZRwmPCt2qgILxL961wnXeOndGGyupHFayIjExNAddRJPBiImYeO5kWte+SktCPGH/k0pK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:59:26.2005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2e936e-a934-41c3-e9a9-08de85bfbb6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 13:59:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19778



On 3/19/2026 5:35 AM, Shiva Tripathi wrote:
> Register dynamic-layers/security in layer.conf with BBFILES_DYNAMIC
> for both 'security' and 'tpm-layer' collections to conditionally
> build LUKS encryption support when meta-security/meta-tpm layers
> are present.
> 
> Add meta-security to LAYERRECOMMENDS to document the optional
> dependency for LUKS functionality.
> 
> Update ti-core-initramfs.inc to auto-enable initramfs generation
> when DISTRO_FEATURES contains 'luks'.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   meta-ti-bsp/conf/layer.conf                            | 5 +++++
>   meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index f78da573..36d05b5a 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -20,10 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
>   
>   LAYERRECOMMENDS_meta-ti-bsp = " \
>       openembedded-layer \
> +    meta-security \
>   "

The layer should be same as below:  security and tpm-layer  I was just 
using meta-security as a placeholder.



>   BBFILES_DYNAMIC += " \
>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
> +    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
> +    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
>   "
>   
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

