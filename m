Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662ADD43359
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 21:54:43 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2082.1765490078010819869
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 13:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hXsJoumt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.36, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HU2/VCQ2dbruCehab53KJ0XhCO+dIDS+S+b+qIlRaI5Of64hqfy6c0GhHH42mD8t53dEauK3HwDB4Hdez2WHvguG+VoenDxO93qEQ68M0eU6+iHHOHQnE4rCH4CkMOdXpX4oxMqY8CGj73dshfRhfHvp+dy/1ojsgDLA4i0UroOrJFho8LNHjXK6SWyT8+y/tInMR7RZTG+8wWZ9V4twnJtIzOHfj/vDBraJncRcVotjbnjZTeH5Du+/lhiBOpWXGKn9ZE9zD5M8ZNltdtxib4WSf7+B8CTopag/1axh+W9nmP4QUB7HLef3q6vFFltUwzempGlYEdICIiUu5WHQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa+civYhCDesNjIggUCiTFxWpC8RhJTDmTdkFajWfRM=;
 b=GnTSqJfBj3uaSi/pq2OJ+tPNvVt4CbAQoHiw34FCEm1JO6V4FJEQzXjtbxhArGoDi2cpvsF2tot3qzUjys+9UzVYQ3gExCBdklUaXcSRzRrpd7bTusB0yp3W78fZbZ7I30iYQ0r2e3Qh2bS4cpKLwOumtkggPd4v8/gTiCPpCBdX/MTIBhleWoLaaC9eQm/dOTL4Fso+hcmyMVtQPrxzunBz+HtJh051BnZfyFdaJT696VQAxdfaRa64aWxd7xdArYUSFRcR/l/jRwprEZrOkMTnr7kO8zoafxx/pku7TsWCeIcCSt2z0H0WWZhXzjcVtr9Eb+MnBwpADiS99cOmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa+civYhCDesNjIggUCiTFxWpC8RhJTDmTdkFajWfRM=;
 b=hXsJoumthjjps/Pk+GaTkJvWjYRzAx7pT/ICOMvsR99cqXM3XaGzb8DrIDeCQ/QP/el6NTjrNANw9c138qMSZ9OL7TD+c1vs4l0MQGWu7DcaL/3y/fwwnoMTcdvUPYwq7yYrBHVgRTodPLS/0fB1ifhvXdbcaAmAlwxhhs1SRRM=
