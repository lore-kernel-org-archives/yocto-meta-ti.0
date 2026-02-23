Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8738AEC1126
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:28:44 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4341.1771878521880905197
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=SeQJ+pdp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.31, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caVtW5skBby9xu6I8QKEpLXOST2iBF6bnYTsG5oSjMA8pbtgOAYXMDIvpqHOEDZ402IatLDDo/xAdUg5/mCgBYXoCApv4CvZEX8yAwnDDqrSoHS/V6b0fgcnfPbHkvdiUC17ilh3d7JFnqk90D9Ql/svECypfeV/VXTI1SpwSotNhs6TfrLJPucDInZj+sjsCtYiEAnNvmV90KIXKJS5V9GfMETGzt37VTmK5T2pw3lL0kcuUadQMgrhyZijLzWF7LgmjDexUYshN9iUevSOgl3OeUhkf9UQYfek4SIpXGlwuGeOCbaYdVteQRrgyshm/XxNuTks4QHTQ1yssnraSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InpchypSczDKS8kFIySMxI0paOOppwQw4Zdjlyq3mc0=;
 b=XtYqIn0+c8u4suIvsOG7jFVQg0DBOPLvyURoSWbowFSWgI1w8GxjeiLOG1IsH51lpToJwobYu7gAlietPSkTVrPQt44VXA++JKaPvtnFV4QV5TOLmM8GOxa8cuW7rVNN0D/dZNycasuJgTW22qfQHl77oBhUFhdA4Y/vn43cCP8Df53Wy4iTGUOPCcgaziS1r3+Ms5QFqvu3ZsGCKkTfdmmLj6rFizcu4YIDLjFa6fG3ky4r2heFB4qfDydqVHJ3/47EkK3Cxc/tTDIcCCJ6B3KnPlNtycFIclKkEFhFlfkIYtNV3KtIlOrGKr9ohOO+QgmGtyo7y+SvLYRuy0ISMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InpchypSczDKS8kFIySMxI0paOOppwQw4Zdjlyq3mc0=;
 b=SeQJ+pdpY33gFKKlmKkX046hR2SldNdq2Uei1ChLs3kX8v1MTckfZM9zlX23iqFYDbfrDL3qvXgEWG1bFS2gfkqDB5uhJU+/MHuSLK3DMZP+K9DpOVAUVQAS8AqcUb3YKHyu4VlAbNs7yik7fscNm2BVY2JuSDvNrvKLpKeb+No=
