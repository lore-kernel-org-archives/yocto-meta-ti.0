Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAF7CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 09:31:29 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16845.1762162282293731234
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 01:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=h0D2kYp8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.40, mailfrom: kamlesh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsIRgY93t1aJwV8j1Ai7Xti4FLoCU1/YMpeSSIUfkX9gvxdIB+w48iGR+q+kVGukaqSsm6yCqwMpox4RU6bguX82vQNUSGQEpyALpXd630nzWXFYYbAI7yFMY3k2E/pA1f+mpDp4XYMIW78YdLnFODPa1x+BedH/MoULFUpwJShSPavfFnEoDLUFcpiIF4SCFt9DVseFcSyrc3/GYU2KOdWUkG/s7LOmvuCzqegC0/S0eP/sB3JXvRFzJma09eKJWpbNJh4+bYWlA9SeJSbzCuMyX/yJh4QC2qihEZsUzFDtlW8XT1zTO8U1cojO4N2H33Tr2dplfmbCgPqCzOPgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ngw+ErEVGdwC5GTq32QNH6zdKPQKY1sZ7Eyv2cV+NKQ=;
 b=HmWTjEukxkO/TgLCpoi0dRVugaU1QcUhmMgV8XOLgzxoE8ikLrQfuAMuaEF6Cj4peGnTGfEgk0xXzOLgojQ36VAhQBBVfOAFfts8syaBmRp+DqfTfuFbiKdS7/wCwtYWRNErdTwmGLTZpmAnSLtpk4QqRiwSW1oYvo90Sx0+ENwDKnKC55lkKsmw42xVxDuU1fyyOte2vLhR7t2Gwq1EWbNaiU2g40UCdse+5rrGlZ9zdhdMsjB0LKDRNbHmAclchRBt9lk75RR1WmFCwXGTkNskAiIIbx9fXsPf53xkBz583Cy/NIeWV5dPMXwtqoUEYXqG6utde3UVqkOpuYFBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ngw+ErEVGdwC5GTq32QNH6zdKPQKY1sZ7Eyv2cV+NKQ=;
 b=h0D2kYp8I+sG4gtdUocc0bUGH5ers0/VNWHpm8RI5Yb+InvGO8lvggOAWr32o0SQ/H6cUTDGTmay2DcRKoQKWmGCXLvk9snDTmh2ClmIdxTjsmUgfKpzpyUAZAkOz7zBwmfZLU+e316nmLBn+ca5FIWpsVl7MGBiwD1YZ8XaQBQ=
