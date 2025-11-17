Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDB3CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 19:07:05 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17737.1763406409296753506
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 11:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hJutIdfH;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.43.8, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=texBOt/cUAEgC43eQPeQE6v8YB2InTxSVC2y/nFmC/GqNxDDZq39WaFE/3ShdeLIiGexCqDzsHa2JeOsTXO6enDaR4CIbYElKtSMae6vrgE0lYmBcAA7mfLG7mb+Q59E/JU8nFDkPbEPBk7o9+AabP75OWonuW/zhZayucnZc3+/fIOqUQzQX6aYhXwk3gSG0sWyYyExpxOTetlIPBINmn5DOsI26TRtKBTBWiserTN1yTndHb55S5PLzpFUzUzyAm2dWqgXu67nKxoyzy59Wj2k66opIExGRlv/gmp4c4nkL2T9un5fXV/ovbuKqk94T1w+RgTSmCCjPXEhzlqDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGtRjv+wdO8QJpqz0urDtWYtghuNDh+LS3O+Srk0syM=;
 b=GsxiumcpOOFIpxMAgZxrAhECDiLHlQxd2cc/2m92fspiOw4rfWsXFVpuo9+6T3vDRv9eN4Rb1VuRLkxbZiUsohSiH0rrr6qypziHBoEHhicPYzE+k8WM3Zj/h+A0wIejqPH7/Wy2Q8WW6s4B4CCuh5l8KlyBe96CBjNzchoZKRzXGtMu+yB7JxzQi7Qkn/S3/8IRxaGOJZCfjVRoCF/qp9cBWb5y0ZxRaEr5HU6ctILe4iZXdgCVRDX2rSCLDCIjv/4ZlVX7r07Sp780nNZ+Zc7OeoBU4Xv6LsGj4tMhacnhcRWZFPz68BbNQ1v3HF2yDJRT0lBsRi926ogyzu9Qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGtRjv+wdO8QJpqz0urDtWYtghuNDh+LS3O+Srk0syM=;
 b=hJutIdfH99jxEJQtAHz/F7irr4HLLJS9DYenA9YcHni0+JTDMXJe1tryBB5Mg7JUr5bqad3IbUmIt0KYBIQe9ac8ff7y5shM5idrL1x7sx4WUcOBaIXgwrMZgjqQpnCMf68XGGIXfU6NSZCMZNbxIo0RgfQD6senBu9ILcbQac0=
