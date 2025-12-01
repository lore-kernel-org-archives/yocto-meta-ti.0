Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50989D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 10:16:29 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18476.1764584186288254087
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 02:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=tNtJ03Z+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.7, mailfrom: c-shilwant@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiA4t44UBFfAqE+MEvSBO0vGR39aBNC8ABHzXlEaZgXjm8OaYw1vERYTCJks7Pn6EzykRaeCvSavj11lopBm1yU1j4OJhk2CKjo3JkGnDSR8LFsDhfoheRMu4LxvQrKTC2g0qNI+q9AmpfIZ8u27UGGOwHVNoOhpV9hTawoqldA66/rxdHD6SQ6g7OJp3NNDd8PE7p1PDHKUQ33YdTsY5exPjYe0HDhIR+Jq4aRzabAfKTdqU8lpkjWjnwYoQGohofElaNhCVk+xvx4I/NmaMz7misHwxPr0Od1mqrbHKvrF2vytCJodRUNdk6NI+qO7nRDrnp+jOqH4rbC3YzEzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60dSfsu4PHip9vURnqTmizaghW9xoqApw/z86gkvvB0=;
 b=xha+8QbcmTGgkQ1l+81mM+e6vxhGaLj/vsYgmmuibm09lEoh2205oE//1JNr7yGzmGFddOcfn95SPMtqyFPLUd24eSZehEQEAZWyqUAo5h0Gc/NfNRh0eL8MImVMxHFSV+hz34CmVODdaoDVC9kJSnaDDgHbDwUeH36XO08CmYlpbA9/FnhXdfO/sOI2O6cNJuQ9YxlrIK4qqCbnn099NQDnG+FNePeBuRGqgzJ8n3tqfTJjpxftsh0nR37BNITWFbiP2Q3M0Zy6pO/Ov5n6LpI+BtsYPeORioYIlag3qqSwLSp/t5Sma2yflH4gEKw55th7hp0xKatn8NMTYj+NVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60dSfsu4PHip9vURnqTmizaghW9xoqApw/z86gkvvB0=;
 b=tNtJ03Z+1cenI+JKjCMYEH61h1WVV4vxdOlAG3ZY5tpU20eVvDFx3PQ5gfquh2zD/LCHfnb/Qae3SVclKMbXIPETOwjT0RZZ9TiqRfNDWx+0vp54mt3opUaAx/dMWTaGVnsrA+JmGKpHXBoLbnX49ElLfIE18X2adpVAed36QtI=
Received: from MN2PR01CA0006.prod.exchangelabs.com (2603:10b6:208:10c::19) by
 CYYPR10MB7607.namprd10.prod.outlook.com (2603:10b6:930:bf::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 10:16:24 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::86) by MN2PR01CA0006.outlook.office365.com
 (2603:10b6:208:10c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:16:23 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:16:19 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:16:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 04:16:19 -0600
Received: from [10.24.73.51] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.73.51])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1AGG9p247473;
	Mon, 1 Dec 2025 04:16:17 -0600
Message-ID: <ef33f353-327c-4f28-9f67-e4b8dbb6baa9@ti.com>
Date: Mon, 1 Dec 2025 15:46:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add
 TPS6594 regulator and core modules to initramfs image
