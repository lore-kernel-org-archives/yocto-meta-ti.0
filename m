Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2DECCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 19:54:00 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.18])
 by mx.groups.io with SMTP id smtpd.web10.13135.1761767631977357785
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 12:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=BD7L2mT7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuGHe4JbQv+IwWzDKxUA5+mN06rnLvRrYm12qxGKin23LRWvokk5PiybaTA13FxduWwSonAfbfPCR4nbLRtdy7eTCSdgyio1gJ02aX0oIx63ep7qSBYJssyaCG6XJN796zRyqxp+2tsFajuRUmVOV7oL7xxDSqB5trIx5kMl6g+Fn8kA3EeIpCDv1shmGVAWYvFsAHEJENDLE3OVsjmKDO5BLEkvYThtj2InkNLt5ITjBV1DHzmzxc+xJqpTYKyOpp6C1xnRhppkiqMuhrCJ98MQ1biKC7to5WW7NroPqc/1T2IU/sKQgyuJYadDRjqd7N8XG06sQwZifXZU8uEnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjiynP84+OwZ46KbsxHw/X0gO1cMC/aa/tpo3md+mjA=;
 b=S83oTnINBBIH8B4DRH7BPTUkQ/dm6fofyKdayOGDTzUkepd8nAt7zsPnS2/1GDrc40qoWjZuVCx7N8qgLPoig7/4QViOI9KXWekHL7Lc/5VQGRj2Yn3ADI3GcglzQ4qJ+fOGfBjxRnr56FNp/NhA/J7SqskfRput+E5dNka0Oa03KPXbP3c6NAgI35LN9+ZMvGwX5hQcljGeV4M1VfkO1W/Ns+54SuogD1W48UtTZall28TuV0lawctRYBNEERsYKMDvhTh8DGxuRogC93/uAm9+xCmei9JOUyEmQy0lj6GUMMta7J8Jim414uTC2TpRcoxXG5Ll2NN5HJ3yWQP6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjiynP84+OwZ46KbsxHw/X0gO1cMC/aa/tpo3md+mjA=;
 b=BD7L2mT7KSKvllo6HeqR4rvZ1mdaMvm2GayC8c1PU2Va+2Ht6liPhCKjJR+83n8fjNzT/pxZ+pNuNM6SY7CBlIjIAfo7IdikkVbEmJzoWFDwUpoSb36hJ1vmQq0yah58W4WOHMtEl1108ehSG8cR4Rmer72jJh7cDlKKRYEyBDU=
