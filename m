Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50138EEC2B7
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:58:06 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9088.1771891083248235656
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 15:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MLnTho2w;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.10, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLnS+15r1SdnG83wgDFcKyXtj6Kq0M1U1C7NPdBIZMoBPmr5qhQTC0CaevSjFoXsUzax4ESrktolxWJf5E+f0NqM3CLRan7M9mC9dmO1j1Mbn4iXpZERHBnQocG9771Wx0gNQL6k+sHgBZSUoHNgLdNjZeUCZAfavUAmyOyVyYQgVRZOIaZOMhMVWLA33JEIOBQ2D4rSjsAZh+esPCKatreyeb+OjwKDwugaL81hmJSfDUViI1DY3WP4H5whaUPU92E1HYPUP0Zal9kGoOSjASxCKaDmN0dvAcCrH5fYv/sgH4n24/A1SSXFiHva/n0RbM3LiFiJFvwXnOXsjMCjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBbGXp6pA+nYsKfto89U/rS7LY3iyKp2cUli4/agkts=;
 b=Mdvc4uPfjdJxrGqk7xQK6FCHtjs/RRym1OYUI87NcxLrEsrK7aVUyPAJJP87nfWmdMfeW5zx2OIhqm5Vgp6vzXWYHfZz92jTQ5wFQALqA1xZLpUnsHJzblePeMTQxsu1/lKQyTvPymtSCW1AVhuAhx+pnnwIZPknrDdphLtI0L/DUXT90gWSsyMNwoHp+iiOJimlYlbYiADsUU3AOmE9hTbpOspS8ZoGruW33oZQb/3qc1zdNnB8zxIMBXgGR0GZf+95q16NafG7YX2ldkJ+Jd8uQHs7gPS/CsfMjWns9v23Kr5vYnwhjbcUfiEvd1ZavmS6fd87ON8iMptPOZzi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBbGXp6pA+nYsKfto89U/rS7LY3iyKp2cUli4/agkts=;
 b=MLnTho2wda+YJa+Qub7dZHy4KlGROOoVEjKMjHZwRl3GsyZgHhQsGSQNKWRhZhhBmStqUkZwohO2LTCwvZkgTFYPhEbGlKd/6ktqpyI0W5QjK21wlfJvnYxJRHdal/T1jQfB/SjrXI0TvJttXQMmj4cARa3KPdpXjPXFAo5KNHw=
Received: from MN2PR22CA0026.namprd22.prod.outlook.com (2603:10b6:208:238::31)
 by IA4PR10MB8712.namprd10.prod.outlook.com (2603:10b6:208:561::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 23:58:01 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::e) by MN2PR22CA0026.outlook.office365.com
 (2603:10b6:208:238::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 23:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 23:57:59 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 17:57:52 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NNvqwe1698885;
	Mon, 23 Feb 2026 17:57:52 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/3] beagleplay-ti: use the am62xx.inc
