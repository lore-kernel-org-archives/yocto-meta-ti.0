Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21CFD43348
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:22:52 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127.1765484562514095207
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=umRUF4JT;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WndsdA7xfDpT46zZmwQuwMyHccdcbDL0IdzhJ1JjSoEhbzOMmpM+Gkd/ZZouOTHpnueGFqCqcQe7BLV11Nw2PFD7bcD9FvYcBzD1LePMHA9ThG0HXNDWDgYAZejqJW0Fa25amzD7CYy/fGST2zPTtct5UhJvpTCiUZAcjBMlZZtuxYvnJigU9Sb9kwzxII01GVuR3LI7nYY33ly9S4A1wZKEfJO0BN6kn/8ET0tybcage1A9N7JvoJnQxzwc8HGQGu7/uSWIm+rFn8U9yb2Cfk4S1wsOMG2GDyBfuSFRTn1EaxqdJTF6oBUBraq72n0bsd/t6MjUrX3XI6Jr5b8Cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hLuoYw1L7gABzqxcbIaCYDIjw4uW+2ATwqeLvbK9wI=;
 b=pRlacC0s5Wlp0oQ55b85LurJ0sD7V413lD46xJK4+W25aBGUBFDGQlKJgIgM3UfCfBmDoRfI0szvtIXuSXtT0qCS5wfIimEjYNBD1vYFNaVpzVL+be0QuAEFiL4CUrxlNJiCkThX7bA8QtlH7UwbzsU8xG8QGSjETR5Pus2/RVd5HEk0IggCZqEvkpOdoXJuIPxatedeit4hitseKbzsTvodObhT1aa9ue6DGfsxE00bYtUvngxX9+8DqeBy3YuegkzrcA4EkYlqrCLNUc9JD5mKpsIGi/HooZNmP4DxqUzRX5rOV19g1DcoElBTCEeWlybJKZFTw+ChrXeQxbr5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hLuoYw1L7gABzqxcbIaCYDIjw4uW+2ATwqeLvbK9wI=;
 b=umRUF4JTngNe4WQbac8d0HhEiFjB0vScTtuY4JojXfVTGKc4SSqI6aGBhrezIJfw5h0H0DKyaQIoeCM2Z4xRsLv9MQ2UIrQeiZ7oFeWABBcyROUiQqJPZazeQ3yb6CTHQsyJDpPq9hdQIZ65vRQZDkSrt5II7Xdck0yHIX0orio=
Received: from CH0PR13CA0040.namprd13.prod.outlook.com (2603:10b6:610:b2::15)
 by IA4PR10MB8495.namprd10.prod.outlook.com (2603:10b6:208:55d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 20:22:36 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::2c) by CH0PR13CA0040.outlook.office365.com
 (2603:10b6:610:b2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 20:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:22:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:22:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKMYBH1060495;
	Thu, 11 Dec 2025 14:22:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTnBK-0000000H3Kb-0iD6;
	Thu, 11 Dec 2025 14:22:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 3/5] ti-bsp: Add ti-6_18 for LTS development
