Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A013E909D3
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:13:08 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15861.1771344785641096773
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HzZcS6dq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.19, mailfrom: gehariprasath@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVkAPJ/JNA4jRUsvPTsT3VTjECWlzT+tvay0vVijF6lpYxu0r2B8LAlmEULf5wfFLJMRHPmTsO849lE3UViqB8H9+SW/Xh0WagnZZcz5GKCp7NUhtZ5tw4BcbbulwYVd1fdVGVejqpRj4EFCwQTvph11SWu4UZZnAljqD4CjM9mMuC3rJ/v9gHKpHJTuh0JOh0LdJTnPOyyUuFprHPTLMGty5dDYYlZ/Ob/raXdEV+gj2k+N/IPyZvp8i1mvaIP/CwOvYmOjRgt2BuRC9MIoSXbG6jZq6Dy9gjAB5ZkS5XxbEwzPIYp+26zhi+3KvcS/o8iKi03+M570DqFP3xMIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vyhx7AHJf+YwfCzmRsAx4ZhX5dwGFjDqWBOf4pA3jPM=;
 b=iyN5oW4ebxQDjGS9qeRqQ8p3WTLP9DZhvWaHTo+2JEF3O5x876+Yl6BEL2Mn6snmIUmDw/8ZHBravTWhQYYJ5R1BKAqsaN2KW4kRl7pVEJ2+an3pG5loQNgIXxJTmtFrUbhIz5KQsVPjZP04m2jsHCGGvbCCdshDlKOnf5PcF0z4eZ5+JpdSO2+cvyzdJkRzFSy87n1+W8OqCn+rgXeB+JYr2Nne/Atq8/YwFD6dbTsmnNlumdjPhJI44RLcSDA+DqZCSBGyhPeXemuL+D6gQusFETFXAMx4O9V5JIA67oNRzZ+O4Sk1T8TUMKSKjS14Z7Zb1QERGTHNP4oRSW1R5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vyhx7AHJf+YwfCzmRsAx4ZhX5dwGFjDqWBOf4pA3jPM=;
 b=HzZcS6dqu2MsGeefT3XfzxJhgCmXiQ6Vs8Qq/NhXzxtH3mnvoS2XUmCoPL64TVLvvrtmzl685h5bkguRrXxkdd82racWTa7cdjp9RQl0E+U8d9yw5JK9JnRoASOhY/aTLOIO46mQMFLWhP6M4rxc+vZ3jXEvnM4V1j5HVcMRofQ=
