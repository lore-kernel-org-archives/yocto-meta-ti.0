Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F12CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 06:18:03 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7078.1762928277300154666
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 22:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hVrL0iFf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.18, mailfrom: a-dutta@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRTGvrbVOteApr5nzq4Ma5ev/Y/zUWcK1gij8VMgdG0NyE3qruC4umjoqKY7szyltZaQslf+0J4lxdf4BDM2+0ppjAyzDeIECc+1Q+KlZR2jXNfIQt53zszMzCom1FwK61SYjPhmZf4AnWMPEO1tlWFnKePFKQDSa14B4D69JMLYnbxNj5jmS/+z3N9NfU71ZNcNTDRje/pNnZw3/l6qrAuoR7+S4rIYKr+z/V0qI3qU5wHfyKijDEXsZl+uGscbnRW4PdGrQnQs0UFaduYBAkrUdrolKtKnPPFHBghA7/YIUUBsi142xeLxFXythmFq7hL+8iZaxICV5GU8CBaVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGDlI1LI/j3T7MsaJJjtklbKw3B1gwUItFZe+Vuptus=;
 b=uQSB4SzzPr1Dyio7lRdF8Kd4M9f/3Cr5zHG+wLr/LKLxO8ND+s6DQUygoDmhcCJ56LxIJj6gadFvLJvwezDnuO7y6CYXsYICF5sEl1C9nxBu3ZgIrYo7PldVzdhWNAi7foaMtWPHmNMcmALmC+R4Qc+MSMk6Y6myYKyC9xVf4P9Gqo0/anGsr8XG6aq0R8L0JBqlE6tmA0it30Ef8O58GDk75bqzmYSLQ312iuDKFZ7xhaxzg9KoF8rcdwYqpWKxdl5bAn+r0XvmlIYbIAUuQL3BqenguaGLcmpYcN9vgfUAon5IuNdWr8EA1+g9vkIgbfytHzzoMw4OGHUIowuk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGDlI1LI/j3T7MsaJJjtklbKw3B1gwUItFZe+Vuptus=;
 b=hVrL0iFfgzaKDAqJi1GBaIkikY1pYZy/RTtNV1ZBGvKfNYsBL4J5OSq3S3nLGW+FWBisJdG5Id8rLNbTDRFwqaAbO8Eib11cEdnkIIb6TnVsuT9CBSDLely/tu7+QbWilMZpd1VLBJaaB1XXsiUPzRGKIjtfyUVVDpAVq96cRhA=