Date: Thu, 11 Dec 2025 14:22:32 -0600
Message-ID: <20251211202234.4064350-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211202234.4064350-1-reatmon@ti.com>
References: <20251211202234.4064350-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|IA4PR10MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 9434d1d3-ce82-4fa4-dad0-08de38f30623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vO67hN0A8IFnUF+xXzyxujvlW5B6+VvxnzrN73MxlKvqRK4JYMKJ5dqDdCKc?=
 =?us-ascii?Q?j0Ot6hc4EyYBc9ct3rQekN2dMyDqlA8CKoED9PSMSuGKrWLpiVCP0MFCNcx1?=
 =?us-ascii?Q?Py/OqWgkY+cyHaMg7JD6eC7dtN3wo8Nx3VdZHH8dxCejrIXmZd21Af6f3eQ7?=
 =?us-ascii?Q?j3GKDVhAKjVgFmtflD3/Kn84n3Quj1KBZyoy9iKVJfEy21RtTuPJuHeT4TZg?=
 =?us-ascii?Q?meZvWw2C+WPpuN7C2CP6C4pxOX/BLzZu2PF6PlGCG7q4A8xh5VPEfY5yN0A7?=
 =?us-ascii?Q?CH9E082sAgJ9TGl+nrORcYz8Wqi1mpazeFpRPTbcI53oYfE5m3wy3pXi5UmV?=
 =?us-ascii?Q?vlkwAlTUMiDHbSCacMMF5SGKVbUo+HHyaJ2/p9N7I1DDNjMNk4+Ii6Bas6Zj?=
 =?us-ascii?Q?WJI4gvQ8Z70XDH3XvkNhUw4ZoPVzs4JeM01ANtvSUagYIflhn13eg6Ize8qR?=
 =?us-ascii?Q?JVcO3o3T8u99B7Z6dcpEvBVty2XFOEEuCFGnfVEpsUc9SC/N6wkf5pv6beat?=
 =?us-ascii?Q?q0Cgnsg+s48WLRAbDg/QIWbK+tijh8tLdkimEZOSSPXkusJf1pUc5MoO7sTe?=
 =?us-ascii?Q?X2fuYMrC56UCXLBv6OwTzeVOGoesr3ihs6n8u4ee4nWH37EpvdYXiUWpXtdn?=
 =?us-ascii?Q?EbD21P2ux2k+cdWCKnGIQ+5EuzY2vwOrKZmombvDHvuHpv6qaPMZcKbm6KiJ?=
 =?us-ascii?Q?lP5Ti+Eq7sVjAYtHW/jNlVg4WXZe6+UvF4zMYmoyQ1KMkN1PHM0fD+XxQr7R?=
 =?us-ascii?Q?djSKRocexVmG36u7gGWb276WIqpTh03Gid6y9bi2uhD5crGk0INQyemDTbsG?=
 =?us-ascii?Q?+/HMTyKvjTVcrRRCJRaLCFZ2wD7nSpjPxULFeED8gTxP7UV52UVnMWTbrPnD?=
 =?us-ascii?Q?v0vcamLV2Y7X6BTETL0Ml9grOP3qR7Rhm2wj/3P3CgoztJUV8JdUKbkfdVL0?=
 =?us-ascii?Q?78jTTszKlcH3SrAVCXsXjcfPKq3zIx5lT8DUSvZWIMwXqc69DoDVTzL7gviD?=
 =?us-ascii?Q?l2VXVx9ZFhDGMQ+XBfb0FPvIrVGXdNOQFJ6pUujYlbTxtFSNvou3Vd2+tXBM?=
 =?us-ascii?Q?xCo833peSUtPYgQHwFKAkbzKP0HI96NpLJPW/j/5P3LDiUKpU8Hy5zrPLWvm?=
 =?us-ascii?Q?FDBTnaUYKmxJbEmFpoQNy8WEJYybWlZEoDaoCOZlEHQlxzlO2lOcSWM3ByL0?=
 =?us-ascii?Q?JgUV8GV6K6KgKzrKQRa1PH0ObyAHuouoGAtPPswzrqOsdYdohYDmLRU4uNMf?=
 =?us-ascii?Q?j6PLvFpvs29lDf2BoR2jmFy5Mr1rRd1SlT3yAou2y2V/J5zOJGG/cNU8qzBB?=
 =?us-ascii?Q?6bwVINkzgpDBHDtVziqsvyYyOtO7I38UbL4X44wlAUkjTXW43UcGCDVj4Rrt?=
 =?us-ascii?Q?K2QCrPGvc6mgNyiC1h1JcMbjMPFapPfxfRXouvKvavtoNoU/Cq9G5XuCZZK7?=
 =?us-ascii?Q?vEqJ2MhJMqXPf04EIwt32LlkoIRw2Pdil6ZOWXwaPwtj6v3HasrD2SRfHN94?=
 =?us-ascii?Q?V0B6ep5/OOEPjHlVPMzSR3vAu4idtO69SgvN5jfiEQptLxarcr76VPLFgA2O?=
 =?us-ascii?Q?rFPYlDCY/xkdN32PfNk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:22:36.3760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9434d1d3-ce82-4fa4-dad0-08de38f30623
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19347

Add entries for ti-6_18 for the upcoming LTS development effort.  This
includes:

kernel: 6.18
u-boot: 2026.01

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No change.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index eaa501c3..0ca2de64 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
=20
-# Supported options are: mainline, next, ti-6_12, ti-6_6
+# Supported options are: mainline, next, ti-6_18, ti-6_12, ti-6_6
 TI_PREFERRED_BSP ??=3D "ti-6_12"
=20
 # Use bsp-* namespace for overrides
@@ -33,6 +33,15 @@ BSP_BOOTLOADER_VERSION:bsp-next =3D "%"
 # GC320 support requires out-of-tree drivers not yet available in next
 MACHINE_FEATURES:remove:bsp-next =3D "gc320"
=20
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# ti-6_18
+# TI staging kernel 6.18, u-boot 2026.01
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-ti-6_18 =3D "linux-ti-staging"
+BSP_KERNEL_VERSION:bsp-ti-6_18 =3D "6.18%"
+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
+
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # ti-6_12
 # TI staging kernel 6.12, u-boot 2025.01
--=20
2.43.0


