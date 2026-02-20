Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CA5C5AD48
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 18:02:20 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3706.1771610533207091034
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Feb 2026 10:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=r4DCF/8K;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.37, mailfrom: praneeth@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMSWDgORjGwh2fXdWdv9/1WoCuP6UDKQZaWTTHP33SzNrBHJeqh4RjGHHaE8fxrFKcrGAEc9OaQ0w4fo7TEt/kMRbWTq+1w9TLOLzVZZ0NsQtkzjrVXkhiP+GBpPgscnl0wh85MKP3Uhxm5VvDwlL9jWA8yu+JxALhZYLcBqySRtbDGtatOJ9tZ9QlloKk4rvNvSPLqXDm6JFllijw+Rt/QFMHOtPl4xii5cknrv2I9FFQQaJYMB0cwkLknM1AXpb4DPV9Epb3bai45JFk8pWiY/iqHANoA8nNsX/hYHgb/PufUpLGb1JM2vdPm4h8C8y/Wl/jajsucndIyS2N2j2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqjJdYxcNXlGd1hBv+meN7UAEFILSvCtfLsbdfIUBJ0=;
 b=Glp9pkgkH7BPD93nk8IFVNfkLdfleav/kwljBqZfpeY2zRF4sMETxEENUHI6oFVZee0PS2zb/xSi9m2Ydm+X5K1gsp2MtvGZLaWtFfNxXrFmRNuuu1Aylo9SZ1w6jx4rfgTwdqBiO804J58tsxc6XgAnxMxLeDYzlPrrHWusnHUTyil4VclK5mPExPd9zN1DDlZIUROGyVAfWKMP8pEBr9wq1vihd+lYkvo/p6zgkZLp7TtIrtXYvVIJbKNgNkRRMyj8A68uDNMcJsAMSELeQPwVTjjZ6jiVvSCVGNh1G5Uj7E+XfQr0cAX4V5hgL4qi7PHoQdEmnoi7Oo3s8F1mmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqjJdYxcNXlGd1hBv+meN7UAEFILSvCtfLsbdfIUBJ0=;
 b=r4DCF/8KAkV6j1Nh84gNRSRUJMSTE8o7deyGQLv2KOKGbfLz5cOPMZF320Lp35/XZnMQs7DCULPQVD79cEVs4pVp/2dXjQrj4gN2MmO+fMJtjhL15Y3etwdsNEuV7qtw/vUafSApqaN1kArvm655p0PaLcWEQokqr/K/HwVHRXA=
