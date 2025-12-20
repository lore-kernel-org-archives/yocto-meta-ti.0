Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6736FE668B8
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 17:10:58 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42766.1766250649098782423
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 20 Dec 2025 09:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qhbP/n3K;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.25, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdyHk7bsJsSIHhGgTBheLO4hBi5yXz8bLWHHlzwtX90673SZRzLEdH71AR2Qz9LFNibby6KzVPCXI6Fe5yTnT4WXslVXD273h1YrH2fCIbTUKdqqemakluIfvsCzvh9Hcz9lvJQP6K+OSYKFKoG/qgdLSj3b83WpaTM+aSRsUEf+59SIEp8BF0clZhYHMKfaamPm56YHk+lJvm2zD2v921h8I6xPUwBD7/rHDL07VqXKmsqjDVAJlqH2+02uwyXbcgG4T4z26WInAC9kIxfWNuBlU5qJFvwdCPhmVtka7ax3NyDhzRnLKebXqU50Nwei1TuR+7MXqbhDh1xy9wiEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P1uYvjjnTPl1lD95LJBlQc0iuDe8cJ1klYsKyam2HE=;
 b=sakVD7KgZIENNuwdHWZWQhTBlDaXqLpe3X7tEtdyF5Y0M3cIe0BSllrU77MMMndkUR+u91Lge9Dnr38ai+ZVn5mrk4Ao017SKEiwGS2OpREToZYaj6iw3BkiV7ra9k0iT+V5U1V1DWdQCu3eE4V4GPXelHV31KgRP3dQau2HA21JjDR7+U6TdjHlvGoFReR+4njoiDjgv7zOE2jwPyNBEqcuZoC+LlNTMFowck0zjb6x+gY2/mkSYDXlNO8TZAPgZwnN35p1dknREukIUzokK4q8HIBp0l08gD+MDpAA2ohyWgDE0SFnqzEyUW6tQO4UAWv4teROJhWmn2h6OkV9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P1uYvjjnTPl1lD95LJBlQc0iuDe8cJ1klYsKyam2HE=;
 b=qhbP/n3KwbqxU5cykXe3fThTNOTFUXFuDSrJx0XOIwAi3+FV0KHA5n7ob4JzaiHVKPCI8h+bxRFKQZE6IsBKY0R+RpiOFZEGREivxViJA3kM5RcFl4EsKUh3R8WnaYu0o/35KQXXBETe7J+iRf6ey3N9FcR4JQp9afwSX3T2UME=
Received: from DS2PEPF00004566.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::508) by SJ5PPFA634C6E92.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7be) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 17:10:46 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:f:fc00::207) by DS2PEPF00004566.outlook.office365.com
 (2603:10b6:f:fc00::508) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.1 via Frontend Transport; Sat,
 20 Dec 2025 17:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Sat, 20 Dec 2025 17:10:45 +0000
Received: from DLEE114.ent.ti.com (157.170.170.25) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Sat, 20 Dec
 2025 11:10:43 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 20
 Dec 2025 11:10:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 20 Dec 2025 11:10:43 -0600
Received: from [10.249.41.140] ([10.249.41.140])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BKHAhjE2679176;
	Sat, 20 Dec 2025 11:10:43 -0600
Message-ID: <c0dadd48-6d6b-444f-8ff9-170919398571@ti.com>
Date: Sat, 20 Dec 2025 11:10:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH v2] trusted-firmware-a/optee-os: Add
 LPM support on few platforms
To: <Haixiao.Yan.CN@windriver.com>, <meta-ti@lists.yoctoproject.org>
References: <20251128184125.3220124-1-m-chawdhry@ti.com>
 <20251128185058.4131726-1-prc@list.ti.com>
 <281355.1766243294658107429@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <281355.1766243294658107429@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|SJ5PPFA634C6E92:EE_
