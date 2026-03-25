Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB03106B53A
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:33:16 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22320.1774445587670576077
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 06:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=G0r64/ER;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.13, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHddMelnuHFHmo8bY+L9mImWhEMmFP+g4NcXfKAkPGNfSr1s1QVWC/yJN8b/qREM0z1JOn/UtgEg0D+ZergA2SDUyrJE6/rhJmSxL+vXRDK4Um4iHvyDbDfdEiUy36La8dtedBgTxofdKqjvNt2F1zrSZHteUXW5RrD0pR5v37zWuGVg+d4gIkhKRo7dM/h1/s0Eix85Ksru6WPdnFm3HBsNm7XKzOKCUqxLH1ZZjsJZwz8oow157KEFQEena2p2f/IvE/W9tjV+nrGTuFtKewGndPO9/x1YB80gByC8uEl5InbmlKS52AkRbHt3RkKJqsy9i5vIyCJhiXHDsYTpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKmXbu/rzU8us2nwUp6hYSItABiQoTs9i5vy4A8ZZ+s=;
 b=gwlygomwAYYMpzA8DdO4PHxpXJzBFw/5nPNe9B1k/spDfJclGxFXxX7Equ2+HDtK8QqUcVGMDhLiuiDBDSsyxjcjgd8iGepK1qfKnC8EkK+RoNNw8dFc+AYEDmK/AlLf6MKIptUH+9vt2QftDUF4nIAqJmiMhcccW4eMB73K0nL0Ztgn+dqiCOuJ/WYfpb8r6HAhLJN8vBAn/vlixqi0EOOupHBUk/9ji3/9OPgXN9DsqQReWEb5fYbIQK79KjSkYT/f3Rkh3iOzWvNJHlSC+KiLbFJN1DlyWGZ+hF3iNc+b95gOMHIkIxOs+F14GngWpL+oG+5HE9qkgk1g/vDoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKmXbu/rzU8us2nwUp6hYSItABiQoTs9i5vy4A8ZZ+s=;
 b=G0r64/ERzkOlNoqLQspHEgiqY0fDGs27uzBvJvqT0zY/LjwyhV2N1l1Tp7d4eeZC4oYUWffAr6sCm0IISKBydavLcXDw2AfZCOyFJfb3N1YWYpHYLKn7NWPT8mCVmw4Mp2XnZ7/OGuvbKh5YCxOKcvacFo2UtBL6MInlTByu92A=
