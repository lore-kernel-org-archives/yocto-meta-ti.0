Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8141091911
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 19:21:04 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4194.1773948061016499244
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 12:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ObMLIxFB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.4, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnHElXrbYGaGAW4EYhgb/915xhg2jlkjGjYN4Ju+Ojrv0gdI1fakhWUPX7c5xIR5QzToWE1Xu0bRZuHAENRZmsLtafJ8VsK7VoPNZNBwYE3INUdL5E+C/97dw0t0DJ4P2H+Io2TVUrwqZS+7aKtnu3oMtwUblotuZFi1DhYJifhUZFkDaGlg+mmzjJcxGoG8AqoczAzasOTdwAWErBwDRP758smZFhkfUwXzGbYQgHn6UFGIMslR+U2FCJFfUazFI3PwNAWy6BceKdZpy5axFM19GcmQsdsob4fTr5YC5e0zxMOzSilwYqG6QFBwYCY9yyslqRiWnV2iuybQ3Vjl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOXQQBRHbEyLWjARE1EcenYT78fzKFlJQV143jsPnfQ=;
 b=i8fczNeOO6dlFFcCH8/00NIXKo95sBcTTz3YBYB5mcfppKKyw9Tfkf7wo3MugEFoS7MKy+vo18qh5wDhdZFG5UUc/4at7GjR/Y0U9wDkVfR4O2rLdi8rVYBYF0tFAsvE5bkt3ErLwD3oLYYQq6JiMUu3VSKs98zl3ftkJsJhgqfphgtvjTDB48c0ldIBdZq8XYYWyqfAIphdjs238eFd+PxYyzjq71ePodvZfjFCxVmYTogweCaZfL0uV7PBfYLExspam4zGoUnYajQPAQ3GJz2+o4+kqttRRumCzUML9B97uF/VKXZ2/GtnMzJeQ6s/varC/TdBivzc2x7Pj2GpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOXQQBRHbEyLWjARE1EcenYT78fzKFlJQV143jsPnfQ=;
 b=ObMLIxFBLK4FYoKVCa1/mJ9VGSv0qw78XdU5kKqUDJc18IQuG0psBTyqinnYNaDczZkWqeXcSfmPO3l02dPDvgOlh5OzC+4GzAvulqtFr/aA11kIGtAVLjeN+slXi0EBXQcX6WGPqvkd6+K8rjcEAVnY7CTQY8TEuoay4GfKX0Q=
Received: from SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) by CH0PR10MB7499.namprd10.prod.outlook.com
 (2603:10b6:610:182::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 19:20:54 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::34) by SN6PR2101CA0012.outlook.office365.com
 (2603:10b6:805:106::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.10 via Frontend Transport; Thu,
 19 Mar 2026 19:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 19:20:53 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:20:52 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:20:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 14:20:52 -0500
Received: from [10.249.32.190] ([10.249.32.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JJKqYn3061468;
	Thu, 19 Mar 2026 14:20:52 -0500
Message-ID: <f6f4156b-05e1-484f-ae18-1c36ea4fcdde@ti.com>
Date: Thu, 19 Mar 2026 14:20:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine name
 for badge
To: Judith Mendez <jm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
References: <20260319175402.2517003-1-jm@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260319175402.2517003-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CH0PR10MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d2ef25-486d-49ea-5e96-08de85eca3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Zbz025P0Ibs01KCBqJUOuX2DxB6NbD7m/HDBUTxSdOAvU15vKTA7xAfgmj9VztvWqL0eJwBHDs+W6lFGKLdBdaS9AA5R7dzK9bUZixRLYg1N2+6BGJaXbk1JCl/D9bM6EO2bEDbmk4LjNzpyVeV5stgetQsQyMaaXUiFwLsXgyWSsdpH1lu8lztMmyqztW7yFWGFIJFWNpUY6j9RNjFUlvc97jyOIOUf5I2QojrNep60LqIdLrRcyInG0UzLA1Zh4Bu7S4bAd6dL3HTzMCfTzR5mkIp5xnthBSD9v835h95ZOHOARrdOBg5aRnZ+i9DQwTjqltER3UY/xeav/f6GPMfG0Na+OiEhoGKWT2Uy9KcLNkDFtWHehKZU4EsdCWm85K4FtRpyBSZarzhKzuGeNre6M52Mf+vJTiDMBNL8mmaJs9MW2XnvDT3OP5/EnA4U6hpBh+nNIDQnP3kjj7CLI4cC7YNVHRAgQTr5mGoj8lVa+lz11RhiaNF65RQlDuz2A8GOyS9Q2yYvRkUTDT0ymIQ4EThZlMMdEx9EOUw8cM/8Uvjzbf3JE/UOoyTAn+OC40teBx0nKVHmIg8F1se4H7yrSO6OJvMUtw8+CACfwXMcr+QShadRBx3ez0sMqy68qTW8K+6XdUTZy0wwlxGiID0po0RO6ggzYF3XHsZ6ga250UYofCYlLj0/++c86ee9+U2AvJ2tk2DEhEdFZFD+CO/E0dSj0Gjf9ggfDCtZCH4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W5syc2oixyKp2HeMe2ciyjWYEET+hIyj5Jud6+2KNuJMlIyQioIglQFPmiTrcPOvudiSPY5Tr+vtEZ2QNlKWQqOLGLoBdx36mP8BiqdYI8MNDQS0L+PpT4LQ7zFrG4uoPyvz5qJReaoK/MpRfZPymGgzL0nQ9U6Jxpp6/L1lmnbrSusOHKGi6UeWVqt/cvHY5VgT38i3vwjQXol8cvM60Z7Dsv/NHo2VqIKMGY+nCPiJw9/879XshjKGOY01g45ZeGw4KYtmfjdXI/8KMNu7EaY8Zenn5wYNsFg6HP/fE65tRMohFUg5QW52aO7e4XjBZD5QdeqLZarCiOuiznG8dqxClZyNsMoUodip60/O7f0VwYu7zw636Zdm4RnB/6ZZd6hixxYFLO+MMKXOS+8ayAWLPTBPj/o1WcOzd12qy0GiJoTQakeUN84+8QAWVoUI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:20:53.9155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d2ef25-486d-49ea-5e96-08de85eca3c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7499
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 19:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19791



On 3/19/2026 12:54 PM, Judith Mendez wrote:
> BeagleBadge board has been renamed to am62l3-badge
> in the new TFA ti-tfa-2.14.y branch [0], so update
> recipe TFA_BOARD accordingly.
> 
> [0] https://github.com/TexasInstruments/arm-trusted-firmware/commit/d203b8453905178252094416448de009931087e0
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Due to build errors with arago-master-config, this patch
> has not been built tested, thus sending as RFC.
> ---
>   meta-beagle/conf/machine/beaglebadge-ti.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
> index d62730ed..78525030 100644
> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
> @@ -18,4 +18,4 @@ KERNEL_DEVICETREE = ""
>   
>   UBOOT_MACHINE = "am62lx_badge_defconfig"
>   
> -TFA_BOARD = "am62l-badge"
> +TFA_BOARD = "am62l3-badge"

Build works so long as I include the SRCREV change sitting on master-next.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