Received: from SJ0PR05CA0205.namprd05.prod.outlook.com (2603:10b6:a03:330::30)
 by IA1PR10MB6241.namprd10.prod.outlook.com (2603:10b6:208:3a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 18:02:06 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::94) by SJ0PR05CA0205.outlook.office365.com
 (2603:10b6:a03:330::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 18:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 18:02:06 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 12:01:47 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 12:01:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 12:01:47 -0600
Received: from [10.60.29.225] (ltpw0eb5ja.dhcp.ti.com [10.60.29.225])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61KI1lsH069771;
	Fri, 20 Feb 2026 12:01:47 -0600
Message-ID: <c8bd8fc4-1dd0-43c4-a21e-bf820ccd5769@ti.com>
Date: Fri, 20 Feb 2026 12:01:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti: optee: Update to 4.9.0 tag
To: <s-joshi@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>,
	<vishalm@ti.com>
References: <20260220074842.2206111-1-s-joshi@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20260220074842.2206111-1-s-joshi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|IA1PR10MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed6972c-ab16-4077-ce83-08de70aa28c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RTFDcGRjSnhEcEh1aEFKTXVnTURVZlF4elBCS05kSDhJd3VhbFI2UjhTTmNO?=
 =?utf-8?B?V3RMZlZiTXc5YmphTklXNmp2bXdHN3d6VnQvZkNUQVlTR2ZsZmFCK3dVZEhF?=
 =?utf-8?B?YURXT1hqM1g5Zml0RGtHTC80NXVqbkt4VG1wU0YrdXE5bVlsS1lGZTJaaFFK?=
 =?utf-8?B?dGJGRFhQckV4L3J5UzltaTFmWWMzTUNqL0s1NTc2L1AvYS9kMGdncTJSd3JL?=
 =?utf-8?B?VHlwaC84NVlncFkrUDBQcTA3QmpLR29zUTBxRDAxMlhPdldWK0pwcm45SXhT?=
 =?utf-8?B?S3hpODJUNXJMUGE0eDNhKzZvVzdvcFlNYjVMamFZRVppb2xlWGkzTHYvby8y?=
 =?utf-8?B?cDB2TWU0QXNMczVjRXI2bGxxdzBZZTBPblpoZXc4eGRmc1VFMWcxUHBoU2ZQ?=
 =?utf-8?B?MGRhRzdsdkJnOG95NjVxcDBOSzF3WmR6aE1ValA3dzcvRU5oUUVTTnVJU2VV?=
 =?utf-8?B?ZFBNK3ZubHA3Z0NkOXdmSTVjb1M4TkVmaTZmRkE5Q1pTOW94V0J2YUU5eHd3?=
 =?utf-8?B?M3FYMk1zaW03a2FWZm9aa3RFZnlkTlphbWhUWlBHd0N5TEV2aVVvTlFqR1Y3?=
 =?utf-8?B?MnNGaE12SWZHRW5EbVFKQTVXUGxXcmxmcmhBekI4bEVEaHZoVCtqWEJQNHh2?=
 =?utf-8?B?Z1JxSEtTR09YejdCU08wLzA0dzNrbGx1OU91UU5aVURRUFVBMVl6OVZaMFZY?=
 =?utf-8?B?YWFhY1FudFFyWmxGQnUxM2t1S2djTUpkaWxaSXRtVE1DRUR2ejVHNXRmY3Vw?=
 =?utf-8?B?Vys0UUZvN2ZkSFdZd3pjV09TMHNFcDZMN0k4RFEveDZSVkx2bWdYUG15TUVl?=
 =?utf-8?B?Vis2STRaYW5na0Mwd2lsVk5YV1UyTDhzeXlDTVRIOVBFNTRSRWZtY21FN1ds?=
 =?utf-8?B?WHBCU1F5NVVwNTU3MjN2bHZVZGJxaFFOMDdnV0drUlFsNW5nNGdXcGpRQ1V5?=
 =?utf-8?B?Ukd5NkhCYzBhOHNOQi83MnpadkFpNjcrWmV4MkN3NzBKRWJlRjdQYzExem5u?=
 =?utf-8?B?ZnlyNHNPMWJlYTQxUlVlT1UwTEVJdnpjQnZZOXhQczlMSU5WVDgrWTMvRGZx?=
 =?utf-8?B?aVNHWGRpUkVpSHdVZXNrV21XanRHS05MakFjdVEwaVplN2RDUXpXU1Z6ZVNV?=
 =?utf-8?B?TktuZnNaVUh6VDIxSFJGejdYOE5pVU9id3dFKzhJM0FHWjVlQklQdVlJWDFZ?=
 =?utf-8?B?UHIxeTdnNmpTZWplMWZHSkpWSVZsTnl0ajFwVEtwYWQ0OXozNmJEdDBxWEtk?=
 =?utf-8?B?d2lyK1k5bTdFQTh5NVlkUlgwRzd3NVk5R3VSME1xa0hFd3NEUjVGTEJIVWxB?=
 =?utf-8?B?L0dVdEdjNWVjS2p6b1pWckErMG1JTGlibVBCcDgxNGl0YjlYekdKdEhnOFhh?=
 =?utf-8?B?bGc3S1l3eGx6WDY5dDF6YW13VHpCenRjWVd4V0U5by8xQmpzd05jTitieS82?=
 =?utf-8?B?K1NOMlc0WmNMOHo0b2JwZDBjTW5ramxyOVR3YmIyZVowQ3AzWmZKUDNXMzkz?=
 =?utf-8?B?dmlSQUlVSnlUL25xQjcyL3lyOEdwczJMOEN4bzFWbm1vSGFtRkVVY2FYZ0Nm?=
 =?utf-8?B?d25ZU016TGNOaXlWcTA3cmE2VHd5NjVtZzJkcHYrQ0RFVXdnaGNyKzYzOFhL?=
 =?utf-8?B?OCtVbUV0d0RNUnh6eGZRS3hQbHh1RGtGaFJZamxUOWRHWmJGTTNGTTh6Q2Jt?=
 =?utf-8?B?RGg5dUZncDVvTkxZeDBxVlR1bzlldXFDczdKRks0NG9OMUZRemJlME42dERY?=
 =?utf-8?B?NHY3YjFNMVRGdjltK3ZXd0h5Nkt3Q2ZoMGNWbTVtN3dMYmlYbEhIUHhLUG96?=
 =?utf-8?B?dENvUjJZTmE3cjNhaktUVmNjVlNCdmVaU25oanNRWlNvTnp1S3dxRUJBdHJC?=
 =?utf-8?B?Z2V6cDg0WnkzWlUwaFRsdzdVejJyVlJycmZsTkhoN0Q4Tjh4eTA0MVFjamVQ?=
 =?utf-8?B?amljSDNya1c0Q29pQ0VLTWE5bmk4NXpkZFRpMVhlQnlyM0MxV0dUS1BqYmNm?=
 =?utf-8?B?UXlXTGNqRThaS2V0TW93d1cvMGdhU2JUaUNlSXBudk1FemdFMVBkTmZVR0V0?=
 =?utf-8?B?SWVWRUJ2VFN2Wjl0U3BSbCtWUytkbGwwbDUwdzNTSXRHOFJjSGgyV2ZiajZX?=
 =?utf-8?B?SnhQNXVPUlYwTWJjcW96ZTJ6a29rdzFSZ3pvclVXMWNyVGNsY0ZNTTh3OWph?=
 =?utf-8?B?Y2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cu1NspbfCt/0A56XWJahjYgs25pPHfpoFMBGwOI8mxIjD51yVgfxzWOdRO1u60we9xV+NEdhAIpDq4nW/pWd3kHgAE9nYQrALqozcYE3K/1VKSOvPUmOubcp5AXtlcaQVI8c8MsRmhJAVSaPen5TwQj53Enyx66mCXAS5lyTE5TLVSycuu7kB0ltBKTaO1Tuyyo/yPRJyPPOi8P7nz7o6VQMdI40Kt1Mvf60QsvNcVhlqwdyIG08FcMaN4Cj0fWaS/bAX/qM2ADXIkGkSkg1Bq91v7dUemG8SnEpblDYSgZ/jofwMs0IfF78nvvSB6lereBLfIjXFSG+tEWbNj5yogHafM+5KLtBRVoDakuoJlNN99fg+pNGOPM2f6m8HGhK4T4IA7li1whpHimaQC1OQcW31kmW5HtAMnqL8dru8pskSJtf3dbnPJx0XL3JhVn+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 18:02:06.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed6972c-ab16-4077-ce83-08de70aa28c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6241
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Feb 2026 18:02:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19560



On 2/20/2026 1:48 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
> Update all optee components, including optee_os, optee_client, optee_examples
> and optee_tests, to 4.9.0 tag.
> 
> In case of optee_os, the commit SHA is ahead of 4.9.0 tag, to integrate changes
> done to apply firewall to AM62L.

Why to scarthgap? ( its in maintenance mode at the moment)

No Major version upgrades should be done on this baseline.

Master already has the 4.9.0 tag update.

So Nack for now, Unless a justification is made.


> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
>   .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
>   .../recipes-security/optee/optee-examples-ti-version.inc      | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 289ca5b5..68b6b262 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
> +PV = "4.9.0+git"
> +SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 91dd5e60..6ec2a83d 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
> +PV = "4.9.0+git"
> +SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 0f040e6e..0b8da91c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,5 +1,5 @@
> -PV = "4.7.0+git"
> -SRCREV = "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
> +PV = "4.9.0+git"
> +SRCREV = "3322f1326f141ef3f41ac7a1c1e08ca23a869fd4"
>   SRC_URI:remove = " \
>       file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
>       file://0001-arm64.h-fix-compile-error-with-Clang.patch \
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index d2593cb8..f56d40de 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,7 +1,7 @@
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
>   
> -PV = "4.7.0+git"
> -SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
> +PV = "4.9.0+git"
> +SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
>   
>   SRC_URI:remove = " \
>       file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19558): https://lists.yoctoproject.org/g/meta-ti/message/19558
> Mute This Topic: https://lists.yoctoproject.org/mt/117906822/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

