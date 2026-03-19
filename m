Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27983108E1D8
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:22:16 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7964.1773915733713969288
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=l8fTNtjr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.30, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKiQLgWhQZMBf8rX4gMHaN8hQMZsQ9Ng1OQnjHl2wuHcEzqpga3WlTnKflnqRg7D7t0NbnwCOibrCJN8UXO2o+kjmvmEwwovcqYeMhTtTetTFBq+AM9zp+Apq7d2B0o+Fm7aSX/vdPXKxYkuJIzLFTvk4QLewAhDq3BYRLekdOO+LWl5GVk5srhOSkJQD2uoMUMFdUfAM88uWihVjtk/swilz7PxqapppCLaqvVWY4JHV1TGwmj9VzKDoZFlETuRn+Aarm9ZZjR5/2tbff4Qe43vfVhw0SBkU2ejuDUymIa6kZ7k6rX5tqaRT+Jkuj8gd7ostuYSiHwtR/JFvgY5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN4AdW0uA79DvCgCpKQwoVmvJr2IziqKLJn8YawwXh0=;
 b=CrDcK+nCjotcy8KOqjQbzU8unI8p0eUZ8jh2a8bOm6tRlJxKT71zXBRNbGY7Zg3omqGPdOXHrxnOe9kMyS/2oCUO4aVlKf/54pvZp5gMwqQd1ESf0AONIGWILRxgno8iRk5YPp+rHpX0mH1SSnaLQJvZ6JHxNu18CRuMhd+9nH8mVhiP1jMMO0Nu/zVZQDR2QG3UifnUm6JHUaInYm/W5ZztFwusuCZFOTWxI7tRtuIhAOoD6JkQTNnFCx+LsXTGfwjOWCjNa8p1aVv3uv6Gl2ZSDCU/hHql49U/4eqMtmlp/GuZgApi2/ZiJ2FW02XTULxFx84NCgN076MH4en1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GN4AdW0uA79DvCgCpKQwoVmvJr2IziqKLJn8YawwXh0=;
 b=l8fTNtjraz59H0zQK7OF2eI+VwR/Kww0p11NyqelE85ZhGvZNXt3X2FS36G7FbwBFK4URpOAOxxfhZfpVQav7oOSyBweAehkAAFTXXOc4Vwk/SVlpWEAs/Hu8arRBoAxJL93Ao707fq3ZW8urbRTIPly0/3Gscc820EDKkR+mqs=