Received: from CH0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:610:75::25)
 by PH5PR10MB997735.namprd10.prod.outlook.com (2603:10b6:510:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 21:54:35 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::2c) by CH0PR04CA0110.outlook.office365.com
 (2603:10b6:610:75::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 21:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 21:54:34 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 15:54:30 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 15:54:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 15:54:29 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBLsTcn1169468;
	Thu, 11 Dec 2025 15:54:29 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Dec 2025 15:54:29 -0600
Message-ID: <DEVPZXAYKACJ.3GB0P2OJWBKCY@ti.com>
CC: <rs@ti.com>, <afd@ti.com>, <a-christidis@ti.com>,
	<meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver
 version 24.2 -> 25.2
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117211517.785176-1-a-christidis@ti.com>
 <3165a1de-6525-4f7a-9795-dd00ffeccdab@ti.com>
 <20251118190921.GD3125@denix.org> <DEC9K3CR2WGF.2TLJJ2M5QQ6Q7@ti.com>
 <20251119145251.GG3125@denix.org>
 <c09abe97-c3cd-41e5-be55-dd611c7d65a9@ti.com>
 <20251121221513.GL3125@denix.org>
In-Reply-To: <20251121221513.GL3125@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|PH5PR10MB997735:EE_
X-MS-Office365-Filtering-Correlation-Id: a8058ab7-a9fc-4cc8-7610-08de38ffdf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bW5nYjJqMDJNM0tNTEkxMXAxVnp3R0hybzhSL3UwSWhoRDd3aWtrWk9ocU5L?=
 =?utf-8?B?ZzYwTGNuMm15RXdRelZCR1lvQzI3K2JZREx4NDk4RURDb0tCTW1rMnVIelc0?=
 =?utf-8?B?OEpJUlkzRFRXdGR4OEZPUWZYTmsxY0crQkc0NkVWc01zemtrZ0dBZDIyZUpC?=
 =?utf-8?B?VnVKTWNoYXVHREcvK05UYW13SFJYZkZhaW1waU9LdVY1b20yQm5jY2ZJRCtU?=
 =?utf-8?B?cDFreGNWTThvelVpbTFqZnhKVEJTemM4OTFkNTlzM1QvRjRWL0ZHN2U3Nzds?=
 =?utf-8?B?R0liQlpZMUl4dkw5aTlDNWFRakNaYVlMQUVyMFlmZURCMGM2eUl2RXNMZFRw?=
 =?utf-8?B?V1VwQmFhZ1B1YWFwZUY4dUxlRk8xcmlmalpsWnpJNUJPT2NMRFFUOHBROE1N?=
 =?utf-8?B?RHBkMnZuL21tT2pFclpISzBDcFNTTXFBNTN6eHZvZTZpV3BKRGFKZUliR1RC?=
 =?utf-8?B?N0MvQnlzWTZZOGpDTVV1RGU2RVVJdzdFN2tUNjIvUlBJTGs2YUNDYlUydlNt?=
 =?utf-8?B?NmEyUm5aQXRNSFJQbmlreGN3bk1xOVZab2RVc1hrcFRLMVJROCtva3BIL3FX?=
 =?utf-8?B?ekxzVWJrbDhIamtkbW8yUk4xN0NzNjdqMTkxVDB0M0pJeHpobTVZK3FWcVRK?=
 =?utf-8?B?NGZrdmNvZUpzcWxCeUdrNHZPdE81RUgxSlEwWnNCdDAwZXRad2JGb2U4ZWhY?=
 =?utf-8?B?Q29mNkFZZEoxNkE3M01CcE9QY2lQdUJHQndEZ0srVXZ2Zzd3YWMvQnZiWGNi?=
 =?utf-8?B?cEhra09IRjN5aExKQVlucm16cDlIWms4dzhEZkZJRWVDWWFtQUhFRzE2aGlz?=
 =?utf-8?B?OERUeERDbDBOcEltZXNLcTJPWTNFR1pTeWZtKzdSRXFKMmJ2MnJtUHFkNTdn?=
 =?utf-8?B?TVVkaFEwRm13dnJoS2I0M1VpeEhZVzJrS3lsRUUzUklGV05KUUdtTlU4MGxs?=
 =?utf-8?B?ZGlCMmRyM3puR1FrN2xGTkQ1WlVKcmlraEFnUHNDM1hxL0VhL0YzaU40YVNK?=
 =?utf-8?B?OWxsMXFxY3NpOGwzblM2V0NqWmQycFdwaktOSldDcE1aRVdnS3pIK2l0M0Nx?=
 =?utf-8?B?MlNzVmxIZlMrSFpnMDdIWC9ISmhaaE02TjU3bENxR1RHdG95aGNlbjJoUEto?=
 =?utf-8?B?NGxEbTVFRkxjN2J5cE84VFZwL0VOVnRMK0FXdVNvN3NET2VRVEkxdmhKSmk5?=
 =?utf-8?B?VUs1RUREejNBL3lqb0E5cE0rQTJFK2hUaDlKZ3poMnNMUHExMEsvWjdsVFdX?=
 =?utf-8?B?TlRab2xWQVV2VnlTZFBZVWRZSHBUVDg0RGFkRi9yd3Q1a0oyOWkwVzdEdWpL?=
 =?utf-8?B?NS8vRm5FWXhkMFczdTlJMGwreU45VTh0eDRuMVR4amlGRjUreDUzZVJoeHdv?=
 =?utf-8?B?WWRTRVJsTHFQeWtzalZLM3lmNkRHR085U1JXOVE1T2N6KzlkUjU5OUNkOERE?=
 =?utf-8?B?ODYyaWxyenluSVRiVEZlbW5NdnpTY2VQQm1zaW9YOUJjNTJRU3MrUnV6aDM1?=
 =?utf-8?B?amF2MzZXWlRHOHZhcmhMbGNRZE0xeUJzWG1WbHhPOWRBa2d2Z1I5c0ltZFAw?=
 =?utf-8?B?blJhR0lEeGZ2b3RUZVhONjRoaWVORHFJWG90dm5jZ1hZcG5PQUlzWTFHY09C?=
 =?utf-8?B?a3BvRkNNMlZVaDhYQzJ6SXZhbnIwcXRZSk13NGxFYTA1L204QXFnSW0xRVJ4?=
 =?utf-8?B?ZFVSMWJOWWZHMGRaNjYvRDcrRFIwckNoQVdEc0QzL3VBUEhuQzlLNWg1WWw5?=
 =?utf-8?B?dGVxMElaVHJUWlpmUWQrZzZjRTZCVGd4dWZYeDdBWXB6eEczWFlGRER5SVVF?=
 =?utf-8?B?WEpFeDhuWENMbTNsN1p3YkJsQ3p2OE5PUEpGcVFveG1UV0JXZFJ5eUtNTlBV?=
 =?utf-8?B?OFZockhISzB2NzVyb0NSdVpzdWFXQ1FlYzhnWUlUZ3ZVdXNDTVNrUG1DNkVU?=
 =?utf-8?B?RitFVndiY2hHcTFWSktIZHcyVjBQVGpVUVZ6a2YyeE4xSFVQZndweGZRK1Zo?=
 =?utf-8?B?SnByTEFmTW5CVmZlZUJRaWdodjkzalRsU0NJNE80UmZ6WWlUSDNHUjZEVVRI?=
 =?utf-8?B?WEtXa2t1Ky9aWEVYbTBVQndNMjl3UHBwb1ptZlpyd2F2VEpmZlJNQVlLUVds?=
 =?utf-8?Q?Z6QI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:54:34.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8058ab7-a9fc-4cc8-7610-08de38ffdf59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997735
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 21:54:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19354

On Fri Nov 21, 2025 at 4:15 PM CST, Denys Dmytriyenko wrote:
> On Wed, Nov 19, 2025 at 11:19:59AM -0600, Ryan Eatmon wrote:
>>=20
>>=20
>> On 11/19/2025 8:52 AM, Denys Dmytriyenko wrote:
>> >On Tue, Nov 18, 2025 at 07:00:52PM -0600, Randolph Sapp via lists.yocto=
project.org wrote:
>> >>On Tue Nov 18, 2025 at 1:09 PM CST, Denys Dmytriyenko wrote:
>> >>>On Mon, Nov 17, 2025 at 05:22:51PM -0600, Andrew Davis via lists.yoct=
oproject.org wrote:
>> >>>>On 11/17/25 3:15 PM, Antonios Christidis via lists.yoctoproject.org =
wrote:
>> >>>>>From: Antonios Christidis <a-christidis@ti.com>
>> >>>>>
>> >>>>>New recipes for GPU DDK 25.2. Update BSP configuration files with n=
ew
>> >>>>>preferred recipe versions.
>> >>>>>
>> >>>>>For the driver recipe, specifically unset the CC variable due to yo=
cto
>> >>>>>appending CROSS_COMPILE and CC, resulting in a warning for the
>> >>>>>do_compile task:
>> >>>>>
>> >>>>>make[1]: aarch64-oe-linux-aarch64-oe-linux-gcc: No such file or dir=
ectory
>> >>>>>
>> >>>>>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> >>>>>---
>> >>>>>  meta-beagle/conf/machine/include/beagle-bsp.inc        |  4 ++--
>> >>>>>  meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 ++--
>> >>>>>  ....6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} | 10 +++=
+++++--
>> >>>>>  ....6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} |  4 +--=
-
>> >>>>>  4 files changed, 13 insertions(+), 9 deletions(-)
>> >>>>>  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driv=
er_24.2.6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} (83%)
>> >>>>>  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-=
umlibs_24.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
>> >>>>>
>> >>>>>diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta=
-beagle/conf/machine/include/beagle-bsp.inc
>> >>>>>index 448e2086..5060e286 100644
>> >>>>>--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
>> >>>>>+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
>> >>>>>@@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
>> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
>> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
>> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-img-rogue-drive=
r"
>> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
>> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "25%"
>> >>>>>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
>> >>>>>  # GC320 support requires out-of-tree drivers not yet available in=
 bb.org 6.12