X-MS-Office365-Filtering-Correlation-Id: 9596e0db-98ab-49f8-3dc7-08de3feab6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmZSbHI3UEhZdDhWT2JvSlhUenUyTGgzTlJJYUtwMm5pSnQ1NXBOaDlPTmxP?=
 =?utf-8?B?K2o2dDlmNlJGby9ERkVEUWFMVXRGQ3I4eUhGTHZWaFkwM0lMSVJoVldOU3Bh?=
 =?utf-8?B?ck4yM3dCTmRRVTJudkpmci9oRTlLMUlRZHlhc2xtZklqeGhkbHExM3FSZlpO?=
 =?utf-8?B?VkR3NVZENzJyNU9qaXlUdDlnaUhlT1h5aWJOV0tqcVU5eEJBOTRHTkIwa1g0?=
 =?utf-8?B?V2xrSFR6b2VMdVA4aFZodnJGVHpLbW94anVwTlB3ZXFMMHZjMHB0WlZUWEQ2?=
 =?utf-8?B?QWFLTVlWeGxJUjE1TVd0aG1pR3VleHVBeDZCL3VUTVdQV1dhOE1kNEpqcXQ2?=
 =?utf-8?B?Vmkya0I0R0w1Y08vUnlSN2RDbi9LNkNhaDBQazhFWVRncXdOT1hsK1ZiUVR6?=
 =?utf-8?B?bk9QVWxia3JzcmMvVmhieFQrVDIvbEZJeW9LVnNPRzJjeTdVajhUUWNEQmwr?=
 =?utf-8?B?QjVXQjNDNE1oemtTWGpvSHZ6NVN3a3Q2cWwxV2xHZm9pRkwydzZLcGZmS3Bz?=
 =?utf-8?B?anVibnFERWplclFqRUQ5YXc0eXh1ZG9IUkVRYWFKd3VOa0h4VFlUc0FJTFN5?=
 =?utf-8?B?c1lXTUp1TXhRQnhuVjhVbEtlL09ydXdDQmRIbFhNOHVERW5KWHl2bjJ6WW43?=
 =?utf-8?B?akl6T3pUNTUwbEx0cEVneHhnVWdrU1JtZk9nMXN1KzZRYjd0azBLYmt2TTFX?=
 =?utf-8?B?dXBBRmd0djA3VGgzdVcwQjkzTHJIOUtHbkRoV2xrN3dJaWNiRk4wVTluZ2Vv?=
 =?utf-8?B?bFFuUWEwQzVCb0IrbU1Ualoyd2NvMW4vU3k5TzNMWnVmV25xWVQ0dUUyK1VB?=
 =?utf-8?B?KzlxZ09DcTZlM0VlZGhuRDlkT284aFpITmloK2UwZVhqOGZMbGRoVk9SUzlT?=
 =?utf-8?B?SzRPNW9aMGs3ZGpKM29mVkcrRXVlNGFFZkJ0cHMydzlwbTBYLzJmQ29XazFl?=
 =?utf-8?B?cWpHMWVJUnJLSEdZVkwvMldORlNuVFZyaDkyS3ltb1NKbWM3SHp5cFpZMmFn?=
 =?utf-8?B?cEtFQWJ6QjA2RkQ5TW9QMkpFbnlxSjljdUdlYWxDOHZ1WDkvUEZhOWE1ZWUz?=
 =?utf-8?B?cHNIS2pSdHdEcmtPempCVk5uM01mWFRtNW1nNU4vbDN5dFpXZjNmSlZ0aVdN?=
 =?utf-8?B?SjlpTmtSSFdHdEhvZnR3azBraGhaQ1o4NHM5UHFTSGNvQnJEWVhNMi90eTJx?=
 =?utf-8?B?bHYrc3BnQnREL0dlcUJIeTRoeFZVN0pOMzkrOUpVSzk0Z0x3eVgraXJLRXkx?=
 =?utf-8?B?U3JzRVRKa1BXeXk2ZzZZemZjY2xCRDMwT21SKzl2K3E1S3pVZFBJbzJ3SkZp?=
 =?utf-8?B?b1FCYUtMSm1LN0lvaDIrYlRIVU1nY0JpdERHUUNsc3B3SFowdllQeWlMOEo5?=
 =?utf-8?B?MDVkRjNjY1loYzJaSUhIUW9sVVVMWUUrWkk2OFgycjArTXczRUVWcERIb2xC?=
 =?utf-8?B?aTdvdXc3eGlhUFB6TWVGcTBXMkFJdjRUNDl2em44SkF3am1tRk1sYStvWmM0?=
 =?utf-8?B?UDFZeGtWN2p5aXZRWnpMazNzQXoyQ1pub0RiZ3BFNWdRUGN0eTBjR0tvK056?=
 =?utf-8?B?QS93ak9weVZQZERERk4rNVhFN0tPem5rWnVpQUY5TG95eU5QM0t0WWJKZDVH?=
 =?utf-8?B?TmhYZ05iNlUyZ3NyeUdzSER0SkxpaGJqSGVwTlY0R3N0QWcra2s5amlFejdH?=
 =?utf-8?B?U1o2c1I2Q1k2endYWXFQZlBwRWtQaFV2OUVpUWQzOUF0aU1uajAybzVrMXQ2?=
 =?utf-8?B?T09MMFZvWUVISjJoa1cyOXoyUE1rV3h4WnBwYXVTTS9zYW4yWTYwd2oyRHZz?=
 =?utf-8?B?ejI4ZmNLQ2srWXRXbkVXRitsNHNKVzJrQVZweGV4cUFOSVNNbVYyeWYwL2lX?=
 =?utf-8?B?UGlTUnpmUklTaEh1S01FaHJqSGdNRVQydWEyYjkydjF2NU5ibEFCdzBSVFNN?=
 =?utf-8?B?eTNiUFpwbHIzYmFyQ3oxdE5TZm13K0Q5QkI0bitjbG1WNEtIa1pnelRZSzNj?=
 =?utf-8?B?TFdiYlRCeWRnV0NGQXNieFN1VFduOGUyZm5KM01hLzNNczVzK2ZuY0l4UnQy?=
 =?utf-8?B?NGh3RUVXRnRiV0lJTzlzSjl5NU9MRFl3QlVkM3dZQlZGYXFEczhWMFg3bjUx?=
 =?utf-8?Q?CHgw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 17:10:45.1411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9596e0db-98ab-49f8-3dc7-08de3feab6a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA634C6E92
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Dec 2025 17:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19385