Received: from BN9PR03CA0439.namprd03.prod.outlook.com (2603:10b6:408:113::24)
 by IA1PR10MB7288.namprd10.prod.outlook.com (2603:10b6:208:3fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:22:11 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::cd) by BN9PR03CA0439.outlook.office365.com
 (2603:10b6:408:113::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 10:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:22:11 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:22:10 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:22:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:22:10 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAM6bA2416790;
	Thu, 19 Mar 2026 05:22:07 -0500
Message-ID: <ec8a6fef-17f8-45de-8554-800fb6f94634@ti.com>
Date: Thu, 19 Mar 2026 15:52:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v6 3/3] conf: Enable dynamic security
 layer for LUKS
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <vigneshr@ti.com>, <afd@ti.com>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
 <20260318145732.2115521-4-s-tripathi1@ti.com>
 <20260318195956.GO11121@denix.org>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <20260318195956.GO11121@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|IA1PR10MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdd6e61-a3e9-4106-8fec-08de85a16206
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	DPA7BHCpCWF7HzJojkSMswSDxBwnRg33nbHqksw4Uw9iCQGYwVzTYa3rvCsp/StPTTbQ5qk5vCyhhwfFa8XG7xZd/Ysl/qLuWDapdI8gVoEpeuOVnljcj7lLMjGqp3LV5akY03VxeUV2gFUqK28fsYV4ojIr29uLHWPUEU6CqXrhu6+CQFCvruh4EamjJWcu7io5l0YN6Cdxmn8/rplvofTAEHweSKLQqPxTLpeml16TRrdzQAjnn/5DkAU2eyIPh3hkB6hCMEfVwEXwPFdWFUEpzeDHmIjC+2yyjf/nI5KmF1fIDz7ih43o4w9zhq3ACrnPfHHVwm3fAp7V3fZTm2BXCOmIM1EJiu6J0EoV4TtZll27RPdgUAeTF3atJV+KbClnX8d0GLw9QK8YRNAblPI3+HtaPq69OsRDH7ZhXcFY9HGipaeoHXMZkgU5E4ilFW/GQOm0BBfTdJMntFpAdq0D2b2pylu2rhjLo9ydHhrIKAT1Sb/FfKdioTbh6boDLtcnE/c7/hTzhtC5N+AJ6B5YBEj3EbM9L1Ndzn9UfED7LxqQTasH5rZhx5ZzQyDuj/iFi5+C0uzOzb+8AaxQEj1QlrMmMoNN6wU2Bcump2VjHztZhf9wRszGacaC/eZCMuaIuFvx7GySCOCsAA4Z95JE6HrUhxMIORL34s/x2UbvHCH0CIrtm9Y1oGBKWDeFzJO8nqwUC3LV8vhFnpx3fyF3lhbsPldsH2KPfRdlXKWmlbsO1Ryl9jAS6jJXDaNETMbSx2CheBWGg463iAj4BA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lZDpLuMxlbCxGbiKqoumzl4TUJXYbKIsPVtRJdnF4a7tt5zvQ4+6Ddd+1RMpSW+tz4ibmg0LymC1k6iiGYo0XoQI02d5S1KlNlD3R1Pe1rwVi4IJqKdAy1qJszoGFG6DPwdCQmsOZWIgQZ80GlsKyxuIGbAVzMStj/SOEzH4BRDaSBtYkK4lRfb7iC/oQQht2P1rGhJ8N2IH/lhtY+XO1uFqrou8DtCv5NEUi92bljFqr56S0siMLQUzU9S+Oz/i5QQSaS1sgCtGbv4NkLk9HQA3sQXYCBnF+dlpo7sDywwfGebWKBBxuhwwPtq88YlhpuxL6nebG2oKFgKHDZEBzDqswAeYijoeXzcBuihsKBJ/0KQJlpkgkGvnwCEyCoLk2RZydTiXr0U6Fp5Jf5Dfggd1WFcD3QiWsRVCvmFCg7mh69D1XKayA50ifmsp8QTC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:22:11.2830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdd6e61-a3e9-4106-8fec-08de85a16206
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7288
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19770



On 3/19/26 01:29, Denys Dmytriyenko wrote:
> On Wed, Mar 18, 2026 at 08:27:32PM +0530, Shiva Tripathi wrote:
>> Register dynamic-layers/security in layer.conf to conditionally
>> build LUKS encryption support when meta-security layer is present.
>>
>> Update ti-core-initramfs.inc to auto-enable initramfs generation
>> when DISTRO_FEATURES contains 'luks'.
>>
>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> ---
>>  meta-ti-bsp/conf/layer.conf                            | 2 ++
>>  meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index f78da573..ce2883ac 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -24,6 +24,8 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
>>  
>>  BBFILES_DYNAMIC += " \
>>      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
>> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
>> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
> 
> As I've previously mentioned, TPM components currently are provided by 
> multiple layers:
> 
> 1. meta-security/meta-tpm - a community set of layers, backed by YP, active
> 2. meta-secure-core/meta-tpm2 - WindRiver vendor set of layers, active
> 3. meta-measured - personal layer, no longer active for 4 years
> 
> Just to note that meta-arm already sets up dynamic-layer with own bbappend 
> fixes for #2 meta-secure-core/meta-tpm2:
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools
> 
> But I'm fine for meta-ti to go with #1 meta-security/meta-tpm.
> 
> That said - have you tested your change? I'm afraid it won't work.
> 
> You are only setting up meta-security, which is a top-level layer, parsing 
> only recipes*/*/*.bb and recipes*/*/*.bbappend - please note that TPM recipes 
> reside in meta-tpm sub-layer called "tpm-layer":
> https://git.yoctoproject.org/meta-security/tree/meta-tpm/conf/layer.conf
> 

Thanks for pointing it out. I did test my v6 patches, but seems it
worked because my local bblayers.conf had both:
  /sources/meta-security/.
  /sources/meta-security/meta-tpm

I'll address this change in v7 series.

Thanks,
Shiva

> 
>>  "
>>  
>>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> index 9d3cc612..15c05e04 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> @@ -5,7 +5,7 @@
>>  #   TI_CORE_INITRAMFS_ENABLED = "0"
>>  #
>>  #------------------------------------------------------------------------------
>> -TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
>> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
>>  
>>  TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>>  TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
>> -- 
>> 2.34.1


