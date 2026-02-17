Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5396FEF99FF
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:23:18 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17582.1771348995366866334
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 09:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=v+dtjFLW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.0, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yyir12uLO9ECoOK0QZbs5a9GfWf4WaRKNzB4RYbNyh+Dtno/eviBjEfhELJ2Ln/VQ1YLDab7bK/K9TydtwoLLiLTjefRKCHHg6kANf5oK5eEbot/9miCmxq142LnIT8Ry+rH6qG6ET/kS3OXffR2cs26QuRvT5SMAbmbq7aSvkF1sG9I+f4ViJh3HYEbm6x9RXR/xYAENNhcLI4vQ0nTLAaGcTCQIooS46aCmsTPZWJ7zISrje16o0mWdqUFuJcx60MkYltv/0SlSHJS9mUnRsyf4aG7ooRxS5F5o3W13S3cdjIvs08BWKeuYgceSbpo5ipfydEexBriJnKWZlCPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT4FHpw65piaxW0IzCirToORWrImMjCRjPZBfde1uqE=;
 b=zJufZQP2IIXItKVefLDBXitgqzFeSCW0e+/SYPmn87MRTD+9fP+NXzw7XBG7sZj4aj5P/mN1aa629VlnPilMjIyEhlF+qRE5k/YbX/EoceO1H07nhp/aF7z1KI5tN4CjmNA0mNcBdj44F+fDABpiZz603SHlhsm19mZpfK75KAe0yMG+cxhuYn9/DuLO2x3JdGylnmMtVFhET64Bi9/UjDCoBvOsDcc1iK/G/7UqWm4D4oH+AYOpK3GMABVNqXN/uJtctQA1N72gvGbDPjVPMh8ZfcP7vE/9XXQ56W/Vixj169OS9NJODeR0l2zgQAQSuAtCnGoZg5ai9RBjNaqzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT4FHpw65piaxW0IzCirToORWrImMjCRjPZBfde1uqE=;
 b=v+dtjFLWL5ed0xXNGWasF4M23Qt/Yo3mqGzE85elRs5wnagq7NbaepGyw0R0gXCJkTAgcZEotz0SrIoVssX5kNvPJNI7sa/Cn1fsqJOM4Xe7ks5rvZDFJNKTsS3XzzDHmohjMY+viR7i7JagcBsVu51CSb8cpBQEA2Srthw6cFM=