Date: Mon, 23 Feb 2026 17:57:44 -0600
Message-ID: <20260223235744.3928753-4-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223235744.3928753-1-rs@ti.com>
References: <20260223235744.3928753-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|IA4PR10MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 0052d6a2-29d2-46d4-1b91-08de73375f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OCuB9wHq2fbt9RZtMRvWJLnLnrw8G+3UM6AAUrkxss1A1JRacuZ1FxbULrva?=
 =?us-ascii?Q?EhlAqjqKZDl1XHXgCcyGCLtNkXHYphHFNCO43rBZTfFYZ2bPY+rB0N6HFzl1?=
 =?us-ascii?Q?DZmANnHmv6hwd+y58myVJefOMM0SHM9aJ/3KCa5oia+MgEAPjAL2mA3GCcnJ?=
 =?us-ascii?Q?iG+6jks9lDyFFF1FKAo1bGUPgE2PbwJ6ISKxdsFTgocor9ThOni9gjC4e+FI?=
 =?us-ascii?Q?cISfQe/UtMlJvj37dl43/WvM3r/VCszPATG07uGHWmyEOovGaXTcIm03iM2m?=
 =?us-ascii?Q?uxeXMt4VfG2BM3y4aJzhetxkZwAmJOc/2LHxexNNtgi0SEZHYktfseIHmfcp?=
 =?us-ascii?Q?rkVnYhgiymotMtRc0tShfICDGAdpdjBadVcW3xyZa17SqGCG65JP+0yJuTwj?=
 =?us-ascii?Q?8iP4E+Iuw5QuJimEI8NmaCYaHbfRb/8ZxSjqrskrJxlPQbAwx7AAiY0JjAfL?=
 =?us-ascii?Q?KJNW1Y1eMZaESiMeZgjARDwmR559ehIHAJlGaGvS2YeGDOBrO1YOrY8Iqxkk?=
 =?us-ascii?Q?TNvieJlxd9x8m229AAyuHU8bDWXA2UEJhS+ShD0MBYYawS7tCu0U7CoMQIRa?=
 =?us-ascii?Q?nqglVIb6IwXKYjFmLmnp6wgfjUS9iosTtQWWAL0F4jj24bdynrFS1YbTogJ4?=
 =?us-ascii?Q?MIuqAp1mS5QPKOVDYS/9VD8wGJ1vT383302f/btn4nLORr+hTztKNjJX0Odi?=
 =?us-ascii?Q?LLmshcz6/kjWXq+FlGd83h3Gq5JmcNZ//DffmQ2caNam46F/giZdbXMJyjhx?=
 =?us-ascii?Q?fGs3PO7ga4l0+uMKTs6g6QfgFi0+nHyqM87AIT0SqJ/wxZuK/hd3f6/4OhDQ?=
 =?us-ascii?Q?dgRet7sH4ERD471CVRDE83vE/QOwLeRi0ug1L8DTOgkHslBcfifQYseKyuIf?=
 =?us-ascii?Q?AefU1CjLWNXLYFl08uOHsqsAggv0lZkpqCaZPuPLrJz+CMtr1fYouWbSwtt4?=
 =?us-ascii?Q?6N88qvbJOmD8ba2CzC3Uw8++3+BlJ9J6tFFuliiqTQ49w/YJ0GSWLA64Q/GA?=
 =?us-ascii?Q?layaGJeyqGgvDjXss+vvxQFLFEMz1vX7/8ie1OaIbLialLnXzOOWK7r+xImq?=
 =?us-ascii?Q?wE5hrOiJm3QKqZ2cDkbPJrdemQ93RrEQO/NHyySXKg+uihQiuFtdQqqWVSNG?=
 =?us-ascii?Q?dfu/qzSkxfRMIWgBvIguS3rm5bqS6ZcRtPOWX/cXtoHUyWSWAXIUF++F596H?=
 =?us-ascii?Q?0clYdIqWKeDAjtHoE3+BG4abndr9/QWaOjL3eL5d1gXao+Dc4veuWNeAfEA1?=
 =?us-ascii?Q?yf17v/d9kpkwq2BQ5Br6h+QtdExfkTMumslu+v6y4t8wHPdcpxeSwvTjOwxU?=
 =?us-ascii?Q?Dfxr4gzXConvwAM1BUlhUMcS73d4s4K1ElV7/D9qXAsQXbjj5xfq6s3oF7Fp?=
 =?us-ascii?Q?od5JFKg0Fm6rb6vw5opwsTP65ejak3XNZiQ3HfGMF6OlHPKU1jcIrFgLgfPi?=
 =?us-ascii?Q?a1eYMyB6/fkXNWuRgOPfRPJSlmRK4nfjR1yDY7HgGAHKXZQ1HuRtMjoXzBe3?=
 =?us-ascii?Q?smxfZah+eexSa2ihkmyr8IkAPvcEV+LtmM1Q1JWUsS/TA0TdEiAAg8jGTcuU?=
 =?us-ascii?Q?UfvHOjPMAwIPIIdMnTuz3pixtOAIe/OVbTHKVdr8ne73Chs0IqUL4s4he4ws?=
 =?us-ascii?Q?CxG0fuofbndKLFWnERSBQKg9e+PQV17g5M5pBift8dwLMPedNyd03JLAyMkY?=
 =?us-ascii?Q?PpPV0g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1Ku2O+Ytl6h3VfF9vLx8UJaT1vfN40qRgU0vWzoKKvRJof3i4Ng6qRh3XBYF5fJX1zxNrCf/BTNuw8jRdvLpTfM6eJ2cQohrqGyeoJPc2mm0mFLuUjfjed5ViLTk0kTYTBIeSb94Yh5+C9+jjdY61pkM7up1knBA2QHr2Ac5AUf/hIhoc9f4F3dXOj1gttpU/HjZm3tE8ckzLy0sdv4l1G5ldle74yFv2XcDeiuVsMV5O3Xh6BMIngZEV25jAeL/IDtSgEfB0/WUJLhhmstpezxYLCPFQ7qQ76AnZs0E9M0QPl2aWl8YwNSmTNpTs60wmBf7XICUHDiM34Nf4dgxqp794cvU/4fsPGtvJhQs5W+L/9RYhP9+Te8ZG7M3PT0dBzhQjCAf5RrozQCJm2WHbpD4oc77ckhw4z1Eiinsvmk484R9ACCo/WMbwKhZHESw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:57:59.5979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0052d6a2-29d2-46d4-1b91-08de73375f9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8712
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 23:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19581

From: Randolph Sapp <rs@ti.com>

We should inherit the am62xx.inc and just override values as needed.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-beagle/conf/machine/beagleplay-ti.conf | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta-beagle/conf/machine/beagleplay-ti.conf b/meta-beagle/conf=
/machine/beagleplay-ti.conf
index ca88fdfb..4e69c819 100644
--- a/meta-beagle/conf/machine/beagleplay-ti.conf
+++ b/meta-beagle/conf/machine/beagleplay-ti.conf
@@ -2,23 +2,10 @@
 #@NAME: BeaglePlay (A53)
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
=20
-require conf/machine/include/k3.inc
-require conf/machine/include/mc_k3r5.inc
-
-SOC_FAMILY:append =3D ":am62xx"
-
-MACHINE_FEATURES +=3D "screen"
+require conf/machine/include/am62xx.inc
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
-require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
-
-TFA_BOARD =3D "lite"
-TFA_K3_SYSTEM_SUSPEND =3D "1"
-
-OPTEEMACHINE =3D "k3-am62x"
-
 UBOOT_MACHINE =3D "am62x_beagleplay_a53_defconfig"
=20
 SPL_BINARY =3D "tispl.bin_unsigned"
--=20
2.53.0


