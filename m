Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38E9CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 15:25:33 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20512.1762269925366904910
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 07:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TQYbj9BE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.68, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmIed7x/2OCDVUwjnYIxblY2eEdJjm/ZI3O/YCIQ/UT0YxfR508HQ39bY3eL58MAuDXnErRwsHpxnSaBbmRhU4/EbJBq5PzgOQOirp8bwVm4fiopYaRlqJnHK/abZLHZ0Hk3TKCJ7EQ9G4dVCE4JlnDP1Z2b1BVAwSXfl5OqmhhoMqCeAffmpmiHjYdKzgkfkgjqW1nqwvFPkz9kbjIHGt6IYX0NyhXqhL8f/jfit/5Mhlljh52pMMFx3fd+tlGZt5tqmiVWdG6yzNBk7yC3vJJgHje12KAEgctXb7bygNvV85m0joflqzTv4vZi7htEjb0YO+EBiMi1FigqmBq5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyAyOiER6pHML8WjaASDpfQesdJxvRIAKAVdfsVDenw=;
 b=PHFBspBr2a2Y6WydNzAC68EK0MXuaK1td0A05Ln67d17L5iPpLkQyQhlKpW7bwfRr2DlVcjKDP++6s3duCQyKBIzc6aDPI/9cYSsxv6G8AaOyf5E3yiQxilxHaGEXLFG3MKFIME2CaM5i3KeUJYPrikgV8CkLR+Xa8J+RD6+oL7ZguTn20qAvdVmnAoUhtbSLT6r7WX3tG0PzcVlmDjsiWehPIBHwIBDPdpr14ZinGQj2JlteNBDayaw0n90ZqpzcceObg6u3sDluc6YnnGDyFqiMNrEivmJ3HfjThQTFKkYwcSFYS817ySse45yNCkKROjEa108eMfi8BV+PUIfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyAyOiER6pHML8WjaASDpfQesdJxvRIAKAVdfsVDenw=;
 b=TQYbj9BE6wWKUC2oHGXfZbXGXCvV+JEf7J2bg1G1pgQBFS1IvbCwv7qht0W4NNtWIGfo4eaUcDJYrzLMfYpdo4adfpg83pDE8HJR9g+J+CleUil6WKwUdEcXl7kPCEfivxT/JRNpocjc/XST8lfxod1kA7O2zz0CParpT3Gd23E=
Received: from SA9P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::32)
 by CY5PR10MB6047.namprd10.prod.outlook.com (2603:10b6:930:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 15:25:22 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::a6) by SA9P221CA0027.outlook.office365.com
 (2603:10b6:806:25::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Tue, 4
 Nov 2025 15:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 15:25:22 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:25:20 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:25:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 09:25:19 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4FPJjk2163531;
	Tue, 4 Nov 2025 09:25:19 -0600
Message-ID: <ac556c03-abbf-4a50-a9e8-1fc91e9c0c6d@ti.com>
Date: Tue, 4 Nov 2025 09:25:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v2] meta-ti-bsp: optee: Add flags to
 enable RPMB and PKCS#11
