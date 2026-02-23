Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CDEEC112C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:23:04 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4215.1771878182201377584
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wg15eQdo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.60, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS2SgGBdL0fOqYA7u7MNfd6lCJSCBOSMsS7DKgkoES7dGlfpqMBw8ECM18eeBFzqR2vh1VXRIGM9ZbLTeUwEULkhLCGJUXiEi8i8dLmSrdoQw7CDD1zLL/L+rCx3xXb1Vk7abC+pI79HPc0IStJf96cVuMTlMyZE3BfUy8+GyfyCTv1pPQKQqmIFrWbNyPuGWOWq3q3ee3KM01/wFAgJ+J1FbXuT00eB5EqCT6NBDIN+mNiORHloI9bRaTGe+/aCbtUYr29jCHfdNNL10pB98XPM9cXEOSn7kTtvPv/yCZ7pPM+bdLYRYqfakBLolkAk+zt2IQ2PH/zq/PtmMni6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Km4WkmHHawDZbzIVTdv8TNsiaRIKeNK3EM6VCA2LtL8=;
 b=SS36XZ745lthVJ9Q4SEnlJZZWT133Py1CCgzHhcz+PuLrF4x2HUMfxYETG/uSi14oOaV9QiSMKkP3R/4TsdDVcdTb3W41NyO914+OX4PBaxo9TtzbwaxidCCsPBtAHsUQ7DHe+g4x2IFmC1JUKNSZVfbY/iNqFrHV33Ca3/RPJ741M6AUohQJlnHYmTvW2bpHzlJS2ibX/b8Dzn7L+DYJ5J2Mp7pkOQVl9vUvCKF4MCGHbx3VAOqHkQdxHKCOtQurLd5hp9NyGSpZQBQPBKhIU+bFUnmeXvI59MdAGarkUb0V0t3Fv1IBI1EeCJFeQWul07Q0FBlRCyU4DmWc0s+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km4WkmHHawDZbzIVTdv8TNsiaRIKeNK3EM6VCA2LtL8=;
 b=wg15eQdo2FKmm9hoFQ87XgL6CTOFy2yu2ROonTuUb+o//e55ru6GVHG/RFinZzsvy2BApvxmUOizUMAZYzRC1dapKrZrFMJb250M/WeMxvnSis37BKxG8+eRa8HasNjPHc9s1VweDUXbkib9s/XIhaBk3aPuBZ8rSE7RYgo7Vo4=
