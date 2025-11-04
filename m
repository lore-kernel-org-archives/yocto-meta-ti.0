Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A666ECCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 18:18:23 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2714.1762280295304095049
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 10:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=I+zwtnXl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.48, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIavGgfFVBhGnfT3neu0rPo30flnwBK5u9IzjUBBiST2pElsq5G9Ztr0bmFJPlo9JMUbgAx0UyZ+DEIgzErLLzeOEIFcXgyhsMNBQCEPmlDEXaa0VxlUoXgQPrmMSxDaMzTx523mZfhTWSQDPB1W/J38YteZBOqyPmvIeLo84CZsMXbsIUmyLw2J6kz36ASpxShA2VGf7tAbWiBhJryeUp+ci2NacX9vQySSkkIXno8V+SA2nScZr+MN6A1HRpMVdWpN3rXg9UtO+O/E8kJXW6OsRQr8Zo5s9DJ8VldlqDpCcCDT3r+I1nMIswI/n/xbLvpaB8TBaO70iezNbud3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/eXqHTVoMOM4hL7h+cEPrdeKLMpmjO9pso6Hjlue64=;
 b=jPgUP1VDaIqWiN5nIUv7KexmlmSEtvpnJ0M+rSSiddpZMQQ99Z6aqvUswnQ7wpNlgWoLRYW5XydaJ6VByi0YJExzu5n5g/f8cQLgrOfOgON7U9Xt4fs2RAEE9iFqgOfPzGlgVbMXcjh4b9hHmHc4KWTifOGT1w2go77js19TJKBxnBDsi95rWn1aRGI6+53xIIA+He3olTmtstKPvncDLIv+41TSumqJaVBkhzd9paLTLgQbNrmF21vS/gmqFmB/FOKyvOCAt90TKahK3tj790n+95WwepI3fEjaDgtHzC/c9nPvKsOcWjfBBzdmcfL/2Ri7Xyn5BNA5PauX6a3ZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/eXqHTVoMOM4hL7h+cEPrdeKLMpmjO9pso6Hjlue64=;
 b=I+zwtnXlWKRYcwj00bAdzETaRhvTN4GYINGL+8DxYFbKjrjc1wXujxQDTlULMIpHBnMbZgYFhdFQtZZMIsv1qJYYqHjjasulJ5ezIEc1c/gA+/MoTLy1FT8wTaw2lumbU/YXqKiwbKyQmwmSQ7pINwFUUghdQ1b8/LsM8snGfwQ=
Received: from SJ0PR03CA0332.namprd03.prod.outlook.com (2603:10b6:a03:39c::7)
 by IA1PR10MB6025.namprd10.prod.outlook.com (2603:10b6:208:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 18:18:11 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::5) by SJ0PR03CA0332.outlook.office365.com
 (2603:10b6:a03:39c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 18:18:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 18:18:09 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 12:18:02 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 12:18:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 12:18:02 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4II2DL2349871;
	Tue, 4 Nov 2025 12:18:02 -0600
Message-ID: <8ad8d349-0841-497a-91a3-340ec08a3ea5@ti.com>
Date: Tue, 4 Nov 2025 12:18:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v2] meta-ti-bsp: optee: Add flags to
 enable RPMB and PKCS#11
