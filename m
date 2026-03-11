Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E601125847
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:18:24 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.216.1773242298182211633
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 08:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=KN+DWTxx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=am3Hke1k6QXDdKYEXO/WUSpfdcRLbtAGLZ9Fk+eA/FlABcWsT3w10zFcgg82fUISB2aJvpHVo1FmaY5xfoOka/RqWq3AWlZse2D1YJBajDBD+WVdtXrwVGkgVz4mWYqbReU+82RIYjjNE7FI+Joctni50ae4BgfngcxnAr+gf7JGQmZSfP4WyFnUIqkxP0xu7dVIWkUi9+gRxwKcttpP/WV5ospPYvuOkqpF2XPmRHb/ozBsh+dnrHJSV3+FwpMMN2WKY6+D8vMadeGYLmC8VtRKlz9xMTGfX2VlsjCBOhynbz+iFNhUNIpSq4Pw4BVtIXZiMUukzpD+mAVrVHCp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2scr2HIAQQ2WwcOMwkO8ZE3dbn7/5WMucu3BfoncSJc=;
 b=EwhCAbaS4NrCqtb5tsjg+mRx4zafuwcPpbr90Xq9qe+pLsGhSIVGE+lntFzHIkHh4MgelUBr0vFxB3wFvfNooSGL6lVEcjBpaAF5Qhri8R5+tR9xu3J+A08bUWOgeZ0W1HtsQ/9UqJS1MBJZwXxrzWymO/l6NNSQD9vpXNrPM/PbT4wX9tJOrV1RZ9f9UukQ7lw3O9VBN3P6c4ua1Oa+jjj2N+FrHMIqImYNyY6vTQIgKfUfaaSN58gLeZgTKhHRte2HOT7p/+jkZO1ZflSTq7DBZ6gF6peyXOrFj2EnrUPrAmWVqSlaBShuqkY2vlPFS8BZv50QvWm64g038luy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2scr2HIAQQ2WwcOMwkO8ZE3dbn7/5WMucu3BfoncSJc=;
 b=KN+DWTxx0c4AdNDIc06Do2EW7cGjkjscKfEhinz1xwErW5BGBtipSGzCWeb8WIu1JMGV7zN379EiUtFa/eNUOWQfJbG1lM0mf2dAHLs4WXFipbO+oXXlAfwwV2wFqGbCkm6b14M7qjtUCo4zego9NwoK3YrbztpojEKlzvBN5vc=
Received: from SJ0PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:33f::18)
 by MW4PR10MB6653.namprd10.prod.outlook.com (2603:10b6:303:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:18:15 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::bf) by SJ0PR05CA0043.outlook.office365.com
 (2603:10b6:a03:33f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 15:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 15:18:13 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:18:04 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:18:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 10:18:04 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BFI3Ex556988;
	Wed, 11 Mar 2026 10:18:04 -0500
Message-ID: <89a59e0a-d676-4fef-bd79-89d9dd27a3a2@ti.com>
Date: Wed, 11 Mar 2026 10:18:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH v3 3/3] ti-jailhouse: Fix buildpaths QA warning
 and cleanup