Received: from DS7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::12) by
 CY8PR10MB7196.namprd10.prod.outlook.com (2603:10b6:930:72::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Mon, 17 Nov 2025 19:06:44 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::49) by DS7P220CA0024.outlook.office365.com
 (2603:10b6:8:223::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 19:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 19:06:44 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 13:06:42 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 13:06:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 13:06:42 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHJ6flh2971623;
	Mon, 17 Nov 2025 13:06:41 -0600
Message-ID: <9af153b1-6ce7-4677-bff9-6a06cfa5592e@ti.com>
Date: Mon, 17 Nov 2025 13:06:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure
 libckteec.so symlink is installed
To: <s-joshi@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>
References: <20251117083407.3719468-1-s-joshi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251117083407.3719468-1-s-joshi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CY8PR10MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ecaa4c-8a3c-4fec-40be-08de260c72d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WUJXR1ZDVmlkQlFRZkMwM01LK2dYa3Q5NFZlbmppeEZtODlPSm1WOVp4b3ky?=
 =?utf-8?B?eUl2V3FVbC8xeCtzd0xPRUNKOE5EWFp1RERpSGorY2lqaGdLQjRRMFMvNm5a?=
 =?utf-8?B?U2tnVnV4MGNJNHQySm5Gby9DelZkVHFFUkltS1hJRWkwYTI1TlRxMFlrbWd3?=
 =?utf-8?B?SmNIM1dxVDcrck03N2ZDcW5NRkI3ak9IYXhYekFqQzcwSFBvNG5NRGhyVVc4?=
 =?utf-8?B?cjZNcTllZlZpU0VwZ0QwMDlHYlBnbkI4cW1jSEJaTDJrVGVKUVJLbXd0Si9v?=
 =?utf-8?B?MElSL0lVUk10eDl5RUpnTnFKT3F5Z3lWZU9UY3I5cUVPeWk1YXVTZFI0djlE?=
 =?utf-8?B?N3RjYTVSa1dRUXUrY3ZUY2xQWXg3V0JUT3hybWFrU29UVFdEd3U2Qm9hUVJI?=
 =?utf-8?B?TndqS2U2VDRoSmJHTHAxSDdub3pFanNvcjhodklxUzNZNXNKRmN0Y3RJaFcy?=
 =?utf-8?B?cFV4ZG5tU2Z0VkJNQXVmcGpWYm50K1g0WkRXeGljYS9vb2hER1BIYnhZUm96?=
 =?utf-8?B?K29aZE9JTFJjb1IvMWJFQVZ5VnREVWZWa1NOTnROUGc0ZE1sVElmUEFkMTVN?=
 =?utf-8?B?MlJmSUQ5QjZ3SS9RMFFSY1NsYW05VHFlMUExR2xjUndiSUtOazNUZXJDaUtV?=
 =?utf-8?B?WlVNTGJzUloxc1hQWTJOR1o4VmUxdHpBYVpHa0hGUzBpdTNqaU1lZjhwT1g3?=
 =?utf-8?B?cEpsbFpEWFhLRGoxTytjOTNCOWwzV0c0RGx6Y0hSNGYwcmFvMC9EL3gvSmRM?=
 =?utf-8?B?L1hLSWxvb1FwSXFTRFAwei9YRjdXVXpRVmZHUnFacm1jWE5CaEtNMDBYRXdv?=
 =?utf-8?B?bFlEM25jZXNPb2t5cURPdDhpU2FmSjEwQXA3MVZlQ0xWanRvQWVESkx4U1o0?=
 =?utf-8?B?YVdpcDFyQU9zZ0dEMSs0T2s0a0tnSXhlRGwwMm1mdS9EK2hucWtyczBLSmZy?=
 =?utf-8?B?ZnIyWGFiVkNRWUwvVFlqL2pzQ2k4WDVUb2hZbk1rTVRsZFZHRU5tUmlyUXNm?=
 =?utf-8?B?Tm1mbXQ3OWNCY1FXZnJIT1pmQW51SDF1QmEvdkpvODNFN0xWdHJNL21mUzNn?=
 =?utf-8?B?aGQrT1lDUmx0OExwZ1F1OGV2TFhodUpFekp4Z1dMajNJd0VRVG9MTVdRTkpD?=
 =?utf-8?B?REIwYUkzUG5nV2VjVmZBY0xQNEo1ODIrZ0lnNEhjRU9KTExHbEJaRHFLRERF?=
 =?utf-8?B?TUpmUjFBaFlWa0cvd3Zua0cwOXFVbE0wUm9EYnJWaGdLMmpsdCswbEQ4OGsz?=
 =?utf-8?B?anFUZ0pobXJKbUNjMVY2cFpoMUdUM05ZdTJ1OEladmNlelk5akRMaXFjTlRs?=
 =?utf-8?B?MGlQSnRkZjE5RVFwV0V3MDdDZExjYVQvRXQrR1BqWlpwUUVZTzM3T21DY2tY?=
 =?utf-8?B?N0c1eFE1VG9rdnRHNFBNcHZuWUt0UFZta1JYbS9aWk9GZWJCS1ZxaWNhMW9r?=
 =?utf-8?B?SkFYdDF5Y0Y0SzIyUzJqcGs4NzBCa3lWWDRvZC9RdExFdSsrUklGRWo1NzBM?=
 =?utf-8?B?TkticERZWkhJcitwWk5GMTlkTmJEeDlqK0J4cS90QytXSGVuejRyODVEYlc0?=
 =?utf-8?B?a3BVVEFObWNrZVVRRTNOTzg1elMvd3hkeDZyS3JsK3gwek8xUlBoaDZKdFJV?=
 =?utf-8?B?NUdYVGw3bVQwRlNoNllseWdWbnE0bnk4SFFxOWt4czdoekpzVFczWjIzOTEr?=
 =?utf-8?B?ZytjS2paTWRhUGJXZFBOdlNNM1BIQW1xbmJNWnMrRVB2MXdNWmN3RFVzUXNO?=
 =?utf-8?B?Nk51M1dNai9ubEU4cUhEZEp5NWJJQ0hWaERrL2ZpSDRhbnR5KzlTTy9Fa29E?=
 =?utf-8?B?K2lpTUxLLzNlNnNtYUsxMWNGd0lDRkZXSklsbEtKTWJtMVdwZ21HRS9Vek83?=
 =?utf-8?B?dGJQSGsyQVI0L1c3SGRzZmxEbkVFblBxSEJ3b2ZhMFZDU0lKLzQzN2xENnVH?=
 =?utf-8?B?VzE3WXNEY2x6L2dNQVN3SnZuY2hKbkxNWk96bHNubUszUVh6ZXE5TkRBZEZu?=
 =?utf-8?B?aTZ2VFFBa3BKd2ZrQ0RFVTZTVkVIOVRGQmFEYmhVR3RyNzVHTi9DMU9qNksr?=
 =?utf-8?B?MmlIaDc0bGV2YTBKdlRndzUzZTA5eGRoL1puZmdXN0UrbGFKQ3VuT1Q0QlVa?=
 =?utf-8?Q?Exh8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 19:06:44.0380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ecaa4c-8a3c-4fec-40be-08de260c72d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7196
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 19:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19280

On 11/17/25 2:34 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
> Presently, /usr/lib/libckteec.so is not installed. Instead, the only
> symlink present is /usr/lib/libckteec.so.0 which points to
> libckteec.so.0.1.0. This makes OpenSSL commands fail since it looks for
> /usr/bin/libckteec.so.
> 

Seems like this would be an issue for others, have you sent this fix
upstream to meta-arm?

Andrew

> So ensure that this symlink is installed by explicitly adding a
> FILES:${PN} assignment.
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
> v3 -> v4:
> * I realized that libckteec.so.0* and the PKCS#11 TA file were both already installed in the SDK.
>    Therefore, in v4, I have removed the logic for that since its redundant now. CFG_PKCS11_TA and
>    CFG_REE_FS are enabled by-default.
> * v4 only fixes one issue: the absence of libckteec.so. /usr/bin/libckteec.so should link to
>    /usr/bin/libckteec.so.0 which then links to /usr/bin/libckteec.so.0.1.0.
> * Link to v3:
> https://lore.kernel.org/yocto-meta-ti/20251113104522.2443817-1-prc@list.ti.com/T/#t
> ---
>   .../recipes-security/optee/optee-client-ti-overrides.inc     | 1 +
>   meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend   | 5 +++++
>   2 files changed, 6 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> new file mode 100644
> index 00000000..dd6a9d01
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> @@ -0,0 +1 @@
> +FILES:${PN} += "${libdir}/libckteec.so*"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index f193e78b..0cee127f 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -2,3 +2,8 @@ OPTEE_TI_VERSION = ""
>   OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>   
>   require ${OPTEE_TI_VERSION}
> +
> +OPTEE_TI_OVERRIDES = ""
> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
> +
> +require ${OPTEE_TI_OVERRIDES}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19278): https://lists.yoctoproject.org/g/meta-ti/message/19278
> Mute This Topic: https://lists.yoctoproject.org/mt/116334516/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