>> >>>>>@@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 =3D ""
>> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
>> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
>> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-img-rogue-driver=
"
>> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
>> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "25%"
>> >>>>>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "24%"
>> >>>>>  # GC320 support requires out-of-tree drivers not yet available in=
 bb.org 6.6
>> >>>>>diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-=
bsp/conf/machine/include/ti-bsp.inc
>> >>>>>index 0ea7bd7b..eaa501c3 100644
>> >>>>>--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> >>>>>+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> >>>>>@@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2025.01%"
>> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-sgx-ddk-km"
>> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 =3D "1.17%"
>> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-img-rogue-driver"
>> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "24%"
>> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "25%"
>> >>>>>  BSP_MESA_PVR_VERSION:bsp-ti-6_12 =3D "24%"
>> >>>>>  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >>>>>@@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 =3D "2024.04%"
>> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-sgx-ddk-km"
>> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 =3D "1.17%"
>> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-img-rogue-driver"
>> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
>> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "25%"
>> >>>>>  BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "24%"
>> >>>>>  # GC320 support requires out-of-tree drivers not yet available in=
 6.6
>> >>>>>diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-d=
river_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogu=
e-driver_25.2.6850647.bb
>> >>>>>similarity index 83%
>> >>>>>rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_24.2.6643903.bb
>> >>>>>rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driv=
er_25.2.6850647.bb
>> >>>>>index ddb401a5..b2f5e4ea 100644
>> >>>>>--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
4.2.6643903.bb
>> >>>>>+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
5.2.6850647.bb
>> >>>>>@@ -17,7 +17,8 @@ BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>> >>>>>  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.gi=
t;protocol=3Dhttps;branch=3D${BRANCH}"
>> >>>>>-SRCREV =3D "8eaff654a8871118c08cfafe53795f57e3b6b396"
>> >>>>>+SRCREV =3D "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
>> >>>>>+
>> >>>>
>> >>>>Extra newline?
>> >>>>
>> >>>>>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>> >>>>>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>> >>>>>@@ -29,7 +30,12 @@ TARGET_PRODUCT:j722s =3D "j722s_linux"
>> >>>>>  PVR_BUILD =3D "release"
>> >>>>>  PVR_WS =3D "lws-generic"
>> >>>>>-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${P=
VR_BUILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
>> >>>>>+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${KBUILD_OUTPUT}" BUILD=3D${PVR_BU=
ILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
>> >>>>>+
>> >>>>>+do_compile(){
>> >>>>>+    unset CC
>> >>>>
>> >>>>This feels like something that could be fixed in the driver's makefi=
le..
>> >>>
>> >>>I agree with Andrew - this seems like a bug in the corresponding Make=
file,
>> >>>where CC is already defined (with all the necessary flags), but it ge=
ts
>> >>>composed again directly from CROSS_COMPILE, hence causing double-pref=
ix.
>> >>
>> >>I disagree. The CC variable in their build system is supposed to eithe=
r be a
>> >>full host toolchain, gcc, or clang. It was never intended to be a cros=
s
>> >>compiler. If it is a cross compiler, then it's not to be used in conju=
nction
>> >>with the CROSS_COMPILE variable.
>> >
>> >>In either case any extra arguments provided to
>> >>the compiler in the CC variable will be stripped away.
>> >
>> >Not correct - from the make manual, see the clarification in parenthesi=
s:
>> >
>> >The variables used in implicit rules fall into two classes: those that =
are
>> >names of programs (like CC) and those that contain arguments for the pr=
ograms
>> >(like CFLAGS). (The "name of a program" may also contain some command
>> >arguments, but it must start with an actual executable program name.) I=
f a
>> >variable value contains more than one argument, separate them with spac=
es.
>> >
>> >https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.h=
tml
>> >
>> >As make itself doesn't care about host vs. cross compilation, it's a co=
mmon
>> >practice to set CC (or CXX, etc.) accordingly:
>> >
>> >$ make CC=3D$(PREFIX)-gcc
>>=20
>>=20
>> I am all in support of doing this the "right way", but I'm going to
>> take this specific patch because we have the same patch on scarthgap
>> already.
>
> Sorry for being a PITA, but scarthgap version of this patch didn't have a=
ny=20
> issues with CC. Just saying...

It actually was. The log of do_compile used to report an unusual compiler
warning, but internally resolved it. Even 25.2 does this, so this change is=
n't
actually necessary. I just figured specifically unsetting CC made it clear =
that
the variable was being ignored in the build process, for anyone who was
following along.

>>  So we need to iterate on a second patch that cleans up
>> this one, please.
>>=20
>>=20
>> >
>> >>The build system used on the km and um are the same, and the user mode
>> >>components produce intermediaries that are executed on the host during
>> >>compilation. This requirement dictated the above variable interaction.
>> >>
>> >>Yocto in particular is mixing CC and CROSS_COMPILE in ways I haven't s=
een on
>> >>other build systems. It's also only doing this for kernel modules. See=
ms a
>> >>little too niche.
>> >>
>> >>- Randolph
>> >>
>> >>>>>+    oe_runmake
>> >>>>>+}
>> >>>>>  do_install() {
>> >>>>>      make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUC=
T}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${ro=
ot_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
>> >>>>>diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rog=
ue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-=
img-rogue-umlibs_25.2.6850647.bb
>> >>>>>similarity index 98%
>> >>>>>rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_24.2.6643903.bb
>> >>>>>rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-=
umlibs_25.2.6850647.bb
>> >>>>>index 949c2d5d..e4b95f8e 100644
>> >>>>>--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_24.2.6643903.bb
>> >>>>>+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_25.2.6850647.bb
>> >>>>>@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98=
c1c58f99e3baa03de5207e76f"
>> >>>>>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> >>>>>  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx=
|j722s"
>> >>>>>-PR =3D "r4"
>> >>>>>-
>> >>>>>  BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>> >>>>>  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.gi=
t;protocol=3Dhttps;branch=3D${BRANCH}"
>> >>>>>-SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
>> >>>>>+SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
>> >>>>>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>> >>>>>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"


