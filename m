Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADD6D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 10:18:29 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18498.1764584305453600217
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 02:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=eqmJb1AE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.59, mailfrom: gehariprasath@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qen25nsMBuOQ8qGQ5to8wAvF1LkNVWDzmJd3gAoBS3yXMALAnKjmbufA1qnAdPdYw2XGvwyLEmeVWxpjguicisPyzo64BjqP2Td4s3NWqtUVxKTTPOl5x4S18ThnsWfthr2MzXgnxo2DVcT6k/hw26WaRoY5Z+mfE4wFhev4UuyaAuU+QfqMa9xf8i+l9vLzvNTCvO+r4FF1jm211+ndGXQTb+GaN80QguDlQDILIJGUfqLosGaluvdflVLT9QQftdKAJF7NkcvzKF28kcVxN/AFDF5MiXcP5UIylZXKajZSIbap1Kh2bJP0bL9uDjKpr/x8C9tL5dWZmn2qMDCVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbc06OmGeLMQ9fBRZcGbS+ym15e004Kh/gnGltzM7TU=;
 b=HBNoHygEOf/g5MhapKaE+y52fKjvHAR3MCCmEuHWHu0Mdk8W2UYR4w7vYbWZMchE0Vm7avWDPOTgaX5/rwPt9g94w5TTu2oMWroR6wDbXERexs11T9WpCdi6RQsv2cwZH/crxz93lLsFqKM5EP6pY18NjrCYm8BWaN4/tGFApLbz3KD/h6mtzQfnCpsNIvJ/IHuRdUqLOKuTymZ2E+L8Z1aom1LyP2xzcOBLwGfhXlLWYQLfegUTozG8H+SJ0umEy7MxqC58A7rUa1MiDoYBan7bFfMEq+kcfiZJt7PAPi+F5pn3tSyOyvnokAz5kDVzGVHWhAGKjCH+zTLahPTm3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbc06OmGeLMQ9fBRZcGbS+ym15e004Kh/gnGltzM7TU=;
 b=eqmJb1AEIkUZGMVcyisqQLqiYK5lgkxrknTSZOdXg+shyMhcY3eD6VOUO/U8x+GUWUvKa1XxbXV0VWxAQJFyC6ZHxLYHJ8hGgI2frkkdPlCALP3DtVk2jP+ScNsFhAvUWpYXC1GT2y/qDr2pObGOOrHyykqDcR4TuR7GUR8BH3w=
