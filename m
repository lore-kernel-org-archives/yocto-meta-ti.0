Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D083CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:46 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.793.1777481079416087133
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iB3FdPbA;
 spf=pass (domain: ti.com, ip: 40.93.194.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neNOvR1/TulcxMgQEzRHZ29CtPJaKa+AYwC/xLzG4dXeuLi1yEshTcbE82Wio7XVVXQoThD7auRierEyNxD37f2nl4f/HYBXfC89UK9Yztc1djyOgpGOtq16Lx+5bvxp54KA3s8pZWtEECn19DtxYM5ZnKcGjWwLmk2EfrspMIVv9fVEGwfxviIqYCU6Hjhb1C5VqW++6U3ku1I+SK57nXJhpp7bk60lr8lAuh/jCvlri9ZAB0vEqx45mgkRYJkOcBUAJ8v7seR5/HzQnun80hJ07Oepu3a0g/54LjmFgRGDkkSdkc57yNm5by2ePqEQL6ZLmjEBx97zd+XU6d7r2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT33WWdm5fu0CdDnCa/3toWhM1t5T8OFYVfsOX1K+3c=;
 b=qVsACwqwz6OrfMe9uktSSiPX+gaE4KtEos1Zk0dsZZeQwIIa+u7F4PEvpigpvVkXJgCK/CvBE9fWj7u0eE4ELw8QOK4zeQLIR9mSM0oz9+g+/eBzr1HNVcScX47g/pj7VmsCuf57w6GWLC+ZmuVLxeZ0kEMIdfOJPnmEQ+MUUl2aB/yxWHdmVM6UOkoLkTN1DXZy1pEB7nf+jev6eJ4dQSXxTV1PtseIfHWqC4q9iDY1jixAkCoR7O1yLE6ntaYATtowA5Cnlb1lMCtUYErBTaZIXun0NH2DiRY/Q93bEJk6T8IXk6aw9eta7llYIiKBDxUOJQKovvpwpGw4AMi5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT33WWdm5fu0CdDnCa/3toWhM1t5T8OFYVfsOX1K+3c=;
 b=iB3FdPbA32CRfhzq6Q0V5VMgj4/CeAatDx7ECmr+eqDPp1kjtJ4d0i+D8p6cxCCaWZeQPIQQMYD05B+n9MKXq3Prv0wGcLuWHUC/xwT9cEr0mgbuV1eYiLfXf8M+awFBSyn8wQ4FNMboyQvilDZvfG9gyoRfSNipTalE4GjOlNw=
Received: from SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31)
 by BN0PR10MB4888.namprd10.prod.outlook.com (2603:10b6:408:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:44:37 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::94) by SJ0PR05CA0116.outlook.office365.com
 (2603:10b6:a03:334::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Wed,
 29 Apr 2026 16:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:34 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWUP3719619;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oNt-30WV;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 06/12] meta-ti-test: Import the recipes-extended recipes
Date: Wed, 29 Apr 2026 11:44:26 -0500
Message-ID: <20260429164432.1623594-6-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|BN0PR10MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 985838df-94b2-4319-4aa1-08dea60e984e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	2zRFyGq+NcCvQbfhe3OyyniriH0wlCT8Eo0+lC/KRaB0dqXxYdZ1Gu92jrC25lftfqV9Q/AloKem1DNT0wnRzIhLLY5ofn9HKDD2YHK56y8V33akc2FY5RUYRqNIzUW7I6NZ2CicgoCLeJIL6ohnG1NWw8XAhxO1CoVIcf+mP2gd/3hGAopMlHE4aGQy/BanXf+gL/HJGS3r8fQi/dfGXWuB79qV3j5Z5rISQdDq3uaOvPr8L4/etpKuLyZdorj7/u9A3sRtg1h+oz7VGsiSz4huoy7ckFjwm+y7rs7Shso3b8ODY0hHS70g/zUAOLhSqQ1H1d97tLb0iGe7dlpptdIe/wXdKqWZ+zrY4bXD6pU6Z6nMJB6TBi5ncsOuKG3A/Ph2HBqhkVt/WjbGTySx+tbbbwx59+zeTp9rr5uobpRIsEAHgo0lIV0J10MqD8euaAyI+rujspcuHRpWfS7cw9T0OtLSLjtBKuIwHcYgUaB90Y3bmsYZo3eo8siuDtPgOgTc47b9mMtSvK1ju21Z7VVp7c9CMoDg6Eto+6pWWlzx/gzLX/4S6P0RwSi0jR2Y8GArdMgzunB9i0w6GK9PJH7L2ZVzgO6YDlVOQliw2A4xJML0AoyXBDUzac7YGnCYNkVEy7CHapH2vQFunar8GFGNOuWocz4CxspwBd+Vcdudd5NpHGL/rjSBD92QdeFynwlVncMXbUQVg9Zo2fZz0WhNeZ9hcbi+FjZrGHZRFAFQOlRkg3FhlQMgqxenaabtYMY4+NscSmyCg91gnVp9Yg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VFqRHtt8CnKLf2p7UcIeZVr6B/kfp6xWiH57rTi9XDyEU6eRGUomAf5mYHvXPHzSJGa0wMIyXka64xJz5iVFxVbqTPocEhqrJOr1Bl/SwrFGK6wCMtGD966nJOsrTExYe/m9aI6b+xqWg6txV4IUfet7DaCrVuzOyus0EMIKmHPPcn5x19mmA84NCRmmmfzShvcnS6Lei1x2s2NRX3v7OtrVOJAKKwjkhFF3Qkzqh3t+zlBDwCJiaA92nZtUokxpcrxkUh6qOXEwG7t4uVYN8osTMY7tTOH0dBoHeOPGLuE54CWg5dijx8igqQHYYhIhlAJ5qI2QBdAibr1etDSMR/6J9X3tz3bY4zVKF10SPIA2h21IsSNzia8ex4SbcKOkQhIT/gykwniAkeWaJ0zv4tw/TlWZstTMBuL7LdySCxGEcFCXd8o+4We9clMunqXG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:34.6837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 985838df-94b2-4319-4aa1-08dea60e984e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4888
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19905

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-extende.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
v2: No changes.

 meta-ti-test/recipes-extended/bc/bc_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-ti-test/recipes-extended/bc/bc_%.bbappend

diff --git a/meta-ti-test/recipes-extended/bc/bc_%.bbappend b/meta-ti-test/=
recipes-extended/bc/bc_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-ti-test/recipes-extended/bc/bc_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE +=3D "${PN}"
+
--=20
2.43.0


