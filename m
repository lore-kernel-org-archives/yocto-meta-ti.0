Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20766CF2566
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 01:01:22 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4075.1763514067636339360
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 17:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xX5Cix5k;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.61.66, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF7Zja8IojzC68yhid6iD3cKz8epmeE66JvoMloJ9NFD5v5EjbOFVwuQvzKl8gszzPkgnLgHKt+c4dREZW1ta/3Nt54OokM9Ao29NldLIgIwC6DdnrmRvB8bXeqPX+G05uDGt5JRMf1EiwgJi/0FIV/TJAKjzdJhDWUXGgd8w+3wildPrFXiT3WE3jP5f+Rv6lv55j1sOdFYyfzDIETN9CMjx90YUi4Za4tBNwqX2aWpQ0lB82ifc4mFY8x//uohh6iTkCbZ6ch6z1ma4WdqkhBUjxtHJuM6RdLYiL+dEULzj9zBoINbEbKw+1f0F/U7m8N1SCetoG8kUl5DMaUGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GApIFDzXPTIBBseFvArBzFR5/bgFLB+23TUXwEtcSE=;
 b=q1JbkX+mOtRLD2CC7f3OWTxl9xULH7PQEnc05jJ/I7DzSN43VuimCmfzySBEC8wxEnSGgyeAf3d/pWab8+tH+GaThZJj5rwNB4zI0qwj8RHUjPugdZxSXv/JExIp2QqVHSzmpwSVVKj+22EeJ9N9yTx9YFDXa0doslDvNibCsZWXPEsfnC+z7mC6iiCvFc8qe6iUE0MD//skseF7GRmk1llRP8qsuLY7lSAwoCXLwJLGQAe9KywqEuyuqJD+eP4UXHON3ZrLnwAX/qkEsrIKs3pv9/7bxN40kdkPiPsDuxTr374L70yk1JORVWr6ODyCQJnm1NJQO1y+scAJe8XCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GApIFDzXPTIBBseFvArBzFR5/bgFLB+23TUXwEtcSE=;
 b=xX5Cix5kI5aYA7xGU3zXYADD9diI5wJu9moVUMN2XHRkrbh3bdeQbKXI8joCidU1Fkq0jqh55JcORkqFFIJx5fOn6WBHT8sNtnCYwmdGdlGCfFewPkh6Sn5iiuROQZFLS+2QyMc9genqU01rV5XIReXg0NHktQc4GIySNxnGOSc=