To: <s-joshi@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
References: <20251104082759.711246-1-s-joshi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251104082759.711246-1-s-joshi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|IA1PR10MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: bee3652c-e4ce-4d51-e3ab-08de1bce8253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ry9lTGVNZ2xKbUs3Szl6MitKMHZ5c2Z5eExLVzNnaitqRm1nZmV2Tzdrc0tz?=
 =?utf-8?B?Wkt2NVBMeUJZWjdyRlZKRnpUYjdFNDZoeE1qZStKREpGbkJNTHhMZ2JhbVdl?=
 =?utf-8?B?RXUrSXk5K3YyS0RFWXROQmFXUm04aGw3eGVzeFFOT2E5L1B3eWl6TTNabVhx?=
 =?utf-8?B?TEZ4SVhJbm80TmFiMUtJTTRnZGlDRkc3ZUJDcWdnMGlMa1cycWk3cStxWEZ3?=
 =?utf-8?B?Tk4relhwVmR3aWhaZVMxZS8zRG9nS3JuME04WXNCMWFWMnl4cm05VTBWa1VH?=
 =?utf-8?B?NzlFVjZheGxoZTJHd2N0ME5LSWR1WDk3VThWYXdlNG56bDc3cHpsUU5RR01L?=
 =?utf-8?B?c0VYTjBUUzA2KzlDek56ajlIYlhDYzR3TUt0dTRUOCtqeFNYaGVyRnB1WXFM?=
 =?utf-8?B?UXdJMGN0S2xGVDJpSG9lNzYvdXhKaDN0bk1PK2RnQlVWMU43QkNqOVA3bTZW?=
 =?utf-8?B?bE0wQ1JjSUZ6bys4OHFrTzRaQUlBWlNpY2JsYkhRK3FORzVGMm02Tkh3amRj?=
 =?utf-8?B?aThhVmlIaGpIR0hnbkhFZzJsVm5qSklZQUEvTEVlRzJqMWhEUm55cDNZdi9o?=
 =?utf-8?B?L2EwU2s0K05MRi9MaDl3MVhTcFJERm1ETnhUVDdmMkF3aXQ4eFVDSG1xaDhv?=
 =?utf-8?B?L3gweEpPOUs1MjlObWdvRGxLYWt5MnZvaGNkY0hpWkJ4UjZZdVFsUldLK3VE?=
 =?utf-8?B?L09YeVNaQlRFUkI1R1lidUFYSzAwT2NDL1QvTzdHcXVORDV4MnpRRmQ5aHlM?=
 =?utf-8?B?Q1MxcmF4bjFtZE05d3FTTFp3a2hrVVcrZ0RWUkNxQ3B1VXRiOHVXL3VicUJR?=
 =?utf-8?B?ZEtaa24wNlVGQTRXRjgvQXJEMWp0ajR2UWtRcEtCMnpRWnkyQ0QxTVBZbnpi?=
 =?utf-8?B?TkI5b3g5QVdjdFdFOTJ2aEd5b1Y4TkFoUHNQWlJONFNWdlZGeEgzdEczMDZ6?=
 =?utf-8?B?U05nd2Y1SEJFWWZFWHRtc0JXYXNoQ1k2VnRHTWlBRmNudFdXZm0raDZXU0ZG?=
 =?utf-8?B?TXhZejEvUHdCZ0I4bWxaVWFabWEvek9ZS2V6MWw4VW94aFBvcW4wZmZuZ1ZN?=
 =?utf-8?B?NWNqUUw3S2hHK0c0RG1wS0xqSnY2WXoxN05scnVCdzBWNmlyc3V5L1JqODhJ?=
 =?utf-8?B?Q0ZITHN4NW9MQUc4YlhsRUNUNmVDckpkc00zQVRIRldzRmVGdEhSTHVZbjFL?=
 =?utf-8?B?cGVaZEd0Z0dIRUR1MzdmSmQ2MUNYTlNyOEswNDYyNFE5Y04wMXdxRkd5V09o?=
 =?utf-8?B?N3VnaW5SeGFCUS9wN1B6RHVMRVZDV0NXVXBickhLczVnZ3RGVHgwVlVqaURK?=
 =?utf-8?B?Sk5zWk5pWndYaFd1ZUc4MkdWUC92c29neWFycTZDRG9iSE4rTUpISVcvSGxU?=
 =?utf-8?B?c2hKWnQ1dExtMURvTGl6czRLZ3MzQnBWclpxNmMzTWliU2RuVHJRL29NNnJj?=
 =?utf-8?B?VmNtOEUxREVGVTcwZkVNdWFJWU5wWkNQa3pjeVk4MjgwMlp5L1BoOEswNDM5?=
 =?utf-8?B?UGF4bVNmMkE3ckw2eUJpRjdxWVJWSCtLZmhPNFNDK2lFZ284aTV4ZENkWW54?=
 =?utf-8?B?QUZ4Q2pxMXh5b01KNnNhZUR3c3NraDdJQmE2dUdIaUNRMW92NEJNajJ1a0Nn?=
 =?utf-8?B?ekd5Rzk5ak1pZ29VTUVneUkwVFRNTGN0dmRuKzlMSkpsK3EwajlZSGRacW5B?=
 =?utf-8?B?WnNmSEhuSE5BOXNFd1FITUpWd0JLcCtMK0srNUdkWUUrUW0rMDhYVjZBbE41?=
 =?utf-8?B?MFhiQnZtZUNBS1hNcUd1SnB3VVpLNGZYQXZJSitCSnFsY2ZVeFRiQ3VhS2hJ?=
 =?utf-8?B?V2lrakdpbzVVSWZjL2hGeHAzazkzcGh3U2NHYmMxNmpjak40L29SYmVlRHJX?=
 =?utf-8?B?SjdtdS9RZ1BpVkJsV0U1bGZiUDQ2RXFJMENwM2xUQ2phV21hTlZKdTQ5Mjha?=
 =?utf-8?B?YnZBNmIrMHJsZllwSkh0cTNlQzVnQXZibmJBTDRiR2svdXhhVDZDcjJOV2hG?=
 =?utf-8?Q?fIRc2cJJ+FgRWSzxcZZB7E7dlLrZt4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 18:18:09.6229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee3652c-e4ce-4d51-e3ab-08de1bce8253
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6025
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 18:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19228

On 11/4/25 2:27 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
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

Then NAK to having it enabled by default in meta-ti. No one is going
to read this commit message and images will go into production with
this enabled. If you want this for some demo, then write an app-note
explaining how to enable it for factory RPMB programming (or just
point out one of the many examples already in the OP-TEE docs).

Andrew

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
> Mute This Topic: https://lists.yoctoproject.org/mt/116113939/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