Received: from BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40) by
 DS7PR10MB7130.namprd10.prod.outlook.com (2603:10b6:8:e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 13:33:04 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:94:cafe::48) by BYAPR01CA0063.outlook.office365.com
 (2603:10b6:a03:94::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 13:33:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Wed, 25 Mar 2026 13:33:04 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 08:33:02 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 08:33:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 08:33:01 -0500
Received: from [10.249.32.33] ([10.249.32.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PDX1iP4070426;
	Wed, 25 Mar 2026 08:33:01 -0500
Message-ID: <6f06cab4-cafb-49b7-83d1-acb73d2aced8@ti.com>
Date: Wed, 25 Mar 2026 08:33:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] packagegroup-ti-core-initramfs: Remove runtime managers
 from initramfs image
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <anshuld@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260325062856.2664785-1-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260325062856.2664785-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DS7PR10MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f318da0-20f3-4a6e-35d8-08de8a730b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cWo+secJR5ikAB4JPBVnpzIzhb5XMbTJKy7xwaHUAi4HmIO+224/O13nExA1r2rpOfb0Q5uBmgFKRi1uXEZBt9Bp9PlfvLsAOdctNYKeOHCUhj/Um5g2qVMx9QzGt7eKCZa4XombRgbgL2OJ1F6VV5V2RHdPVqwU1YAfYwPp0TukYeK0A1uA0E+XALWWllpB1qbtLOGF6+amUiso3iiT+KRKoVdNxCK+tYrMAcUN1UxQr1pgMhug+c2Zt7b6Xx5sv6XUuq8QM5SYOQ6aYWVy46956S72qXM57UypPYYLAG+qQazQDqW91YhXVmGOW1WIv4KRq5cqpmj0XsI/P5CIYPDpCHDYcNm2PLCgrHciIdl3J7HYclr2Oer7WPP9Qnkv5XdZcDdqQxSeY18UX3eE7aHhuwas+/omLNZPudVmhhetJbbAoHeDtly8cGwEulEBUOxQBEliX7Y5rBTZJkdUqspo/cVoup2sfT38ckJTJ+ABQXmBPAyc7pdmdh0pMRFjrRh/Qi+JsIiWHYwIDBYF1GbUDaZw0yUhaVcrHW8X6gJcvhbiOBgxJx9xgxuUyDHLBYrO+rH7id6EJXxLP3KfDmyrGYB9TBfVN4Alv6aZA3GtBkSvfobKQSNwOdCXYwGYMyVpBUdjciQgQpoCDt6nyOFWgJJlFX2zabrot1qTZMNet5jG7hrwH2ZcmRt3k2E3N6cjFg4jm9Hxnwlzb7yX9T7Slv/GtNDdMVUTp890rmKz8Zk7a9RgLPPkwy5/NjYDcfccoizhjHJdUMNSfEIlcw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qMouttdAD4ue89yyHcn6kbXLczHX5qjwdrf8nDsA0Ymzp7VLyzvcG8RCAPT5K27EQM50ExOfmvSyJtCG3NXtsrWxBoeLHzPexQmeXDoEKg4voU/BSmGQgRJaHr23Budem8Mui40nBxKfkS6gxAucPmx2uGMpw1Y4Ood6dxc2jYXaKsRsZI4zGpScDADYuRdGsjTt4ST32A1TyThKM0DPaH41/J1rwZQgRB6kGyKZh0QkFJ0nXYCPE3X9IsX65j7fwbaKESIL04lMkpQoDuOsAlXK9FnyyTH6hITqSfqMZP6dTXQPldyr/5bN3XkXIN5Gj6hnCUUTZ0Y2kpqzyQsqhNuPHL+zQbjQQcBD2/ghyxQb3IeSg+Gkidwbyh4QBNUs3wKtJq6QHTdn5mpsdUZWGMObvjPwP06qjz9xd8dwFaEU4BJ6BEmrWZ8f5pqlQqhr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 13:33:04.4436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f318da0-20f3-4a6e-35d8-08de8a730b17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7130
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Mar 2026 13:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19815



On 3/25/2026 1:28 AM, Moteen Shah wrote:
> Remove runtime managers since ti-core-initramfs does not requires
> login and other services as it is being used as a read only
> image during the boot. Modules can be probed using the udev from
> initrams-module-udev, hence remove the init manager along with
> others.

I don't think this is going to pass muster.  We just added those in to 
make the initramfs function correctly with the rest of the system post boot.

What is the more in depth reason you want to remove them?  Are they 
causing you a problem?

I'll let Denys chime in more since he did the work to figure out what 
all we needed to add in to make it "correct".



> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
> This patch will help in reducing the size of the initramfs to about 7 MB's compressed and 25 MB's uncompressed
> Boot logs: https://gist.github.com/Jamm02/ebdb124064e253208ee479f46edf127f
>   .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb    | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index a9eff847..f496f21a 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -11,10 +11,6 @@ TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>   RDEPENDS:${PN} += "\
>       ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
>       ${VIRTUAL-RUNTIME_base-utils} \
> -    ${VIRTUAL-RUNTIME_login_manager} \
> -    ${VIRTUAL-RUNTIME_init_manager} \
> -    ${VIRTUAL-RUNTIME_dev_manager} \
> -    ${VIRTUAL-RUNTIME_update-alternatives} \
>       netbase \
>       base-files \
>       base-passwd \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