Received: from BLAPR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:36e::27)
 by DM3PPF97BE3526C.namprd10.prod.outlook.com (2603:10b6:f:fc00::c38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 20:28:38 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::9b) by BLAPR05CA0022.outlook.office365.com
 (2603:10b6:208:36e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:28:38 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:28:37 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:28:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:28:37 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKSbKR1448779;
	Mon, 23 Feb 2026 14:28:37 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 14:28:37 -0600
Message-ID: <DGMMIHJIO6B3.EEJ13FC305KR@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1896F9D1C736BFA7.558139@lists.yoctoproject.org>
In-Reply-To: <1896F9D1C736BFA7.558139@lists.yoctoproject.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DM3PPF97BE3526C:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cce5ab-af32-4ec7-c3ce-08de731a2064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U05hM3dQSjQ1M3JHaWtrVW80Rk9NeTlRaG5IRU1CTDhvL1Z4WFh4RDB6bUph?=
 =?utf-8?B?QktvTTY3MG90S0tZS25QWFAwM3JZVXdMOEZrOWU3MHFTeldjb0NlR0tGSlNt?=
 =?utf-8?B?WklQMHoxblFMZzRvc3BaVmRiUldSbllCWVRINTF4NmpKR0xicWxMQlVoODhL?=
 =?utf-8?B?MW9XZkw0Mks0dmtlVWxtSjhOeUdvWVBiVE1pYlVNUmNsaldLcDdEZGp6ZkVR?=
 =?utf-8?B?eFRMc2dETGZ6WlV2Y1ZKNys2cXFlYlUzNWhkRHh1WUJDdDVZVHR2N0wvWEdP?=
 =?utf-8?B?a2NtWktnbnp1alR3b0lNN2JtSFdrSlZEcnpsNmUybGs2eUNicDhLZ1NON1NC?=
 =?utf-8?B?T2tKZHIwK1JRUjYzd3N4MzZBUDBhNVNhUHhKNkdjcCsxUk9DekU1RWs3aWU1?=
 =?utf-8?B?dURlQ3pEamxXRGpkcVI5WnZQcnpqZU1mY2t2TWt0ZFdHblNBWUxrVDBuQ3U0?=
 =?utf-8?B?WjdMVjk1MHUrVStpa0w5R2VUYVZndDU5dmRGUURYVlg4MGVPNi8wZnlOUXg4?=
 =?utf-8?B?MS9xUUhGblVldlNGbFdwbGplUGdOZmVZKzFSM28rTE0rVnUxU2ZGdk9ZZDEv?=
 =?utf-8?B?YmJMM2JaNHdHN2ZVNXRWNGJXemRpV1EwbVJLOU1LZW5ZVlZnSGhmeEQwL1Yz?=
 =?utf-8?B?dUlVRkxYd0NpY3U0Qi9SZlBxa0xtdE55NmJuNm1EU2xmemdubXVwMG83Uk9P?=
 =?utf-8?B?aFNZRUIzckNwWWVCb1hOL2ZSbTV0Q3Q0MFFqcXp5eE5Ed1F5aDdHdlJmS0RP?=
 =?utf-8?B?YWhWcmNwT3FpWEk0bENYTUlYZ0RuU0x5T2Y1UEJybnRkRG1ESVNwWVFmR21R?=
 =?utf-8?B?ZU11N2JENFpkZEZpUlF5T0FtalpNc3U1TG81dDRVa2FOanMyU0pvMytOOXlC?=
 =?utf-8?B?TG5pZ0Uwekd2T0NkRFE5SkRhYXI4L2RremZIZnBXQy90MnF0dmZlOEhQOVdL?=
 =?utf-8?B?NTVBeDlBclJtY2o2OTdBL0srZU0wbzcyYVdxVE5nWmQ2RXBPNXpJazRjbWw3?=
 =?utf-8?B?OS9ZeXVYMFp2RWNmbkFIa3UvNDZkbHYwOWFLMGxXVmRvYTY3YWVCdzl1clB4?=
 =?utf-8?B?OExRSkVlbVFBaTFMWm0zbkxRbDc3b1o3OHlvK3dLVHAvbVJ5WE5CRGM0dGMx?=
 =?utf-8?B?SG4yMGJQdXVKOVZWbGRocDdOMmdzSkFlUkR3M0s3QlFvWHBjVHVXenNPMmhE?=
 =?utf-8?B?Wk1LTVpUc09qOVhXdThKOVlTSTlTZWYwNEdtSGRnT2d0T0FCQkhselZEUUcw?=
 =?utf-8?B?THhZaVNEaTlMcWtYYzZmY1VTeGo0K25zWis2N0h2eTFsZkRGb2d2dXJMZEV0?=
 =?utf-8?B?SDcwUk5GRFFLV3BlV1laUGEwbzJWR09wVWpjZ21jb2RYTGJSeVB0UjFxZkJt?=
 =?utf-8?B?MzNGNUxKZVNOMUMzS1o5d0dETjBra05hR2ptdUlBQSswbU9lNWk1VnNoOEpD?=
 =?utf-8?B?alNBVXJFdDBEa21XY2RJeDZ3SW41dDcxTmE3YmlxQ1hHSHBwYUJuMTJrRW4w?=
 =?utf-8?B?bDNLQ0l4Q3NGZS9pODAzWC8rYVBvR1lNdy9hRzFNQWFRbk52RjB1MFJISU5K?=
 =?utf-8?B?eEhET3lWQkFDbXplL2RKT1FMUmlETmx2a2s0SlpsTEZ1U1lWbU5yK0xNL0I0?=
 =?utf-8?B?aUJaSy9vNnZFSmlXUHNWcnhicUtRdjdpelBCL0l6YXZnalhYaGJRVUNkdlhK?=
 =?utf-8?B?UmdmNExOUGN4T2FNZW9KZVB6WWdkbmhWRHF3N2tHMjE1MlEvYit0T0dYcEhT?=
 =?utf-8?B?V0s0ZDhHRjlFMGlQOVNldUIwZXdDYnNiaG92VlZtN1RzbWIzNTkyaFlXMTBC?=
 =?utf-8?B?R3A1eDQ2MHlUUzBWZVJUeUdxVlJpQVF4dnpaNXQzQ2lYbS8vSEVjazRJMWM4?=
 =?utf-8?B?RE1sWnFCaEdhdURKOXZNc3V5RkY0TW9NckpvN3crVFN3TDhNNHlFN08vUmQy?=
 =?utf-8?B?WXBiclNDUWNIK3NzUUxkclBNS01kUVRncDZEVkNIS0NnNW5SZy9yRm12L3Qv?=
 =?utf-8?B?R3c5UzZSRzVsS1NhdzZWdnBZQWZUSUE4dy9sRE84TUVzNUxXbWF6eG9xV1dm?=
 =?utf-8?B?NlBJZVRMOXVMTFBGbnBnZnpsTjVadG1OcVhPR3ZrT0w1OFd2WVE0VzFydHh2?=
 =?utf-8?B?dTdEYk4weFpvcUh0dHRNVmY3dFNPMU9TSzhESGJvMDJIYXpUb3B0RE40S3Jr?=
 =?utf-8?B?ZlVUcjFmZXB4QVNtT1RaaHh2Z2tNMHRhbTZWQXBJSXVTRGVTd2t6OXBXWVdO?=
 =?utf-8?B?UTFzZ3VmZVlZSmgweEZaWkxIMzVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2SdK60wZ1ly4iAWU11lMY9JvVdVzIfc7rsA3lW8zcyDnQtIQmP7iaaL1mq3WEMmr7+H1ffa3vSKg6LRBLHB4vkZHzqPHnC7/gbHBNhwK0zMXqAok6hGOUQ6ujLi9EnEiDoaQZ0qp6dScsxekhT4L9QRDoPbS038tJARGY6MOV0Yf1ECY1BL4RKm/XsTv3KuJQAZyy+HcqvQiibtz4qgz2lNnNYT6bB1QdQOBk3j0fJTZwxUK7amfhy8EiY9hesjVw7+g0pztKoCgu0Fp3vcqfEJy0jTVj0mp9QFgzgoUFA/zGu88jqQuXPahhBlH9g4J2qcKFShsI3E3CKSpqNPv0SSdHqciwAuiOxYAnfIM/C1yXtlErGmaloA9tj7tn1cYIIYvQWsM/pT5HQr63MHHZds4RvMcah6V97FMoQpEIkpBDgWpO6tgR47jPwB+auvF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:28:38.1838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cce5ab-af32-4ec7-c3ce-08de731a2064
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF97BE3526C
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:28:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19563

On Mon Feb 23, 2026 at 2:22 PM CST, Randolph Sapp via lists.yoctoproject.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Add a TI configuration for the BeagleY-AI development board.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |  7 +++++++
>  meta-ti-bsp/conf/machine/beagley-ai-ti.conf      | 16 ++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>  create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>
> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf b/meta-ti-b=
sp/conf/machine/beagley-ai-ti-k3r5.conf
> new file mode 100644
> index 00000000..88d0888b
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
> @@ -0,0 +1,7 @@
> +#@TYPE: Machine
> +#@NAME: BeagleY-AI (R5F)
> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf b/meta-ti-bsp/co=
nf/machine/beagley-ai-ti.conf
> new file mode 100644
> index 00000000..088cbd62
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
> @@ -0,0 +1,16 @@
> +#@TYPE: Machine
> +#@NAME: BeagleY-AI (A53)
> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
> +
> +require conf/machine/include/j722s.inc
> +
> +KERNEL_DEVICETREE_PREFIX =3D " \
> +    ti/k3-am67a \
> +    ti/k3-j722s \
> +"
> +
> +KERNEL_DEVICETREE =3D " \
> +    ti/k3-am67a-beagley-ai.dtb \
> +"
> +
> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"

This is just to get the ball moving. Boot tests were performed on k6.12 and
k6.18. There's still some issues with firmware loading and remoteproc, but
those are both known and shouldn't prevent us from starting to roll out som=
e
initial testing. Let me know if there are any missing overlays that we may =
need
that jump out right now. Otherwise we can add em later.

- Randolph

