Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0661BF3C98B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:55:24 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21967.1771944920708925181
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 06:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jQarNIq+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1RSA6sl0+rHIrLi+l3qXn+6RSd75WWXw2bEZq7/gg2Wos9yBoWBjwJuVhJ8j09ZRwQjhxjbqK/OayGsFObSNaRuQdt40jnY/z4LQRKwHZ+d7OOF8y2UCZMuk+p7MTiy9bd83w7gPv0itEj2u2pNABektxSIVMiQgxCGjgYeTvjpDpNK9ltPCe3L7SJTbJzs/xtfbO/SUEnAfNo/MtMPhi/LjGUXOzWYMokWf+0CcnDu/pZLiarSboqhqHOgLT7FkFEmE5Q2UnNVZKeeZARZGNDBW5Xt+kF7Et6uIbQWG/BE35oCFxdyLYWmAyonCLCeQa8lbSTlwaNeBD7Vg8QucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKTNBKyynX35q5krL+1XGLZluq+nKTLIvv5bZf0rzR8=;
 b=oo1weLtxw4cE/pi2QxhMur9syRGDsn98Ezv5DkZmwTrAV/O61LXjNI1pga5fosPFAxPobqy4xhSCcJOY5fLy8mvBIoY2gN3Wme6O0CDVExyz5eFsuZkzXJApI1/lRaYfncRRDtSnNJ9dSAaIhbZc+27aOwehUVR/0YA9miUjsrKC90bgHvVIkvxmwjhYLwg9V9zJ0MztjSRtcAnW4q5i4SBgXPW+Q05ePCKzP/fCYyoXZtrsgHBuvAWikt8C0lIwppP3M9ghd7OVw0Ym+DEi0K89kVbj60jLSdBiuHy+0EWHULip/IOOBUJBMVBt3q9GWkF09V+gwB3rhgFL4AsX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKTNBKyynX35q5krL+1XGLZluq+nKTLIvv5bZf0rzR8=;
 b=jQarNIq+bTwfGZZAvxaIpCP4DwUnPLNUEZQpRmqJeAVguO8i5Mrv9kSpuXa4wp4aoU1xiCqxYA/yz5tJQqlL5ukCzu7jWiInym4FtswzcO/oq/dHPnN/bLXhbyLvkCfQy2pBH8BwlwoMT7tINGaCBST7XJeRN21CZF5DU0l3iTw=