Received: from BN0PR02CA0036.namprd02.prod.outlook.com (2603:10b6:408:e5::11)
 by DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 01:01:02 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::a0) by BN0PR02CA0036.outlook.office365.com
 (2603:10b6:408:e5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Wed,
 19 Nov 2025 01:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 01:01:00 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 19:00:52 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 19:00:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 19:00:52 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJ10qRR1009564;
	Tue, 18 Nov 2025 19:00:52 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Nov 2025 19:00:52 -0600
Message-ID: <DEC9K3CR2WGF.2TLJJ2M5QQ6Q7@ti.com>
CC: <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <rs@ti.com>
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver
 version 24.2 -> 25.2
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117211517.785176-1-a-christidis@ti.com>
 <3165a1de-6525-4f7a-9795-dd00ffeccdab@ti.com>
 <20251118190921.GD3125@denix.org>
In-Reply-To: <20251118190921.GD3125@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS7PR10MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: a80ab0ea-6933-4251-e604-08de27071b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXB4OXNYRlM5S1U5QldIWFJLQ1MrQlloNVR3ajB5Q2lNTGdGQW1QdkhJVVdJ?=
 =?utf-8?B?Rng4MUtrNVoyclFJN05Ba2ovbStRaFlCaVlFR3ZaeVRKSlQ5ZndDQmpubzJQ?=
 =?utf-8?B?L0NtUmR4bEVISmFEM2lBTzAwYWh0N0NheW9nT3R4aDV4aExYSm1CT1JhV2ZK?=
 =?utf-8?B?NktZZUR2RlJZZVQxSW5qMitPUW51d25Tb3gxYmRFQyt6SG80YzVEbnBTaHE4?=
 =?utf-8?B?K0gvMUMwaUplNDJHY05sVUw1N0lyRFE3RmRESjR6R0R6YjN2MkdNdHFuN28r?=
 =?utf-8?B?bkJCeDllK3ZUcFo4N1ljV0lsUUljS0hveEhxWHVNaHdhcnhJU01xbUxNaGFG?=
 =?utf-8?B?MGE3Q0R6ZDZZenpsL1dYWHN3WDVHSFkwM3RMTkF6Rm9xUHNrZC9XbXYvMU04?=
 =?utf-8?B?Y2ZzbGpCeUE5QmdnM3M0N1orWGg3a0hsazQ5WUIzNGYzS1lUbmp6R1pRYlZD?=
 =?utf-8?B?STZKNVljeXM1TnpScWtpRnM3RmtoTDRmSnpYZ0VqMVBPRHJrbDYyNEt0SmZN?=
 =?utf-8?B?cHBOMjh3Si93TGFqZExqUThlOEJBcWJzNU9sMnc5QU91bTJKdS9UeTVTalVF?=
 =?utf-8?B?dTZxNnkybkVMdGpZeXJLYjdqSTJGYU1mWmNjQ2FPVGkyL1YzYVkxajB2VFRY?=
 =?utf-8?B?eUZCYnlZcGdLaEs0MytjN3FkMWRYVi8wUExiQ3o3THBJakN2dVRkNXlSVC9j?=
 =?utf-8?B?TDJSaGo0dk9raEEybS90R3ZxbHZGYVJiRkpBZzFvYlAwK2poMUlnL3dpdTht?=
 =?utf-8?B?cDZGa0F5R3VaWGhKZTR5MW4yZ3NIL29vY1JJYnFtRHJjVkdFc0dsWmtLVVpt?=
 =?utf-8?B?TU1ia1FaYjdHcEhmNkl0Tm1CajZKNS9ES1N0Rjlucy9kaEwyRWtMaThMdDZF?=
 =?utf-8?B?TFpCN3IwQnRJeTNQZE9CaWhsa2k5QS9OOXBSZjJEU1kwTlEwc1JEWThnUS95?=
 =?utf-8?B?NElPbUxTbTF2ZGE0M3B5ditRN21uL0dvaUpULzhOaWFUNmN6Y01qTVZPcERi?=
 =?utf-8?B?cFpiVVVNWmF2ZXp0Y2pKdi9XOGlRL21oc01obE9qbmNQWXZhbjUvWitqNkl2?=
 =?utf-8?B?dnZSak9vSzhlSms0WmppNXlPRUFYZml2dzJ5ZDFJc3REbVV1QnNFdkR5OW90?=
 =?utf-8?B?ZHVsZ29zeEVmeGE2Q3RpNHNURjhQVFZlNWNNWmI2aEtsTjVNYzZaU2plUFdQ?=
 =?utf-8?B?LytiV1RTM2hDK2NUMWtYTFpYZE5kTkVwcCtBYWNkZ1B3a08zeXpJTkhNZVM0?=
 =?utf-8?B?RFhaYmYrTkFnSENoRS9VMDJvdUR2d3RPeFZ0NzRSUjY0OHROSENrWjRKS0pM?=
 =?utf-8?B?aG42WUpQV1JaQWU4eE5IekxiT21jRG04VU5zN3krT3BCU1lCN0pqZXowT1Vi?=
 =?utf-8?B?QmVTaWhwOW9DOEk5M2xGcGl4V2dHMGxXbHZaQ2tTdVBqeTBWWjY1eHBBZm1w?=
 =?utf-8?B?V0g4N2hMWER0Um1CM1BOeS9UUjBzaDBWWlROVlNTcDdIeXZYQXk4M3Y5Q00v?=
 =?utf-8?B?aG9wQ1ZjeDd1Tm9waUJ0bzVTOW10RHp5SzdscUt1Q2VHNjVwOWNwTVJEb01z?=
 =?utf-8?B?QjRzRTR2b2pKbkZNMENsbHkvL0JiWGtZS09QUDk5RnBITmx3NFJHTmdIR24y?=
 =?utf-8?B?Wk0zTWhIeXpnYitrajdzU21rVDhYU25YVTFUcFJyenBscW5jdHpqSjJPRG5p?=
 =?utf-8?B?Qm1ocmNFbmhaVWJZeURzeGpUbVgrOGtNSWlXTjNpUGdObFNRUFRua0hXZVpp?=
 =?utf-8?B?UnI3SE5SNzhJYjFxUWtWUnRDSExYVHFZRlNnQ0NlSVpGVmFtQ2Rwd2lNQkt4?=
 =?utf-8?B?bnpYT3E3MHZIakVua0wrc3Yyb0RaSytnanlJZXFpdHA1dFFHMEVabVd0RDZI?=
 =?utf-8?B?N1BFMS9WZklMc1Rza2I1RXRrTVZjRG84Y3dwV1F2QUVBbWhlVDlOV3NvL1VY?=
 =?utf-8?B?VzlCbTNOb3dVQWR2OFJyNXY3THd6d2xJWERCTnpoOFFlQ0J5NVdQZEVkc2dq?=
 =?utf-8?B?SUZhMEUzNVg1SHdJZGZqQWxubzlMajIyNEtkdFZQQXZwZHZMTE0yRXVONFBS?=
 =?utf-8?B?VkZpNTdBTG82MXZ1UGpoMnhlRkV0cTY1Q01zOGlWeXA4OWw4V0E2MnoreTIy?=
 =?utf-8?Q?yj1I=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 01:01:00.5559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80ab0ea-6933-4251-e604-08de27071b23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4926
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Nov 2025 01:01:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19291

On Tue Nov 18, 2025 at 1:09 PM CST, Denys Dmytriyenko wrote:
> On Mon, Nov 17, 2025 at 05:22:51PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
>> On 11/17/25 3:15 PM, Antonios Christidis via lists.yoctoproject.org wrot=
e:
>> >From: Antonios Christidis <a-christidis@ti.com>
>> >
>> >New recipes for GPU DDK 25.2. Update BSP configuration files with new
>> >preferred recipe versions.
>> >
>> >For the driver recipe, specifically unset the CC variable due to yocto
>> >appending CROSS_COMPILE and CC, resulting in a warning for the
>> >do_compile task:
>> >
>> >make[1]: aarch64-oe-linux-aarch64-oe-linux-gcc: No such file or directo=
ry
>> >
>> >Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> >---
>> >  meta-beagle/conf/machine/include/beagle-bsp.inc        |  4 ++--
>> >  meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 ++--
>> >  ....6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} | 10 +++++++=
+--
>> >  ....6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} |  4 +---
>> >  4 files changed, 13 insertions(+), 9 deletions(-)
>> >  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_2=
4.2.6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} (83%)
>> >  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umli=
bs_24.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
>> >
>> >diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-bea=
gle/conf/machine/include/beagle-bsp.inc
>> >index 448e2086..5060e286 100644
>> >--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
>> >+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
>> >@@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
>> >  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
>> >  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
>> >  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-img-rogue-driver"
>> >-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
>> >+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "25%"
>> >  BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
>> >  # GC320 support requires out-of-tree drivers not yet available in bb.=
org 6.12
>> >@@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 =3D ""
>> >  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
>> >  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
>> >  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-img-rogue-driver"
>> >-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
>> >+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "25%"
>> >  BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "24%"
>> >  # GC320 support requires out-of-tree drivers not yet available in bb.=
org 6.6
>> >diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/=
conf/machine/include/ti-bsp.inc
>> >index 0ea7bd7b..eaa501c3 100644
>> >--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> >+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> >@@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2025.01%"
>> >  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-sgx-ddk-km"
>> >  BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 =3D "1.17%"
>> >  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-img-rogue-driver"
>> >-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "24%"
>> >+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "25%"
>> >  BSP_MESA_PVR_VERSION:bsp-ti-6_12 =3D "24%"
>> >  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >@@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 =3D "2024.04%"
>> >  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-sgx-ddk-km"
>> >  BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 =3D "1.17%"
>> >  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-img-rogue-driver"
>> >-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
>> >+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "25%"
>> >  BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "24%"
>> >  # GC320 support requires out-of-tree drivers not yet available in 6.6
>> >diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_25.2.6850647.bb
>> >similarity index 83%
>> >rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_24.2.6643903.bb
>> >rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
5.2.6850647.bb
>> >index ddb401a5..b2f5e4ea 100644
>> >--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.=
6643903.bb
>> >+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.=
6850647.bb
>> >@@ -17,7 +17,8 @@ BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
>> >-SRCREV =3D "8eaff654a8871118c08cfafe53795f57e3b6b396"
>> >+SRCREV =3D "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
>> >+
>>=20
>> Extra newline?
>>=20
>> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
>> >  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>> >@@ -29,7 +30,12 @@ TARGET_PRODUCT:j722s =3D "j722s_linux"
>> >  PVR_BUILD =3D "release"
>> >  PVR_WS =3D "lws-generic"
>> >-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_B=
UILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
>> >+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${KBUILD_OUTPUT}" BUILD=3D${PVR_BUILD}=
 PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
