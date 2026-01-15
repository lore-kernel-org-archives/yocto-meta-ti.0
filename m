Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCEDD46609
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 17:55:47 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.798.1768499739266766671
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 09:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MDRidLAB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.9, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5hzfjReLd3pt1FxyCHd10ytPcF7yJBscFTln5VxnfZdQREZUyNlL2oUHS6wWmvaUsDw+MghWNSrsOTPz4Nm1G7ytgERVHuKwNYcX9YxkY8c1X+UefAghAuHoQnEzceORSL272XTvMu1dVggcjQYIjUervWjYGZFrR3DZAGx+17QdIHo1JMQXcq0GkBTy2RWlIkq+mzgAXNY7Sskn9KbaQywLVo7OiPFYxca/p//Q5O1RqyQT449FCuDPVXb7NMzPSvXitZMRvf5XZCGPjcv/WO2/K6GYl7kVozfuGkff0+dialeYmZ/505g+P0hmgyzM/xk2WeGvxBWiPhZDzId0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hruK0IJyRqtOklrqDJLYicx+bOA0V+Y0Cvtn3R1XHQ=;
 b=c/HiSrUEl6lCYpwS/OXebmtnNfzSzC6dT8hjgZ3+GnvhPXZ6Cho5DzUc2UbmKGErvQFSN10esK/mqB0eIQsZHJhCrQ/pAq4RApaggzmm0Fxq+WL8OslJwJRor24uKrBCeRpYNjHTSLCS8aCIgHEUT92TbwRXri+v7nKLFzd2MpuYChEqzZT49Oy9WFXnkAOf60l5rhmqqZG1gCZiia9xTs+WfCbNDWbNT2kOBw4UjhMvKVxz9XenJHL00Id4ugUmUKN87aqAwC1WOK9a2PFKBkNCq6snDLPRhB7mVXdif6ZeAjBVNXMsQZjfi3wX/0DqpNdRqf07DONTc2927IqKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hruK0IJyRqtOklrqDJLYicx+bOA0V+Y0Cvtn3R1XHQ=;
 b=MDRidLABNAQRM8EEwIuBHvs2yPF3hYkJ0pN6AvV4SK4sybxCKh5q26A3mHzmeuaueoIfh6iiq6+7XBQsM2KR10uo0a1MC8Q9s3psOhwTjcryejejGfN04LZ8pLbu7lJUxjZ5Bd/wFY/t7nbC1lsfQJn4YVXGYIrjej5BO43LiR8=
Received: from SJ0PR13CA0163.namprd13.prod.outlook.com (2603:10b6:a03:2c7::18)
 by CO1PR10MB4676.namprd10.prod.outlook.com (2603:10b6:303:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 17:55:35 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::aa) by SJ0PR13CA0163.outlook.office365.com
 (2603:10b6:a03:2c7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 17:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 17:55:33 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 11:55:32 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 11:55:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 11:55:32 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FHtWU41943803;
	Thu, 15 Jan 2026 11:55:32 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgRZE-0000000E6TV-1JAf;
	Thu, 15 Jan 2026 11:55:32 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] linux-ti-staging-6.18: Add config fragment for j721e