Received: from PH0PR07CA0085.namprd07.prod.outlook.com (2603:10b6:510:f::30)
 by LV3PR10MB7868.namprd10.prod.outlook.com (2603:10b6:408:1b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:13:03 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::2e) by PH0PR07CA0085.outlook.office365.com
 (2603:10b6:510:f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 16:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 16:12:59 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:12:59 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:12:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 10:12:59 -0600
Received: from [10.249.135.215] ([10.249.135.215])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HGCvMN3604760;
	Tue, 17 Feb 2026 10:12:58 -0600
Message-ID: <683e8e48-0f64-4046-b6ff-8d6f0307deab@ti.com>
Date: Tue, 17 Feb 2026 21:42:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Change assignment of
 IMAGE_BOOT_FILES
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260217160806.785575-1-reatmon@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260217160806.785575-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|LV3PR10MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: cd44df55-57db-4933-d23b-08de6e3f6b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|4022899009|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2RsR0hXK1NtWGFRMzdiUWtLckFsa01oajRYV2wrUWZFSTVsSDYvUGpyNkVD?=
 =?utf-8?B?b0QyOFNtSlQ0UkhJWW1iZXQ3c0R3ajE2TWE3anhXZHg5TjV1aU1SOGR4NHVl?=
 =?utf-8?B?MTRHMkpWRXl3RkZyVkVJbFljYnVoZUpHalBmNUNMREh2eFJubXphL0IxL0xR?=
 =?utf-8?B?bzhpaklveTVrTDBNVWlsL3hqU0MyMDc1cG94UWNzYmt4SmpqNCtOekZyeExn?=
 =?utf-8?B?aXp2WllaMy9aZ2E4Tmc2S1h5R1lKRjFNYlV1ZGxiR21CRkV1Mm4yV1NsUSs1?=
 =?utf-8?B?VStHb1creitaWHNLNDRYb3lyb2FUOEd6ZlVNRi9JZTR5NUpmMDgrajBudEVR?=
 =?utf-8?B?cGdBQzFDenRIek5uYVpNSVgyWThJM1ArN3Vzb2RMRFMzQnVSbzg5bTlkOUpG?=
 =?utf-8?B?UXkxblg1U2tRNHdXRmxrMXdmT0N3T2NFZFB1ME1DdlpUWE5YcjJFcHIrWnhH?=
 =?utf-8?B?S1dzNTlveHZUaCttSm4rUFRsaG94RmgrbVBRa1ZvQ0lDclpnOUxwSXBlT1FC?=
 =?utf-8?B?c0gyTjlFTVNJdzRzeGd5U3piYVlMUXdndFpWR3RlRW1aaGZTc3VGNkpBYy9E?=
 =?utf-8?B?aXRkK2hjRUo5em16Ynk5SmtlSU43OHA3SW13cjh5Yy9xbXZYRVVtc3lKdmxB?=
 =?utf-8?B?RURzdTI3bEJibnBHM2lNb0VzQkUzUDB5aFFDSko5WXJhY0VjTXZCZ2ZDTHdN?=
 =?utf-8?B?Tit1K2hKaGZPODhvUVRDOWJwZzlEaC9BeEN4M3F5bXd3WkgzM0VUMWtKclJh?=
 =?utf-8?B?eWxIN24vMEU1MmVLR25BWHhCTERxQUdBM2gzWmlFMW5kdUdHcWJWM1g3bmNJ?=
 =?utf-8?B?c05TRFdvY1BBZzZsZnkvVk83L2tTQkJFSU50V0dibkRzQTRFMnhtdWFSdGp1?=
 =?utf-8?B?VHVoMnRSMk12KzUzMExjUk1JZ1QvNkhYdUxVbEhlN3VJdHc1SkpKMXI2YzZv?=
 =?utf-8?B?RFFFakdsS0lmSDVLeWh4b0dEbktEVXI4N042TWdaMmNab0xHcXM0ZDlZRkVM?=
 =?utf-8?B?WjRId1R2S3F2emVpc09mUWtFUXZrb3BsUWVRK2RQMG5yL1h5cURWQVhpSG5F?=
 =?utf-8?B?KzlwcGpaTlpkWXdTcVAzLzVTY3R2d3VrbUt4ZmplbVF6cWpqZENIU3ZpcGlD?=
 =?utf-8?B?bEdFcjE4d25yTnBJWFVVSzFqNENPTlZVVUJtbEx2T2ZoU2dxUVAzRnVROEJi?=
 =?utf-8?B?VSs1WW9kN29JVysvSkxXUzVhSER5bEVtNXZBQlc5QWFoOGlMWXhOVkwwakdE?=
 =?utf-8?B?WWVKaTZVamxPZ1M2TG16enNMdVNrNnhGRWV4d3dWMWhDSGtFd3hid3RQc1Vh?=
 =?utf-8?B?dmJxOUEwQXlvZFdpczZXZjFOVGlsNVZ1RTgrOWcwWlpuVTFTcWJrbG56WWc1?=
 =?utf-8?B?eUdIdnkralRZMytlZm93UTAwK00vUjdNZkhjbWhNZXVTRC90Mjk3cThGNFZV?=
 =?utf-8?B?QkR4RGtnTWV6MC85SWRWMHV4ZFBTQkVpWlNzOVR4eTA3NktxZFF5dzBQbHJy?=
 =?utf-8?B?Ulg3WkdJSVlqYzlPeDVPdzlyaXpLeHdoQ0Q0d1VjTGFuTmltTGpBR1FwZU5x?=
 =?utf-8?B?QUNrQ28rdStqQUIyYzZweXFRSzVJdnlhaDF1TnFnZHFrdnhKeC9XUzdNOFRz?=
 =?utf-8?B?eWg1OHUvdzR6VW9jWE9KWU9iSWY3eDZuZnczVVpqeDlQREtxb2xRajVTVDQ1?=
 =?utf-8?B?ZDlHdGdPMmd4WHVtbWpNTVlCWFBYUURlc0E2ZjJOMGJ4VTFKYUJzeGVlUmpY?=
 =?utf-8?B?d0lMbWhaUlM1YWtHNjBMcElOaUFOVzhVaXlRZmplM3E3R1VRUlh3ZXFzTjQ3?=
 =?utf-8?B?eUJ0ajRmZy9aZXpjRkErOUlTQ3l1VmpiOWlhRG9lSVU3RVVtQm9xeDZHL1RF?=
 =?utf-8?B?a2c5SnNyc2V0RDQwMUFZbXYxWi93cEQ1MkxXdDd2dlZXY0RNdFlMTXFCRWVY?=
 =?utf-8?B?Z3N6UVU2WkJYRkN5L2d1YW1WWFZxQ1BGRmljczVOalNTd0Y4OGt4SWxpbStX?=
 =?utf-8?B?SForZnBNOTFXWGczYXI4R1ArL25XM1podmFKaUp0bk5QVU0vMjE0LzYwS05E?=
 =?utf-8?B?WlVRS2Q0OFVvVG5BSTRJUndFdTZ4SStxRWI0RnU2VlBzM1h5VmdPWEdTUCt3?=
 =?utf-8?B?cFYzOEVrbUhHclR4N291a2l3VWVNTWUvWWpJeUY3QytjNHdRNjVMTjd5dUxm?=
 =?utf-8?B?SFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(4022899009)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gwK6TPh91BAoC6Rxd8SU1YhHIdkgIk+z4JbHKaUtFjrjdR5Y3MHbZUaPf5DX4pG/uRnEobcqN4xjmDVBWesp4FZAtBToclJ0cYYWTjUdvfza3v89+vi+9U6KOxBKTbL61lgxjXOUFZf3KdRlYONz+yd3s2Uwv1vYLR5KYnBdXhQfnDyky4v37Tw/3BAcRC7gcavLcrlU7Qma3XRzIjSmT4C12oOdMti7Nnh+xcmFYVoU6B7dUyqO8zV3iSjGjHOQ5W5cRKqC846HPw2/Q9bvmQjXanovmC6XnRdxDcZtbczk3Adki4TL6Z1tBWB5ONZ3KCpgkl4dJ31Fjo4A7GwAM4qOcwEHwKt1j0hSYjZ1/cjmM3STdkUaM17onBIlRRwdQigD9cRxLbqcLqKdl9FQvAOC+OJ+9oBgsWg1a+j3C6ntEmxYUAVyz4j2Fw6VISAD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:12:59.8363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd44df55-57db-4933-d23b-08de6e3f6b85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7868
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:13:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19525

On 2/17/2026 9:38 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The += setting was overriding the weak ?= assignment of IMAGE_BOOT_FILES
> in k3.inc.  This resulted in nothing going into the boot partition of the
> wic image.  Change to :append to force this to occur after all other
> settings of IMAGE_BOOT_FILES in the cof files have processed.
> 

Does this qualify for a fixes tag ?

-Hari

> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> index 9d3cc612..475234a1 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> @@ -20,4 +20,4 @@ do_image_wic[depends] += "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_image_complete' if
>   
>   TI_WKS_INITRAMFS ?= "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
>   
> -IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> +IMAGE_BOOT_FILES:append = " ${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19523): https://lists.yoctoproject.org/g/meta-ti/message/19523
> Mute This Topic: https://lists.yoctoproject.org/mt/117858984/10119719
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [gehariprasath@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