>> >+
>> >+do_compile(){
>> >+    unset CC
>>=20
>> This feels like something that could be fixed in the driver's makefile..
>
> I agree with Andrew - this seems like a bug in the corresponding Makefile=
,=20
> where CC is already defined (with all the necessary flags), but it gets=
=20
> composed again directly from CROSS_COMPILE, hence causing double-prefix.

I disagree. The CC variable in their build system is supposed to either be =
a
full host toolchain, gcc, or clang. It was never intended to be a cross
compiler. If it is a cross compiler, then it's not to be used in conjunctio=
n
with the CROSS_COMPILE variable. In either case any extra arguments provide=
d to
the compiler in the CC variable will be stripped away.

The build system used on the km and um are the same, and the user mode
components produce intermediaries that are executed on the host during
compilation. This requirement dictated the above variable interaction.

Yocto in particular is mixing CC and CROSS_COMPILE in ways I haven't seen o=
n
other build systems. It's also only doing this for kernel modules. Seems a
little too niche.

- Randolph

>> >+    oe_runmake
>> >+}
>> >  do_install() {
>> >      make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_$=
{PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_p=
refix} PREFIX=3D${STAGING_DIR_HOST} modules_install
>> >diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_25.2.6850647.bb
>> >similarity index 98%
>> >rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_24.2.6643903.bb
>> >rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_25.2.6850647.bb
>> >index 949c2d5d..e4b95f8e 100644
>> >--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.2.6643903.bb
>> >+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.2.6850647.bb
>> >@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c5=
8f99e3baa03de5207e76f"
>> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> >  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j72=
2s"
>> >-PR =3D "r4"
>> >-
>> >  BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
>> >-SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
>> >+SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
>> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
>> >  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"