Received: from CH2PR12CA0004.namprd12.prod.outlook.com (2603:10b6:610:57::14)
 by LV0PR10MB997566.namprd10.prod.outlook.com (2603:10b6:408:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:55:17 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::c7) by CH2PR12CA0004.outlook.office365.com
 (2603:10b6:610:57::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 14:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 14:55:16 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 08:55:11 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 08:55:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 08:55:11 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OEtBuv2909070;
	Tue, 24 Feb 2026 08:55:11 -0600
Message-ID: <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
Date: Tue, 24 Feb 2026 08:55:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board
 configurations
To: <rs@ti.com>, <afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-2-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260223235744.3928753-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|LV0PR10MB997566:EE_
X-MS-Office365-Filtering-Correlation-Id: 11432708-5d03-4c0b-e3d1-08de73b4b8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NTA4bkRuVURqeVhJZW0yZmlrNSsvdFJXbXd1VzFsRThtb1Q3OUp4Qk5ralpY?=
 =?utf-8?B?L045eUtUM2tScW96bEVtN1oydGlkdU5zMTJCNHJjOFdscS9lOGRPMHlZdklM?=
 =?utf-8?B?VTlCZUJwMWJIenFZYXhEV1Q2R1BMVWlkWnFFN1JGTnovSERodE1WTklXNm5p?=
 =?utf-8?B?VUU3a210S1hwSnNvL3Zha1FkOGk0TVg5NWZ0RWdYekR6U3V4RngwK1BPazRB?=
 =?utf-8?B?cmtLS1RSR3JkWWxoWWNlKzlMUU1laVNLeS9yZ2VuaUFUK0t1a2dWU20wN3Yv?=
 =?utf-8?B?ek9HVGtEcm8wQjFGQlk3bmJaZXhTV3VRTXdoWW5jdWlLZ2NCM1krS1EzTGZi?=
 =?utf-8?B?MndzeTZQUXdVRUVrd2NnUDRFMTFEdmZ1U1VzNHJDdEJaSG1LcEdSMDZxUzh3?=
 =?utf-8?B?eTJuUFhSTFdzSWxiWkh5S2RialpSb0tWRjUvU3FERk1vNmJ2eFBkRkMzbHdv?=
 =?utf-8?B?OGw3bEZMdjFMUUQ0L0ZFU2d6bDgvVW1LMjgxWkxYWEFTMHhPbzljNmhTdnJI?=
 =?utf-8?B?VnM3a1JXL24wT0JsOFJPaStHbmR2YlNsQk5zRmdNZGFHeXFUajZHVFduSkUw?=
 =?utf-8?B?K2lFQU8veTFOa3BYMkc3WEN0NWNVVC95Q1JiSDhHaExJQmdqcjYyMlFKRXJ4?=
 =?utf-8?B?UXF3c3F5L2hqcVVGVjlxNkRBdjBwczYvMnh1b0Z5cEdtamNMc3JUNHdzeTVT?=
 =?utf-8?B?RnArT2xZOVlPeEhXTlNXbjdrL2VDMkpxbUtSd1hScHNXaDRlcytGUTJoV2Fr?=
 =?utf-8?B?dGF6Q3pvbnp3LzJwNGZaTzhuVGpsL3BvWGhDeTlNdTNhcGtTNHBaZTlmQjlj?=
 =?utf-8?B?S1F6NHc2VlFJY2g0N3paL1lTSnc5MjFHSGJNdUR6U05FZ1dLVjRPRXNXUkJD?=
 =?utf-8?B?c2lqSHlQb241RGMyM2tSaVBHejlzNm5lZFhVUkt6c1o3c2FIZlFHT2Rqc2sx?=
 =?utf-8?B?dThMay9LNDdwV2NhRmRKRDI4ZXJDS3l6NDFCQnJ6blkxS05BZW5LempMejh4?=
 =?utf-8?B?SmpxUkRkeGYvYzRNQVptZW10aHVKOWN2WFREd3d2emR0V3p4WmlYTlFHaEp3?=
 =?utf-8?B?aDBQblRWczkzSDduMWM3bGo5c3BqR2h5Q1NJTVBxTjNHNWJsakxWSmV2eXQ5?=
 =?utf-8?B?WnF4RyswMVc0K1RFWXNSbWthczM2WkNCSUhldElsY0NGd1BxTUw0akZDVldt?=
 =?utf-8?B?RVkzMGF5N2sra1BlcnpibjR0aDAwZVk1T1JyZnBHNUdsOUJVUkFTcXJpQWJr?=
 =?utf-8?B?dlJjdEY1dW9SYkxBNHBFYUhWamQ2SVNHbmw1QW9sT0V0NGd2V3BPUzg5MGM3?=
 =?utf-8?B?b1NBQkVHQnMydFNpcVRoL1NOZXljOVg3U3FoTlVRckM0ZGhEVTBpUGY2T3lH?=
 =?utf-8?B?dzF0UVlnVjlHQmIzTURhTEdIK096ZVJvSUJSQmp0NnE2UElEdXpLL3Y4eG9V?=
 =?utf-8?B?ZFRraGFGM2s4VUxZRENJOXZ0RFhOSDFvRHdPL003WFZQTlVYVi9lWXRaNnhO?=
 =?utf-8?B?VXJZcGlEMHdXcXNWbDIvK1lpZmVjaEJzQlFQaHZhb2hDQ0RJZ2xLUXB6NUZM?=
 =?utf-8?B?R1NsRm9lNkw0V1lGaGdSSjloQWRKdzV6emtvd1RLdUVGR0IrbXlleTByYWor?=
 =?utf-8?B?dGtuTmlUVVB1MjJGbEpXNjBUNGNtR1Eyd2hBVkVQQzNFbWpaRkFENU1Ma2NO?=
 =?utf-8?B?QUsyRXQycUI4MEY1QlNLWjNlNy9ZTGxjRUNPaXVPYXcxNzlhRWkzTnVFRUpr?=
 =?utf-8?B?bHdmOFBYVmkxMHc3OG9YeEhGc0lPRFhpdFBuVDA3VHJ0dFl1UGVPdnVXdWxC?=
 =?utf-8?B?Z3VMSlJZK1JVVlpuUlpoSjFUMW1TMXlTYjZRamdzVGFvU2VEbXJRL0xYMUVk?=
 =?utf-8?B?K0l3RFU5d3B0MnBJZnQrKy9RZStZZVZrUUlCL2pkY2RqUEM3K042eHdEaDh4?=
 =?utf-8?B?aXdMSThGaFhDbWNuNDVZUTVOc3QyOUF4RDRicVZjZ0VHNllQZjhSL3Fsb1pw?=
 =?utf-8?B?SGVNQ0MwbnJ6ZmEzQWJFRmFQcHg2YXRibG53alBBZ3lJb3c4SG10ZWNxRHgr?=
 =?utf-8?B?YThtc3FJamNjL3VtNThmSmUzcmhCK1l1blpVTHUrdjJ6N3g1OTJUVWtmc2oy?=
 =?utf-8?B?RjUrKzRXRUVXQXpNWEsxS3cwaytiaktGNDdOeCtRSzVDWWd1SXdmOUFOOVdL?=
 =?utf-8?B?cndIRVRCek82cjA3Z0xXZkFqU3FTNFRuSFlFeHV4djhTUU5RRzFJTjRjNC9D?=
 =?utf-8?B?VVE2SUtoNVRTaHlZc0t2MGtEMUpnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j4qw4+EPzHP60L/P8GC28oQCGZ1Aeqp8qF7hGEV2QvR4AEHJKG+ZixOezuL7URXxj3tpiJ/UmTRAfwdvlTM/oaz6o8/xl7pfRXDfJFx70iCqw09CWIPksSwalxFN/64IKR3z96F6E6q5/iLjmCFKx6xRU6P/LL7PNuQubovUXldlKM4Ljzy+xsYrqTmQJfK0el/RcO87H28u5rUH21BV+qpu1brqlHvtDAhNuRtVxYAPQfhc6NE5Juw50GfpVvA1obNcGD9SEaNDYyWCnzQz+9Oh2FJp8yhveIqtEy7dYDLeSh+q82pxXjB30AR27mRrMJeCW8wSlbRbZrmKIJWEJwQqTeqkrt/6JH8tjdUtPOtvwwhjKE5aegcXqiZTJKKy5RTL3coGST8zsnWO00o6bs8E0OysjjKIC3IQYdTIsXGoBW/4CuJWExf2y4XfLdiU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:55:16.2429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11432708-5d03-4c0b-e3d1-08de73b4b8b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997566
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 14:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19583



On 2/23/2026 5:57 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Move all beagle board configurations to meta-beagle. There are 2 skews
> currently:
> 
> 1. A base TI configuration setting all the default variables required to
>     use the device with meta-ti-bsp provided packages.
> 
> 2. An override that uses meta-beagle BSP components. This includes all
>     the values defined in the TI skew as well as any meta-beagle specific
>     configuration.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   {meta-ti-bsp => meta-beagle}/conf/machine/beaglebadge-ti.conf     | 0
>   {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf | 0
>   {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti.conf      | 0
>   3 files changed, 0 insertions(+), 0 deletions(-)
>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebadge-ti.conf (100%)
>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf (100%)
>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti.conf (100%)
> 
> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
> similarity index 100%
> rename from meta-ti-bsp/conf/machine/beaglebadge-ti.conf
> rename to meta-beagle/conf/machine/beaglebadge-ti.conf
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
> similarity index 100%
> rename from meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
> rename to meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-beagle/conf/machine/beagleplay-ti.conf
> similarity index 100%
> rename from meta-ti-bsp/conf/machine/beagleplay-ti.conf
> rename to meta-beagle/conf/machine/beagleplay-ti.conf

NAK.  There is nothing needed in meta-beagle to build beagleXXXX-ti 
since it uses the TI kernel/uboot.  So just moving it over there does 
not make sense.  I don't think this is the right thing to do.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