Received: from DM6PR17CA0034.namprd17.prod.outlook.com (2603:10b6:5:1b3::47)
 by SA1PR10MB997629.namprd10.prod.outlook.com (2603:10b6:806:4b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 06:17:54 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::80) by DM6PR17CA0034.outlook.office365.com
 (2603:10b6:5:1b3::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 06:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 06:17:52 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 00:17:45 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 00:17:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 00:17:45 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC6HhpD2216306;
	Wed, 12 Nov 2025 00:17:43 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <a-dutta@ti.com>
Subject: [meta-ti] [master/scarthgap][PATCH] conf: machine: j722s: Fix overlay name in KERNEL_DEVICETREE_PREFIX
Date: Wed, 12 Nov 2025 11:47:42 +0530
Message-ID: <20251112061742.2741418-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SA1PR10MB997629:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0b09b7-bba3-4236-c79a-08de21b3366b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9p41VIGud55fjPbeWYOrXSRC9CQSdPAUW1ikvObV5rKLBLfTVhMHxbmiSAOg?=
 =?us-ascii?Q?AP0xNCU5cSUWvovrOFeQIoi+mMvnjcl/36C4jwoXcqYQ3cfURniQOBilNDwQ?=
 =?us-ascii?Q?CFYLvLDxT+lYKP+QPbopeef9X6BIeXSij4a4N80pNf6OUtqRYg/+krHtIq1S?=
 =?us-ascii?Q?ssiqlxM6QnOLpNlvRHvfLari7fhJJ9iDmgxJt++fIiOpQTXw8bZrGtxS0/6G?=
 =?us-ascii?Q?eRNIXYYvFqIYDqBtAGL2+E44qYQQyuVJDtpZSgC3EXt8HTKpyyWpAK+UYj4U?=
 =?us-ascii?Q?71XB3uWr+Cru3E+CpEwy0Sl/1pbcWG/YxvPVN9Kf61A9GJL/MIB89DrD5MNn?=
 =?us-ascii?Q?hmMr/kbxrmmiKIGoD7Od5ZtipsvTE/+bO8d8yZ41xRCDVDJLKhkEs6WLHzAr?=
 =?us-ascii?Q?l5qQh+lQaA75frlTjf6pm7ExY3tJIWQSfGthtK0V1mzmYvyME5aJ/2VGQPaH?=
 =?us-ascii?Q?LpfUnBMMByCHfntXVfvVYU6SFPhe+ckogGiGezSNAH2t+74EBI4fM/a+z8d8?=
 =?us-ascii?Q?N+EIl6VP7XuOQB03hJ16TE2dHvHl6BtgvUSU9Bh00mSizyG4Nt163P7Fsgr0?=
 =?us-ascii?Q?r6bmyHj/APhRpIj++Eq9N6DwNJvenxM5I1BhQ95OGe1uf+MMHAkrh7X2p49+?=
 =?us-ascii?Q?GZVouHgrwrJkzCL7n6YGhQ6SjbR7u2fkFdTobE0dU3KpCY3BscLujNUyZ/1V?=
 =?us-ascii?Q?z5ISVe+drBQC8B07GjZ5tIB2fOIkoTpnBnQ3Lcz85ODyFkSHEbr8mPTnkKBR?=
 =?us-ascii?Q?az5fs6zza9NEb/VegMfSPxZNYPObnAxMAFkdrW9yqQwZi2zg937c+OccwfTi?=
 =?us-ascii?Q?Gis3WURfOmwD8QGDIA92udV3GILgVrj5QBpeJfKammaDpuWUPQ/0YMcXQHQ6?=
 =?us-ascii?Q?gBuAUd3mP3DcRhgFLsKsFQgdDmnhR3VcL6jNp8HXLkRa4gBlhlJoshjv6TFb?=
 =?us-ascii?Q?0J8dDfEbo+rlGNaSWqtil4X8+uEex7Ijnixmpi9EhG4beJwbqn9R4eTIyYNC?=
 =?us-ascii?Q?aQlDGWiiB/iGG9S8MQWoVza0oCwEKq2Opx8pD80c85BHql0JUy92yPjP3wp6?=
 =?us-ascii?Q?Hdu7ED/7vqwrb4EqLuFGN41S+PHVRomV42MxQ/nvZaF5/u06HeO/0nctnAXg?=
 =?us-ascii?Q?j0AWLDBMYpdSCMadjMBD+k2ryh0xxmWZ6K6ycmYbOS+rof5XPHngqrcdGbfN?=
 =?us-ascii?Q?/ZFwryXP1Dk6hGKYCmWhxLpvVYt2xVItnp8ssZWvg5gtQeMl5QOaiMkgKJEA?=
 =?us-ascii?Q?JNiIQtKaNj/JyLUSSAMjzNbdaw8XQbUoUafCG6WYXpIsJjeSLVZKWYl6NAh6?=
 =?us-ascii?Q?4MepmPGXnWkNeEVNryAP/A+JNJdlLQONfMs97chpYA5KgF0kJ4V34Rg9zJsl?=
 =?us-ascii?Q?/3+HQO4gq6PVjCY4uq76eamh8sAO+g9b1JmXiSNYvC37I19THRfI4S6gmMfB?=
 =?us-ascii?Q?ZkLuRAoPWXkdeuFDqoM9A9+OiV0M2xx2sVvQ9lAyrG0xJ8KjbX7dPky7wovS?=
 =?us-ascii?Q?SwB57H5NjQ2TxZOen4VSacXgVmj68KeaKbQrrfOK+eBQ/JMOcfPiAaFUhq9t?=
 =?us-ascii?Q?iekls7cvwWWJ0HTZR6s=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:17:52.8772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0b09b7-bba3-4236-c79a-08de21b3366b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997629
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 06:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19245

Currently, the overlay mentioned in KERNEL_DEVICETREE_PREFIX in case
of j722s is "k3-am625-sk-mcspi-loopback" which is incorrect as it has
been renamed recently. Change the overlay to "k3-am62x-sk-mcspi-loopback"
in order to carry out SPI loopback tests successfully.

Fixes: 3b2097d72758 ("conf: machine: j722s: Change overlay in KERNEL_DEVICE=
TREE_PREFIX")
Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/mac=
hine/j722s-evm.conf
index 52a6cfbd..8d69a23e 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-j722s \
     ti/k3-fpdlink \
-    ti/k3-am625-sk-mcspi-loopback \
+    ti/k3-am62x-sk-mcspi-loopback \
     ti/k3-v3link \
 "
=20
--=20
2.34.1