Date: Thu, 15 Jan 2026 11:55:32 -0600
Message-ID: <20260115175532.3361474-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|CO1PR10MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc44b83-9a24-499d-4c20-08de545f47a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lH32/fczX5T9H4g8FdCJvjJwVqCs4JZxoRyinpU/I5iFq0lc17soaMSkXvO1?=
 =?us-ascii?Q?c+V2UEN9AWAl3moV0Gav0xj3KX6etVUZKLZq4Hk3F5IxK6ZF3UGMfFVXNYhX?=
 =?us-ascii?Q?/yVS0s4ZbbQQ8Y/garkfCO6DNmjGugKcePDnFQVhCBBUg2M0Hl8YNLp8FrKd?=
 =?us-ascii?Q?oZShg17HinYo4VYyA8cntIkLewtqgfY//pLpnIV9EPZgft5K3RoM6Z217QvF?=
 =?us-ascii?Q?WiAm5aeoCPKY5mwLK3FlwqjAo1Afkpvs/OihXzSeeR0qxeY0tM0x+B6t6ogy?=
 =?us-ascii?Q?fO1kYXQLqxPh55zlAMeW1hKX3/mqCvlR29Kb8GCUo+b3g5J+5iCG7RtzIoXS?=
 =?us-ascii?Q?LfCrISY019JO9Pmjn7uHdQlF9ThzueZfYTHNGaeFTIu3vCabKzasTkdIJklb?=
 =?us-ascii?Q?sY20vieAYUnrE+ZEpwP8zB3y2hIe7VRgNalMPhBIEI26htfytHMCEdfYnnjn?=
 =?us-ascii?Q?jcSC53E87PNJqmhmMfzv4hHTejl/odvrlvn7aQwe1vhmrglac69uNnkNNZsb?=
 =?us-ascii?Q?iYftFHFo0Oak/sq3ASSm5uWbK29JtrA+8Y+YgjN6P7wd7LtyFuM6GT3ngRng?=
 =?us-ascii?Q?byWBOSr/6MreLo2IUi/9jSEQDe1ZjhHINZqOCEVpBWnfVYUH9f2386vhFBYh?=
 =?us-ascii?Q?3mgLi+mctn37m0MrOzgqazyQZnsYS0IVvTs9A9dZg4QQ01JHKM8DzVQg0mKY?=
 =?us-ascii?Q?imOTXhi4K5c73apH+lItskl6FHWUZFI23XYbAD4y5a/h0mtbD5oJdP4pU62L?=
 =?us-ascii?Q?pdyFbboS+Quz8DLwGQZ1YyLcbN9lkZwDROo4FRYJ0Dm6H00mN5yAju1rxdtg?=
 =?us-ascii?Q?942EnJFXlYiVOWEWWtYBahwY74SWrYcGKyvLfvGsSqOI4Ea+L1ngeILMilIt?=
 =?us-ascii?Q?M9PEJeduzCu6STjHPYPJjqrkkDSMkxWFKmzw0Titg7GP89LRxDo8Rn6oSJ0h?=
 =?us-ascii?Q?ekjs121Y4VPJ5ItwivlyMajj97bPsmcoPDsUfmrHd80u0/6doSJBlpfhCPa3?=
 =?us-ascii?Q?QO0HBmckwhzSeUqsk6V0FDJ/ojs82b36jbTgHsB8uBkw/nULA8QfCJ3s2WU3?=
 =?us-ascii?Q?8c8l7WGi60RK3igQislEbb0rZjbYhqMlEtlr+TqK6uTeOQPhSzaIFf3iMlmg?=
 =?us-ascii?Q?Ryg5DBb//Prxu1wvtVayqex9wfpTdHojx8te6dF+lM8nZ3m/GQJMXgQClc9v?=
 =?us-ascii?Q?lqiThkRtyTrnbkvxxxCM6s3D9aCHou5mwxztBHYUXtSOmhO9HQJthxetMJ1L?=
 =?us-ascii?Q?ZIw+jfymJs1h3HAhakn+7GJ6AmPT04XUV1HRBNk2z6f3EQ/GhpGZRnI5jjha?=
 =?us-ascii?Q?j7WYKIwY8lWEfBn4Ufvl9SpehKnL1y5Co0aScEZiG1H5ahmpMtGd6tpheNg7?=
 =?us-ascii?Q?3P3P2DB6CLc/OcaNendnkrSSude42E6qJPrle6S6lH4/0VLobnS2YEg5ebjp?=
 =?us-ascii?Q?4LAwGb/47vjMfdTQ6gsSGiMZ4L7NSbkPyBlh2HQww/WAVGrZ+2Yk5rCCkZ3f?=
 =?us-ascii?Q?+B8Me0YSC/n7ybQEaBCP1wSejBobgJfPVbnRITtwu7CGpWovrB1Q2GAewNyN?=
 =?us-ascii?Q?H+6uTeWwnGO9x4qICPVW+Nag/YJeSNZm8HVehOAgWum12mqvkyHbxuf/0cHq?=
 =?us-ascii?Q?wYUWhyVmGryE5O6PJpf+PONgsu0JvbPlpSPQk78jnIE0+6AiC3Y+NtskmDCP?=
 =?us-ascii?Q?aFa4Aw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 17:55:33.2554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc44b83-9a24-499d-4c20-08de545f47a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4676
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jan 2026 17:55:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19422

The ti-vxe-vxd-driver (out of tree module) requires the VIDEOBUF2_DMA_SG
module to be built.  But the in layer defconfig is pruning several
options from the default defconfig that prevents us from easily turning
it back on.  This KERNEL_CONFIG_FRAGMENTS entry will turn on all of the
needed options to re-enable the VIDEOBUF2_DMA_SG setting.

This might be a temporary fix as there is effort to move the
ti-vxe-vxd-driver back into the kernel tree which will clean up the
Kconfig mess that requires this fragment.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix assignment operator for KERNEL_CONFIG_FRAGMENTS.

 .../linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg           | 2 ++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb      | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
j721e_vb2_dma_sg.cfg

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_v=
b2_dma_sg.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721=
e_vb2_dma_sg.cfg
new file mode 100644
index 00000000..d7249909
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_=
sg.cfg
@@ -0,0 +1,2 @@
+CONFIG_VIDEOBUF2_DMA_SG=3Dm
+CONFIG_ARCH_ROCKCHIP=3Dy
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index c2e2a3b5..054c1e76 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -36,4 +36,7 @@ module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_rem=
oteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
=20
+SRC_URI:append:j721e =3D " file://j721e_vb2_dma_sg.cfg"
+KERNEL_CONFIG_FRAGMENTS:append:j721e =3D " ${UNPACKDIR}/j721e_vb2_dma_sg.c=
fg"
+
 DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