Received: from CH2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:610:50::12)
 by SA1PR10MB7664.namprd10.prod.outlook.com (2603:10b6:806:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 09:31:18 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::31) by CH2PR16CA0002.outlook.office365.com
 (2603:10b6:610:50::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 09:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 09:31:17 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 03:31:14 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 03:31:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 3 Nov 2025 03:31:14 -0600
Received: from localhost (kamlesh.dhcp.ti.com [172.24.233.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A39VCF63876463;
	Mon, 3 Nov 2025 03:31:13 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Suhaas Joshi <s-joshi@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: optee: Add flags to
 enable RPMB and PKCS#11
In-Reply-To: <20251103053940.555954-1-s-joshi@ti.com>
References: <20251103053940.555954-1-s-joshi@ti.com>
Date: Mon, 3 Nov 2025 15:01:12 +0530
Message-ID: <87cy5z8ntr.fsf@kamlesh.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SA1PR10MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e72b5f6-6365-47e7-1cef-08de1abbbd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jv6oIln1FQY0XSre9PcNBapPVc26gkITrGqR3rXt9MIlCAOT+ENVbR7zEq2v?=
 =?us-ascii?Q?ar3x+qEki6hXyndvi35wRKhlPAzHR3ShoHFJ8CZW9Rk9VNDOrfiw1vchswUr?=
 =?us-ascii?Q?8Ja8o2Ziu2AxthXOiNaLPEXE/2Fxgov54F5X6a47RKahQmrNQ89y71yzz9lQ?=
 =?us-ascii?Q?8ZvWsNN6yhouIIiJfjNPmouDO1Ggqgi73hiVFmHf/WH8HIAVGHOTWoebEz+1?=
 =?us-ascii?Q?Nk6wfjsYIznT2IP1FDeBmypmvMpEoUV5VZl24QitC8ce/UovAy1bFZrWZ5Pk?=
 =?us-ascii?Q?Wxa0UoEFjRwX8sH3jHhgryQfsw/Pjmy8RXAbRNYNUF49N5fVxDcyNtBhBgCV?=
 =?us-ascii?Q?kxD+Ochc1rYtT2u4i1szw0IWxD/jdm7Bn3LrAO7Fq4R7sX2Zy8JNLx6EkL/k?=
 =?us-ascii?Q?w8wsvpAK1ovek0yWnMbH743t10wBxE4idReXe6fS7HsL5b7bMossMW+yio6u?=
 =?us-ascii?Q?RW6PwA8hBx9GtuqfL+L31BD/rpimzls8pqAabKutHZ9IJB95By+tebN1dQn3?=
 =?us-ascii?Q?8LIx53mnOuJ+cYIadPkKz/+eBwNPC6zuO7MLAbDkX+KWYi+yF7j9LXFkYElA?=
 =?us-ascii?Q?VAWCCyKS1seHVXg84MwA7uAAquqEf5uVUsfMUCNA8BDGpaC76L0F7WniXkzj?=
 =?us-ascii?Q?hE3YtDwGlzcozZlrLgljED9NE+N+eWNucoZaWOtJMjjHpCqTehQcV0yW0O5S?=
 =?us-ascii?Q?wU+fuqJV6Ka8yvB2JgsdMQflEaXvqAjKWY8/jRNDzSg6zQgJBtv03XX+EcZq?=
 =?us-ascii?Q?UA+GViWLr//Yp6Z/dSrjIOnvMR7S+oflHH/p/qOO2/Yot9Z49iqCBPG5q0yE?=
 =?us-ascii?Q?1GIP6p/Zirzc6BjC+i+Cn6a/KHpEhL8aBmSqh0C3YR0MX7lLWkfHhsvsxi93?=
 =?us-ascii?Q?2FNXDLM2Y9xv5QX++6kVAFwaBPzVRr7ouievRIpnxgJPA9rBl+iZ6P4UWIZO?=
 =?us-ascii?Q?wN1eLZVrIO/+h9MWlEfcUSQ4RPZ/p//kko7tFlZtWicpm82GccAfqaM/ZxMI?=
 =?us-ascii?Q?ElWmf3YoVN0lAu6+pG7VSbkHEnFdxGezGJH28Oku81L6rENnYXbLfVzTBml8?=
 =?us-ascii?Q?NLLONovxecLVORiEQnQ4y7KdxaKGDgpTD4ogw3mqVyJr0ndCbIGIFB7S4GGe?=
 =?us-ascii?Q?yO0rOVqXn978n18UUiPn3u4WisyI4SWybubN+QW2zTuAqa1j52KUphU76O+y?=
 =?us-ascii?Q?ML5q8nlz2z4X1aPi9MbzZlZFaswDSUpkpj7wwLC/zuv+qOPZl5qDNRdIWe7H?=
 =?us-ascii?Q?CNC6AoEY1KG4ORGFvOpOEVU82Qa6lPUFsnPf2ZVyW7V2UuGI3HLSKml0Rc+Y?=
 =?us-ascii?Q?N+L+tu8QBqglee0zMKUASFUB7HZj0Astd7vC4bdXHcaDC2DB43P9axC13DDd?=
 =?us-ascii?Q?3C3dcsLUNrosNhSQmuHGL5jZRqsEbdEVTW2Sq6R5D4Fc8ZJiYkUh4FZs/eti?=
 =?us-ascii?Q?ogGfTVWkS0Xps9BT2HJpJAunodJIX0Db1hbXfPKnVqTKYgtPpIoAH7BNKvDL?=
 =?us-ascii?Q?XQuTbFzCQgZdkrySVvL7o8qeNvfEM6av0x8K/NS8VqTkc1I130RSkzZXKFqs?=
 =?us-ascii?Q?ZseB5EJiH77rVP9E9eQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 09:31:17.2100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e72b5f6-6365-47e7-1cef-08de1abbbd76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7664
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Nov 2025 09:31:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19218

Suhaas Joshi <s-joshi@ti.com> writes:

> RPMB is a secure storage mechanism used to store data in a separate
> partition of compliant storage devices such as eMMC, NVME etc. It is
> provided by TEE's, including OP-TEE.
>
> Add the following build options to optee_os:
>     * CFG_REE_FS=n -> disables the default REE_FS, this is so that
>       RPMB can be be demonstrated
>     * CFG_RPMB_FS=y -> enables the RPMB feature
>     * CFG_RPMB_WRITE_KEY=y -> generates Auth Key during first access to
>       storage device. Note: This needs to be turned off for production
>       builds.
Add a note at the end, explaining that this will require two binaries for optee, the first
boot(or factory binary) which writes the binary and then the production
binary with this option =n. and RPMB_EMU=0 option combination for production.

>     * CFG_PKCS11_TA=y -> enables PKCS#11 API support in form of a
>       Trusted Application. This commit also copies this TA to the
>       relevant location.
>
> In optee_client, do the following:
>     * Add RPMB_EMU=1 option. This is enabled by-default, but even so,
>       enable it explicitly. This option makes tee-supplicant emulate
>       RPMB instead of using the actual hardware. The actual hardware
I guess you missed adding changes for this. Please add RPMB_EMU flag
explicitly.

>       should be used consciously since the key, once written, cannot be
>       re-programmed. But in the emulated flow, each reboot wipes the key
>       off, since the "emulated RPMB" is just a portion of primary
>       memory.
>     * Copy libckteec library files to relevant locations.
>
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
>  .../recipes-security/optee/optee-client_%.bbappend   | 12 ++++++++++++
>  .../recipes-security/optee/optee-os-ti-overrides.inc | 10 ++++++----
>  2 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index f193e78b..07db2955 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -2,3 +2,15 @@ OPTEE_TI_VERSION = ""
>  OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>  
>  require ${OPTEE_TI_VERSION}
> +
> +do_install:append() {
> +   install -d ${D}${libdir}
> +
> +   install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
> +   ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0.1
> +   ln -v -sf libckteec.so.0.1 ${D}${libdir}/libckteec.so.0
> +   ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
> +}
> +
> +FILES:${PN} += "${libdir}/libckteec.so.0 ${libdir}/libckteec.so.0.1 ${libdir}/libckteec.so.0.1.0"
> +FILES:${PN}-dev += "${libdir}/libckteec.so"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a06..0b940e5c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -6,11 +6,11 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>  EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>  EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_TZDRAM_START='+ d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
>  
> -EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
>  EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
> +EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
>  EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>  
>  do_compile:append:k3() {
> @@ -49,6 +49,8 @@ do_install:append() {
>      install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
>      install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
>      install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
> +    install -d ${D}${nonarch_base_libdir}/optee_armtz
> +    install -m 644 ${B}/ta/pkcs11/fd02c9da-306c-48c7-a49c-bbd827ae86ee.ta ${D}${nonarch_base_libdir}/optee_armtz
>  }
>  
>  optee_deploy_legacyhs() {
> -- 
> 2.34.1