Received: from PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::13)
 by DM6PR10MB4266.namprd10.prod.outlook.com (2603:10b6:5:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 19:53:48 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::e0) by PH5P220CA0010.outlook.office365.com
 (2603:10b6:510:34a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 19:53:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 19:53:47 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 14:53:47 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 14:53:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 14:53:47 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TJrlFX432579;
	Wed, 29 Oct 2025 14:53:47 -0500
Message-ID: <614a22d3-d7bf-487c-b5d2-d126b9f318d0@ti.com>
Date: Wed, 29 Oct 2025 14:53:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-core-initramfs: Set
 IMAGE_OVERHEAD_FACTOR
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18730CC43FC2175D.16111@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18730CC43FC2175D.16111@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DM6PR10MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e45908a-36c2-4722-1509-08de1724e020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2RMQTF3UGFqb1hneEZYZTZ6eEl0ZW9QbUJBYmpGSERYdE5KQmtMbFkxeHhq?=
 =?utf-8?B?cXU5WjlyVFVES3dSYW5LQy9FcVNHRXlQZGM0R1BXQmU4ZUlVbTJwaUlRNjRL?=
 =?utf-8?B?VG9VdmFYZDNHR1pZaDhWUHQrMVZ2ZTBrNmwrNzA5UTdyUTdxWWpyeFQ0S3ph?=
 =?utf-8?B?RFVsVGY4ZG9rNUFqN3hkZDRiWFFhNGo4VERGeHd1OXgwT0JiTnFLZlFoeFI0?=
 =?utf-8?B?eVNJQ2JmTkZmYysrOUU3UlQreTM2blQrNUZoMkRaS1IyMWlpZHVVallLOWJK?=
 =?utf-8?B?emxmZ1doQk9TaXR4WStTMUFEamNJYis2MUQyZmJROFdybkp5ZmVINDUzOU9G?=
 =?utf-8?B?cEJvU0IvKzIwZUZSOXVnV25vTHBvZmtlNmpqdG9ZbXJWR1dYaU9LNTRTL2Yz?=
 =?utf-8?B?RVFSQ2ZRQUsweUVsbElaRjBrVTlPUXFOTVVHVmtnL041MVMyQk5JaUc3REZn?=
 =?utf-8?B?Z1E1blRqZXpVbVpaS0VDM1RhemFLRktPczFiZGFKRlNtV2d2SWtORVRaczBB?=
 =?utf-8?B?aFhHRWc0TXVDb2JEa1ZXN2pTYjlvdUNscWVUTjRsUkRWaEVOM25US0w0YWdk?=
 =?utf-8?B?enAvZHVhektQS2JWaFQ5aHNqZ1RyYWRWZlAyRlR1Y0hJbm42QUQzZDg4SzNH?=
 =?utf-8?B?M2FXVUp3MzV1ZGdXTGtBd3AyaU0zN1RKMWZ3dGV6cVcwRFdmY2U3S29yNkEw?=
 =?utf-8?B?RTBWdyt2UlFXOVhyOTdERlR2M2IvMyt1M25yWVgvRUd6WFdPa2x5QXJWSmtS?=
 =?utf-8?B?UTZJaHIzWFlZdm1vc1hnL2d1OUpzQlpvTGx5U0xucjNzQ0NmcURQN0pQSkZq?=
 =?utf-8?B?OVhGSGd6cENqMFJib29SeENZcjk1c3Z4K2JjL0p2WGErSzh2bjZHMjFzenpr?=
 =?utf-8?B?bWhkTGFEUzFXeTJtWVhHVE1DWHJrQnRCOG54ZGh5aEZaYjAxUXcwSTB2YkxT?=
 =?utf-8?B?b2VIeGtDZysvbS9WWjBsRlpCaUsvd2gyRytuR3FSQThsb041RzFycTV0Unh6?=
 =?utf-8?B?QU5nVU9uQTNMMndZOTVZK1QwbzA4THZqbU4yVlRmZDMxTG51M1I0c1haODFo?=
 =?utf-8?B?VTFiUy95MitUMktmeFNzTzNMMlc0Mkh0VzZpN1RZQ3lIK0JzNExHVTYyREZB?=
 =?utf-8?B?c0hIVjRkN2c5QmVaU2NPNEx0OS9uOTZidWhTK1BYRWpzNk5qRlpGS1NsZTNT?=
 =?utf-8?B?UjRibExsYkxEMTQ5T3lZc0xmU21ucGRsalJSZ1JKeWVMeW52N1dDNkpPY0FS?=
 =?utf-8?B?TjBYQXR0S2M0cUJGK0pkZjdkNHhzdGNMWTh5aVB2UmNpUnQ4R1BzWWJSNGo1?=
 =?utf-8?B?MGxFWmM0bUswU0dJbEdUc0RreU5nWW0rNC9HNFNNVWljZzZzQW8yYnczV3Iw?=
 =?utf-8?B?U2lDRFR6VkdJaG9EZDlEdW9kTGxKclA4NW5YNGtaWXhvbHVZUDRaYmZscllS?=
 =?utf-8?B?TzRwZ3NpaTEyUlNsT2VpdjVqQWZaWW41d25NNFpLdmJRS09kUmo5UTRFT0ZM?=
 =?utf-8?B?c2hpQUtQRU84OVowNys1U0x3YU9ndzJqem81QzJaSXJ1U2hwWDkwQ1ZEaEFu?=
 =?utf-8?B?RXNUb1pqMnAweVlZK1pRZXk1MFFLZDNTQk5YYWNXZzU2TFRGYUxyWmpKZXgw?=
 =?utf-8?B?S1BicmpJLzZ6dlB5dU9jSEUyOWdkSkZWaWc1UTdyTWtWK2o4cjVvVjM4akY4?=
 =?utf-8?B?a2JxQ3hRWDNtcG5ZdXhGQU0rRHdJK1orZW9PKzVXTmFzQjNQS1JXSHhURFdD?=
 =?utf-8?B?S0JOcXRGVEpCRzJBVjc5ZExKS0tUdnNraEtZejVBVWU5ekFodVk4cnEwMGlz?=
 =?utf-8?B?ZjQ3NlI2am9QWHFDMktHZWw3M0lDdnZlT2dURHhmWitMZmdMV3dCU0w4amx2?=
 =?utf-8?B?Wm4xbW9iNWs5NU9OR21XczJ0dXloZHU2Y3FtZzU1RHVpbHVhM2dReVo3bE9p?=
 =?utf-8?B?Z0cyYUNHTlFybjJnbEFXYitTaFROeW9UWGpxTGNsVE1QSVZMN1pDaDR6TVJG?=
 =?utf-8?Q?PXTNW7q6LdXXgijYb2YLzcj8zwQEoA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:53:47.8885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e45908a-36c2-4722-1509-08de1724e020
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4266
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 19:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19207


Doh... This is for master only.


On 10/29/2025 2:25 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are seeing errors when building against linux-next where we run into
> the INITRAMFS_MAXSIZE check.  Lower the overhead factor a little to give
> us a little more room.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> index 236aa756..1a102d82 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> @@ -23,6 +23,8 @@ PACKAGE_INSTALL = "packagegroup-ti-core-initramfs"
>   
>   export IMAGE_BASENAME = "${IMAGE_NAME}"
>   
> +IMAGE_OVERHEAD_FACTOR = "1.1"
> +
>   # To further reduce the size of the rootfs, remove the /boot directory from
>   # the final image this is usually done by adding RDEPENDS_kernel-base = ""
>   # in the configuration file. In our case we can't use this method. Instead we
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19205): https://lists.yoctoproject.org/g/meta-ti/message/19205
> Mute This Topic: https://lists.yoctoproject.org/mt/116018898/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

