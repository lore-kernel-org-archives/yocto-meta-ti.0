Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE8D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 16:07:21 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19426.1764346034170756597
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 08:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VI61lEBF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.1, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy+UqhF2frxL+mm0gAhuR4C2itdIhMHhKGXjgZzgwjwYFwf7JHiSd5+c0hJ+oKTuEJT2byNNNONRV9E7O4IRG7Fwoc96udLZjNeu8OCzE/Kbe1ljIef/zjo89JBtJvVfhLVAhr9ZaXbFdJkj0kUpAIjzGdDiX9ZHtQkOMwoO48V9exrFDPCAoIydLqV8xCQj/4HeequoK1SRlrlNuh8cf+X9Xofk4lcnydfEwLuu3OuP3M3peMeOrzPgGMv1hzUtPm/r7Dc5zfX/zsxy+wRwdk2IKx451dbDZ+qxSpmgMVHDgMW2jHLZvNo/T9bbyEFb0Z6SZmRoykfWLbnHGUR2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+ehnN7BMXP2h+9JY9q8HXHp5S8hh4WsMuGyb/cioBY=;
 b=lGERqAUhxpsSx0ESchz80SdxCJPyA1lXj3F6PCw6dRzBnnIrrxTxPSdmgtbQq2k492f5UZjf2im7RwzSOxiKdeii/kNio5nkrR/3i+0Ntu6Y7ZRRIuw5s8tjBvMdJugAi1zFErwUH+MI6uzEXXXDKGGsMzC0S3H5ewvp/0aSIa3R3o/QIwv1nX2pJuLSY9ugnzE2Mv1pGXJyqQplpkvE87GMM6aC5xiBp0DiHeyJgN6z4jPaE4hg9duMyHekZHC37RmOF6uiJONGv1zu5J5xJBNc5Cgh4fd4q31FiU3lXpblOKeLOGl9ojRfn0QUJLIOYYidx12Qp833SVFk14JGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+ehnN7BMXP2h+9JY9q8HXHp5S8hh4WsMuGyb/cioBY=;
 b=VI61lEBF1/rU6+r27Us+3mRn8YYaYUjCZwhJXipidJVymz+h90yR6an1iI+2cs9l8fElhkzIUqHVowsGm/DWdZy1HyM0DP9kBzr8HQhtUvUgKLxs4r8WmG3NnR7Epp0icOYPpg2quhIjHJsUnt6HS2FdD21ZrP1K1E1D3fBta5s=