Received: from CH0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:610:32::6)
 by SA1PR10MB997653.namprd10.prod.outlook.com (2603:10b6:806:4b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:23:12 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::17) by CH0PR07CA0001.outlook.office365.com
 (2603:10b6:610:32::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 17:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 17:23:11 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:23:09 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:23:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 11:23:09 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HHN9bd3695801;
	Tue, 17 Feb 2026 11:23:09 -0600
Message-ID: <1148f430-063d-4aa7-8e52-8e8378112ee6@ti.com>
Date: Tue, 17 Feb 2026 11:23:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Change assignment
 of IMAGE_BOOT_FILES
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260217161041.786432-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260217161041.786432-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SA1PR10MB997653:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2803b9-6971-4f6a-d861-08de6e4939c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|4022899009|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUVBY1FJWGVOS2ltWUF0V25JQjEva2JvTzFsaGg3ZHdkdFVKTkhxMWdLTzIw?=
 =?utf-8?B?WVppZlpVQ2NKV0tFQVR3U3hjcXpGTnQrV01DNW16SW1rcUV3bU5UOGdDdVVU?=
 =?utf-8?B?cG5LKzNSWmo4N3Rmb0JtK0VuNTZEZGFCb3BUOS90K2kvOGp0Z28wK0dWdjF6?=
 =?utf-8?B?akplRy9pYWRqLzgyZkRJVlN5alBwYldxR1JEbmd4WVRRVG5NVWJvdmg1dzRr?=
 =?utf-8?B?RVFZSWFtR05DMEZCMFZuc3RhRlRqaVRoK1kzN29CRkgyU0lDSnpKaGhWdWw3?=
 =?utf-8?B?bnJacGUwSWZjSHkraGVwS21PMHZlL2NjNll5Ykk1SWZidE5CeEVoUGRjMDJa?=
 =?utf-8?B?c0xDK1JzbFJJUmo5Rmx5QlIwRkppWktZU2dQSE0vdHJWS0hUNVVUcTJRZncr?=
 =?utf-8?B?Uy9NZFBkTEVZMFpnRDRFVXByOGZkUTQveUZIK1I1TVV0dXJVQkVHcVZ0TGhS?=
 =?utf-8?B?SU9abVBPeUNGbmZxVzR4M1M2ZHcrd3dobSs2eWZmanVoMTFaNXhtc29LL0hx?=
 =?utf-8?B?bStGYlZuSWErTmM0L1ZwVDlsb3N1Z2VTbzdhSzZVMFozNDZLdlJCVEN5NVFr?=
 =?utf-8?B?QnluOE1MMXNQTTByeVZEMEx1YnJCSndUZEJQN0lYc1NRYmRDWlEyRHhPanNo?=
 =?utf-8?B?eEVycmUxT0lKTmlTU0J6Z1VYTC9RLzRkRjBjNkEzSWcydXFGV0V5d3dWNHJY?=
 =?utf-8?B?UFBEVkRFNGNWWUJBSDlBcnBnNHlnZGdHU2hCeC81VDgvY2EyREN0WDlWMzgw?=
 =?utf-8?B?VTYxY0VaMXNCZ09RT3VLcm9PUytnSEF1VDhFM0dJZXg4b053a1F5WElpNFht?=
 =?utf-8?B?M0JZblN4bWwwd3FzWURadG8yODBoV3VBOHZJeStveGl2Yk5nbjBmUnBLWnV6?=
 =?utf-8?B?RFBOVFcrVmhqV291KytwaFA3ZUd4dkFMTlNDYld5akdjQkRudmYzRmxlMlJn?=
 =?utf-8?B?K0FYNk1yRWdUWFpvNm5heHd4RWMxRjAzZExRbHFjSEFyYnc2aHNqQ1YzWWY4?=
 =?utf-8?B?TFVNcFVDZDY2aXhTbEVmMzE4VExNUGx4V0lZbmdIYVJGQk5sZHFwMUZLU0ox?=
 =?utf-8?B?YW01NE5wYWFnQXlFT1pIWkRIUC94a0ZFNEV2SG5QMjBhKy95Rk5FcCtSY3VF?=
 =?utf-8?B?V0wyUU5yNFFHdjZBQXVjOUJxb1JISjRHSTIxaElyeWFWMkxsYzF2WVdnUjQ5?=
 =?utf-8?B?dXNkYkhwZzVMNU5oQ2RxbEE5MkNKbnZUYUJ4QlNvTlNwZmJWcDhtZ0twNmps?=
 =?utf-8?B?YmxpbGJCZ2k5aHNSSWhPWXJQdy9hZTBKd0dRVyttT09TWFVPUFpiVk0zVE01?=
 =?utf-8?B?YXFHSjNxRmkvN3RETmtFR2RjYjNHS2hHd2ttWlo1d2FyMmlYaHdDTGFmMThm?=
 =?utf-8?B?NUJoOFRXTmdPWE93UFV6MktRVmpxL09XRGhCQkU1SnpyNlBLTnhKMW5jeGdx?=
 =?utf-8?B?eE1CTE1BaEE1K2pqZ3ltSDJhdmc5WU9YM2pabm1oR3hLcjNXbkxhS09obndn?=
 =?utf-8?B?dXNQQXFSYnlTTGJUcW5pOTQwZllXUmhOWEFaUjI3VXFlS1R1SHpkcUxNbWZD?=
 =?utf-8?B?S0JHbnJYY3hiQTNCQ3pEZUZrUTBlUWlZUG1IczhEOUo0aWV5b1B5cy9RRjU2?=
 =?utf-8?B?QTA0WVVCOEFnUHZyV2NzdU1QaWFPeGRvdWpvSG8rZVFVMkdwRi9OWWM0cTJJ?=
 =?utf-8?B?S2ZDOXEzUE83RjRMclBrWnoyeUZwcW1iNUJONGt5R2N6QUNsSExuUno0dmhX?=
 =?utf-8?B?ei9QVjM5b2JKaVl1cXg3N0V2M3FYZVluZjgwbjV3Y0duejVMR3g1MVQrQUNW?=
 =?utf-8?B?dnRFaGs5bW5Na1JFbEk2VEhpR1pIYWpmcFZDTWdEdGtnRitmMUdUL0Y2QURY?=
 =?utf-8?B?QlRjN3RqWFR3WU1rVUR0dlNmMFpYaG9PWmROTlpPZjNselJOTHkydTFRS3JI?=
 =?utf-8?B?SEJmaHNqaHVCMnN5MVRSeEZhT1JBanUvN3pyOW9Xc1E5SS9hSWIzTEw5SC9v?=
 =?utf-8?B?ZU9DcVhkcHBRY05SdStFNkJkdThiVzZuTk9xRWpKcVFFbTMwTTVPaDNsUVRr?=
 =?utf-8?B?Snk3QUFRTmZaaEhJaG9YU2pPeXl5NXpkSytNamlnNlRtZE5Ycnk3MHdwMzNP?=
 =?utf-8?B?UXNkNTRrb1ZHTytoOXdiMWJuekQwOFlsU2sza1c2RGZIRG1Gdk1tY2lHZE42?=
 =?utf-8?B?OEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(4022899009)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6Qdz4QrsRsDgbHYy8EPtzsHCaAZiaAo1X/JJHT5SGJff4WysxudK7/20KTwueepQdVDzNHNorPrzg28Nfk6sDLr10doNfUAC2GWa8Fn46wwVLXY1DDOKrX5pkrg1uohgG6qA8nwi8RpBeYyLyIqaQjtrH8X0F4Vx7bmahiSjpJhQELFX8c9M49J/x4seRxL8k+Gc8jZxTZiufKZQTDJB4KrNyCB2NryFsRiCyJ5H9gOnasMLmRK6Ty3v5SkBLb06Ls91UPPdXv0SWHM+ELkkA4E4rsANLEEOJINtYnz+Cw02VfoCFpcECEhVhl/FJGpbNh9uI0PfPP+kdVat2UC4xz1OFahqBOndGL+yV6LGPrttd+JJsPlRk0FTTAob6XRw+WMJ1KN1qdQMMNw2IRpqSx3QJnEn9vv+3jSFBl2tmy4q8T2V5F6+zl2ZH8Ite/hy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:23:11.3514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2803b9-6971-4f6a-d861-08de6e4939c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997653
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 17:23:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19528

On 2/17/26 10:10 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The += setting was overriding the weak ?= assignment of IMAGE_BOOT_FILES
> in k3.inc.  This resulted in nothing going into the boot partition of the

Could the weak assignment in k3.inc be changed to a +=? Seems like that
would have the same effect and prevent any future issues like this.

Andrew

> wic image.  Change to :append to force this to occur after all other
> settings of IMAGE_BOOT_FILES in the conf files have processed.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Fix spelling error in commit message.
> 
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
> View/Reply Online (#19524): https://lists.yoctoproject.org/g/meta-ti/message/19524
> Mute This Topic: https://lists.yoctoproject.org/mt/117859038/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