Received: from BL1PR13CA0211.namprd13.prod.outlook.com (2603:10b6:208:2bf::6)
 by PH7PR10MB6459.namprd10.prod.outlook.com (2603:10b6:510:1ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:22:59 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::9e) by BL1PR13CA0211.outlook.office365.com
 (2603:10b6:208:2bf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:22:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:22:51 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:22:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:22:51 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKMpLQ1443082;
	Mon, 23 Feb 2026 14:22:51 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti configuration
Date: Mon, 23 Feb 2026 14:22:36 -0600
Message-ID: <20260223202236.3642261-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|PH7PR10MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: b55920f6-0b69-4058-ed4c-08de731955ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4jQTVaya05DR01viVniDTpn3Y7+2T5IWucXuAPVNhUOdPTLMFOn7wSCY1nWa?=
 =?us-ascii?Q?zEpDDwnASUqt5ALPmd7MWbRTyZ0JH3TRGYvkTs1/sSxWA6AkB3KKODFKyOYQ?=
 =?us-ascii?Q?l+W39kg/UsDss9mZxa9tC0m6tUQwybIn87cHRa3X97XDBA18Tse/UDvWWLJe?=
 =?us-ascii?Q?kKCnOvDM/V8SYfjC2OsleEaX7qO2tpmH2M2T13xosm0QEWgN/w30ikFaawUF?=
 =?us-ascii?Q?VuWZ6pSHnJMuCu+K9oXKWyQzcgZglrrkoLIAjWBEs5ADAlfsXQNiA35nDGnY?=
 =?us-ascii?Q?yaet7a+GoJ7w1aBwF1UEGsLTCxTAS/Twj30fl37ZawzoG6bC+F6ggIJ5IXjR?=
 =?us-ascii?Q?llVOM+bPpNO05YQ37mtMbwbGPrxPSUz25xqqXf68MiCOopOocZpc1FKY8032?=
 =?us-ascii?Q?l7CDkPhw3DYlVzy1Qi6yXm/H5baH5UPfBKBJ/wFDlXlsI6gce+1M1VDs1hig?=
 =?us-ascii?Q?Z4nTfgAX053dRpduZXFlSXlnsS+NlJDY3lAhvO5XuU8YT91MlKeYsuzksBp+?=
 =?us-ascii?Q?FaqLF4zk/umv0H2J465SpGP9LAAVCWL3U1SyXFNY75qDq9KiEDZSv7r0F1xU?=
 =?us-ascii?Q?nomw67Y7jH9ofoBp9I+oFDf5/lpHk7QC3FQLR2jbe3s/g8gwyam0yA9z6xom?=
 =?us-ascii?Q?ap36v9RPXvG48YGs5K3bRn0l1I42EfRR5ClRL/Kkw7YmErfFmNd2+Jq8sh4q?=
 =?us-ascii?Q?cLkEANWG//EFCuNZ7JbB1sApR6+luui34oQuedcsZyPbR6bekK+SOxlqYE9K?=
 =?us-ascii?Q?9B09c6JfjllX6vndjK2lkMtyhTC8sEKtQKQ609MORtnjtc0GPXnHR0SJgzxb?=
 =?us-ascii?Q?wUfejwukSEXUFhJycinML5peZSSaqira2mFEb1F9qp8VT+kASNYVSyVp7UFn?=
 =?us-ascii?Q?g8hn73oRtOZ0saN/b5yEUJIp8z9+WHQN/tv60ivyBGdcr53CL5W71QdVQdyi?=
 =?us-ascii?Q?HTsfjTZFY7zQfKWXPmsjH8YX0mGqyvHn9onM+pLs1FCEZxmI8UQ5v8CYNLU4?=
 =?us-ascii?Q?cz0PzS26H8ZWn+Ms+WI6kPI3gjZ2i6AL3+yPniZ0+1qsEs/3tz7FYe9Eh2RU?=
 =?us-ascii?Q?AgKlx62+dAqKbbQaAjZWc7xHrtAK/w72C/1ntkqkgj8t1W5AQOlnhyV9j6m8?=
 =?us-ascii?Q?fLpjbf+NPua3tPT/88Jxvk8Xef/SiwoOxdvoa+XqGpYwFiI4x5Ld5u0wHBFH?=
 =?us-ascii?Q?DIwx8YOGTXWu4kyDR5fCSqpk+/MffAZhlFvbVxnGr4X2rTtz4b1F01jugw4x?=
 =?us-ascii?Q?sTqF2QFuUn+mVGAgmgm/+FVjGqtpft0UYE8OvWyAd/xmzMKseOS6klGfYT0U?=
 =?us-ascii?Q?wqwIHdc49+LfaRAfPBuJO5ZEyGFWzx1/qZglSAOJXxVVvFhmpbjg01ycUFHW?=
 =?us-ascii?Q?p/LisDMH8PEdGRF2cmBbHuVinCFpfm5C2Dp6wPhk6LEbUvG3o7/mk4CfjIYi?=
 =?us-ascii?Q?i7UD7wlqVdWPVjWi2nzUFXAIL7gFeiX14EDc5Pnt0DgxWzY2wSJiJaTv/leG?=
 =?us-ascii?Q?gnKHfLUq4GpU5jwlEHXfzgdLRogOXn1KEQ7rjqfLBKxoUDXk8iJl2Tqchegi?=
 =?us-ascii?Q?VrAw+zYWCvVjAdhJ/L5qmbQp+C2Gbshz+Qq2GKI7SsghdyNDxUpEoxx7ZigG?=
 =?us-ascii?Q?zrIb2JM5Eb11T4l5/NkfeDdpsaA4LwqlDJlK0BArr5LHr28T+iwzB5L0Gtg3?=
 =?us-ascii?Q?lsqgzw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GqlAPYPwZTHy0eHah8zfwpsir1KIC4R6tAa3QoFgkXbRoIJwK4C37SzNgWpJTNWebAQdamHYR4AWrbh0R9hBJ6SPtqiVV5CdE9wKYr0bmml9/7uT5r/0gO67GfqvQucrmqv253PRtfjdtiNZItAp9EbcJvJYMdrd1OLhIVMGF1rzj1C3/sJbZFr1tWlrlVtAIi8ek1MpGGUtlUWq1LJPfClNRnmDAsZOrp+pF1J8Lwnt5hMtaXnxNNsBiuROs9KxTl5mTsUcxS+v7RIFbseXHXj+sy9pogiXvqknyD3F3nl9kRXa64bOF4UzoKqIwsPKUMbVbUVS/6tTqCNbTnHFqKIv/Szyr062WtFTGtWnzjKgdYyiSJFo+q1cXP9lOhpJReaAZrfBTtDz3nNpUxvitpEpauCQlKteGMMgrES0qGVzjC5WqzIT1kBaBRdGv09e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:22:58.0754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b55920f6-0b69-4058-ed4c-08de731955ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6459
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:23:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19562

From: Randolph Sapp <rs@ti.com>

Add a TI configuration for the BeagleY-AI development board.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |  7 +++++++
 meta-ti-bsp/conf/machine/beagley-ai-ti.conf      | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf

diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf b/meta-ti-bsp=
/conf/machine/beagley-ai-ti-k3r5.conf
new file mode 100644
index 00000000..88d0888b
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: BeagleY-AI (R5F)
+#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf b/meta-ti-bsp/conf=
/machine/beagley-ai-ti.conf
new file mode 100644
index 00000000..088cbd62
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: BeagleY-AI (A53)
+#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
+
+require conf/machine/include/j722s.inc
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am67a \
+    ti/k3-j722s \
+"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am67a-beagley-ai.dtb \
+"
+
+UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
--=20
2.53.0