To: <s-joshi@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
References: <20251104082759.711246-1-s-joshi@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251104082759.711246-1-s-joshi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CY5PR10MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 573763ad-03f6-433b-a61f-08de1bb65ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|34020700016|82310400026|4022899009|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWI4Y2hRTnJaYnhKdkt2ZzNrRDNraTFCTnNVdENoRkpTcWhCcGRweU5ndFhY?=
 =?utf-8?B?UkVxQ0dyQXRiZVZ0T1NLYUVtQVYvRjFhNlVBSkM5VE5VUWFhZXNlUm1tYTVQ?=
 =?utf-8?B?b2R6djRuNi9pKzRTK0NvWHk4V0FQS1NkOUxaTGRzWkpyaUhpbEs0cnpMMk02?=
 =?utf-8?B?eHAwODFzLzdDc3E3WTB6VlpYRWJCSWVYUG1pWmNRMXcrUEtiYldXU3NiYlFy?=
 =?utf-8?B?OExWTVJZdVVNV2thVlpTREVsRi9YcUJQVUt5cU5WbVZtK0QzOW8yakg5U0FK?=
 =?utf-8?B?TmxETzV0Z2xSaDFEUktLYlNnUXRJVHlsc1R0aHkwbktDajlBcmVSSjFSTjFW?=
 =?utf-8?B?ZUo3YkJoblRzT2FmNTcrVDZmRG05ZjZrSnJGcTMvalJQTzJOYlNJend1RTgx?=
 =?utf-8?B?cFRnOUhXb3JZcmRNcnJkMU9EeWpxTDlQOXYrcmVvc1JLVjlKS1d1SFhIbVF2?=
 =?utf-8?B?MitXV01sdGhoYW5VOXNHN2x3UVRZek9DYzRXeEVpa3ludkMxc0RjbFdOa0k1?=
 =?utf-8?B?SHBpWnQ2UmF4K3FtTSt1bElrOWlVbE0rZDZpN2JKNXY2U3BhL0lZZzlrakFT?=
 =?utf-8?B?Nm9Wbno3Z1ozajdnMWNGTnYzbmt1VFhsVy9Ud3BBTDlSNnUwd0VKNFB5VkhQ?=
 =?utf-8?B?QncrL01XWFJaNi9MSkNmTkxhNllZbjRuL3FmcUxiem1QZFJBaXBHaTFKaklp?=
 =?utf-8?B?RXRCSVVId1ZEZi90QTJnSUs0VkRFb284aENKc2dhRkJMenB4eWtnR0h1YUpX?=
 =?utf-8?B?Zjlab05ienNiTXM3R3VnSFBmMGVQSzhId0lRS1Mzc3h4OS93VzE5TmFxZm9N?=
 =?utf-8?B?bUl2NTJNTGJDaGd3R1JjVVJwZGdha3NxckhDdG12M2xmQ1NLQkRtbVplUW5j?=
 =?utf-8?B?ZllDZFJOczdodldjYjFlRlZmZkZBdFJGMDlmdE4xOGF1WHZPSjZrb0pZazRp?=
 =?utf-8?B?L1h3ZkRydUNNTGJPcW1IRzhqZUpxMjJYandicDNqWVYwcE5tbHJ3cTZLcmx4?=
 =?utf-8?B?WlJCU3UzVC9HaEtrUHZ1Mit4YlhPeUY2aThPVUtrWjdWUk4zd1d1QlZIeHBs?=
 =?utf-8?B?OGs0b0pGTFRSVjlkSTZRaTFZZm5RSFdTTWpNN3JURmZKekFGMjM3dDUyNmwx?=
 =?utf-8?B?SHFlMSt6eUdyTXhDazZSek9wRmRUU0Nsazg3UGhCM0hOS1o0WVNVeWdqU0JH?=
 =?utf-8?B?dm5IaDRrbnZWcWZTelRxU0NHRzRjS0podkFnWFB5Uk4vclZRUnpOWTdRTmpB?=
 =?utf-8?B?NytYTGMrVXBKNlJNU0FDRzBVMnc4MHZYTEtFTHVGdTJSa3Qvbk5uWHZQdG1k?=
 =?utf-8?B?Nm1waWs1bVl0MERBUlM1enh1MUkvQk5qRVJsdjFsUk41aS90N2FuQWREb1pp?=
 =?utf-8?B?cG9STmN5azQyZzcrWU1FOCtWY2t3dWNJWW5Dc2dQZTZqUlZ0K0hTUDBDZEJv?=
 =?utf-8?B?bnZMcm56VFVnR1d5dFlEaWw5RTcrQnMyd282QUZZQjdxYVZFM0Y3RG9zVGNH?=
 =?utf-8?B?bEo4VEFDZVM1anFhNnY5Wi9JRUVHY1FJZ2ExZmU0dTdSR0JhMnJBMHJ0QUF4?=
 =?utf-8?B?T3dFRCtzSXNoSzFMRjg3Mk5sUzVrU3k0OGwzdHYyaWdVYXAvdTZxWnRLMWVG?=
 =?utf-8?B?b1V1Uy9RbzUrQVBVSmxYUGJ0RmZCMjhwalVwR2VMeTBTOU41d0dhNUpncHg0?=
 =?utf-8?B?alRwZzl0dmdndDRpNG4zQUpvT1Y2TUVWemg5TWVLUUF1Qng1OTdwaUFLY0RB?=
 =?utf-8?B?d3ZvTm85akpFc0JZS1QrRGNPd3JxYTkrQzF4clozOXdZK3NLZzlLdjZxQXhQ?=
 =?utf-8?B?RTQrN3ZiN3NCWlIydStWakdab0I4RGFZM0hzQjVHZFpJelVCdlRRSWdjOXpy?=
 =?utf-8?B?OXJleS9aVkl0NVMwOE9vMUFRZ2xScGpDMVFpVDBXRUljMDIxVnlQcEJwYmlT?=
 =?utf-8?B?OS9oRTIva3BSUjF5bWFaQkxoMytSMGg5VUVzK1E4ZXhwZ1VpRnp2TDdST0tH?=
 =?utf-8?Q?iONJaY8nGjFKcggeaTHP8JYtcZpKjg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(82310400026)(4022899009)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:25:22.4032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573763ad-03f6-433b-a61f-08de1bb65ef7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 15:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19227