To: Mahammed Sadik Shaik <s-sadik@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Prudhvi Veeramachaneni <prudhvi@ti.com>
References: <20260311150100.3275513-1-s-sadik@ti.com>
 <20260311150100.3275513-4-s-sadik@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260311150100.3275513-4-s-sadik@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MW4PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 915cf627-337a-4768-3818-08de7f8169d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	65g16FU8hp1ZVnDw3pXOOSA+UnHfSV5vAxJlTSEzweP6whkpwK/yOJfONRjIYST4tEYsLkRPW/rH9DLD6+2Cl2oLnPT0c3ojStCBje57PO9mDW40jB+Y3MA/uQagZJaQcm72RjPQBgAaZKg7ONxo/dadyTOf2rR1KycgjTQXny3ZrmomU6DUq4F+hNooyT035lLIJML2P5qVqbRXfcBph+LIPZ+u/aIJNs+JymaEcqHA57F9+VZEaVdG6ABWLkbNFaHVvioJELYASSd4HEo8RtaYEBAr4wJU7mwbP/8b2qpRYU7B/BF7Vp6Kp+8St3uPAtNNm0tf22KksAaezhVuH9qcX5L77GW5bJ087Ca7sObkEfIcZHvwuwWZP0ZtWSMgR7cXMSSzn2/+h4HhZNBFr3FVmhML9Z9Uw+UsXogRNtefw6W9LewGKYlCB/IyJAjfmRg2YDyLFY/6Nt75Og4G1GG6PWMSaIPrpm6sBAkpWe2/aH1eZ9mzfxDz2sRXmvRSvKXOzZyz94HzRvhqhTPRSg48jJbbapI7b/u4+i0sHyXOvWhY9ckVPDT5oqL3UXUdypC8qR/2Tl4sd5s/nMbvC7UCe3wO1KYRJlfFoN4UBeZLg3hjTrsc9vhbYM75aby19/KlVBYUuS2wOwIzkNcDJOTWrz1V7l/ldqjR3LRA+TYHLH0ievUS0J8LsAzJgd67tuKQfeyM5IjoyBP/FSkH8bZwyCrSHT3+STbPGpNAnqhAHDCK5meavw89fuf2gIiiNsfQejM17O9eZuyDkx0ImA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	466KEjiwk9z9dABAOY5+W3hUrEBu9sGCsP0mIu8Z1HE/jTIOwOgd3VIFQfXuAwDkcX8+/Y7qjs4eW61NTDKbTvoqhjnX0E1MDZ5lIUb/D135xtYfVb/wTn7+4hT0slz+CZmkAN4EhdfkvKr/k2M4ynYyMsQDTs62aHUFIYCAUh5TXm8F0hqXhVnSn7Z7rboA8CNCwaQ3ZZhec7G+j6ugtQcJ2qVwNKdgZ4ZmgvL+nHWhdnVdevBosyHWZK96Ji5bmdCB6WcU3vniYvT3IKiOVVyJqMYLJxB7DsC64hp1+h63KX8bNWBVenimtvfW0n7vQThR7Fk7ChPXOTlJ/Poy9LUtVEuXmhCatlX7WNwEhIbXJ9RZVZOwxyiNbmfcNJgCw237rQps+EoAQQGgR4gVJ7z3QejBmoBwTqix8AI98vn5LiVXIqigzS76ZGy8TBTj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:18:13.5027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915cf627-337a-4768-3818-08de7f8169d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6653
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 15:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19703



On 3/11/2026 10:01 AM, Mahammed Sadik Shaik wrote:
> Add -ffile-prefix-map flags to KCFLAGS to remove build path
> references from kernel module compilation, ensuring reproducible
> builds and preventing absolute path leakage in binaries.
> 
> inherit module-base kernel-module-split for building kernel modules
> 
> move V=1 into EXTRA_OEMAKE and remove overriding do_compile()
> 
> This resolves buildpaths QA warnings during packaging.
> 
> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> ---
>   .../recipes-ti/jailhouse/ti-jailhouse.inc     | 32 ++++++++++---------
>   1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> index 91076c9e..58603dac 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> @@ -47,7 +47,7 @@ B = "${S}"
>   
>   DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
>   
> -inherit module python3native bash-completion deploy setuptools3
> +inherit module-base kernel-module-split python3native bash-completion deploy
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "(ti-soc)"
> @@ -66,22 +66,24 @@ JH_SYSCONFIG_CELL:am62lxx ?= "k3-am62l3-evm.cell"
>   JH_SYSCONFIG_CELL:j7 ?= "k3-j721e-evm.cell"
>   JH_SYSCONFIG_CELL:j7200-evm ?= "k3-j7200-evm.cell"
>   
> -do_configure() {
> -        if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
> -        then
> -            cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
> -        fi
> -}
> +EXTRA_OEMAKE = "V=1 \
> +    ARCH=${JH_ARCH} \
> +    CROSS_COMPILE=${TARGET_PREFIX} \
> +    CC="${CC}" \
> +    KDIR=${STAGING_KERNEL_BUILDDIR} \
> +    KCFLAGS='-ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}/= \
> +             -ffile-prefix-map=${STAGING_KERNEL_DIR}/='"
>   
> -USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
> -                    -DJAILHOUSE_VERSION=\\\"$JAILHOUSE_VERSION\\\" \
> -                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
> -                    -I../driver'
> +USER_SPACE_CFLAGS = '${CFLAGS} \
> +    -DLIBEXECDIR=\\\"${libexecdir}\\\" \
> +    -DJAILHOUSE_VERSION=\\\"$JAILHOUSE_VERSION\\\" \
> +    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
> +    -I../driver'

Usually when we do line wraps with the follow on lines not lining up 
with the opening ' then we try to move all of the lines down, not just 
the follow on lines.  And also move the final ' or " to its own line.

For example:

FOO = "\
   arg1 \
   arg2 \
   arg3 \
"

That way when you are reading the variable you don't visually miss that 
there was an extra bit on the original line or where the closing " is.

FOO = "arg1 \
   arg2 \
   arg3"

Can you fix both EXTRA_OEMAKE and USER_SPACE_CFLAGS?



>   TOOLS_SRC_DIR = "${S}/tools"
>   
> -EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
> -
> -do_compile() {
> -        oe_runmake V=1
> +do_configure() {
> +    if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; then
> +        cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
> +    fi
>   }

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