To: <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <denys@konsulko.com>
References: <20251201100941.95152-1-m-shah@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20251201100941.95152-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|CYYPR10MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: d67d493d-f27c-4279-edc6-08de30c2ae17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWpsdlZtd3JQRnFzVUR1S0FIK1VVUXRXTFd1LzFXcmMxVDE3aE1wZDV6UWx5?=
 =?utf-8?B?dEkzYVpid0JqOWRiTk5uNHlBU216YWl2V1RLSC9PZ3NQUDgyOEZoWHQ2aG9S?=
 =?utf-8?B?MmIvQ0hEZ0hYM2RoT2J5STBzd01xeW5iWmJpaEh0STNCcUl5TGd1bEdzS2RE?=
 =?utf-8?B?R2xUNWMzY3haelBDcU0vNWx3c2kwVHZiV3dxZUt3KytHa0xpU3BMVUR6aGxZ?=
 =?utf-8?B?dnJoMXh2c2tuTEROWTk2S3NJN2dlTUNOTUdDTERxeUI2bzVLbWNxNW9sdFV0?=
 =?utf-8?B?OTJUQVB5d2hXL0xYVTRFcC9rMFIyb0plaEY2Z2lEaVBYbTBKRVg1Z2VkaktV?=
 =?utf-8?B?UkZhb0NSVTdhMWhvN1cyMk5VM3pDUEQ1QWU1dEdOelM4bTFMenhIOVlXT1FZ?=
 =?utf-8?B?VEtPdEYrdHNXb2sxei80ODMvbHRGVktLRnpxOWl3anZxU0EvZW1URkI0cm1K?=
 =?utf-8?B?aGFYUHNsM3NXZTgweFA0aWJxR3E2QTNQYXd1djhrTEJtWWxNUlRrdjg2RzVO?=
 =?utf-8?B?K1BTclJoc2NCekVIUXQzdC9JYzRXZFA3ZllRWEFUQWM1OUN4N2diWGl3OThW?=
 =?utf-8?B?bFpoeE5ZNnJIeXB1RE1nejhXQ0FMN1lGWThDWUZuSjMweHVnZEk1MGlOSjdQ?=
 =?utf-8?B?c3RZQXY4MkVQTm1ESnIveVM3R0lOK0V6djQ3QjBwYmM4M2FCbFozUnR1NUJE?=
 =?utf-8?B?b0VJaUFzeUVHOHk2ZE94emxNcnBMZzY5enRLR1pRMCtNMEhzUHNLRkRQQk9I?=
 =?utf-8?B?MU0rVnBFVmNQOFF0dTVIVDNrWXhURVFLNW5oN2dNQUV1Z25LQU9la0VSNURs?=
 =?utf-8?B?NXB3a3ZZTm0xb1dUV25GUFdWbGsySUFta0dPZ1IrYUNVdU5pSmx6YkFlOHhy?=
 =?utf-8?B?ZjRzNHpWUHdMaE5XNkJZS1ZSbHB3ME5tWlRiTGZqNVcrWU5MbHdYbmpBOXd1?=
 =?utf-8?B?WE9UL0ZJSlUwSnZzenVxNXdpVllQWVBhOVg4L2xmdTVjL0ZFNHM3U2gzZDh6?=
 =?utf-8?B?UjBIUlRNZDhneXJHaSs1elhOOGFvQ1p5RHllTlJ6WitrMkdUZG5PMktOTHVQ?=
 =?utf-8?B?YWpseHVYYjllbnBrUnRkRmlCcFI2a2pDdkZGK3dWVkNRNm8rV3JMbGs5cW10?=
 =?utf-8?B?TUdtUTFCaFJHQ3NTL2JnUEtIUThFbzlwazk5bkg4YThwNWgzRVYzcEpHdHpx?=
 =?utf-8?B?VGU3Qk9WVS95RjgrdWZpWEVBbWlhQUlQcExTdXVVVm9VUFNQWGFna3ZlbmxE?=
 =?utf-8?B?RmIyb1RRUzU0M0FTS2kxR2tQYmxVNVB4VzdQelpxVmR2UzVHS1Z0WW1rZjFE?=
 =?utf-8?B?OTdwZm5MUE5ZNXFuWWVaZkVIQTFYL0VJdm1SUG56VWtNUW9OWFBrRmpKT0hj?=
 =?utf-8?B?dER1VnBGeitxanoxMm9MY0IyZlJEZUcxRk5qcHYzazFsOFdwVTJFZGl0amN5?=
 =?utf-8?B?aXYxUTliVVVjM3ErYVZlWnNreUt2WmVtZVFjTHNScGVLWWtiQzltMGdGSEZO?=
 =?utf-8?B?VzZONm9xQncyQVZ3bUowVEJrY2RuS0hGWm9zZmMwbGIwZmxxNkFWOVR5djRp?=
 =?utf-8?B?V0VuNXlqN1BJRDY3S2cvREdYc2dTMVQ5WGtOQWF2OVFwdHVqV2MyTU41TVJx?=
 =?utf-8?B?ZkdXOFNXYnZoeEJ4Tm9xVG9YZ2ZveUQ1bGFNVnI4R3RVMkVvYTlkWXNXclVP?=
 =?utf-8?B?MnQ0L05mWGlWR2xLdk4yMlh2eGNZK1VOQmZyQTlLNU96dHJtSi8wSng3M0pO?=
 =?utf-8?B?ZVljQTlmb1l5LzBlZXlBdWtRanNnZUVuVXVOdnZUU1pzNEdZMHJDK3liOEpD?=
 =?utf-8?B?RVRrYzAzTUFHNERZbmY5VXQzaFN3QVZ0eHlaR3lQejg4VDkrMC80dTgxaVlU?=
 =?utf-8?B?MHU1eDlwM0FFeTlOa3B6UUNIYkVHTTZ1WDRjVkt5YzdKSjlwZExJZnJNUzRP?=
 =?utf-8?B?dER5WVllWWZnajFHRld5UzNnM1hnWkFjc2UwMVJQdUdDYlZ5UlNzK2d1NHY0?=
 =?utf-8?Q?FCyBcVbHps/QevAq66FMVRrad4iGic=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:16:23.4604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67d493d-f27c-4279-edc6-08de30c2ae17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7607
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Dec 2025 10:16:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19310

Hi,
On 01/12/25 15:39, Moteen Shah via lists.yoctoproject.org wrote:
> Add TPS6594 core and regulator driver modules in the initramfs image so
> that the SD card can be probed for am62axx as it is dependent on regulator
> to get the SD card probing and eventually boot from it.
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
> Bootlogs with this patch applied: http://serenity.dal.design.ti.com:7777/ecagupigod.yaml
> Bootlogs without this patch applied: http://serenity.dal.design.ti.com:7777/kiweziviha.yaml


meta-ti is a public mailing list [0]
Please avoid internal serenity links.

Use gist.github [1] for attaching logs

Chirag
--

[0] - https://lists.yoctoproject.org/g/meta-ti

[1] - https://gist.github.com/


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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19308): https://lists.yoctoproject.org/g/meta-ti/message/19308
> Mute This Topic: https://lists.yoctoproject.org/mt/116553566/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