Received: from PH5P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::11)
 by BY5PR10MB4386.namprd10.prod.outlook.com (2603:10b6:a03:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:18:21 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::a9) by PH5P222CA0010.outlook.office365.com
 (2603:10b6:510:34b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:18:20 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:18:02 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:18:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 04:18:01 -0600
Received: from [172.24.235.213] (gehariprasath.dhcp.ti.com [172.24.235.213])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1AHxo0255338;
	Mon, 1 Dec 2025 04:17:59 -0600
Message-ID: <f884d1a3-4dd9-48a5-a5c4-8a558610b018@ti.com>
Date: Mon, 1 Dec 2025 15:47:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add TPS6594
 regulator and core modules to initramfs image
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>, <praneeth@ti.com>,
	<jm@ti.com>, <denys@konsulko.com>
References: <20251201100941.95152-1-m-shah@ti.com>
Content-Language: en-US
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20251201100941.95152-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|BY5PR10MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e4dc94-cc61-450d-0986-08de30c2f392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjNiRTdLYkJmaU9xSUdhRHM1QURhS1BWb0M3UHZ3cDZKZElZNklUTHRJZUwx?=
 =?utf-8?B?NVNWTzBzVFZDL3VkeGVkUWdnQWJBcjh0Z1JaRTNRY3FOdW5JSDdNaWtxRjFi?=
 =?utf-8?B?eWJzNTQ1SVZQNXJvczNQTEZ2czYwRXlEbGJib1pKY3FpaW1YVGdERmRDdjl4?=
 =?utf-8?B?Qi9wcjAwRlNkWlhaRStNWmNlWG5MWm9kWENLaE5WN01Kdlc3cjFLSlBoZUps?=
 =?utf-8?B?UE9aOEJmcEdxeDczK0UyTkVra0E5MmF5R1BkcDRRL2U5RGpqeVQ3UUo5THVM?=
 =?utf-8?B?d2U3M3k0dFhyR3JrVHZUN3VpcFlnNldzdWpxTGJwbjBXTUZXL0phaDlEcjhN?=
 =?utf-8?B?a1JMR2M5Ty9HaElmSEsxOExmbDB5MG9NY1pUVjVydTdWaDhidk5nc2ppZVYw?=
 =?utf-8?B?OFJrNlRmMHoyN3Bsa1AzWkNuSFVZNGxNVTE0bEMwNWZSb3BhNU43QUV0Zk4x?=
 =?utf-8?B?T1d4WWRXUklWNHI5QkVncEYveWMzN2FJUFo2OVlqRHNYMHlsNFJkN1dBdTAy?=
 =?utf-8?B?MVY1djBVeDNkdGZ0VXp1cjA2cmRnNkU1a3VwWUt4NVYyaWdqYTJ0QkxheEN3?=
 =?utf-8?B?NXZJOE1HN1pyMlE2cWRkVWZYRlZiZzhKWG1HYTJjU3A1QVlYMlNMdklSbGlh?=
 =?utf-8?B?QU43RzRUdkliV1RJdFFNdmt4OXRpb0tRUlJrQWZ1ZGZ4SHpOUWFtYXRVS1Bh?=
 =?utf-8?B?SEEwMDZ6cndLMWk2cE9SMzNra1JDUEJqVWlUSVIzN2pJSnRrVHNuU09QMFp6?=
 =?utf-8?B?VXBDVm1FN2xrcE9uQWhTVGFic1F4cEU0amdwN3lHNkZYRnFtRVhqbmgwQmdR?=
 =?utf-8?B?eC9SNVZmR1VhZ00xeUtiSS9BMkJmUkFSTTZrZWhuN1l6ZGhxbmpERlBSSlBo?=
 =?utf-8?B?MUhWL0lpMkJTNTZvUUhGdzlBZU1UcVZYZkVHZ3BQU0lxTWM3YXVHSFY2VUda?=
 =?utf-8?B?NndTa21yWG83a1kwSm9kV3BORWVia0ZGY2pmdHFHVm1iN3FjUERUbmVIS3pp?=
 =?utf-8?B?a3lnNm1oWGhFR1FRaDhlTEVmTERtWmliS2pYZUhKSWxQWGQzYWFNWGQ3Q0ky?=
 =?utf-8?B?dHZtb2JONXpPdVR3OWFvRm5lNmtReTE0em5NNUFmTlFtNnhBMG9CME1EaWhy?=
 =?utf-8?B?cHF5Mk9JZlYwcFltd216L1RHSUJ6MTdnZ2pRWndaNFZxWXREOEhpS3QzNFBi?=
 =?utf-8?B?MDY0enpnTDBoQlR0M3M0S2wxRDdhc1kzd1BRNTVxM1NuQklTSHRCVzk2NG9Q?=
 =?utf-8?B?SENhK0k1cXRScU1wL1VjcW4wbThLRUs5WU51LzhhZ0FyMnlqRElGcDZCTVJ4?=
 =?utf-8?B?TE1zY25tSFh5YlV1VUV4ZmorT0drRERvWGlpY1hyb3AyMmdkM1ZVcmQycEUw?=
 =?utf-8?B?Vks1c0lVdDExOXBubG9sWUZIeU40clZkdFdPTmZGcmx2RU4yalJFcGsxbnZl?=
 =?utf-8?B?VHpEVnkzbHlHZGtuQ1d0YUE4N3ZLdkpuSnQzVWNzNEJlTEE0MHBaZjFSWk1M?=
 =?utf-8?B?NVBVVE94QlhwNFcwK0FZNDlUZHFpY1BQamhnYVV2emtMejhTR3huR2s1VXlE?=
 =?utf-8?B?ZXEyUUJYL1dZbmN6UnZqdlk1eFYydTZ5UmxkSFdFSENRVE1Kd1VtVzhoNGRL?=
 =?utf-8?B?REFERURtQWlHWUtHUGNIS0VjeHhKY2pPQWhyMGllVElxM29SeTRSbFJndlpU?=
 =?utf-8?B?Z1VoQ05yampEWk9OUjBtRUNGNGhwd0Y1bk5zS2NNZzNZVFZ0ZlJwSUVYaVh4?=
 =?utf-8?B?MzlZWHhjQkZtbm5wY3d1dmhIOGFtamlYanpHQWhIcXVaaW16Wkcxc0RuVEZu?=
 =?utf-8?B?QnlQaFRab21LaUxQalVqQ0l5VjBlelZqZTVKV1VJeG9SR2pwTlYrUVVLRnlK?=
 =?utf-8?B?NklJWG9LZDdTWXZHaDJldVJ5UCtHME1aK1lodC8yQXozMkxkR0JDandTalp5?=
 =?utf-8?B?WVZzYTlSbmVsWmN3b2FmQWplZkVJMjhqREhSaUZQQ3ovZmNNNE14cHNHZHZF?=
 =?utf-8?B?TzBDRThZK1VDaHF2NFpXTGErRDVPcE55dnBhTE5wU1R2ZGhSTno5aFlKTExG?=
 =?utf-8?Q?cp96H/?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:18:20.0537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e4dc94-cc61-450d-0986-08de30c2f392
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4386
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Dec 2025 10:18:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19311

On 01/12/25 3:39 pm, Moteen Shah wrote:
> Add TPS6594 core and regulator driver modules in the initramfs image so
> that the SD card can be probed for am62axx as it is dependent on regulator
> to get the SD card probing and eventually boot from it.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>

The subject line can be just "conf: machine: am62axx: ..."

> ---
> Bootlogs with this patch applied: http://serenity.dal.design.ti.com:7777/ecagupigod.yaml
> Bootlogs without this patch applied: http://serenity.dal.design.ti.com:7777/kiweziviha.yaml
> 
>   meta-ti-bsp/conf/machine/include/am62axx.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index b66a2227..08111f82 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -12,5 +12,5 @@ OPTEEMACHINE = "k3-am62x"
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
>   
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = " kernel-module-tps6594-i2c"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = " kernel-module-tps6594-i2c"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"