On 11/4/2025 2:27 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
> RPMB is a secure storage mechanism used to store data in a separate
> partition of compliant storage devices such as eMMC, NVME etc. It is
> provided by TEE's, including OP-TEE.
> 
> Add the following build options to optee_os:
>      * CFG_REE_FS=n -> disables the default REE_FS, this is so that
>        RPMB can be be demonstrated
>      * CFG_RPMB_FS=y -> enables the RPMB feature
>      * CFG_RPMB_WRITE_KEY=y -> generates and automatically writes the RPMB
>        key if not already written (see NOTE below).
>      * CFG_PKCS11_TA=y -> enables PKCS#11 API support in form of a
>        Trusted Application. This commit also copies this TA to the
>        relevant location.
> 
> In optee_client, do the following:
>      * Add RPMB_EMU=1 option. This is enabled by-default, but even so,
>        enable it explicitly. This option makes tee-supplicant emulate
>        RPMB instead of using the actual hardware. The actual hardware
>        should be used consciously since the key, once written, cannot be
>        re-programmed. But in the emulated flow, each reboot wipes the key
>        off, since the "emulated RPMB" is just a portion of primary
>        memory.
>      * Copy libckteec library files to relevant locations.
> 
> NOTE:
> 
> CFG_RPMB_WRITE_KEY=y sends the key in *plain text* to the normal Linux
> world. This might be OK in development environments, but it is a huge
> security risk in production! Therefore, this option must always be
> disabled in production images.
> 
> RPMB_EMU=1 emulates RPMB, instead of using the real one. With
> CFG_RPMB_WRITE_KEY=y, it also prevents the key from being written to the
> real device. This option, also, must be disabled (RPMB_EMU=0) in
> production environment.
> 
> Both of these options are enabled for the purposes of demo'ing RPMB
> examples only, but are unsuited for production.
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
> changes from v1:
> - move "FILES-${PN}*" lines from .bbappend to .inc
> - actually add RPMB_EMU=1 explicitly
> - give a more elaborate explanation of CFG_RPMB_WRITE_KEY and RPMB_EMU
> ---
>   .../optee/optee-client-ti-version.inc              |  3 +++
>   .../recipes-security/optee/optee-client_%.bbappend | 14 ++++++++++++++
>   .../optee/optee-os-ti-overrides.inc                | 10 ++++++----
>   3 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 289ca5b5..7e4505ff 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,5 @@
>   PV = "4.7.0+git"
>   SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
> +

> +FILES:${PN} += "${libdir}/libckteec.so.0 ${libdir}/libckteec.so.0.1 ${libdir}/libckteec.so.0.1.0"
> +FILES:${PN}-dev += "${libdir}/libckteec.so"

These changes should be in the new optee-client-ti-overrides.inc file
(see next comment).  The optee-client-ti-version.inc should just contain 
the needed information for changing the version.


> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index f193e78b..1727caa5 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -2,3 +2,17 @@ OPTEE_TI_VERSION = ""
>   OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>   
>   require ${OPTEE_TI_VERSION}
> +
> +EXTRA_OEMAKE:append:am62xx = " RPMB_EMU=1"
> +EXTRA_OEMAKE:append:am62px = " RPMB_EMU=1"
> +EXTRA_OEMAKE:append:am62ax = " RPMB_EMU=1"
> +EXTRA_OEMAKE:append:am62dx = " RPMB_EMU=1"
> +
> +do_install:append() {
> +   install -d ${D}${libdir}
> +
> +   install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
> +   ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0.1
> +   ln -v -sf libckteec.so.0.1 ${D}${libdir}/libckteec.so.0
> +   ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
> +}

I think you missed Denys' point.  There should be NOTHING in the 
bbappend file except for including two .inc files.  So all of the 
changes above need to move into a new optee-client-ti-overrides.inc 
file, and the correct include lines in the bbappend.  You can see the 
optee-os_%.bbappend for an example.

Also, are these files needed for ALL platforms, just k3, or just the 
four listed above?  Is this libckteec.so file related to the RPMB_EMU=1 
option, or does it exist in all situations?


> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a06..0b940e5c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -6,11 +6,11 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>   EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_TZDRAM_START='+ d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
>   
> -EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
>   EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
> +EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
>   EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
>   do_compile:append:k3() {
> @@ -49,6 +49,8 @@ do_install:append() {
>       install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
>       install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
>       install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
> +    install -d ${D}${nonarch_base_libdir}/optee_armtz
> +    install -m 644 ${B}/ta/pkcs11/fd02c9da-306c-48c7-a49c-bbd827ae86ee.ta ${D}${nonarch_base_libdir}/optee_armtz
>   }
>   
>   optee_deploy_legacyhs() {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19223): https://lists.yoctoproject.org/g/meta-ti/message/19223
> Mute This Topic: https://lists.yoctoproject.org/mt/116113939/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