On 12/20/2025 9:08 AM, Yan, Haixiao (CN) via lists.yoctoproject.org wrote:
> This patch failed to apply on scarthgap.
> the version of trusted-firmware-a is 2.10.4, the patch is not suitable for this version.

The recipe in meta-ti-bsp that applies this patch, also moves the 
version to 2.13+.  So I'm not sure how you are trying to apply this 
patch to meta-ti scarthgap against a 2.10 trusted-firmware-a version.

Clearly you are trying to do something more than taking meta-ti-bsp 
scarthgap at face value.  Do you have your own layer in your build that 
is also changing the SRCREV of trusted-firmware-a to a version that 
might not accept these patches?


> NOTE: Applying patch '0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch' (../layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch)
> NOTE: Applying patch '0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch' (../layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch)
> ERROR: Applying patch '0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch' on target directory '/build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/trusted-firmware-a/2.10+git/git'
> CmdError('quilt --quiltrc /build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/trusted-firmware-a/2.10+git/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
> can't find file to patch at input line 39
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |From c79ff3679a4360bb848b01d4036c365533fcf791 Mon Sep 17 00:00:00 2001
> |From: Richard Genoud <richard.genoud@bootlin.com>
> |Date: Tue, 11 Feb 2025 18:20:17 +0100
> |Subject: [PATCH 2/3] feat(ti): add message to encrypt tfa during suspend
> |
> |At suspend, BL31 with its context will be encrypted by TIFS in DDR.
> |Encryption is needed for security matters, so that the BL31 is not
> |modified before entering suspend or early at resume.
> |
> |We only need the encryption function here because the decryption message
> |will be send by the R5 SPL at resume.
> |
> |Also introduce the LPM_ENCRYPT_IMAGE cap signals that FW has the support
> |to encrypt the image using the TISCI_MSG_LPM_ENCRYPT tisci message.
> |
> |This is useful in suspend to ram cases where we would like to
> |store the encrypted image of a secure fw instead of the original image
> |itself in the DDR.
> |
> |Check for LPM_ENCRYPT_IMAGE flag in the FW capabilities, and only then
> |call encrypt.
> |
> |Upstream-Status: Pending
> |
> |Change-Id: I266472da87dd0821493019b2d9853f8886f33811
> |Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> |Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> |---
> | drivers/ti/ti_sci/ti_sci.c          | 36 +++++++++++++++++++++++++++++
> | drivers/ti/ti_sci/ti_sci.h          |  7 ++++++
> | drivers/ti/ti_sci/ti_sci_protocol.h | 32 +++++++++++++++++++++++++
> | plat/ti/k3/common/k3_psci.c         | 10 ++++++++
> | 4 files changed, 85 insertions(+)
> |
> |diff --git a/drivers/ti/ti_sci/ti_sci.c b/drivers/ti/ti_sci/ti_sci.c
> |index f0813e5b0..ee5f7166f 100644
> |--- a/drivers/ti/ti_sci/ti_sci.c
> |+++ b/drivers/ti/ti_sci/ti_sci.c
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> can't find file to patch at input line 83
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/drivers/ti/ti_sci/ti_sci.h b/drivers/ti/ti_sci/ti_sci.h
> |index 1f1963274..2afa11317 100644
> |--- a/drivers/ti/ti_sci/ti_sci.h
> |+++ b/drivers/ti/ti_sci/ti_sci.h
> --------------------------
> No file to patch.  Skipping patch.
> 2 out of 2 hunks ignored
> can't find file to patch at input line 107
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h b/drivers/ti/ti_sci/ti_sci_protocol.h
> |index bdd24622a..a165cda99 100644
> |--- a/drivers/ti/ti_sci/ti_sci_protocol.h
> |+++ b/drivers/ti/ti_sci/ti_sci_protocol.h
> --------------------------
> No file to patch.  Skipping patch.
> 3 out of 3 hunks ignored
> patching file plat/ti/k3/common/k3_psci.c
> Hunk #2 succeeded at 269 with fuzz 1 (offset -14 lines).
> Hunk #3 succeeded at 321 (offset -32 lines).
> Patch 0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch does not apply (enforce with -f)

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