Received: from CH0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:610:b0::34)
 by CH0PR10MB4921.namprd10.prod.outlook.com (2603:10b6:610:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 16:07:12 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::db) by CH0PR03CA0029.outlook.office365.com
 (2603:10b6:610:b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Fri,
 28 Nov 2025 16:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 28 Nov 2025 16:07:10 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 10:07:08 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 10:07:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 28 Nov 2025 10:07:08 -0600
Received: from [10.249.36.112] ([10.249.36.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ASG78FA555133;
	Fri, 28 Nov 2025 10:07:08 -0600
Message-ID: <32a00152-67ab-45ec-b684-f8291fd6d740@ti.com>
Date: Fri, 28 Nov 2025 10:07:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp:
 trusted-firmware-a/optee-os: Add LPM support on few platforms
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, "Hari
 Prasath Gujulan Elango" <gehariprasath@ti.com>
References: <20251128085314.2671804-1-m-chawdhry@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251128085314.2671804-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|CH0PR10MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7fc7f4-27b0-4a36-5d63-08de2e982fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUdHNWRXMUQrZlZHQjZQVXEzSjJ4M0Z4Slh6a0RiQXBiUlgybWxWN0RJSC9v?=
 =?utf-8?B?SG5ZN3VJbGdzK0Z3UG1EbDJJSjJoWFNKVVRibThJNW9UYkkxSXZ3Vk1mY2dq?=
 =?utf-8?B?eVVaSGJFbDdHQlNpVi9ZL1oxQk1PZEVPdVNRVjBQVjBZYmNsK3NYempmM0Zp?=
 =?utf-8?B?NlY4OEFMYVdXNHJFME5tTWpwQlllSUJEaDZVamVtYmRVZWJLZGFWN3RaMm5n?=
 =?utf-8?B?QjdRMHdnMmpJQmYyb1N2cFVTOVUwdzhUT3JNTU1NZVdiNkFPcnhZTWd4R2Zq?=
 =?utf-8?B?SmJWZzRzSllrWWdrR3FKaFVIUXBaQmRnSEVsZUdTeFZkQmw5eDl2UkRFci9Q?=
 =?utf-8?B?NW5rKzc2clN6SzRXUVVEaVZpUFZKQi9pRFExdG15cTFCUkU1QXJlRWcvT0lS?=
 =?utf-8?B?cG84UlhUNjJjTHFKdUpvTXgwR0pCTGxqejdmOHp2cFBsZjRrWVROdFJ4c2Z0?=
 =?utf-8?B?aDE1L0dmbURvK0svNXQvVFE2Qzh6VEZ5L0d5bXFNYi9RcWIxbkJsQTNKcWpL?=
 =?utf-8?B?UitSZ0ZUaG1oOFVLM0lPSC9ldW15QjV6QTg1TlVwdG82V3VYekl3bm9yREdn?=
 =?utf-8?B?VzZqMy9Pbk9GTEswQzlSZjEzRE9TZlc0bjRqTm5Fc3lGUzRtbU80eWNsZ2wx?=
 =?utf-8?B?Z3VEYWlJMzZrTFRmRkc5V04wQ2RxYzVUZWZMUWpGYmdLYjVPU0VyQ2QrTUhQ?=
 =?utf-8?B?Z253S3I2MEx6M3dsNkgrQWVSMTBOU1dKZE9MTGJvZjNya2cxUXdxZTJJL2JT?=
 =?utf-8?B?YjNnNlpIZjVLaHZFcmo3N0FPSk9JRjZ0bDN3eVJqZ3BHR3R6eGdVcGJoRmFJ?=
 =?utf-8?B?ZFRxWXJTTXk1eDFmNHhGbkhHN1NBT1BkL1RzVnhPMjBzUTVwTFRFOHNzcWJG?=
 =?utf-8?B?Mkh6SjQyMkY3VThaUldJdWFLQjIrTTloYnN5RzAzQ2JLQWJ5RVFTdmZOcnpV?=
 =?utf-8?B?K1g1eTdhQUJDT29vUTczUUt6d1RFZzRsV0N4SCtRdFNYb3JNZmgvOFVLcGpR?=
 =?utf-8?B?SlJheDhxRG5KTlA1eUdSaERQZXU0MU45SS81YVBhWXczSHREVUZ5MVYrQUJW?=
 =?utf-8?B?ZkttMzF2RVE2VVpDa0w3UjhrWHRUZEtTTDlrL3VCWm9BV2tsemxST0hINCtw?=
 =?utf-8?B?ak9POFRxWmlnRWNLNWVxZGxtVmo1U3N5NTdnbFE1Rml1dDNGSmE0Qi8rdEJl?=
 =?utf-8?B?Nm9SRi8yWjFmTFRlZmxVbmdHZFQ3NE5reXBtcnpKQ2NJcmJGVXpVbWJFTkM3?=
 =?utf-8?B?NGJ1bmFyTTlpRTdzZVpOY3NJWm9zSXRWWkdaYnNmUERtUzhrcWxKUFpmd1lO?=
 =?utf-8?B?U2FPWnA3eWY2UUVjazc2ejlHS3RtMk10VmJUaUJSSXFGa3BxN2FRSnlDU0pT?=
 =?utf-8?B?S0dsUzBycVlGUkhYRG5GTlRWZWlQaDljUXNpczZzRm5NeE1pb3JQNDFPNjJQ?=
 =?utf-8?B?LytEYzdoS0FPOFgwUHdnd1BKYVVZOTliUEFOTEc0Rzk0UDB1VnlCWFlSeCt6?=
 =?utf-8?B?N2t4UXZYZ3cwQXJxOC9ZQ2J2cEF0NUo3bG0vTU1YSitUbjFyVTRyNXVCbGtJ?=
 =?utf-8?B?N0dLanJpMXdVTGdyQzdrZ2FJeUN1RmlsM1ZtRFBhK3NPeGY5M2xnaTcySzlU?=
 =?utf-8?B?STlRbzdOVWVCUDgxczJiKzZmazZ3NlFXdDlZSTd6VktaRlYyb3BDZSttUXRQ?=
 =?utf-8?B?NmJCeU9tQlVuZDhEVzlJWlF6RXdLczZSS3poL3dOazlTbmVWeXc1ZnMxdFli?=
 =?utf-8?B?TnMvRjFSU0dZZXJQVE1EaHJpMWhFb3hDS1dTbmE5czViaG8rdHNOd0VmK3lt?=
 =?utf-8?B?akx4Q3FiQW1CY282M3VLSUwzWS9sOVhWaVFnTmt6TThxS0RNdktvYm1tcGJl?=
 =?utf-8?B?MWhOZzgzcFQ0MWJuL01hWGVEdFJTNDRtVy9kRStYckZxb1d2emZyVXJ1eTNM?=
 =?utf-8?B?OE5pQXFtdTBGaFV4QVJXUWcvVVNCYlFIZ25XaU1JTHpDa0d0OWY2aW5ETEtn?=
 =?utf-8?B?RTNzWXdyaDlpd1lnWXZVQk41eUJwNWo5eXBuQ3hyeTduaWViZ1IzYmltOVpM?=
 =?utf-8?B?VVpBbDRKbnFJSVc3bnhWSjhwM0c3bVJKUUF4dUhDenFvNjFLUk5UQUVEak1X?=
 =?utf-8?Q?vlVw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:07:10.3966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7fc7f4-27b0-4a36-5d63-08de2e982fc6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4921
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Nov 2025 16:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19305


Please stop including (and remove) the meta-ti-bsp: from the subject. 
It needlessly increases the verbosity of the commit message.


On 11/28/2025 2:53 AM, Manorit Chawdhry wrote:
> Adds the required TF-A and OP-TEE patches to enable LPM support on
> J7200, J784s4, J742s2.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   .../trusted-firmware-a-ti.inc                 |  20 ++
>   ...luster_start_id-depending-on-the-soc.patch | 116 +++++++++++
>   ...essage-to-encrypt-tfa-during-suspend.patch | 195 ++++++++++++++++++
>   ...uspend-in-case-of-LPM_BOARDCFG_MANAG.patch |  69 +++++++
>   .../optee/optee-os-ti-overrides.inc           |  14 ++
>   ...Open-TRNG-firewall-for-TIFS-on-all-k.patch |  46 +++++
>   6 files changed, 460 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch
>   create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
>   create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch
>   create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index f188f35ee740..6058c000e865 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,5 +1,7 @@
>   # NOTE: This .inc file with customizations only gets included for K3 platforms
>   
> +FILESEXTRAPATHS:prepend := "${THISDIR}/trusted-firmware-a:"
> +
>   PV = "2.13+git"
>   
>   LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
> @@ -28,3 +30,21 @@ EXTRA_OEMAKE += "${@ 'BL32_BASE=' + d.getVar('TFA_K3_BL32_BASE') if d.getVar('TF
>   EXTRA_OEMAKE += "${@ 'PRELOADED_BL33_BASE=' + d.getVar('TFA_K3_PRELOADED_BL33') if d.getVar('TFA_K3_PRELOADED_BL33') else ''}"
>   EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>   EXTRA_OEMAKE:append:ti-falcon = " PRELOADED_BL33_BASE=0x82000000 K3_HW_CONFIG_BASE=0x88000000"
> +
> +SRC_URI:append:j7200 = " \
> +    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch \
> +    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
> +    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch \
> +"
> +
> +SRC_URI:append:j742s2 = " \
> +    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch \
> +    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
> +    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch \
> +"
> +
> +SRC_URI:append:j784s4 = " \
> +    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch \
> +    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
> +    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch \
> +"

I don't like seeing the same big lists repeated over and over.  I'd 
prefer if you created a new variable and then used that to set the 
SRC_URI for the three platforms:

JACINTO_LPM_PATCHES = "\
 
file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch \
     file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
 
file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch \
"

SRC_URI:append:j7200 = " ${JACINTO_LPM_PATCHES}"
SRC_URI:append:j742s2 = " ${JACINTO_LPM_PATCHES}"
SRC_URI:append:j784s4 = " ${JACINTO_LPM_PATCHES}"

Feel free to pick a different variable name of course, just something 
unique and descriptive.



> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a069886..52aad8a72599 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -1,6 +1,8 @@
>   # Use TI SECDEV for signing
>   inherit ti-secdev
>   
> +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> +
>   EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>   
>   EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
> @@ -76,3 +78,15 @@ RDEPENDS:${PN} += "${PN}-ta"
>   
>   # This is needed for bl32.elf
>   INSANE_SKIP:${PN}:append:k3 = " textrel"
> +
> +SRC_URI:append:j7200 = " \
> +    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch \
> +"
> +
> +SRC_URI:append:j784s4 = " \
> +    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch \
> +"
> +
> +SRC_URI:append:j742s2 = " \
> +    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch \
> +"

Same thing here, please.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

