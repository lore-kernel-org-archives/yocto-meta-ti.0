Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831F8D46607
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 17:44:57 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.520.1768499087413119988
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 09:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=u5ygYZ09;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hblNduWHD5VHSpi/ONypioKRShMvAgRW550eGB1310Fp++d/BuMGxY6hPvwDj+JG9Ebk9RRmV6Znvxuw/3MtY86X6l/INESOd3aqLjflOf+874gWZGvk7ZZGlHfCit8S8JhJU9/wA7ws+JOUgLGX8GEjGu4vWvjWuGIxWXviV+ZcOio3zWivYtax4ONYHPmIG0f/Tp2dTpxqz0w4v9XKhsnFTrCokIMleaXoJltBRgwZ5qxLfxL1L6efiiofKCKc6PtowTVAe2Idn0pXHGpnJFa889+bZfhhGN75NMATL6tB8QoB+BCtU/da/m4EyheQ/0qn4AFVWI9/DJ9QA2fDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WbinEwOZa2MjuJS5f+L+npXeoMO7Teek9vVCJWNwd0=;
 b=KE1mNsI0ecH5tq9eCdDok2zMkXbmYCzRZ1dcYBPdRZS87T7FCWm59wbozvAzubi/FTCq4dF2BKJErVBhSuJr0FamEN1ncHOQ9P09eRw+N14/XqCiL7/nbHf1ZtRVEbUFPFHD3G3ttm4weWuJFvY+wiHGP4xFfJyivUNx1/R6fDvsvUnCtbRdfJFMDOYymDCwNxlPhOaIg2RIxnuALTAguiTOqnISuhOb66NfFxbOLuBvmPdeY7WnEx4Heg+kgrPoECCmoF+1wqMg1BBFxpq6ZCud8lGzRzWpJRhe97qHsSgXMURGJlFM4AffkOSysDIoJVXpP6nmidMmecqY4+A0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WbinEwOZa2MjuJS5f+L+npXeoMO7Teek9vVCJWNwd0=;
 b=u5ygYZ09DdPueKFWQnSLNRCrdGARfggonbjGiBimOr5oZFNSexlNq/ijJYS1oMES6cEZSlHjTjwcJPaFNHCt13z3xFvYOuG7/GQ2lCbOMd9XRDXDK3jou1JVEzGFqUhpOJSqJhxC4WkULtJf2WVTZir0jthl/A93kCmDGn3HXro=
Received: from BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::14)
 by CY8PR10MB6492.namprd10.prod.outlook.com (2603:10b6:930:5c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 17:44:41 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::5a) by BY1P220CA0001.outlook.office365.com
 (2603:10b6:a03:59d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Thu,
 15 Jan 2026 17:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 17:44:40 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 11:44:40 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 11:44:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 11:44:39 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FHidwW1932401;
	Thu, 15 Jan 2026 11:44:39 -0600
Message-ID: <49731e93-3db5-4a19-80c6-562073e31cbd@ti.com>
Date: Thu, 15 Jan 2026 11:44:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging-6.18: Add config
 fragment for j721e
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260115160413.2999023-1-reatmon@ti.com>
 <20260115174044.GS11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260115174044.GS11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CY8PR10MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: a450726f-1f45-401e-178f-08de545dc2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3ZpMmo4V3ZtcUpWMnp2ZzlDd1A2QnRjbVFMNVQxVVdxVkFQK2JFU2MxQk55?=
 =?utf-8?B?ODlPOU41QnFGOFVCcU9Vb0ZHRnZhK1ZGVG9NVFBIYzVidm1HbU92R1VZWkFL?=
 =?utf-8?B?TTlUbzNHcms1aHJHeUtEaTZrMk8yUUdKamZhejFocElyWEwyamxCeHpxNTdp?=
 =?utf-8?B?ZXp3U0lrZGxkaWJaNk5JOHFObW1ucjJuZlZVU0FYSTl2UG1lc2YybWVZam4y?=
 =?utf-8?B?dEIxWlNORFJEd1ZXdzc5Zm9FM0cybml6R0tsNlJEcEZMWUVGNXNSRXl3dC9z?=
 =?utf-8?B?Ym1rYXhBTHZLSnJZaTdCMnBHZzV2Mnp4d3NUVVloUHlscndyczJpS2xzbm42?=
 =?utf-8?B?R3lTY1BlTHl1NUpYSDJHekcwYkI5ZXlmSFFCanMxOFNtYXRZZkZraHpEYlg3?=
 =?utf-8?B?Y092eTBOTDFUTENoeFRtWUtmQjR3MG1xQTAxYWt5eW92aEJGdUovM3ZlaHdk?=
 =?utf-8?B?TmRPb082c21ZSXIzRkZnSmJzdU5qT29OQ3krdGdTU1JoVUdCOTgrN3RpWjNw?=
 =?utf-8?B?b2F4dEVuOTZ5dnJCazZYUlVxUzNLYmtBQVRrcldSRHJlK003bVdoUjZ1eERH?=
 =?utf-8?B?RE91cVlzeUVvRENQUklVVnBNQVJrQ01MaGkrL3pkTDBwdVlSTExTelBOcGNv?=
 =?utf-8?B?VkwyVjA0ZnFzNithMUNIWXpjYjZLVVVwNlVSNUJjMTd0UHM2cjFkYjdneFd2?=
 =?utf-8?B?bDZjN2gyN2FYOUh2TzBsazRMdGZBcTRSNEtoVlgwOW5rdjVpU2d0UVNLRUJx?=
 =?utf-8?B?T0k5TW8yMzVTeTBDYk0vcmUrR1hvOThXWG1aN2xYQ2tRMlV4ODJwNXJEbjJh?=
 =?utf-8?B?UmU1eVNCaFJteHZIRzk3enVnU0pOa0FSOWN6L3Vlam5wN3JsY0taRWtZOW5Z?=
 =?utf-8?B?Nm12NlVOemJETkFVRDB2Rk9ZSUprUmd6TThya0I1SUZLTzVVeXdmdkFRUitk?=
 =?utf-8?B?eGhFMWxVYW94ai8zczV5OC85cG13cDUzRXM1MXpwSmJqMVQwcFc3clFaVlhD?=
 =?utf-8?B?aitXeDlmdnhuQVA5VXVnREYva3lCQmJsall2dHpkTUpVZEZwd3FMdDJWS3Fr?=
 =?utf-8?B?RVU0RmRGbUx5VHllbDQ4ek5sNGNZNzF2RWs1aDRrWGtPZ2tmMVVmQmw1b3A1?=
 =?utf-8?B?YllSRTU0aXdYenBVdThLbDdtOE9Remk1MGlOckhLTGE1SjV3Y08yZ1hCNzla?=
 =?utf-8?B?SzJXc0djWFZqcGdnOCtTNkg3cjRtcXAySEtSeC9pT1ZQdk9mM1dxbmVyZW5E?=
 =?utf-8?B?RWd6TWNwOWVNM211cmhub3NoOVo2MXlzRWdmcnU5OGRpLzEyOE8xOVQzeFZ2?=
 =?utf-8?B?UU1KODdWeUxERCtkaGt4OWl0bk1WN1d5ZDRtZ0x1ajdpWXk5OWlrVUo5OWtL?=
 =?utf-8?B?MGhqejlRVTBST2FKS05aN0ZyMjhFbmk4OXIvK2U0VTNZZWV6SmdaUHIxbGFB?=
 =?utf-8?B?U3NHM3IrQmpmSlh2S3B0NTd2UEwzNU5xZ0Z1d203TG4xQ05rLzFMU1g1Z1VD?=
 =?utf-8?B?bi9QYXlEZElvRUJoc1VwMUE2cngxT0tGZmljaXN1elhOQ2JiOC9yUGVnT0Va?=
 =?utf-8?B?UGJnWDNFMzZxb0U1MzVPZ0xHanJUTmh3Z285amI0bEZGRnVnd2huUlRKMXQz?=
 =?utf-8?B?SHlVZC9JM3VSSlFXNGgzdnB3QkEvV2hjclpFck52ZkdQLzdmZjJkdmg4dDVy?=
 =?utf-8?B?bzY0NWV5VXhyVEcrTU02Ri8vRE13QkhLUnBobFNmTXVxT2t5dys2VHZ4VFF6?=
 =?utf-8?B?Qnc4S0sxeXFLZlhwZVFFbzlBbzkyUmVvN1QyNjB6QmZBck9xNytDYkhEMW5x?=
 =?utf-8?B?ZmVyWngvRWE1K2lpcGhOMUVDNGh6aUFQQktXSS81U3NMQWRNdHoxQStuOU9x?=
 =?utf-8?B?ZWhjMTNWQm5PTGdlT3JoR3hQRnlPdTFSSjI3SE5vbytpdTBDVjVEVlRLZkRP?=
 =?utf-8?B?NUxOZzFpNnRNRXNWMDVZZFZLK1o5MW1sTnpHN1FrVENtcTBKQnpxdS9WWXV0?=
 =?utf-8?B?Smg4SWVSTXVrSjdQbjBiUjk0dnpwYUpoMklRNFJDc25VK3dIUmVoRjljWUUy?=
 =?utf-8?B?eVMxTnMwamVnTGZ3ZGxsKzFtbzNxS2Iyd1I0L09rbURMQitDSFgyUW1CTUpa?=
 =?utf-8?B?bzJZRHJ5c0FZZnF0MnBjQnhuUzBRVDRMNkM3Z003dDZyZUVlSld2ektaUnpC?=
 =?utf-8?B?QVkxMnlRWmk1QXVOZlZtam1kS244bVkzYmUzYUlwSURYdDQzRENxNGRRZHJR?=
 =?utf-8?B?NFpKZTlQM0FoWUNQMUdsanVBRkx3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 17:44:40.6529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a450726f-1f45-401e-178f-08de545dc2aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6492
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jan 2026 17:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19421



On 1/15/2026 11:40 AM, Denys Dmytriyenko wrote:
> On Thu, Jan 15, 2026 at 10:04:13AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The ti-vxe-vxd-driver (out of tree module) requires the VIDEOBUF2_DMA_SG
>> module to be built.  But the in layer defconfig is pruning several
>> options from the default defconfig that prevents us from easily turning
>> it back on.  This KERNEL_CONFIG_FRAGMENTS entry will turn on all of the
>> needed options to re-enable the VIDEOBUF2_DMA_SG setting.
>>
>> This might be a temporary fix as there is effort to move the
>> ti-vxe-vxd-driver back into the kernel tree which will clean up the
>> Kconfig mess that requires this fragment.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg           | 2 ++
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb      | 3 +++
>>   2 files changed, 5 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg
>> new file mode 100644
>> index 00000000..d7249909
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg
>> @@ -0,0 +1,2 @@
>> +CONFIG_VIDEOBUF2_DMA_SG=m
>> +CONFIG_ARCH_ROCKCHIP=y
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> index 169d8395..51a4f63f 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> @@ -36,4 +36,7 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
>>   module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>>   KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>>   
>> +SRC_URI:append:j721e = " file://j721e_vb2_dma_sg.cfg"
>> +KERNEL_CONFIG_FRAGMENTS:j721e += "${UNPACKDIR}/j721e_vb2_dma_sg.cfg"
> 
> Instead of mixing machine override and +=. it should also be :append:j721e
> here

Good call.


> 
>>   DEFAULT_PREFERENCE = "-1"
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


